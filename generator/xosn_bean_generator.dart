import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xson/xson.dart';
import 'package:xson_builder/xson_builder.dart';
import 'package:dartpoet/dartpoet.dart';
import 'package:named_mode/named_mode.dart';

class XsonBeanGenerator extends GeneratorForAnnotation<XsonBean> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    ElementKind kind = element.kind;
    if (kind == ElementKind.CLASS) {
      ClassElement classElement = element as ClassElement;
      print("掃描到類別 ${classElement.displayName}");
      String jsonSrc = annotation.read("src").stringValue;
      print("json文件來源=$jsonSrc");
      File file = File.fromUri(Uri.parse(jsonSrc));
      if (!file.existsSync()) throw "Can not find json source file at $jsonSrc!";
      String jsonString = file.readAsStringSync();
      JsonElement jsonElement = xson.decodeToJsonElement(jsonString);
    }
    return null;
  }

  String _calcClassName(List<_AncestorInfo> ancestors) {
    var segments = ancestors.expand((info) => info.isArray ? ["list", "${info.arrayIndex}"] : ["${info.objectKey}"]).toList();
    return combineWithNamedMode(segments, NamedMode.AnApple);
  }

  PropertySpec _generateFile(String propertyName, JsonElement element, FileSpec fileSpec, List<_AncestorInfo> ancestors) {
    PropertySpec propertySpec = PropertySpec.of(propertyName);
    if (element.isObject) {
      JsonObject jsonObject = element.asObject;
      String className = _calcClassName(ancestors);
      ClassSpec classSpec = ClassSpec.build(className);
      ancestors.add(_AncestorInfo.object(propertyName, jsonObject));
      for(var entry in jsonObject.entries){
        String childPropertyName = entry.key;
        JsonElement propertyVal = entry.value;
        propertySpec = _generateFile(childPropertyName, propertyVal, fileSpec, ancestors);
        classSpec.properties.add(propertySpec);

      }


      for (var entry in element.asObject.entries) {
        String key = entry.key;
        JsonElement value = entry.value;
      }
    } else if (element.isArray) {}
  }

  ClassSpec _generateClass(JsonObject object, String className) {
    ClassSpec classSpec = ClassSpec.build(className);
    for (var entry in object.entries) {
      String propertyName = entry.key;
      JsonElement propertyVal = entry.value;
      PropertySpec propertySpec = PropertySpec.of(propertyName);
      if (propertyVal.isPrimitive) {
        propertySpec.type = TypeToken.of(propertyVal.type.nativeType);
      } else if (propertyVal.isArray) {
      } else if (propertyVal.isObject) {}
    }
  }

  String _renameKey(String old) {
    String result;
    if (DART_KEYWORDS.contains(old)) result = "\$$old";
    return result;
  }
}

class _AncestorInfo {
  int arrayIndex;
  String objectKey;
  JsonElement element;

  bool get isArray => element.isArray;

  _AncestorInfo.array(this.arrayIndex, JsonArray array) : element = array;

  _AncestorInfo.object(this.objectKey, JsonObject object) : element = object;
}
