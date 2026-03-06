// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maybe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmutableMaybe _$ImmutableMaybeFromJson(Map<String, dynamic> json) =>
    ImmutableMaybe(
      id: MaybeId.fromJson(json['id'] as String),
      data: json['data'] as Object,
    );

Map<String, dynamic> _$ImmutableMaybeToJson(ImmutableMaybe instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};

MutableMaybe _$MutableMaybeFromJson(Map<String, dynamic> json) => MutableMaybe(
  MaybeId.fromJson(json['id'] as String),
  data: json['data'] as Object,
);

Map<String, dynamic> _$MutableMaybeToJson(MutableMaybe instance) =>
    <String, dynamic>{'id': instance.id, 'data': instance.data};
