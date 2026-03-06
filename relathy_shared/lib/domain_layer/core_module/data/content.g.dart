// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentPointer _$ContentPointerFromJson(Map<String, dynamic> json) =>
    ContentPointer(
      dateTime: DateTime.parse(json['dateTime'] as String),
      contentId: ContentId.fromJson(json['contentId'] as String),
    );

Map<String, dynamic> _$ContentPointerToJson(ContentPointer instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'contentId': instance.contentId.toJson(),
    };

ImmutableContentData _$ImmutableContentDataFromJson(
  Map<String, dynamic> json,
) => ImmutableContentData(
  const ImmutableStringObjectMapConverter().fromJson(
    json['data'] as Map<String, Object>,
  ),
);

Map<String, dynamic> _$ImmutableContentDataToJson(
  ImmutableContentData instance,
) => <String, dynamic>{
  'data': const ImmutableStringObjectMapConverter().toJson(instance.data),
};

ImmutableContent _$ImmutableContentFromJson(Map<String, dynamic> json) =>
    ImmutableContent(
      objectId: ObjectId.fromJson(json['objectId'] as String),
      contentId: ContentId.fromJson(json['contentId'] as String),
      data: json['data'] == null
          ? null
          : ImmutableContentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImmutableContentToJson(ImmutableContent instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'contentId': instance.contentId,
      'data': instance.data,
    };
