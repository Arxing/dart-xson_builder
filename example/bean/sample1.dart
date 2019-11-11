import 'package:json_annotation/json_annotation.dart';
import 'package:type_translator/type_translator.dart';
part 'sample1.g.dart';

@JsonSerializable()
class Sample1Bean {
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
  @JsonKey(fromJson: Sample1FBean._fromJson, toJson: Sample1FBean._toJson)
  Sample1FBean f;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$int$$,
      toJson: _ToJsonWrapper._toJsonList$List$int$$)
  List<List<int>> g;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$Sample1HList0Bean$,
      toJson: _ToJsonWrapper._toJsonList$Sample1HList0Bean$)
  List<Sample1HList0Bean> h;
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$dynamic$,
      toJson: _ToJsonWrapper._toJsonList$dynamic$)
  List<dynamic> i;
  @JsonKey(fromJson: Sample1JBean._fromJson, toJson: Sample1JBean._toJson)
  Sample1JBean j;

  Sample1Bean(
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
  factory Sample1Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1BeanFromJson(json) : null;

  dynamic toJson() => _$Sample1BeanToJson(this);
}

@JsonSerializable()
class Sample1JBean {
  @JsonKey(fromJson: Sample1JJ1Bean._fromJson, toJson: Sample1JJ1Bean._toJson)
  Sample1JJ1Bean j1;

  Sample1JBean({this.j1});
  factory Sample1JBean.fromJson(dynamic json) =>
      json != null ? _$Sample1JBeanFromJson(json) : null;

  static Sample1JBean _fromJson(dynamic json) => Sample1JBean.fromJson(json);

  static dynamic _toJson(Sample1JBean instance) => instance.toJson();

  dynamic toJson() => _$Sample1JBeanToJson(this);
}

@JsonSerializable()
class Sample1JJ1Bean {
  @JsonKey(
      fromJson: Sample1JJ1J11Bean._fromJson, toJson: Sample1JJ1J11Bean._toJson)
  Sample1JJ1J11Bean j11;

  Sample1JJ1Bean({this.j11});
  factory Sample1JJ1Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1BeanFromJson(json) : null;

  static Sample1JJ1Bean _fromJson(dynamic json) =>
      Sample1JJ1Bean.fromJson(json);

  static dynamic _toJson(Sample1JJ1Bean instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1BeanToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11Bean {
  @JsonKey(
      fromJson: Sample1JJ1J11J111Bean._fromJson,
      toJson: Sample1JJ1J11J111Bean._toJson)
  Sample1JJ1J11J111Bean j111;

  Sample1JJ1J11Bean({this.j111});
  factory Sample1JJ1J11Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11BeanFromJson(json) : null;

  static Sample1JJ1J11Bean _fromJson(dynamic json) =>
      Sample1JJ1J11Bean.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11Bean instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11BeanToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11J111Bean {
  @JsonKey(
      fromJson: Sample1JJ1J11J111J1111Bean._fromJson,
      toJson: Sample1JJ1J11J111J1111Bean._toJson)
  Sample1JJ1J11J111J1111Bean j1111;

  Sample1JJ1J11J111Bean({this.j1111});
  factory Sample1JJ1J11J111Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11J111BeanFromJson(json) : null;

  static Sample1JJ1J11J111Bean _fromJson(dynamic json) =>
      Sample1JJ1J11J111Bean.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11J111Bean instance) => instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11J111BeanToJson(this);
}

@JsonSerializable()
class Sample1JJ1J11J111J1111Bean {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$String$,
      toJson: _ToJsonWrapper._toJsonList$String$)
  List<String> j11111;

  Sample1JJ1J11J111J1111Bean({this.j11111});
  factory Sample1JJ1J11J111J1111Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1JJ1J11J111J1111BeanFromJson(json) : null;

  static Sample1JJ1J11J111J1111Bean _fromJson(dynamic json) =>
      Sample1JJ1J11J111J1111Bean.fromJson(json);

  static dynamic _toJson(Sample1JJ1J11J111J1111Bean instance) =>
      instance.toJson();

  dynamic toJson() => _$Sample1JJ1J11J111J1111BeanToJson(this);
}

@JsonSerializable()
class Sample1IList4Bean {
  @JsonKey(
      fromJson: _FromJsonWrapper._fromJsonList$List$List$List$int$$$$,
      toJson: _ToJsonWrapper._toJsonList$List$List$List$int$$$$)
  List<List<List<List<int>>>> isoup1;

  Sample1IList4Bean({this.isoup1});
  factory Sample1IList4Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1IList4BeanFromJson(json) : null;

  static Sample1IList4Bean _fromJson(dynamic json) =>
      Sample1IList4Bean.fromJson(json);

  static dynamic _toJson(Sample1IList4Bean instance) => instance.toJson();

  dynamic toJson() => _$Sample1IList4BeanToJson(this);
}

@JsonSerializable()
class Sample1HList0Bean {
  @JsonKey(fromJson: translateString)
  String name;
  @JsonKey(fromJson: translateString)
  String color;

  Sample1HList0Bean({this.name, this.color});
  factory Sample1HList0Bean.fromJson(dynamic json) =>
      json != null ? _$Sample1HList0BeanFromJson(json) : null;

  static Sample1HList0Bean _fromJson(dynamic json) =>
      Sample1HList0Bean.fromJson(json);

  static dynamic _toJson(Sample1HList0Bean instance) => instance.toJson();

  dynamic toJson() => _$Sample1HList0BeanToJson(this);
}

@JsonSerializable()
class Sample1FBean {
  @JsonKey(fromJson: translateInt)
  int f1;
  @JsonKey(fromJson: translateString)
  String f2;

  Sample1FBean({this.f1, this.f2});
  factory Sample1FBean.fromJson(dynamic json) =>
      json != null ? _$Sample1FBeanFromJson(json) : null;

  static Sample1FBean _fromJson(dynamic json) => Sample1FBean.fromJson(json);

  static dynamic _toJson(Sample1FBean instance) => instance.toJson();

  dynamic toJson() => _$Sample1FBeanToJson(this);
}

class _FromJsonWrapper {
  static List<int> _fromJsonList$int$(dynamic json) =>
      (json as List).map((json) => translateT<int>(json)).toList();

  static List<List<int>> _fromJsonList$List$int$$(dynamic json) =>
      (json as List)
          .map((json) =>
              (json as List).map((json) => translateT<int>(json)).toList())
          .toList();

  static List<Sample1HList0Bean> _fromJsonList$Sample1HList0Bean$(
          dynamic json) =>
      (json as List).map((json) => Sample1HList0Bean.fromJson(json)).toList();

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

  static dynamic _toJsonList$Sample1HList0Bean$(
          List<Sample1HList0Bean> instance) =>
      instance.map((instance) => instance.toJson()).toList();

  static dynamic _toJsonList$List$List$int$$$(List<List<List<int>>> instance) =>
      instance;

  static dynamic _toJsonList$List$List$List$int$$$$(
          List<List<List<List<int>>>> instance) =>
      instance;

  static dynamic _toJsonList$dynamic$(List<dynamic> instance) => instance;

  static dynamic _toJsonList$String$(List<String> instance) => instance;
}
