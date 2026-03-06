import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/aggregates/common/display_name.dart';

import 'package:relathy_shared/domain_layer/core_module/data/aggregates/aggregate.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
part 'property_type_template.freezed.dart';

@Freezed(equal: false, copyWith: false, toStringOverride: false)
sealed class PropertyTypeTemplate with _$PropertyTypeTemplate implements Aggregate {
  const PropertyTypeTemplate._();

  ObjectId get objectId => object.objectId;
  WebObject get object => displayName.object;

  const factory PropertyTypeTemplate.categoryAttributeTypeTemplate({required DisplayName displayName}) =
      CategoryAttributeTypeTemplate;

  const factory PropertyTypeTemplate.textAttributeTypeTemplate({required DisplayName displayName}) =
      TextAttributeTypeTemplate;

  const factory PropertyTypeTemplate.contentAttributeTypeTemplate({required DisplayName displayName}) =
      ContentAttributeTypeTemplate;

  const factory PropertyTypeTemplate.objectAttributeTypeTemplate({required DisplayName displayName}) =
      ObjectAttributeTypeTemplate;

  const factory PropertyTypeTemplate.referenceAttributeTypeTemplate({required DisplayName displayName}) =
      ReferenceAttributeTypeTemplate;

  const factory PropertyTypeTemplate.referenceListAttributeTypeTemplate({required DisplayName displayName}) =
      ReferenceListAttributeTypeTemplate;

  const factory PropertyTypeTemplate.phaseAttributeTypeTemplate({required DisplayName displayName}) =
      PhaseAttributeTypeTemplate;

  const factory PropertyTypeTemplate.objectListAttributeTypeTemplate({required DisplayName displayName}) =
      ObjectListAttributeTypeTemplate;

  const factory PropertyTypeTemplate.ownerRelationshipTypeTemplate({required DisplayName displayName}) =
      OwnerRelationshipTypeTemplate;

  const factory PropertyTypeTemplate.ownedRelationshipTypeTemplate({required DisplayName displayName}) =
      OwnedRelationshipTypeTemplate;

  const factory PropertyTypeTemplate.associationRelationshipTypeTemplate({required DisplayName displayName}) =
      AssociationRelationshipTypeTemplate;
}
