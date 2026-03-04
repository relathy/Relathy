// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rrf_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => _MessageDto(
  type: json['type'] as String,
  data: json['data'] as Map<String, dynamic>,
  messageId: json['messageId'] as String,
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'messageId': instance.messageId,
    };
