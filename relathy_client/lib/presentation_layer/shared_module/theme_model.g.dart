// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeModel on ThemeModelBase, Store {
  late final _$_themeModeAtom = Atom(
    name: 'ThemeModelBase._themeMode',
    context: context,
  );

  ThemeMode get themeMode {
    _$_themeModeAtom.reportRead();
    return super._themeMode;
  }

  @override
  ThemeMode get _themeMode => themeMode;

  @override
  set _themeMode(ThemeMode value) {
    _$_themeModeAtom.reportWrite(value, super._themeMode, () {
      super._themeMode = value;
    });
  }

  late final _$doInitAsyncAction = AsyncAction(
    'ThemeModelBase.doInit',
    context: context,
  );

  @override
  Future<void> doInit() {
    return _$doInitAsyncAction.run(() => super.doInit());
  }

  late final _$setThemeModeAsyncAction = AsyncAction(
    'ThemeModelBase.setThemeMode',
    context: context,
  );

  @override
  Future<void> setThemeMode(ThemeMode mode) {
    return _$setThemeModeAsyncAction.run(() => super.setThemeMode(mode));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
