// lib/builder.dart
import 'package:build/build.dart';
import 'package:relathy_shared/codegen/immutable_mutable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder immutableMutableBuilder(BuilderOptions options) {
  return PartBuilder([ImmutableMutableGenerator()], '.immut_mut.dart');
}
