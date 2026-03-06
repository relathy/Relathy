import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';

abstract interface class PreferencesModel implements LoadingModel {
  Object? get(String key);

  bool? getBool(String key);

  int? getInt(String key);

  double? getDouble(String key);

  String? getString(String key);

  List<String>? getStringList(String key);

  Future<void> setBool(String key, bool value);

  Future<void> setInt(String key, int value);

  Future<void> setDouble(String key, double value);

  Future<void> setString(String key, String value);

  Future<void> setStringList(String key, List<String> value);

  Future<void> remove(String key);

  Future<void> clear();
}
