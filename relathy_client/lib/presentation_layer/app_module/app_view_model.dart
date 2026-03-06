import 'package:mobx/mobx.dart';
import 'package:relathy_client/presentation_layer/app_module/auth_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/user_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/theme_model.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';

part 'app_view_model.g.dart';

class AppViewModel = AppViewModelBase with _$AppViewModel;

abstract class AppViewModelBase extends FutureLoadingViewModelBase<AppViewModel, EmptyViewProps> with Store {
  final UserModel _userModel;
  final ThemeModel themeModel;
  final PreferencesModel preferencesModel;

  AppViewModelBase(super.viewModelFactory, this._userModel, this.preferencesModel, this.themeModel);

  @override
  Future<List<ComputedAsyncResult>> doInitAsync(EmptyViewProps props) async {
    await preferencesModel.init();
    await Future.wait([_userModel, themeModel].map((x) => x.init()));
    return const [];
  }

  bool get isAuthenticated => _userModel.isAuthenticated;

  @computed
  ViewModel get childViewModel {
    return isAuthenticated
        ? createViewModel<AuthViewModel, EmptyViewProps>(props) //todo: change to main view model
        : createViewModel<AuthViewModel, EmptyViewProps>(props);
  }
}
