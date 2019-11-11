import 'dart:io';

import 'package:xson_builder/xson_builder.dart';

XsonBuilder builder = XsonBuilder();

main() async {
  print("generating...");
  generateBeanWithJsonContent();
  String fileContent = generateBeanAndGetFileContent();
  File("./example/sample2.dart").writeAsStringSync(fileContent);
  await executeBuildRunner();
  print("generate success");
}

void generateBeanWithJsonContent() {
  String content = File("./example/json/sample_json.json").readAsStringSync();
  builder.generateAndWriteFile("./example", "sample1.dart", content);
}

String generateBeanAndGetFileContent() {
  String content = File("./example/json/sample_json.json").readAsStringSync();
  return builder.generateAndGetFileContent("sample2.dart", content);
}
