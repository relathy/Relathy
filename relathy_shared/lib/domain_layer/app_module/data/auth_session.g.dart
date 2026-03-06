// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => AuthSession(
  userId: ObjectId.fromJson(json['userId'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  userName: json['userName'] as String,
);

Map<String, dynamic> _$AuthSessionToJson(AuthSession instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'userName': instance.userName,
    };
