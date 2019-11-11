import 'dart:convert';
import 'dart:io';

import 'package:xson/xson.dart';

import 'bean/sample1.dart';

void main() {
  String jsonSource = File("./example/json_input/sample1.json").readAsStringSync();
  var json = jsonDecode(jsonSource);
  Sample1Bean bean = Sample1Bean.fromJson(json);
  dynamic resultJson = bean.toJson();
  print("toJson結果:");
  print(resultJson);
  print("");
  print("實際json:");
  print(xson.encode(resultJson, prettify: true));
}
