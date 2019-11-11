// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// XsonBeanGenerator
// **************************************************************************

import 'package:json_annotation/json_annotation.dart';
import 'package:type_translator/type_translator.dart';
part 'sample4.xson.g.dart';

@JsonSerializable()
class Sample4Bean {
  @JsonKey(fromJson: translateString)
  String name;
  @JsonKey(fromJson: translateDouble)
  double price;
  @JsonKey(fromJson: translateString)
  String color;

  Sample4Bean({this.name, this.price, this.color});
  factory Sample4Bean.fromJson(dynamic json) =>
      json != null ? _$Sample4BeanFromJson(json) : null;

  dynamic toJson() => _$Sample4BeanToJson(this);
}
