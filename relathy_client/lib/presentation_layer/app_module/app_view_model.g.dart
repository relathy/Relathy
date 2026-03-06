// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppViewModel on AppViewModelBase, Store {
  Computed<ViewModel<ViewProps>>? _$childViewModelComputed;

  @override
  ViewModel<ViewProps> get childViewModel =>
      (_$childViewModelComputed ??= Computed<ViewModel<ViewProps>>(
        () => super.childViewModel,
        name: 'AppViewModelBase.childViewModel',
      )).value;

  @override
  String toString() {
    return '''
childViewModel: ${childViewModel}
    ''';
  }
}
