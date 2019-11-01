import 'package:dartpoet/dartpoet.dart';
import 'package:xson/xson.dart';

String generate(String json){
  JsonElement jsonElement = xson.decodeToJsonElement(json);
  jsonElement.traversalChildrenNode(_visitor);


}

JsonSerializeCallback _visitor = (JsonElement node, dynamic parent, int depth){
  JsonType jsonType = JsonType.fromElement(node);

};
