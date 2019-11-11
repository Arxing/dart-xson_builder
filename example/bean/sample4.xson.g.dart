// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample4.xson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample4Bean _$Sample4BeanFromJson(Map<String, dynamic> json) {
  return Sample4Bean(
    name: translateString(json['name']),
    price: translateDouble(json['price']),
    color: translateString(json['color']),
  );
}

Map<String, dynamic> _$Sample4BeanToJson(Sample4Bean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'color': instance.color,
    };
