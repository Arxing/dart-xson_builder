library xson_builder.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/xson_bean_generator.dart';
import 'package:logging/logging.dart';

Builder xsonBuilder(BuilderOptions options) => LibraryBuilder(XsonBeanGenerator(), generatedExtension: ".xson.dart");
