import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xson_annotation/xson_annotation.dart';
import 'package:xson_builder/xson_builder.dart';

class XsonBeanGenerator extends GeneratorForAnnotation<XsonBean> {
  XsonBuilder xsonBuilder = XsonBuilder();

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    String jsonContent = _getRealJsonContent(annotation);
    String rootClassName = annotation.peek("rootClassName")?.stringValue;
    String classSuffix = annotation.peek("classSuffix")?.stringValue;

    return xsonBuilder.generateAndGetFileContent(
      element.source.shortName,
      jsonContent,
      rootClassName: rootClassName,
      classSuffix: classSuffix,
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
}
