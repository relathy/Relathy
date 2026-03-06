import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

part 'auth_session.g.dart';

@immutable
@JsonSerializable()
class AuthSession {
  final ObjectId userId;
  final DateTime expiresAt;
  final String userName;
  AuthSession({required this.userId, required this.expiresAt, required this.userName});

  factory AuthSession.fromJson(Map<String, dynamic> json) => _$AuthSessionFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionToJson(this);
}
