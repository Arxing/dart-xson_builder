import 'dart:convert';
import 'dart:io';

import 'package:xson/xson.dart';

import 'bean/sample1.dart';
import 'bean/sample2.dart';
import 'bean/sample3.xson.dart';
import 'bean/sample4.xson.dart';

void main() {
  String jsonSource = File("./example/json_input/sample_input_json.json").readAsStringSync();
  var json = jsonDecode(jsonSource);

  Sample1Bean bean1 = Sample1Bean.fromJson(json);
  dynamic resultJson1 = bean1.toJson();
  Sample2Bean bean2 = Sample2Bean.fromJson(json);
  dynamic resultJson2 = bean2.toJson();
  RootMixin bean3 = RootMixin.fromJson(json);
  dynamic resultJson3 = bean3.toJson();
  Sample4Bean bean4 = Sample4Bean.fromJson(json);
  dynamic resultJson4 = bean4.toJson();
}
