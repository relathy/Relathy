// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccount _$CreateAccountFromJson(Map<String, dynamic> json) =>
    CreateAccount(
      email: json['email'] as String,
      context: ActorContext.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAccountToJson(CreateAccount instance) =>
    <String, dynamic>{'context': instance.context, 'email': instance.email};
