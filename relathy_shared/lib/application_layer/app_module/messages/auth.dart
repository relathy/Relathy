import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_shared/domain_layer/app_module/data/auth_session.dart';
part 'auth.g.dart';

@JsonSerializable()
@immutable
class AuthSendOtp extends Command<void> {
  final String email;
  AuthSendOtp({required this.email});

  factory AuthSendOtp.fromJson(Map<String, dynamic> json) => _$AuthSendOtpFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthSendOtpToJson(this);

  @override
  acceptVisitor(RequestVisitor visitor) => visitor.visit(this);
}

@JsonSerializable()
@immutable
class AuthVerifyOtp extends Command<AuthSession> {
  final String email;
  final String code;
  AuthVerifyOtp({required this.email, required this.code});

  factory AuthVerifyOtp.fromJson(Map<String, dynamic> json) => _$AuthVerifyOtpFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthVerifyOtpToJson(this);

  @override
  acceptVisitor(RequestVisitor visitor) => visitor.visit(this);
}
