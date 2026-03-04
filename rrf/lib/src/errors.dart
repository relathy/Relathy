import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.g.dart';

class UnreachableCodeError extends Error {
  final String message;

  UnreachableCodeError([this.message = "Unreachable code executed"]);

  @override
  String toString() => message;
}

abstract class AppError {
  late final String type = runtimeType.toString();

  Map<String, dynamic> toJson();
  @override
  String toString() => "${super.toString()} ${jsonEncode(toJson())}";

  String toFriendlyString();
}

@JsonSerializable()
@immutable
final class InternalAppError extends AppError {
  final Object? systemError;

  InternalAppError({this.systemError});

  @override
  Map<String, dynamic> toJson() => _$InternalAppErrorToJson(this);
  factory InternalAppError.fromJson(Map<String, dynamic> json) => _$InternalAppErrorFromJson(json);

  @override
  String toFriendlyString() => "Internal error";
}

@JsonSerializable()
@Immutable()
final class InternalClientError extends InternalAppError {
  InternalClientError({super.systemError});

  @override
  Map<String, dynamic> toJson() => _$InternalClientErrorToJson(this);
  factory InternalClientError.fromJson(Map<String, dynamic> json) => _$InternalClientErrorFromJson(json);

  @override
  String toFriendlyString() => "Internal client error";
}

@JsonSerializable()
@Immutable()
final class InternalServerError extends InternalAppError {
  InternalServerError({super.systemError});

  @override
  Map<String, dynamic> toJson() => _$InternalServerErrorToJson(this);
  factory InternalServerError.fromJson(Map<String, dynamic> json) => _$InternalServerErrorFromJson(json);

  @override
  String toFriendlyString() => "Internal server error";
}

@JsonSerializable()
@Immutable()
final class ValidationClientError extends AppError {
  final String message;

  ValidationClientError(this.message);

  @override
  Map<String, dynamic> toJson() => _$ValidationClientErrorToJson(this);
  factory ValidationClientError.fromJson(Map<String, dynamic> json) => _$ValidationClientErrorFromJson(json);

  @override
  String toFriendlyString() => message;
}

abstract class AppException extends AppError implements Exception {
  final String? message;

  AppException({this.message});
}

@JsonSerializable()
@Immutable()
class NetworkAppException extends AppException {
  NetworkAppException({super.message});

  @override
  Map<String, dynamic> toJson() => _$NetworkAppExceptionToJson(this);
  factory NetworkAppException.fromJson(Map<String, dynamic> json) => _$NetworkAppExceptionFromJson(json);

  @override
  String toFriendlyString() => message ?? "Network error";
}

@JsonSerializable()
@Immutable()
class AuthenticationClientException extends AppException {
  AuthenticationClientException({super.message});

  @override
  Map<String, dynamic> toJson() => _$AuthenticationClientExceptionToJson(this);
  factory AuthenticationClientException.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationClientExceptionFromJson(json);

  @override
  String toFriendlyString() => message ?? "Authentication error";
}

@JsonSerializable()
@Immutable()
class AuthorizationClientException extends AppException {
  AuthorizationClientException({super.message});

  @override
  Map<String, dynamic> toJson() => _$AuthorizationClientExceptionToJson(this);
  factory AuthorizationClientException.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationClientExceptionFromJson(json);

  @override
  String toFriendlyString() => message ?? "Authorization error";
}

@JsonSerializable()
@Immutable()
class DataNotFoundException extends AppException {
  final String dataId;
  final String dataType;
  DataNotFoundException({required this.dataId, required this.dataType});

  @override
  Map<String, dynamic> toJson() => _$DataNotFoundExceptionToJson(this);
  factory DataNotFoundException.fromJson(Map<String, dynamic> json) => _$DataNotFoundExceptionFromJson(json);

  @override
  String toFriendlyString() => "$dataType not found with id $dataId";
}
