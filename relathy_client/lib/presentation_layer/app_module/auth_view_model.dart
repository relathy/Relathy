import 'package:mobx/mobx.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_client/presentation_layer/shared_module/user_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/theme_model.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_shared/application_layer/app_module/messages/auth.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';
part 'auth_view_model.g.dart';

enum AuthStage { enterEmail, enterCode }

class AuthViewModel = AuthViewModelBase with _$AuthViewModel;

abstract class AuthViewModelBase extends ViewModelBase<AuthViewModel, EmptyViewProps> with Store {
  final UserModel _userModel;
  final ThemeModel themeModel;
  final Executor executor;
  late final sendOtpCommand = createFutureCommand(execute: _sendOtp);
  late final verifyOtpCommand = createFutureCommand(execute: _verifyOtp);
  late final backToEmailStepCommand = createCommand(
    execute: _backToEmailStep,
    canExecute: _canBackToEmailStep,
  );
  AuthViewModelBase(this._userModel, this.themeModel, this.executor, super.viewModelFactory);

  bool hasError() {
    return sendOtpCommand.isFailure || verifyOtpCommand.isFailure;
  }

  String getFriendlyErrorMessage() {
    if (sendOtpCommand.isFailure) {
      return sendOtpCommand.getFriendlyErrorMessage();
    }
    if (verifyOtpCommand.isFailure) {
      return verifyOtpCommand.getFriendlyErrorMessage();
    }
    throw UnreachableCodeError();
  }

  @readonly
  AuthStage _stage = AuthStage.enterEmail;

  @readonly
  String _email = '';

  @readonly
  String _code = '';

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  @action
  void setEmail(String value) {
    _email = value.trim();
  }

  @action
  void setCode(String value) {
    _code = value.trim();
  }

  @action
  FutureAsyncVoid _sendOtp() async {
    final e = _email.trim();

    if (e.isEmpty || !_isValidEmail(e)) {
      return AsyncFailure.validationClientError('Please enter a valid email.');
    }

    var sendOtpResult = await executor.executeToAsyncResult(AuthSendOtp(email: e));

    if (sendOtpResult.returnIsRequired) {
      return sendOtpResult.returnRequired();
    }

    _code = '';
    _stage = AuthStage.enterCode;
    return AsyncSuccess(null);
  }

  @action
  FutureAsyncVoid _verifyOtp() async {
    final entered = _code.trim();
    if (entered.isEmpty) {
      return AsyncFailure('Please enter the code sent to your email.');
    }

    var veryOtpResult = await executor.executeToAsyncResult(
      AuthVerifyOtp(email: _email.trim(), code: entered),
    );

    if (veryOtpResult.returnIsRequired) {
      return veryOtpResult.returnRequired();
    }

    var authData = veryOtpResult.getValue();
    await _userModel.signIn(authData);
    return AsyncResult.success(null);
  }

  @action
  AsyncVoid _backToEmailStep() {
    _stage = AuthStage.enterEmail;
    _code = '';
    verifyOtpCommand.reset();
    sendOtpCommand.reset();
    return AsyncSuccess(null);
  }

  bool _canBackToEmailStep() {
    return !sendOtpCommand.isPending && !verifyOtpCommand.isPending;
  }
}
