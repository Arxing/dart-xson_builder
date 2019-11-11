import 'dart:io';

import 'package:xson_builder/xson_builder.dart';
import 'package:xson/xson.dart';

XsonBuilder builder = XsonBuilder();

main() async {
  print("generating...");
  generateBeanWithJsonContent();
  await executeBuildRunner();
  print("generate success");
}

void generateBeanWithJsonContent() {
  String content = File("./example/json/sample1.json").readAsStringSync();
  JsonElement rootElement = JsonElement.fromJsonString(content);
  builder.generateAndWriteFile("./example/bean", "sample1", rootElement);
}
