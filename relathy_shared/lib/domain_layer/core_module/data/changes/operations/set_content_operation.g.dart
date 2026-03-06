// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_content_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetContentOperation _$SetContentOperationFromJson(
  Map<String, dynamic> json,
) => SetContentOperation(
  operationId: json['operationId'] == null
      ? null
      : OperationId.fromJson(json['operationId'] as String),
  objectId: ObjectId.fromJson(json['objectId'] as String),
  attributeTypeId: ObjectId.fromJson(json['attributeTypeId'] as String),
  contentId: json['contentId'] as String,
  oldValue: json['oldValue'] == null
      ? null
      : ImmutableContentData.fromJson(json['oldValue'] as Map<String, dynamic>),
  newValue: json['newValue'] == null
      ? null
      : ImmutableContentData.fromJson(json['newValue'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SetContentOperationToJson(
  SetContentOperation instance,
) => <String, dynamic>{
  'objectId': instance.objectId,
  'operationId': instance.operationId,
  'attributeTypeId': instance.attributeTypeId,
  'contentId': instance.contentId,
  'oldValue': instance.oldValue,
  'newValue': instance.newValue,
};
