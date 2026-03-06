import 'package:mobx/mobx.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';

part 'user_model.g.dart';

class UserModel = UserModelBase with _$UserModel;

abstract class UserModelBase extends LoadingModelBase with Store {
  UserModelBase();

  @override
  Future<void> doInit() async {}

  @computed
  bool get isAuthenticated => false;
}
