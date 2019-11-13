import 'dart:io';
import 'dart:mirrors';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xfile/xfile.dart';
import 'package:xson_annotation/xson_annotation.dart';
import 'package:xson_builder/xson_builder.dart';

class XsonBeanGenerator extends GeneratorForAnnotation<XsonBean> {
  XsonBuilder xsonBuilder = XsonBuilder();

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element.kind != ElementKind.CLASS) return null;
    ClassElement classElement = element as ClassElement;

    String jsonContent = _getRealJsonContent(annotation);
    String rootClassName = annotation.peek("rootClassName")?.stringValue;
    String classSuffix = annotation.peek("classSuffix")?.stringValue;

    String className = classElement.name;
    PropertyRenameHandler renameHandler = await _reflectRenameHandler(element, annotation, className);

    return xsonBuilder.generateAndGetFileContent(
      element.source.shortName,
      jsonContent,
      rootClassName: rootClassName,
      classSuffix: classSuffix,
      handler: renameHandler,
      fromBuildRunner: true,
    );
  }

  String _getRealJsonContent(ConstantReader xsonBean) {
    String jsonContent = xsonBean.peek("jsonContent")?.stringValue;
    String jsonFilePath = xsonBean.peek("jsonFilePath")?.stringValue;
    if ((jsonContent == null && jsonFilePath == null) || (jsonContent != null && jsonFilePath != null)) {
      throw "You must only choose one way to generate dart bean.";
    }
    if (jsonContent != null) return jsonContent;
    File file = File(jsonFilePath);
    if (!file.existsSync()) throw "Can not find json source file at $jsonFilePath!";
    return file.readAsStringSync();
  }

  Future<PropertyRenameHandler> _reflectRenameHandler(Element element, ConstantReader annotation, String className) async {
    var peeks = annotation.peek("propertyRenameHandler");

    // not set propertyRenameHandler in @XsonBean
    if (peeks == null) return null;
    var handler = peeks.objectValue;
    ExecutableElement handlerInfo = handler.toFunctionValue();
    String libraryName = handlerInfo.source.fullName;
    String methodName = handlerInfo.name;

    MirrorSystem mirrorSystem = currentMirrorSystem();
    String path = XFile.fromPath(Directory.current.path).cdBack().append(element.source.uri.path).file.path;

    LibraryMirror libraryMirror = await mirrorSystem.isolate.loadUri(Uri.file(path));

    // can not found target library
    if (libraryMirror == null) {
      log.warning("can not found library name($libraryName) in current mirror system.");
      return null;
    }

    DeclarationMirror declarationMirror = libraryMirror.declarations[Symbol(className)];
    ClassMirror classMirror = declarationMirror as ClassMirror;
    PropertyRenameHandler result = (String key, String name) => classMirror.invoke(Symbol(methodName), [key, name]).reflectee;
    return result;
  }
}
