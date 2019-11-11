import 'package:xson_annotation/xson_annotation.dart';

const _json = """
{
  "name": "apple",
  "price": 60.5,
  "color": "yellow"
}
""";

@XsonBean(jsonContent: _json)
class Sample4 {}
