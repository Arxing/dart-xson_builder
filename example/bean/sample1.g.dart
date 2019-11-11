// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample1Bean _$Sample1BeanFromJson(Map<String, dynamic> json) {
  return Sample1Bean(
    a: translateInt(json['a']),
    b: translateDouble(json['b']),
    c: translateBool(json['c']),
    d: translateString(json['d']),
    e: _FromJsonWrapper._fromJsonList$int$(json['e']),
    f: Sample1FBean._fromJson(json['f']),
    g: _FromJsonWrapper._fromJsonList$List$int$$(json['g']),
    h: _FromJsonWrapper._fromJsonList$Sample1HList0Bean$(json['h']),
    i: _FromJsonWrapper._fromJsonList$dynamic$(json['i']),
    j: Sample1JBean._fromJson(json['j']),
  );
}

Map<String, dynamic> _$Sample1BeanToJson(Sample1Bean instance) =>
    <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'd': instance.d,
      'e': _ToJsonWrapper._toJsonList$int$(instance.e),
      'f': Sample1FBean._toJson(instance.f),
      'g': _ToJsonWrapper._toJsonList$List$int$$(instance.g),
      'h': _ToJsonWrapper._toJsonList$Sample1HList0Bean$(instance.h),
      'i': _ToJsonWrapper._toJsonList$dynamic$(instance.i),
      'j': Sample1JBean._toJson(instance.j),
    };

Sample1JBean _$Sample1JBeanFromJson(Map<String, dynamic> json) {
  return Sample1JBean(
    j1: Sample1JJ1Bean._fromJson(json['j1']),
  );
}

Map<String, dynamic> _$Sample1JBeanToJson(Sample1JBean instance) =>
    <String, dynamic>{
      'j1': Sample1JJ1Bean._toJson(instance.j1),
    };

Sample1JJ1Bean _$Sample1JJ1BeanFromJson(Map<String, dynamic> json) {
  return Sample1JJ1Bean(
    j11: Sample1JJ1J11Bean._fromJson(json['j11']),
  );
}

Map<String, dynamic> _$Sample1JJ1BeanToJson(Sample1JJ1Bean instance) =>
    <String, dynamic>{
      'j11': Sample1JJ1J11Bean._toJson(instance.j11),
    };

Sample1JJ1J11Bean _$Sample1JJ1J11BeanFromJson(Map<String, dynamic> json) {
  return Sample1JJ1J11Bean(
    j111: Sample1JJ1J11J111Bean._fromJson(json['j111']),
  );
}

Map<String, dynamic> _$Sample1JJ1J11BeanToJson(Sample1JJ1J11Bean instance) =>
    <String, dynamic>{
      'j111': Sample1JJ1J11J111Bean._toJson(instance.j111),
    };

Sample1JJ1J11J111Bean _$Sample1JJ1J11J111BeanFromJson(
    Map<String, dynamic> json) {
  return Sample1JJ1J11J111Bean(
    j1111: Sample1JJ1J11J111J1111Bean._fromJson(json['j1111']),
  );
}

Map<String, dynamic> _$Sample1JJ1J11J111BeanToJson(
        Sample1JJ1J11J111Bean instance) =>
    <String, dynamic>{
      'j1111': Sample1JJ1J11J111J1111Bean._toJson(instance.j1111),
    };

Sample1JJ1J11J111J1111Bean _$Sample1JJ1J11J111J1111BeanFromJson(
    Map<String, dynamic> json) {
  return Sample1JJ1J11J111J1111Bean(
    j11111: _FromJsonWrapper._fromJsonList$String$(json['j11111']),
  );
}

Map<String, dynamic> _$Sample1JJ1J11J111J1111BeanToJson(
        Sample1JJ1J11J111J1111Bean instance) =>
    <String, dynamic>{
      'j11111': _ToJsonWrapper._toJsonList$String$(instance.j11111),
    };

Sample1IList4Bean _$Sample1IList4BeanFromJson(Map<String, dynamic> json) {
  return Sample1IList4Bean(
    isoup1:
        _FromJsonWrapper._fromJsonList$List$List$List$int$$$$(json['isoup1']),
  );
}

Map<String, dynamic> _$Sample1IList4BeanToJson(Sample1IList4Bean instance) =>
    <String, dynamic>{
      'isoup1':
          _ToJsonWrapper._toJsonList$List$List$List$int$$$$(instance.isoup1),
    };

Sample1HList0Bean _$Sample1HList0BeanFromJson(Map<String, dynamic> json) {
  return Sample1HList0Bean(
    name: translateString(json['name']),
    color: translateString(json['color']),
  );
}

Map<String, dynamic> _$Sample1HList0BeanToJson(Sample1HList0Bean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };

Sample1FBean _$Sample1FBeanFromJson(Map<String, dynamic> json) {
  return Sample1FBean(
    f1: translateInt(json['f1']),
    f2: translateString(json['f2']),
  );
}

Map<String, dynamic> _$Sample1FBeanToJson(Sample1FBean instance) =>
    <String, dynamic>{
      'f1': instance.f1,
      'f2': instance.f2,
    };
