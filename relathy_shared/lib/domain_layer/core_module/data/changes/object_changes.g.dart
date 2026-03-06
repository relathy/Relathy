// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_changes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmutableAttributeChanges _$ImmutableAttributeChangesFromJson(
  Map<String, dynamic> json,
) => ImmutableAttributeChanges(
  setAttribute: json['setAttribute'] == null
      ? null
      : SetAttributeOperation.fromJson(
          json['setAttribute'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImmutableAttributeChangesToJson(
  ImmutableAttributeChanges instance,
) => <String, dynamic>{'setAttribute': instance.setAttribute};

ImmutableRelationshipsChanges _$ImmutableRelationshipsChangesFromJson(
  Map<String, dynamic> json,
) => ImmutableRelationshipsChanges(
  addRelationships: ImmutableList<AddRelationshipOperation>.fromJson(
    json['addRelationships'] as List<dynamic>,
    (value) => AddRelationshipOperation.fromJson(value as Map<String, dynamic>),
  ),
  removeRelationships: ImmutableList<RemoveRelationshipOperation>.fromJson(
    json['removeRelationships'] as List<dynamic>,
    (value) =>
        RemoveRelationshipOperation.fromJson(value as Map<String, dynamic>),
  ),
);

Map<String, dynamic> _$ImmutableRelationshipsChangesToJson(
  ImmutableRelationshipsChanges instance,
) => <String, dynamic>{
  'addRelationships': instance.addRelationships.toJson((value) => value),
  'removeRelationships': instance.removeRelationships.toJson((value) => value),
};

ImmutableObjectChanges _$ImmutableObjectChangesFromJson(
  Map<String, dynamic> json,
) => ImmutableObjectChanges(
  objectId: ObjectId.fromJson(json['objectId'] as String),
  contentMap: const _ContentMapConverter().fromJson(
    json['contentMap'] as Map<String, ImmutableContentData>,
  ),
  attributeChangesMap: const _AttributeChangesMapConverter().fromJson(
    json['attributeChangesMap'] as Map<String, ImmutableAttributeChanges>,
  ),
  relationshipsChangesMap: const _RelationshipsChangesMapConverter().fromJson(
    json['relationshipsChangesMap']
        as Map<String, ImmutableRelationshipsChanges>,
  ),
);

Map<String, dynamic> _$ImmutableObjectChangesToJson(
  ImmutableObjectChanges instance,
) => <String, dynamic>{
  'objectId': instance.objectId,
  'contentMap': const _ContentMapConverter().toJson(instance.contentMap),
  'attributeChangesMap': const _AttributeChangesMapConverter().toJson(
    instance.attributeChangesMap,
  ),
  'relationshipsChangesMap': const _RelationshipsChangesMapConverter().toJson(
    instance.relationshipsChangesMap,
  ),
};
