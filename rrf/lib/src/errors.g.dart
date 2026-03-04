// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalAppError _$InternalAppErrorFromJson(Map<String, dynamic> json) =>
    InternalAppError(systemError: json['systemError']);

Map<String, dynamic> _$InternalAppErrorToJson(InternalAppError instance) =>
    <String, dynamic>{'systemError': instance.systemError};

InternalClientError _$InternalClientErrorFromJson(Map<String, dynamic> json) =>
    InternalClientError(systemError: json['systemError']);

Map<String, dynamic> _$InternalClientErrorToJson(
  InternalClientError instance,
) => <String, dynamic>{'systemError': instance.systemError};

InternalServerError _$InternalServerErrorFromJson(Map<String, dynamic> json) =>
    InternalServerError(systemError: json['systemError']);

Map<String, dynamic> _$InternalServerErrorToJson(
  InternalServerError instance,
) => <String, dynamic>{'systemError': instance.systemError};

ValidationClientError _$ValidationClientErrorFromJson(
  Map<String, dynamic> json,
) => ValidationClientError(json['message'] as String);

Map<String, dynamic> _$ValidationClientErrorToJson(
  ValidationClientError instance,
) => <String, dynamic>{'message': instance.message};

NetworkAppException _$NetworkAppExceptionFromJson(Map<String, dynamic> json) =>
    NetworkAppException(message: json['message'] as String?);

Map<String, dynamic> _$NetworkAppExceptionToJson(
  NetworkAppException instance,
) => <String, dynamic>{'message': instance.message};

AuthenticationClientException _$AuthenticationClientExceptionFromJson(
  Map<String, dynamic> json,
) => AuthenticationClientException(message: json['message'] as String?);

Map<String, dynamic> _$AuthenticationClientExceptionToJson(
  AuthenticationClientException instance,
) => <String, dynamic>{'message': instance.message};

AuthorizationClientException _$AuthorizationClientExceptionFromJson(
  Map<String, dynamic> json,
) => AuthorizationClientException(message: json['message'] as String?);

Map<String, dynamic> _$AuthorizationClientExceptionToJson(
  AuthorizationClientException instance,
) => <String, dynamic>{'message': instance.message};

DataNotFoundException _$DataNotFoundExceptionFromJson(
  Map<String, dynamic> json,
) => DataNotFoundException(
  dataId: json['dataId'] as String,
  dataType: json['dataType'] as String,
);

Map<String, dynamic> _$DataNotFoundExceptionToJson(
  DataNotFoundException instance,
) => <String, dynamic>{
  'dataId': instance.dataId,
  'dataType': instance.dataType,
};
