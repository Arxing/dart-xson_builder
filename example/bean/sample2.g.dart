// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample2Bean _$Sample2BeanFromJson(Map<String, dynamic> json) {
  return Sample2Bean(
    a: translateInt(json['a']),
    b: translateDouble(json['b']),
    c: translateBool(json['c']),
    d: translateString(json['d']),
    e: _FromJsonWrapper._fromJsonList$int$(json['e']),
    f: Sample2FBean._fromJson(json['f']),
    g: _FromJsonWrapper._fromJsonList$List$int$$(json['g']),
    h: _FromJsonWrapper._fromJsonList$Sample2HList0Bean$(json['h']),
    i: _FromJsonWrapper._fromJsonList$dynamic$(json['i']),
    j: Sample2JBean._fromJson(json['j']),
  );
}

Map<String, dynamic> _$Sample2BeanToJson(Sample2Bean instance) =>
    <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'd': instance.d,
      'e': _ToJsonWrapper._toJsonList$int$(instance.e),
      'f': Sample2FBean._toJson(instance.f),
      'g': _ToJsonWrapper._toJsonList$List$int$$(instance.g),
      'h': _ToJsonWrapper._toJsonList$Sample2HList0Bean$(instance.h),
      'i': _ToJsonWrapper._toJsonList$dynamic$(instance.i),
      'j': Sample2JBean._toJson(instance.j),
    };

Sample2JBean _$Sample2JBeanFromJson(Map<String, dynamic> json) {
  return Sample2JBean(
    j1: Sample2JJ1Bean._fromJson(json['j1']),
  );
}

Map<String, dynamic> _$Sample2JBeanToJson(Sample2JBean instance) =>
    <String, dynamic>{
      'j1': Sample2JJ1Bean._toJson(instance.j1),
    };

Sample2JJ1Bean _$Sample2JJ1BeanFromJson(Map<String, dynamic> json) {
  return Sample2JJ1Bean(
    j11: Sample2JJ1J11Bean._fromJson(json['j11']),
  );
}

Map<String, dynamic> _$Sample2JJ1BeanToJson(Sample2JJ1Bean instance) =>
    <String, dynamic>{
      'j11': Sample2JJ1J11Bean._toJson(instance.j11),
    };

Sample2JJ1J11Bean _$Sample2JJ1J11BeanFromJson(Map<String, dynamic> json) {
  return Sample2JJ1J11Bean(
    j111: Sample2JJ1J11J111Bean._fromJson(json['j111']),
  );
}

Map<String, dynamic> _$Sample2JJ1J11BeanToJson(Sample2JJ1J11Bean instance) =>
    <String, dynamic>{
      'j111': Sample2JJ1J11J111Bean._toJson(instance.j111),
    };

Sample2JJ1J11J111Bean _$Sample2JJ1J11J111BeanFromJson(
    Map<String, dynamic> json) {
  return Sample2JJ1J11J111Bean(
    j1111: Sample2JJ1J11J111J1111Bean._fromJson(json['j1111']),
  );
}

Map<String, dynamic> _$Sample2JJ1J11J111BeanToJson(
        Sample2JJ1J11J111Bean instance) =>
    <String, dynamic>{
      'j1111': Sample2JJ1J11J111J1111Bean._toJson(instance.j1111),
    };

Sample2JJ1J11J111J1111Bean _$Sample2JJ1J11J111J1111BeanFromJson(
    Map<String, dynamic> json) {
  return Sample2JJ1J11J111J1111Bean(
    j11111: _FromJsonWrapper._fromJsonList$String$(json['j11111']),
  );
}

Map<String, dynamic> _$Sample2JJ1J11J111J1111BeanToJson(
        Sample2JJ1J11J111J1111Bean instance) =>
    <String, dynamic>{
      'j11111': _ToJsonWrapper._toJsonList$String$(instance.j11111),
    };

Sample2IList4Bean _$Sample2IList4BeanFromJson(Map<String, dynamic> json) {
  return Sample2IList4Bean(
    isoup1:
        _FromJsonWrapper._fromJsonList$List$List$List$int$$$$(json['isoup1']),
  );
}

Map<String, dynamic> _$Sample2IList4BeanToJson(Sample2IList4Bean instance) =>
    <String, dynamic>{
      'isoup1':
          _ToJsonWrapper._toJsonList$List$List$List$int$$$$(instance.isoup1),
    };

Sample2HList0Bean _$Sample2HList0BeanFromJson(Map<String, dynamic> json) {
  return Sample2HList0Bean(
    name: translateString(json['name']),
    color: translateString(json['color']),
  );
}

Map<String, dynamic> _$Sample2HList0BeanToJson(Sample2HList0Bean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };

Sample2FBean _$Sample2FBeanFromJson(Map<String, dynamic> json) {
  return Sample2FBean(
    f1: translateInt(json['f1']),
    f2: translateString(json['f2']),
  );
}

Map<String, dynamic> _$Sample2FBeanToJson(Sample2FBean instance) =>
    <String, dynamic>{
      'f1': instance.f1,
      'f2': instance.f2,
    };
