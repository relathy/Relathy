// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserModel on UserModelBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated => (_$isAuthenticatedComputed ??= Computed<bool>(
    () => super.isAuthenticated,
    name: 'UserModelBase.isAuthenticated',
  )).value;

  late final _$_authSessionAtom = Atom(
    name: 'UserModelBase._authSession',
    context: context,
  );

  AuthSession? get authSession {
    _$_authSessionAtom.reportRead();
    return super._authSession;
  }

  @override
  AuthSession? get _authSession => authSession;

  @override
  set _authSession(AuthSession? value) {
    _$_authSessionAtom.reportWrite(value, super._authSession, () {
      super._authSession = value;
    });
  }

  late final _$_initAuthDataSessionAsyncAction = AsyncAction(
    'UserModelBase._initAuthDataSession',
    context: context,
  );

  @override
  Future<void> _initAuthDataSession() {
    return _$_initAuthDataSessionAsyncAction.run(
      () => super._initAuthDataSession(),
    );
  }

  late final _$signOutAsyncAction = AsyncAction(
    'UserModelBase.signOut',
    context: context,
  );

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$signInAsyncAction = AsyncAction(
    'UserModelBase.signIn',
    context: context,
  );

  @override
  Future<void> signIn(AuthSession data) {
    return _$signInAsyncAction.run(() => super.signIn(data));
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
