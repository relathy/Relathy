// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on AuthViewModelBase, Store {
  late final _$_stageAtom = Atom(
    name: 'AuthViewModelBase._stage',
    context: context,
  );

  AuthStage get stage {
    _$_stageAtom.reportRead();
    return super._stage;
  }

  @override
  AuthStage get _stage => stage;

  @override
  set _stage(AuthStage value) {
    _$_stageAtom.reportWrite(value, super._stage, () {
      super._stage = value;
    });
  }

  late final _$_emailAtom = Atom(
    name: 'AuthViewModelBase._email',
    context: context,
  );

  String get email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  String get _email => email;

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_codeAtom = Atom(
    name: 'AuthViewModelBase._code',
    context: context,
  );

  String get code {
    _$_codeAtom.reportRead();
    return super._code;
  }

  @override
  String get _code => code;

  @override
  set _code(String value) {
    _$_codeAtom.reportWrite(value, super._code, () {
      super._code = value;
    });
  }

  late final _$_sendOtpAsyncAction = AsyncAction(
    'AuthViewModelBase._sendOtp',
    context: context,
  );

  @override
  Future<AsyncResult<void>> _sendOtp() {
    return _$_sendOtpAsyncAction.run(() => super._sendOtp());
  }

  late final _$_verifyOtpAsyncAction = AsyncAction(
    'AuthViewModelBase._verifyOtp',
    context: context,
  );

  @override
  Future<AsyncResult<void>> _verifyOtp() {
    return _$_verifyOtpAsyncAction.run(() => super._verifyOtp());
  }

  late final _$AuthViewModelBaseActionController = ActionController(
    name: 'AuthViewModelBase',
    context: context,
  );

  @override
  void setEmail(String value) {
    final _$actionInfo = _$AuthViewModelBaseActionController.startAction(
      name: 'AuthViewModelBase.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$AuthViewModelBaseActionController.startAction(
      name: 'AuthViewModelBase.setCode',
    );
    try {
      return super.setCode(value);
    } finally {
      _$AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  AsyncResult<void> _backToEmailStep() {
    final _$actionInfo = _$AuthViewModelBaseActionController.startAction(
      name: 'AuthViewModelBase._backToEmailStep',
    );
    try {
      return super._backToEmailStep();
    } finally {
      _$AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
