import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/class_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

@immutable
class ObjectClassesTemplate implements Aggregate {
  const ObjectClassesTemplate({required this.objectId, required this.name, required this.classTemplates});

  final ObjectId objectId;
  final String name;
  final List<ClassTemplate> classTemplates;
}
