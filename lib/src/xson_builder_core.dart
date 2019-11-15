import 'dart:io';

import 'package:dartpoet/dartpoet.dart';
import 'package:named_mode/named_mode.dart';
import 'package:xfile/xfile.dart';
import 'package:xson/xson.dart';
import 'package:xson_annotation/xson_annotation.dart';

part 'ancestor_info.dart';

class XsonBuilder {
  Map<String, ClassSpec> _classCache = {};
  Map<String, MethodSpec> _fromJsonCache = {};
  Map<String, MethodSpec> _toJsonCache = {};
  FileSpec _fileSpec;
  String _defaultRootClassName;
  String _generatedClassSuffix;
  bool _fromBuildRunner;
  XFile _fileInfo;
  PropertyRenameHandler _propertyRenameHandler;

  String get rootClassName {
    String pureFileName = _fileInfo.fileName(withExtension: false).split(".").first;
    return _defaultRootClassName ?? renameTo__AnApple(pureFileName);
  }

  File generateAndWriteFile(
    String outputDir,
    String outputFileName,
    String json, {
    String rootClassName,
    String classSuffix,
    bool fromBuildRunner,
    PropertyRenameHandler handler,
  }) {
    var dartFile = _generate(
      outputFileName,
      json,
      rootClassName: rootClassName,
      classSuffix: classSuffix,
      fromBuildRunner: fromBuildRunner,
      handler: handler,
    );
    return dartFile.outputSync(XFile.concat(outputDir, outputFileName).file.path);
  }

  String generateAndGetFileContent(
    String outputFileName,
    String json, {
    String rootClassName,
    String classSuffix,
    bool fromBuildRunner,
    PropertyRenameHandler handler,
  }) {
    var dartFile = _generate(
      outputFileName,
      json,
      rootClassName: rootClassName,
      classSuffix: classSuffix,
      fromBuildRunner: fromBuildRunner,
      handler: handler,
    );
    return dartFile.outputContent();
  }

  String _ignoreComments(String json) => json.split("\n").where((line) => !line.trimLeft().startsWith("//")).join("\n");

  DartFile _generate(
    String outputFileName,
    String json, {
    String rootClassName,
    String classSuffix,
    bool fromBuildRunner,
    PropertyRenameHandler handler,
  }) {
    _fromBuildRunner = fromBuildRunner ?? false;
    _fileSpec = FileSpec.build();
    _fileInfo = XFile.fromPath(outputFileName);
    _generatedClassSuffix = classSuffix ?? "bean";
    _defaultRootClassName = rootClassName;
    _classCache.clear();
    _fromJsonCache.clear();
    _toJsonCache.clear();
    _propertyRenameHandler = handler ?? PropertyRenameHandlers.defaultHandler;
    _resolveDependencies();
    _iterate(element: xson.decodeToJsonElement(_ignoreComments(json)), ancestors: []);
    _resolveCaches();
    return DartFile.fromFileSpec(_fileSpec);
  }

  void _resolveCaches() {
    if (_fromJsonCache.isNotEmpty) {
      _fileSpec.classes.insert(0, ClassSpec.build("_FromJsonWrapper", methods: _fromJsonCache.values.toList()));
    }
    if (_toJsonCache.isNotEmpty) {
      _fileSpec.classes.insert(0, ClassSpec.build("_ToJsonWrapper", methods: _toJsonCache.values.toList()));
    }
  }

  PropertySpec _iterate({String objectKey, int arrayIndex, JsonElement element, List<_AncestorInfo> ancestors = const []}) {
    PropertySpec property;
    bool isRoot = ancestors.isEmpty;
    var cloneAncestors = List<_AncestorInfo>.from(ancestors);
    cloneAncestors.add(_AncestorInfo.create(arrayIndex, objectKey, element));
    if (element.isObject) {
      // ********************************************************************************** object
      JsonObject jsonObject = element.asObject;
      String md5 = JsonInfo.parseElement(jsonObject).md5;
      ClassSpec classSpec = _classCache.containsKey(md5) ? _classCache[md5] : _createClass(jsonObject, cloneAncestors, isRoot);
      String className = classSpec.className;
      TypeToken typeToken = TypeToken.ofName(className);
      property = PropertySpec.of(objectKey, type: typeToken);
      MetaSpec jsonKey = _findOrCreateJsonKeyOfProperty(property);
      jsonKey.parameters.add(ParameterSpec.named("fromJson", isValue: true, value: "$className._fromJson", valueString: false));
      jsonKey.parameters.add(ParameterSpec.named("toJson", isValue: true, value: "$className._toJson", valueString: false));
    } else if (element.isArray) {
      // ********************************************************************************** array
      JsonArray jsonArray = element.asArray;
      jsonArray.toList().asMap().entries.forEach((entry) {
        int jsonIndex = entry.key;
        JsonElement jsonValue = entry.value;
        _iterate(arrayIndex: jsonIndex, element: jsonValue, ancestors: cloneAncestors);
      });
      TypeToken componentType = _calcComponentType(jsonArray, objectKey, arrayIndex, cloneAncestors);
      if (isRoot) {
        String className = _calcClassName(cloneAncestors, rootClassName);
        _createRootClassForList(className, componentType);
        _fileSpec.dependencies.add(DependencySpec.import("dart:collection"));
      }
      TypeToken listType = TypeToken.ofListByToken(componentType);
      property = PropertySpec.of(objectKey, type: listType);

      String key = listType.fullTypeName.replaceAll(RegExp("[<>]"), r"$");

      // cache fromJson method of list
      String fromJsonName = "_fromJson$key";
      if (!_fromJsonCache.containsKey(fromJsonName)) {
        MethodSpec fromJson = _buildFromJsonForList(listType, fromJsonName);
        _fromJsonCache[fromJsonName] = fromJson;
      }

      // cache toJson method of list
      String toJsonName = "_toJson$key";
      if (!_toJsonCache.containsKey(toJsonName)) {
        MethodSpec toJson = _buildToJsonForList(listType, toJsonName);
        _toJsonCache[toJsonName] = toJson;
      }

      MetaSpec jsonKey = _findOrCreateJsonKeyOfProperty(property);
      jsonKey.parameters.add(ParameterSpec.named(
        "fromJson",
        isValue: true,
        valueString: false,
        value: "_FromJsonWrapper.$fromJsonName",
      ));
      jsonKey.parameters.add(ParameterSpec.named(
        "toJson",
        isValue: true,
        valueString: false,
        value: "_ToJsonWrapper.$toJsonName",
      ));
    } else if (element.isPrimitive) {
      // ********************************************************************************** primitive
      JsonPrimitive jsonPrimitive = element.asPrimitive;
      TypeToken typeToken = TypeToken.of(jsonPrimitive.type.nativeType);
      property = PropertySpec.of(objectKey, type: typeToken);
      MetaSpec jsonKey = _findOrCreateJsonKeyOfProperty(property);
      ParameterSpec fromJson;
      if (jsonPrimitive.isInt) fromJson = ParameterSpec.named("fromJson", value: "translateInt");
      if (jsonPrimitive.isDouble) fromJson = ParameterSpec.named("fromJson", value: "translateDouble");
      if (jsonPrimitive.isBool) fromJson = ParameterSpec.named("fromJson", value: "translateBool");
      if (jsonPrimitive.isString) fromJson = ParameterSpec.named("fromJson", value: "translateString");
      fromJson.valueString = false;
      fromJson.isValue = true;
      jsonKey.parameters.add(fromJson);
    } else if (element.isNull) {
      // ********************************************************************************** null
      property = PropertySpec.of(objectKey);
    }
    if (property == null) throw JsonIllegalStateException();

    return _renameProperty(_calcUniqueKey(ancestors), property);
  }

  int _calcListDepth(TypeToken type) {
    TypeToken target = type;
    int depth = 0;
    while (target.isList) {
      depth++;
      target = target.firstGeneric;
    }
    return depth;
  }

  TypeToken _calcFinalGeneric(TypeToken type) {
    TypeToken target = type;
    while (target.isList) {
      target = target.firstGeneric;
    }
    return target;
  }

  MethodSpec _buildFromJsonForList(TypeToken listType, String methodName) {
    TypeToken finalGeneric = _calcFinalGeneric(listType);
    var variable = "json";

    String transformCore;
    if (finalGeneric.isPrimitive) {
      transformCore = "translateT<${finalGeneric.fullTypeName}>($variable)";
    } else if (finalGeneric.isDynamic) {
      transformCore = "$variable";
    } else {
      transformCore = "${finalGeneric.fullTypeName}.fromJson($variable)";
    }
    String code = transformCore;
    int listDepth = _calcListDepth(listType);
    for (var i = 0; i < listDepth; i++) {
      code = "($variable as List).map(($variable) => $code).toList()";
    }

    List<String> codes = [];
    codes.add("if($variable == null) return [];");
    codes.add("return $code;");

    return MethodSpec.build(
      methodName,
      parameters: [ParameterSpec.normal(variable, type: TypeToken.ofDynamic())],
      returnType: listType,
      codeBlock: CodeBlockSpec.lines(codes),
      isStatic: true,
    );
  }

  MethodSpec _buildToJsonForList(TypeToken listType, String methodName) {
    TypeToken finalGeneric = _calcFinalGeneric(listType);
    var variable = "instance";

    String code;
    if (finalGeneric.isPrimitive || finalGeneric.isDynamic) {
      code = "$variable";
    } else {
      int listDepth = _calcListDepth(listType);
      String transformCore = "$variable.toJson()";
      code = transformCore;
      for (var i = 0; i < listDepth; i++) {
        code = "$variable.map(($variable) => $code).toList()";
      }
    }
    code += ";";
    return MethodSpec.build(
      methodName,
      parameters: [ParameterSpec.normal(variable, type: listType)],
      returnType: TypeToken.ofDynamic(),
      codeBlock: CodeBlockSpec.line(code),
      isStatic: true,
    );
  }

  String _calcUniqueKey(List<_AncestorInfo> ancestors) {
    return ancestors.map((o) => o.isObject ? ".${o.objectKey}" : "[${o.arrayIndex}]").join();
  }

  PropertySpec _renameProperty(String uniqueKey, PropertySpec property) {
    if (property.name == null) return property;
    String oldName = property.name;
    String newName = _propertyRenameHandler(uniqueKey, oldName);
    property.name = newName;
    if (oldName != newName) {
      MetaSpec jsonKey = _findOrCreateJsonKeyOfProperty(property);
      jsonKey.parameters.add(ParameterSpec.named("name", valueString: true, value: oldName, isValue: true));
    }
    return property;
  }

  MetaSpec _findOrCreateJsonKeyOfProperty(PropertySpec property) {
    return property.metas.firstWhere((o) => o.typeToken.typeName == "JsonKey", orElse: () {
      var jsonKey = MetaSpec.ofConstructor(TypeToken.ofName("JsonKey"));
      property.metas.add(jsonKey);
      return jsonKey;
    });
  }

  String _calcClassName(List<_AncestorInfo> ancestors, [String rootClassName]) {
    var segments = ancestors.expand((info) {
      if (info.isArray) return ["list", "${info.arrayIndex}"];
      if (info.isObject) return ["${info.objectKey}"];
      if (info.isRoot) return [rootClassName ?? ""];
      throw JsonIllegalStateException();
    }).toList();
    segments.add(_generatedClassSuffix);
    return segments.isEmpty ? rootClassName : combineWithNamedMode(segments, NamedMode.AnApple);
  }

  void _resolveDependencies() {
    _fileSpec.dependencies.add(DependencySpec.import("package:json_annotation/json_annotation.dart"));
    _fileSpec.dependencies.add(DependencySpec.import("package:type_translator/type_translator.dart"));
    var fileNameWithoutExtension = _fileInfo.fileName(withExtension: false);
    _fileSpec.dependencies.add(
        DependencySpec.part(_fromBuildRunner ? "${fileNameWithoutExtension}.xson.g.dart" : "${fileNameWithoutExtension}.g.dart"));
  }

  TypeToken _calcComponentType(JsonArray jsonArray, String objectKey, int arrayIndex, List<_AncestorInfo> ancestors) {
    var childTypes = jsonArray.values
        .map((element) {
          if (element.isPrimitive) return TypeToken.of(element.type.nativeType);
          if (element.isNull) return TypeToken.ofDynamic();
          if (element.isObject) {
            String md5 = JsonInfo.parseElement(element).md5;
            ClassSpec cacheClass = _classCache[md5];
            return TypeToken.ofName(cacheClass.className);
          }
          if (element.isArray) {
            TypeToken componentType = _iterate(
              objectKey: objectKey,
              arrayIndex: arrayIndex,
              ancestors: ancestors,
              element: element,
            ).type.firstGeneric;

            return TypeToken.ofListByToken(componentType);
          }
          throw JsonIllegalStateException();
        })
        .toSet()
        .toList();
    return childTypes.length == 1 ? childTypes.single : TypeToken.ofDynamic();
  }

  ClassSpec _createClass(JsonObject jsonObject, List<_AncestorInfo> ancestors, bool isRoot) {
    String md5 = JsonInfo.parseElement(jsonObject).md5;
    String className = _calcClassName(ancestors, rootClassName);
    ClassSpec classSpec = ClassSpec.build(className);

    jsonObject.entries.forEach((entry) {
      String jsonKey = entry.key;
      JsonElement jsonValue = entry.value;
      PropertySpec childProperty = _iterate(objectKey: jsonKey, element: jsonValue, ancestors: ancestors);
      classSpec.properties.add(childProperty);
    });
    ConstructorSpec defaultConstructor = ConstructorSpec.normal(classSpec,
        parameters: classSpec.properties.map((property) {
          return ParameterSpec.named(property.name, isSelfParameter: true);
        }).toList());
    if (!isRoot) {
      MethodSpec fromJsonFactory = MethodSpec.build(
        "_fromJson",
        isStatic: true,
        parameters: [ParameterSpec.normal("json", type: TypeToken.ofDynamic())],
        returnType: TypeToken.ofName(className),
        codeBlock: CodeBlockSpec.line("$className.fromJson(json);"),
      );
      MethodSpec toJsonFactory = MethodSpec.build(
        "_toJson",
        isStatic: true,
        parameters: [ParameterSpec.normal("instance", type: TypeToken.ofName(className))],
        returnType: TypeToken.ofDynamic(),
        codeBlock: CodeBlockSpec.line("instance.toJson();"),
      );
      classSpec.methods.add(fromJsonFactory);
      classSpec.methods.add(toJsonFactory);
    }
    ConstructorSpec fromJson = ConstructorSpec.namedFactory(
      classSpec,
      "fromJson",
      parameters: [ParameterSpec.normal("json")],
      codeBlock: CodeBlockSpec.line("json != null ? _\$${className}FromJson(json) : null;"),
    );
    MethodSpec toJson = MethodSpec.build(
      "toJson",
      returnType: TypeToken.ofDynamic(),
      codeBlock: CodeBlockSpec.line("_\$${className}ToJson(this);"),
    );

    classSpec.constructors.add(defaultConstructor);
    classSpec.constructors.add(fromJson);
    classSpec.methods.add(toJson);
    classSpec.metas.add(MetaSpec.ofConstructor(TypeToken.ofName("JsonSerializable")));
    _classCache[md5] = classSpec;
    _fileSpec.classes.add(classSpec);
    return classSpec;
  }

  ClassSpec _createRootClassForList(String className, TypeToken componentType) {
    var realListName = "_real";
    ClassSpec classSpec = ClassSpec.build(className, superClass: TypeToken.ofName("ListBase", [componentType]));
    PropertySpec realProperty = PropertySpec.ofListByToken(realListName, componentType: componentType);
    PropertySpec lengthProperty = PropertySpec.ofInt("length");
    ConstructorSpec defaultConstructor = ConstructorSpec.normal(classSpec, parameters: [
      ParameterSpec.normal(realListName, isSelfParameter: true),
    ]);
    OperatorSpec indexGetter = OperatorSpec.build(
      "[]",
      componentType,
      [
        ParameterSpec.normal("index", type: TypeToken.ofInt()),
      ],
      CodeBlockSpec.line("$realListName[index];"),
    );
    OperatorSpec indexSetter = OperatorSpec.build(
      "[]=",
      TypeToken.ofVoid(),
      [
        ParameterSpec.normal("index", type: TypeToken.ofInt()),
        ParameterSpec.normal("value", type: componentType),
      ],
      CodeBlockSpec.line("$realListName[index] = value;"),
    );
    ConstructorSpec fromJson = ConstructorSpec.namedFactory(
      classSpec,
      "fromJson",
      parameters: [ParameterSpec.normal("json", type: TypeToken.ofDynamic())],
      codeBlock: CodeBlockSpec.lines([
        'if (json is List) return $className(json.map((element) => $className.fromJson(element)).toList());',
        'throw "Call `fromJson` on ListBean, but input json is not list.";'
      ]),
    );
    MethodSpec toJson = MethodSpec.build(
      "toJson",
      returnType: TypeToken.ofDynamic(),
      codeBlock: CodeBlockSpec.line("_real.map((element) => element?.toJson()).toList();"),
    );
    classSpec.properties.add(realProperty);
    classSpec.constructors.add(defaultConstructor);
    classSpec.properties.add(lengthProperty);
    classSpec.operatorMethods.add(indexGetter);
    classSpec.operatorMethods.add(indexSetter);
    classSpec.constructors.add(fromJson);
    classSpec.methods.add(toJson);
    _fileSpec.classes.add(classSpec);
    return classSpec;
  }
}

Future<ProcessResult> executeBuildRunner({
  Encoding encoding = utf8,
  bool deleteConflictingOutputs = false,
  bool showVerbose = false,
}) async {
  String runner;
  List<String> commands;
  if (Platform.isWindows) {
    runner = "cmd.exe";
    commands = ['/c', 'flutter', 'packages', 'pub', 'run', 'build_runner', 'build'];
  } else if (Platform.isMacOS) {
    runner = "/bin/sh";
    commands = ['flutter', 'packages', 'pub', 'run', 'build_runner', 'build'];
  } else {
    throw "Unsupported platform";
  }
  if (deleteConflictingOutputs) commands.add("--delete-conflicting-outputs");
  if (showVerbose) commands.add("--verbose");
  return await Process.run(
    runner,
    commands,
    stdoutEncoding: encoding,
    stderrEncoding: encoding,
  );
}
