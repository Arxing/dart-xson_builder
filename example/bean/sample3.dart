import 'package:xson_annotation/xson_annotation.dart';

@XsonBean(jsonFilePath: "./example/json/sample_json.json", classSuffix: "mixin", rootClassName: "root")
class Sample3 {}
