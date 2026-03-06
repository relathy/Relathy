import 'package:shared_preferences/shared_preferences.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';

class PreferencesModelImpl extends LoadingModelBase implements PreferencesModel {
  late final SharedPreferencesWithCache _prefs;
  PreferencesModelImpl();

  @override
  Future<void> doInit() async {
    _prefs = await SharedPreferencesWithCache.create(cacheOptions: SharedPreferencesWithCacheOptions());
  }

  Set<String> get keys => _prefs.keys;

  @override
  Object? get(String key) => _prefs.get(key);

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  int? getInt(String key) => _prefs.getInt(key);

  @override
  double? getDouble(String key) => _prefs.getDouble(key);

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  List<String>? getStringList(String key) => _prefs.getStringList(key);

  @override
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  @override
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  @override
  Future<void> setDouble(String key, double value) => _prefs.setDouble(key, value);

  @override
  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  @override
  Future<void> setStringList(String key, List<String> value) => _prefs.setStringList(key, value);

  @override
  Future<void> remove(String key) => _prefs.remove(key);

  @override
  Future<void> clear() => _prefs.clear();
}

class NullPreferencesModelImpl implements PreferencesModel {
  NullPreferencesModelImpl();

  @override
  Future<void> clear() => Future.value();

  @override
  Object? get(String key) => null;

  @override
  bool? getBool(String key) => null;

  @override
  double? getDouble(String key) => null;

  @override
  int? getInt(String key) => null;

  @override
  AsyncResult<void> getLoadingResult() => AsyncResult.success(null);

  @override
  String? getString(String key) => null;

  @override
  List<String>? getStringList(String key) => null;

  @override
  Future<void> init() => Future.value();

  @override
  Future<void> remove(String key) => Future.value();

  @override
  Future<void> setBool(String key, bool value) => Future.value();

  @override
  Future<void> setDouble(String key, double value) => Future.value();

  @override
  Future<void> setInt(String key, int value) => Future.value();

  @override
  Future<void> setString(String key, String value) => Future.value();

  @override
  Future<void> setStringList(String key, List<String> value) => Future.value();
}
