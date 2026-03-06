// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_relationship_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveRelationshipOperation _$RemoveRelationshipOperationFromJson(
  Map<String, dynamic> json,
) => RemoveRelationshipOperation(
  operationId: json['operationId'] == null
      ? null
      : OperationId.fromJson(json['operationId'] as String),
  objectId: ObjectId.fromJson(json['objectId'] as String),
  relationshipTypeId: ObjectId.fromJson(json['relationshipTypeId'] as String),
  toObjectId: ObjectId.fromJson(json['toObjectId'] as String),
  deletingObject: json['deletingObject'] as bool,
);

Map<String, dynamic> _$RemoveRelationshipOperationToJson(
  RemoveRelationshipOperation instance,
) => <String, dynamic>{
  'objectId': instance.objectId,
  'operationId': instance.operationId,
  'relationshipTypeId': instance.relationshipTypeId,
  'toObjectId': instance.toObjectId,
  'deletingObject': instance.deletingObject,
};
