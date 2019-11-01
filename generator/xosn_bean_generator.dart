import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:xson/xson.dart';
import 'package:xson_builder/xson_builder.dart';
import 'package:dartpoet/dartpoet.dart';

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

  void _generateFile(JsonElement element, FileSpec fileSpec){
    if(element.isObject){


      for (var entry in element.asObject.entries) {
        String key = entry.key;
        JsonElement value = entry.value;
      }


    }else if(element.isArray){

    }
  }

  ClassSpec _generateClass(JsonObject object){

  }
}