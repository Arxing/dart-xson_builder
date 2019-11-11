part of 'xson_builder_core.dart';

class _AncestorInfo {
  int arrayIndex;
  String objectKey;
  JsonElement element;

  bool get isRoot => arrayIndex == null && objectKey == null;

  bool get isArray => arrayIndex != null && objectKey == null;

  bool get isObject => arrayIndex == null && objectKey != null;

  _AncestorInfo.create(this.arrayIndex, this.objectKey, this.element);

  @override
  String toString() {
    return isArray ? "[$arrayIndex]" : objectKey != null ? "{$objectKey}" : "ROOT";
  }
}
