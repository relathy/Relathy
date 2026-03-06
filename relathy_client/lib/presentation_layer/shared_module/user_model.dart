import 'package:mobx/mobx.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';
import 'package:relathy_shared/domain_layer/app_module/data/auth_session.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

part 'user_model.g.dart';

class UserModel = UserModelBase with _$UserModel;

abstract class UserModelBase extends LoadingModelBase with Store {
  static const _prefsAuthUserId = 'auth_user_id';
  static const _prefsAuthName = 'auth_displayname';
  static const _prefsAuthExpiresAtMs = 'auth_expires_at_ms';

  final PreferencesModel _preferencesModel;
  final DateTimeService _datetimeService;
  UserModelBase(this._preferencesModel, this._datetimeService);

  @readonly
  AuthSession? _authSession;

  ObjectId get userId => _authSession!.userId;

  @override
  Future<void> doInit() async {
    await _initAuthDataSession();
  }

  @computed
  bool get isAuthenticated =>
      _authSession != null && _datetimeService.now().isBefore(_authSession!.expiresAt);

  @action
  Future<void> _initAuthDataSession() async {
    var data = _readAuthSession();
    if (data == null) {
      _authSession = null;
      return;
    }

    final now = _datetimeService.now();
    if (now.isBefore(data.expiresAt)) {
      await signOut();
    }
    _authSession = data;
  }

  @action
  Future<void> signOut() async {
    _authSession = null;
    await _writeAuthSessionData(null);
  }

  @action
  Future<void> signIn(AuthSession data) async {
    _authSession = data;
    await _writeAuthSessionData(data);
  }

  Future<void> _writeAuthSessionData(AuthSession? authSession) async {
    if (authSession == null) {
      await _preferencesModel.remove(_prefsAuthUserId);
      await _preferencesModel.remove(_prefsAuthName);
      await _preferencesModel.remove(_prefsAuthExpiresAtMs);
    } else {
      await _preferencesModel.setString(_prefsAuthUserId, authSession.userId.value);
      await _preferencesModel.setString(_prefsAuthName, authSession.userName);
      await _preferencesModel.setInt(_prefsAuthExpiresAtMs, authSession.expiresAt.millisecondsSinceEpoch);
    }
  }

  AuthSession? _readAuthSession() {
    final storedCitizenId = _preferencesModel.getString(_prefsAuthUserId);
    final storedWebname = _preferencesModel.getString(_prefsAuthName);
    final storedExpiresAtMs = _preferencesModel.getInt(_prefsAuthExpiresAtMs);
    if (storedCitizenId == null || storedWebname == null || storedExpiresAtMs == null) {
      return null;
    }
    return AuthSession(
      userId: ObjectId(storedCitizenId),
      userName: storedWebname,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(storedExpiresAtMs),
    );
  }
}
