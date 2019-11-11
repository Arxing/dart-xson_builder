// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// XsonBeanGenerator
// **************************************************************************

import 'package:json_annotation/json_annotation.dart';
import 'package:type_translator/type_translator.dart';
part 'sample3.xson.g.dart';

@JsonSerializable()
class RootMixin {
  @JsonKey(fromJson: translateInt)
  int a;
  @JsonKey(fromJson: translateDouble)
  double b;
  @JsonKey(fromJson: translateBool)
  bool c;
  @JsonKey(fromJson: translateString)
  String d;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$int$,
      toJson: _ToJsonWrapper._toJsonList$int$)
  List<int> e;
  @JsonKey(fromJson: RootFMixin._fromJson, toJson: RootFMixin._toJson)
  RootFMixin f;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$int$$,
      toJson: _ToJsonWrapper._toJsonList$List$int$$)
  List<List<int>> g;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$RootHList0Mixin$,
      toJson: _ToJsonWrapper._toJsonList$RootHList0Mixin$)
  List<RootHList0Mixin> h;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$dynamic$,
      toJson: _ToJsonWrapper._toJsonList$dynamic$)
  List<dynamic> i;
  @JsonKey(fromJson: RootJMixin._fromJson, toJson: RootJMixin._toJson)
  RootJMixin j;

  RootMixin(
      {this.a,
      this.b,
      this.c,
      this.d,
      this.e,
      this.f,
      this.g,
      this.h,
      this.i,
      this.j});
  factory RootMixin.fromJson(dynamic json) =>
      json != null ? _$RootMixinFromJson(json) : null;

  dynamic toJson() => _$RootMixinToJson(this);
}

@JsonSerializable()
class RootJMixin {
  @JsonKey(fromJson: RootJJ1Mixin._fromJson, toJson: RootJJ1Mixin._toJson)
  RootJJ1Mixin j1;

  RootJMixin({this.j1});
  factory RootJMixin.fromJson(dynamic json) =>
      json != null ? _$RootJMixinFromJson(json) : null;

  static RootJMixin _fromJson(dynamic json) => RootJMixin.fromJson(json);

  static dynamic _toJson(RootJMixin instance) => instance.toJson();

  dynamic toJson() => _$RootJMixinToJson(this);
}

@JsonSerializable()
class RootJJ1Mixin {
  @JsonKey(fromJson: RootJJ1J11Mixin._fromJson, toJson: RootJJ1J11Mixin._toJson)
  RootJJ1J11Mixin j11;

  RootJJ1Mixin({this.j11});
  factory RootJJ1Mixin.fromJson(dynamic json) =>
      json != null ? _$RootJJ1MixinFromJson(json) : null;

  static RootJJ1Mixin _fromJson(dynamic json) => RootJJ1Mixin.fromJson(json);

  static dynamic _toJson(RootJJ1Mixin instance) => instance.toJson();

  dynamic toJson() => _$RootJJ1MixinToJson(this);
}

@JsonSerializable()
class RootJJ1J11Mixin {
  @JsonKey(
      fromJson: RootJJ1J11J111Mixin._fromJson,
      toJson: RootJJ1J11J111Mixin._toJson)
  RootJJ1J11J111Mixin j111;

  RootJJ1J11Mixin({this.j111});
  factory RootJJ1J11Mixin.fromJson(dynamic json) =>
      json != null ? _$RootJJ1J11MixinFromJson(json) : null;

  static RootJJ1J11Mixin _fromJson(dynamic json) =>
      RootJJ1J11Mixin.fromJson(json);

  static dynamic _toJson(RootJJ1J11Mixin instance) => instance.toJson();

  dynamic toJson() => _$RootJJ1J11MixinToJson(this);
}

@JsonSerializable()
class RootJJ1J11J111Mixin {
  @JsonKey(
      fromJson: RootJJ1J11J111J1111Mixin._fromJson,
      toJson: RootJJ1J11J111J1111Mixin._toJson)
  RootJJ1J11J111J1111Mixin j1111;

  RootJJ1J11J111Mixin({this.j1111});
  factory RootJJ1J11J111Mixin.fromJson(dynamic json) =>
      json != null ? _$RootJJ1J11J111MixinFromJson(json) : null;

  static RootJJ1J11J111Mixin _fromJson(dynamic json) =>
      RootJJ1J11J111Mixin.fromJson(json);

  static dynamic _toJson(RootJJ1J11J111Mixin instance) => instance.toJson();

  dynamic toJson() => _$RootJJ1J11J111MixinToJson(this);
}

@JsonSerializable()
class RootJJ1J11J111J1111Mixin {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$String$,
      toJson: _ToJsonWrapper._toJsonList$String$)
  List<String> j11111;

  RootJJ1J11J111J1111Mixin({this.j11111});
  factory RootJJ1J11J111J1111Mixin.fromJson(dynamic json) =>
      json != null ? _$RootJJ1J11J111J1111MixinFromJson(json) : null;

  static RootJJ1J11J111J1111Mixin _fromJson(dynamic json) =>
      RootJJ1J11J111J1111Mixin.fromJson(json);

  static dynamic _toJson(RootJJ1J11J111J1111Mixin instance) =>
      instance.toJson();

  dynamic toJson() => _$RootJJ1J11J111J1111MixinToJson(this);
}

@JsonSerializable()
class RootIList4Mixin {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$List$List$int$$$$,
      toJson: _ToJsonWrapper._toJsonList$List$List$List$int$$$$)
  List<List<List<List<int>>>> isoup1;

  RootIList4Mixin({this.isoup1});
  factory RootIList4Mixin.fromJson(dynamic json) =>
      json != null ? _$RootIList4MixinFromJson(json) : null;

  static RootIList4Mixin _fromJson(dynamic json) =>
      RootIList4Mixin.fromJson(json);

  static dynamic _toJson(RootIList4Mixin instance) => instance.toJson();

  dynamic toJson() => _$RootIList4MixinToJson(this);
}

@JsonSerializable()
class RootHList0Mixin {
  @JsonKey(fromJson: translateString)
  String name;
  @JsonKey(fromJson: translateString)
  String color;

  RootHList0Mixin({this.name, this.color});
  factory RootHList0Mixin.fromJson(dynamic json) =>
      json != null ? _$RootHList0MixinFromJson(json) : null;

  static RootHList0Mixin _fromJson(dynamic json) =>
      RootHList0Mixin.fromJson(json);

  static dynamic _toJson(RootHList0Mixin instance) => instance.toJson();

  dynamic toJson() => _$RootHList0MixinToJson(this);
}

@JsonSerializable()
class RootFMixin {
  @JsonKey(fromJson: translateInt)
  int f1;
  @JsonKey(fromJson: translateString)
  String f2;

  RootFMixin({this.f1, this.f2});
  factory RootFMixin.fromJson(dynamic json) =>
      json != null ? _$RootFMixinFromJson(json) : null;

  static RootFMixin _fromJson(dynamic json) => RootFMixin.fromJson(json);

  static dynamic _toJson(RootFMixin instance) => instance.toJson();

  dynamic toJson() => _$RootFMixinToJson(this);
}

class _FromJsonWrapper {
  static List<int> _fromJsonList$int$(dynamic json) =>
      (json as List).map((json) => translateT<int>(json)).toList();

  static List<List<int>> _fromJsonList$List$int$$(dynamic json) =>
      (json as List)
          .map((json) =>
              (json as List).map((json) => translateT<int>(json)).toList())
          .toList();

  static List<RootHList0Mixin> _fromJsonList$RootHList0Mixin$(dynamic json) =>
      (json as List).map((json) => RootHList0Mixin.fromJson(json)).toList();

  static List<List<List<int>>> _fromJsonList$List$List$int$$$(dynamic json) =>
      (json as List)
          .map((json) => (json as List)
              .map((json) =>
                  (json as List).map((json) => translateT<int>(json)).toList())
              .toList())
          .toList();

  static List<List<List<List<int>>>> _fromJsonList$List$List$List$int$$$$(
          dynamic json) =>
      (json as List)
          .map((json) => (json as List)
              .map((json) => (json as List)
                  .map((json) => (json as List)
                      .map((json) => translateT<int>(json))
                      .toList())
                  .toList())
              .toList())
          .toList();

  static List<dynamic> _fromJsonList$dynamic$(dynamic json) =>
      (json as List).map((json) => json).toList();

  static List<String> _fromJsonList$String$(dynamic json) =>
      (json as List).map((json) => translateT<String>(json)).toList();
}

class _ToJsonWrapper {
  static dynamic _toJsonList$int$(List<int> instance) => instance;

  static dynamic _toJsonList$List$int$$(List<List<int>> instance) => instance;

  static dynamic _toJsonList$RootHList0Mixin$(List<RootHList0Mixin> instance) =>
      instance.map((instance) => instance.toJson()).toList();

  static dynamic _toJsonList$List$List$int$$$(List<List<List<int>>> instance) =>
      instance;

  static dynamic _toJsonList$List$List$List$int$$$$(
          List<List<List<List<int>>>> instance) =>
      instance;

  static dynamic _toJsonList$dynamic$(List<dynamic> instance) => instance;

  static dynamic _toJsonList$String$(List<String> instance) => instance;
}
