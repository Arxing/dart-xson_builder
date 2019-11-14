![](https://img.shields.io/badge/language-dart-orange.svg)
![](https://img.shields.io/badge/pub-v1.0.3-blue.svg)

`xson_builder` can help you to easily generate dart json bean by json source.
You can also change root class name and class name's suffix. 
Here are 2 ways to use this package.

+ generate programmatically with `XsonBuilder().generateAndGetFileContent()` or 
`XsonBuilder().generateAndWriteFile()`.

+ generate dart json bean with `@XsonBean` via 
[xson_annotation](https://pub.dev/packages/xson_annotation).

## Example

### Generate programmatically

1. Create a instance of `XsonBuilder`.
2. Get a json string via any way.
3. Call method `generateAndWriteFile(outputDir, outputFileName, json)` can auto generate file, 
   call method `generateAndGetFileContent(outputFileName, json)` can get file content.

```dart
import 'dart:io';

import 'package:xson_builder/xson_builder.dart';

XsonBuilder builder = XsonBuilder();

main() async {
  String content = File("./example/json/sample_json.json").readAsStringSync();
  builder.generateAndWriteFile("./example", "sample1.dart", content);
}
```

4. Then `sample1.dart` will be generated.
5. execute build_runner command `pub run build_runner build`.
6. Then `sample1.g.dart` will be generated.

### Generate by `build_runner`

1. Depends package `xson_annotation`.
2. Given a dart file `sample3.dart` with a `Sample3` class annotated with `@XsonBean()`.
3. Given `@XsonBean()` a json source way, 
   raw json(`jsonContent:`) or json file path(`jsonFilePath:`). 
   You can only choose one way to generate.
4. If you use raw json way, you class will be like this:
```dart
import 'package:xson_annotation/xson_annotation.dart';

const _json = """
{
  "name": "apple",
  "price": 60.5,
  "color": "yellow"
}
""";

@XsonBean(jsonContent: _json)
class Sample4 {}
```

5. If you use json file path way, you class will be like this:
```dart
import 'package:xson_annotation/xson_annotation.dart';

@XsonBean(jsonFilePath: "./example/json/sample_json.json")
class Sample3 {}
```

6. Execute build_runner command `pub run build_runner build`.
7. Then `sample1.xson.dart` and `sample1.xson.g.dart` will be generated.