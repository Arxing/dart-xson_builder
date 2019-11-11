import 'package:json_annotation/json_annotation.dart';
import 'package:type_translator/type_translator.dart';
part 'sample1.dart.g.dart';

@JsonSerializable()
class Sample1 {
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
  @JsonKey(fromJson: Sample1F._fromJson, toJson: Sample1F._toJson)
  Sample1F f;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$int$$,
      toJson: _ToJsonWrapper._toJsonList$List$int$$)
  List<List<int>> g;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$Sample1HList0$,
      toJson: _ToJsonWrapper._toJsonList$Sample1HList0$)
  List<Sample1HList0> h;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$dynamic$,
      toJson: _ToJsonWrapper._toJsonList$dynamic$)
  List<dynamic> i;
  @JsonKey(fromJson: Sample1J._fromJson, toJson: Sample1J._toJson)
  Sample1J j;

  Sample1(
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
  factory Sample1.fromJson(dynamic json) =>
      json != null ? _$Sample1FromJson(json) : null;

  dynamic toJson() => _$Sample1ToJson(this);
}

@JsonSerializable()
class Sample1J {
  @JsonKey(fromJson: Sample1JJ1._fromJson, toJson: Sample1JJ1._toJson)
  Sample1JJ1 j1;

  Sample1J({this.j1});
  factory Sample1J.fromJson(dynamic json) =>
      json != null ? _$Sample1JFromJson(json) : null;

  static Sample1J _fromJson(dynamic json) => Sample1J.fromJson(json);

  static dynamic _toJson(Sample1J instance) => instance.toJson();

  dynamic toJson() => _$Sample1JToJson(this);
}

@JsonSerializable()
class Sample1JJ1 {
  @JsonKey(fromJson: Sample1JJ1J11._fromJson, toJson: Sample1JJ1J11._toJson)
  Sample1JJ1J11 j11;

  Sample1JJ1({this.j11});
  factory Sample1JJ1.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1FromJson(json) : null;

  static Sample1JJ1 _fromJson(dynamic json) => Sample1JJ1.fromJson(json);

  static dynamic _toJson(Sample1JJ1 instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1ToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11 {
  @JsonKey(
      fromJson: Sample1JJ1J11J111._fromJson, toJson: Sample1JJ1J11J111._toJson)
  Sample1JJ1J11J111 j111;

  Sample1JJ1J11({this.j111});
  factory Sample1JJ1J11.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11FromJson(json) : null;

  static Sample1JJ1J11 _fromJson(dynamic json) => Sample1JJ1J11.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11 instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11ToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11J111 {
  @JsonKey(
      fromJson: Sample1JJ1J11J111J1111._fromJson,
      toJson: Sample1JJ1J11J111J1111._toJson)
  Sample1JJ1J11J111J1111 j1111;

  Sample1JJ1J11J111({this.j1111});
  factory Sample1JJ1J11J111.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11J111FromJson(json) : null;

  static Sample1JJ1J11J111 _fromJson(dynamic json) =>
      Sample1JJ1J11J111.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11J111 instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11J111ToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11J111J1111 {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$String$,
      toJson: _ToJsonWrapper._toJsonList$String$)
  List<String> j11111;

  Sample1JJ1J11J111J1111({this.j11111});
  factory Sample1JJ1J11J111J1111.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11J111J1111FromJson(json) : null;

  static Sample1JJ1J11J111J1111 _fromJson(dynamic json) =>
      Sample1JJ1J11J111J1111.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11J111J1111 instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11J111J1111ToJson(this);
}

@JsonSerializable()
class Sample1IList4 {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$List$List$int$$$$,
      toJson: _ToJsonWrapper._toJsonList$List$List$List$int$$$$)
  List<List<List<List<int>>>> isoup1;

  Sample1IList4({this.isoup1});
  factory Sample1IList4.fromJson(dynamic json) =>
      json != null ? _$Sample1IList4FromJson(json) : null;

  static Sample1IList4 _fromJson(dynamic json) => Sample1IList4.fromJson(json);

  static dynamic _toJson(Sample1IList4 instance) => instance.toJson();

  dynamic toJson() => _$Sample1IList4ToJson(this);
}

@JsonSerializable()
class Sample1HList0 {
  @JsonKey(fromJson: translateString)
  String name;
  @JsonKey(fromJson: translateString)
  String color;

  Sample1HList0({this.name, this.color});
  factory Sample1HList0.fromJson(dynamic json) =>
      json != null ? _$Sample1HList0FromJson(json) : null;

  static Sample1HList0 _fromJson(dynamic json) => Sample1HList0.fromJson(json);

  static dynamic _toJson(Sample1HList0 instance) => instance.toJson();

  dynamic toJson() => _$Sample1HList0ToJson(this);
}

@JsonSerializable()
class Sample1F {
  @JsonKey(fromJson: translateInt)
  int f1;
  @JsonKey(fromJson: translateString)
  String f2;

  Sample1F({this.f1, this.f2});
  factory Sample1F.fromJson(dynamic json) =>
      json != null ? _$Sample1FFromJson(json) : null;

  static Sample1F _fromJson(dynamic json) => Sample1F.fromJson(json);

  static dynamic _toJson(Sample1F instance) => instance.toJson();

  dynamic toJson() => _$Sample1FToJson(this);
}

class _ToJsonWrapper {
  static dynamic _toJsonList$int$(List<int> instance) => instance;

  static dynamic _toJsonList$List$int$$(List<List<int>> instance) => instance;

  static dynamic _toJsonList$Sample1HList0$(List<Sample1HList0> instance) =>
      instance.map((instance) => instance.toJson()).toList();

  static dynamic _toJsonList$List$List$int$$$(List<List<List<int>>> instance) =>
      instance;

  static dynamic _toJsonList$List$List$List$int$$$$(
          List<List<List<List<int>>>> instance) =>
      instance;

  static dynamic _toJsonList$dynamic$(List<dynamic> instance) => instance;

  static dynamic _toJsonList$String$(List<String> instance) => instance;
}

class _FromJsonWrapper {
  static List<int> _fromJsonList$int$(dynamic json) =>
      json.map((json) => translateT<int>(json)).toList();

  static List<List<int>> _fromJsonList$List$int$$(dynamic json) => json
      .map((json) => json.map((json) => translateT<int>(json)).toList())
      .toList();

  static List<Sample1HList0> _fromJsonList$Sample1HList0$(dynamic json) =>
      json.map((json) => Sample1HList0.fromJson(json)).toList();

  static List<List<List<int>>> _fromJsonList$List$List$int$$$(dynamic json) =>
      json
          .map((json) => json
              .map((json) => json.map((json) => translateT<int>(json)).toList())
              .toList())
          .toList();

  static List<List<List<List<int>>>> _fromJsonList$List$List$List$int$$$$(
          dynamic json) =>
      json
          .map((json) => json
              .map((json) => json
                  .map((json) =>
                      json.map((json) => translateT<int>(json)).toList())
                  .toList())
              .toList())
          .toList();

  static List<dynamic> _fromJsonList$dynamic$(dynamic json) =>
      json.map((json) => json).toList();

  static List<String> _fromJsonList$String$(dynamic json) =>
      json.map((json) => translateT<String>(json)).toList();
}
