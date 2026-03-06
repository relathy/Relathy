// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_relationship_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRelationshipOperation _$AddRelationshipOperationFromJson(
  Map<String, dynamic> json,
) => AddRelationshipOperation(
  operationId: json['operationId'] == null
      ? null
      : OperationId.fromJson(json['operationId'] as String),
  objectId: ObjectId.fromJson(json['objectId'] as String),
  relationshipTypeId: ObjectId.fromJson(json['relationshipTypeId'] as String),
  toObjectId: ObjectId.fromJson(json['toObjectId'] as String),
  creatingObject: json['creatingObject'] as bool? ?? false,
);

Map<String, dynamic> _$AddRelationshipOperationToJson(
  AddRelationshipOperation instance,
) => <String, dynamic>{
  'objectId': instance.objectId,
  'operationId': instance.operationId,
  'relationshipTypeId': instance.relationshipTypeId,
  'toObjectId': instance.toObjectId,
  'creatingObject': instance.creatingObject,
};
