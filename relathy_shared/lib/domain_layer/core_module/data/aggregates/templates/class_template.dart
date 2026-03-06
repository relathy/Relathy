import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/common/display_name.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/templates/property_type_template.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
part 'class_template.freezed.dart';

@Freezed(equal: false, copyWith: false, toStringOverride: false)
sealed class ClassTemplate with _$ClassTemplate implements Aggregate {
  const ClassTemplate._();

  ObjectId get objectId => classObject.objectId;

  const factory ClassTemplate.typeTemplate({
    required WebObject classObject,
    required DisplayName label,
    required List<PropertyTypeTemplate> propertyTypeTemplates,
  }) = TypeTemplate;

  const factory ClassTemplate.mixinTemplate({
    required WebObject classObject,
    required DisplayName label,
    required List<PropertyTypeTemplate> propertyTypeTemplates,
  }) = MixinTemplate;

  bool get isEmpty => propertyTypeTemplates.isEmpty;
}
