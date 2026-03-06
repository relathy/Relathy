import 'package:mobx/mobx.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';

part 'user_model.g.dart';

class UserModel = UserModelBase with _$UserModel;

abstract class UserModelBase extends LoadingModelBase with Store {
  final PreferencesModel _preferencesModel;
  final DateTimeService _datetimeService;
  UserModelBase(this._preferencesModel, this._datetimeService);

  @override
  Future<void> doInit() async {}

  @computed
  bool get isAuthenticated => false;
}
