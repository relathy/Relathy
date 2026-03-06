// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSendOtp _$AuthSendOtpFromJson(Map<String, dynamic> json) =>
    AuthSendOtp(email: json['email'] as String);

Map<String, dynamic> _$AuthSendOtpToJson(AuthSendOtp instance) =>
    <String, dynamic>{'email': instance.email};

AuthVerifyOtp _$AuthVerifyOtpFromJson(Map<String, dynamic> json) =>
    AuthVerifyOtp(email: json['email'] as String, code: json['code'] as String);

Map<String, dynamic> _$AuthVerifyOtpToJson(AuthVerifyOtp instance) =>
    <String, dynamic>{'email': instance.email, 'code': instance.code};
