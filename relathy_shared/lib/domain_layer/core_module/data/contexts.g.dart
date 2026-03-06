// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contexts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorContext _$ActorContextFromJson(Map<String, dynamic> json) => ActorContext(
  actorId: ObjectId.fromJson(json['actorId'] as String),
  toolId: ToolId.fromJson(json['toolId'] as String),
);

Map<String, dynamic> _$ActorContextToJson(ActorContext instance) =>
    <String, dynamic>{'actorId': instance.actorId, 'toolId': instance.toolId};
