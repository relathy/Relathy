// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmutablePerTypeRelationships _$ImmutablePerTypeRelationshipsFromJson(
  Map<String, dynamic> json,
) => ImmutablePerTypeRelationships(
  relationships: json['relationships'] == null
      ? const ImmutableList.empty()
      : ImmutableList<ImmutableRelationship>.fromJson(
          json['relationships'] as List<dynamic>,
          (value) =>
              ImmutableRelationship.fromJson(value as Map<String, dynamic>),
        ),
  addedToObjects: json['addedToObjects'] == null
      ? const ImmutableList.empty()
      : ImmutableList<ObjectId>.fromJson(
          json['addedToObjects'] as List<dynamic>,
          (value) => ObjectId.fromJson(value as String),
        ),
  removedRelationships: json['removedRelationships'] == null
      ? const ImmutableList.empty()
      : ImmutableList<ImmutableRelationship>.fromJson(
          json['removedRelationships'] as List<dynamic>,
          (value) =>
              ImmutableRelationship.fromJson(value as Map<String, dynamic>),
        ),
  oldToObjects: json['oldToObjects'] == null
      ? null
      : ImmutableList<ObjectId>.fromJson(
          json['oldToObjects'] as List<dynamic>,
          (value) => ObjectId.fromJson(value as String),
        ),
);

Map<String, dynamic> _$ImmutablePerTypeRelationshipsToJson(
  ImmutablePerTypeRelationships instance,
) => <String, dynamic>{
  'relationships': instance.relationships.toJson((value) => value.toJson()),
  'addedToObjects': instance.addedToObjects.toJson((value) => value.toJson()),
  'removedRelationships': instance.removedRelationships.toJson(
    (value) => value.toJson(),
  ),
  'oldToObjects': instance.oldToObjects?.toJson((value) => value.toJson()),
};

ImmutableAttribute _$ImmutableAttributeFromJson(Map<String, dynamic> json) =>
    ImmutableAttribute(
      rawValue: json['rawValue'],
      conflictRawValue: json['conflictRawValue'],
      setAttributeOperation: json['setAttributeOperation'] == null
          ? null
          : SetAttributeOperation.fromJson(
              json['setAttributeOperation'] as Map<String, dynamic>,
            ),
      maybes: json['maybes'] == null
          ? const ImmutableList.empty()
          : ImmutableList<ImmutableMaybe>.fromJson(
              json['maybes'] as List<dynamic>,
              (value) => ImmutableMaybe.fromJson(value as Map<String, dynamic>),
            ),
    );

Map<String, dynamic> _$ImmutableAttributeToJson(ImmutableAttribute instance) =>
    <String, dynamic>{
      'rawValue': instance.rawValue,
      'conflictRawValue': instance.conflictRawValue,
      'setAttributeOperation': instance.setAttributeOperation?.toJson(),
      'maybes': instance.maybes.toJson((value) => value.toJson()),
    };

ImmutableWebObject _$ImmutableWebObjectFromJson(Map<String, dynamic> json) =>
    ImmutableWebObject(
      objectId: ObjectId.fromJson(json['objectId'] as String),
      toolId: ToolId.fromJson(json['toolId'] as String),
      attributes: json['attributes'] == null
          ? const ImmutableMap.empty()
          : const _AttributesMapConverter().fromJson(
              json['attributes'] as Map<String, ImmutableAttribute>,
            ),
      perTypeRelationships: json['perTypeRelationships'] == null
          ? const ImmutableMap.empty()
          : const _PerTypeRelationshipsMapConverter().fromJson(
              json['perTypeRelationships']
                  as Map<String, ImmutablePerTypeRelationships>,
            ),
    );

Map<String, dynamic> _$ImmutableWebObjectToJson(ImmutableWebObject instance) =>
    <String, dynamic>{
      'objectId': instance.objectId.toJson(),
      'toolId': instance.toolId.toJson(),
      'attributes': const _AttributesMapConverter().toJson(instance.attributes),
      'perTypeRelationships': const _PerTypeRelationshipsMapConverter().toJson(
        instance.perTypeRelationships,
      ),
    };

ImmutableRelationship _$ImmutableRelationshipFromJson(
  Map<String, dynamic> json,
) => ImmutableRelationship(
  toObjectId: ObjectId.fromJson(json['toObjectId'] as String),
  attributes: json['attributes'] == null
      ? const ImmutableMap.empty()
      : const _AttributesMapConverter().fromJson(
          json['attributes'] as Map<String, ImmutableAttribute>,
        ),
  addRelationshipOperation: json['addRelationshipOperation'] == null
      ? null
      : AddRelationshipOperation.fromJson(
          json['addRelationshipOperation'] as Map<String, dynamic>,
        ),
  removeRelationshipOperation: json['removeRelationshipOperation'] == null
      ? null
      : RemoveRelationshipOperation.fromJson(
          json['removeRelationshipOperation'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImmutableRelationshipToJson(
  ImmutableRelationship instance,
) => <String, dynamic>{
  'toObjectId': instance.toObjectId.toJson(),
  'attributes': const _AttributesMapConverter().toJson(instance.attributes),
  'addRelationshipOperation': instance.addRelationshipOperation?.toJson(),
  'removeRelationshipOperation': instance.removeRelationshipOperation?.toJson(),
};
