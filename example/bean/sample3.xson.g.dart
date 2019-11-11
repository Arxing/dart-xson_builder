// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample3.xson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootMixin _$RootMixinFromJson(Map<String, dynamic> json) {
  return RootMixin(
    a: translateInt(json['a']),
    b: translateDouble(json['b']),
    c: translateBool(json['c']),
    d: translateString(json['d']),
    e: _FromJsonWrapper._fromJsonList$int$(json['e']),
    f: RootFMixin._fromJson(json['f']),
    g: _FromJsonWrapper._fromJsonList$List$int$$(json['g']),
    h: _FromJsonWrapper._fromJsonList$RootHList0Mixin$(json['h']),
    i: _FromJsonWrapper._fromJsonList$dynamic$(json['i']),
    j: RootJMixin._fromJson(json['j']),
  );
}

Map<String, dynamic> _$RootMixinToJson(RootMixin instance) => <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'd': instance.d,
      'e': _ToJsonWrapper._toJsonList$int$(instance.e),
      'f': RootFMixin._toJson(instance.f),
      'g': _ToJsonWrapper._toJsonList$List$int$$(instance.g),
      'h': _ToJsonWrapper._toJsonList$RootHList0Mixin$(instance.h),
      'i': _ToJsonWrapper._toJsonList$dynamic$(instance.i),
      'j': RootJMixin._toJson(instance.j),
    };

RootJMixin _$RootJMixinFromJson(Map<String, dynamic> json) {
  return RootJMixin(
    j1: RootJJ1Mixin._fromJson(json['j1']),
  );
}

Map<String, dynamic> _$RootJMixinToJson(RootJMixin instance) =>
    <String, dynamic>{
      'j1': RootJJ1Mixin._toJson(instance.j1),
    };

RootJJ1Mixin _$RootJJ1MixinFromJson(Map<String, dynamic> json) {
  return RootJJ1Mixin(
    j11: RootJJ1J11Mixin._fromJson(json['j11']),
  );
}

Map<String, dynamic> _$RootJJ1MixinToJson(RootJJ1Mixin instance) =>
    <String, dynamic>{
      'j11': RootJJ1J11Mixin._toJson(instance.j11),
    };

RootJJ1J11Mixin _$RootJJ1J11MixinFromJson(Map<String, dynamic> json) {
  return RootJJ1J11Mixin(
    j111: RootJJ1J11J111Mixin._fromJson(json['j111']),
  );
}

Map<String, dynamic> _$RootJJ1J11MixinToJson(RootJJ1J11Mixin instance) =>
    <String, dynamic>{
      'j111': RootJJ1J11J111Mixin._toJson(instance.j111),
    };

RootJJ1J11J111Mixin _$RootJJ1J11J111MixinFromJson(Map<String, dynamic> json) {
  return RootJJ1J11J111Mixin(
    j1111: RootJJ1J11J111J1111Mixin._fromJson(json['j1111']),
  );
}

Map<String, dynamic> _$RootJJ1J11J111MixinToJson(
        RootJJ1J11J111Mixin instance) =>
    <String, dynamic>{
      'j1111': RootJJ1J11J111J1111Mixin._toJson(instance.j1111),
    };

RootJJ1J11J111J1111Mixin _$RootJJ1J11J111J1111MixinFromJson(
    Map<String, dynamic> json) {
  return RootJJ1J11J111J1111Mixin(
    j11111: _FromJsonWrapper._fromJsonList$String$(json['j11111']),
  );
}

Map<String, dynamic> _$RootJJ1J11J111J1111MixinToJson(
        RootJJ1J11J111J1111Mixin instance) =>
    <String, dynamic>{
      'j11111': _ToJsonWrapper._toJsonList$String$(instance.j11111),
    };

RootIList4Mixin _$RootIList4MixinFromJson(Map<String, dynamic> json) {
  return RootIList4Mixin(
    isoup1:
        _FromJsonWrapper._fromJsonList$List$List$List$int$$$$(json['isoup1']),
  );
}

Map<String, dynamic> _$RootIList4MixinToJson(RootIList4Mixin instance) =>
    <String, dynamic>{
      'isoup1':
          _ToJsonWrapper._toJsonList$List$List$List$int$$$$(instance.isoup1),
    };

RootHList0Mixin _$RootHList0MixinFromJson(Map<String, dynamic> json) {
  return RootHList0Mixin(
    name: translateString(json['name']),
    color: translateString(json['color']),
  );
}

Map<String, dynamic> _$RootHList0MixinToJson(RootHList0Mixin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
    };

RootFMixin _$RootFMixinFromJson(Map<String, dynamic> json) {
  return RootFMixin(
    f1: translateInt(json['f1']),
    f2: translateString(json['f2']),
  );
}

Map<String, dynamic> _$RootFMixinToJson(RootFMixin instance) =>
    <String, dynamic>{
      'f1': instance.f1,
      'f2': instance.f2,
    };
