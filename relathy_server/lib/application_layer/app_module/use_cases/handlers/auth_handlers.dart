import 'package:rrf/rrf_server.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_shared/application_layer/core_module/messages/account.dart';
import 'package:relathy_shared/application_layer/app_module/messages/auth.dart';
import 'package:relathy_shared/domain_layer/app_module/data/auth_session.dart';
import 'package:relathy_shared/domain_layer/core_module/data/contexts.dart';

class AuthSendOtpHandler implements CommandHandler<AuthSendOtp, void> {
  @override
  Future<Response<void>> handle(AuthSendOtp command) async {
    return SuccessResponse(null);
  }
}

class AuthVerifyOtpHandler implements CommandHandler<AuthVerifyOtp, AuthSession> {
  final DateTimeService _datetimeService;
  final Executor _executor;
  AuthVerifyOtpHandler(this._datetimeService, this._executor);

  @override
  Future<Response<AuthSession>> handle(AuthVerifyOtp command) async {
    if (command.code != '123') {
      return FailureResponse.validationClientError('Invalid code');
    }
    var now = _datetimeService.now();

    var accountId = await _executor.executeAndGetValue(
      CreateAccount(email: command.email, context: ActorContext.webverseSystem),
    );

    return SuccessResponse(
      AuthSession(userId: accountId, expiresAt: now.add(const Duration(hours: 1)), userName: "geovaly"),
    );
  }
}
