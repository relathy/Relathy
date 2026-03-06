import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/class_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/object_classes_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/view_class_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

@immutable
class ViewObjectClassesTemplate implements Aggregate {
  const ViewObjectClassesTemplate({
    required this.objectId,
    required this.name,
    required this.objectClassesTemplate,
    required this.viewClassTemplates,
  });

  final ObjectId objectId;
  final String name;
  final ObjectClassesTemplate objectClassesTemplate;
  final List<ViewClassTemplate> viewClassTemplates;

  List<ClassTemplate> get classTemplates => objectClassesTemplate.classTemplates;
}
