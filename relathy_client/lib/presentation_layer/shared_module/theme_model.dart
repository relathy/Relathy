import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';
part 'theme_model.g.dart';

class ThemeModel = ThemeModelBase with _$ThemeModel;

abstract class ThemeModelBase extends LoadingModelBase with Store {
  static const _prefsThemeMode = 'theme_mode';

  final PreferencesModel _preferencesModel;

  ThemeModelBase(this._preferencesModel);

  @readonly
  ThemeMode _themeMode = ThemeMode.system;

  @override
  @action
  Future<void> doInit() async {
    final modeIndex = _preferencesModel.getInt(_prefsThemeMode);

    if (modeIndex != null && modeIndex >= 0 && modeIndex < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[modeIndex];
    }
  }

  @action
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _preferencesModel.setInt(_prefsThemeMode, mode.index);
  }
}
