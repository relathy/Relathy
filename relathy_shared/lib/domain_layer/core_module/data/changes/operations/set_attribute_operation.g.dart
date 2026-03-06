// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_attribute_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAttributeOperation _$SetAttributeOperationFromJson(
  Map<String, dynamic> json,
) => SetAttributeOperation(
  operationId: json['operationId'] == null
      ? null
      : OperationId.fromJson(json['operationId'] as String),
  objectId: ObjectId.fromJson(json['objectId'] as String),
  attributeTypeId: ObjectId.fromJson(json['attributeTypeId'] as String),
  oldRawValue: json['oldRawValue'],
  newRawValue: json['newRawValue'],
);

Map<String, dynamic> _$SetAttributeOperationToJson(
  SetAttributeOperation instance,
) => <String, dynamic>{
  'objectId': instance.objectId,
  'operationId': instance.operationId,
  'attributeTypeId': instance.attributeTypeId,
  'oldRawValue': instance.oldRawValue,
  'newRawValue': instance.newRawValue,
};
