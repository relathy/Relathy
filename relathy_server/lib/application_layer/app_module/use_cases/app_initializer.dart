import 'package:relathy_server/application_layer/app_module/repositories/application_info_repository.dart';
import 'package:relathy_server/domain_layer/app_module/data/application_info.dart';

class AppInitializer {
  final ApplicationInfoRepository _applicationInfoRepository;

  AppInitializer(this._applicationInfoRepository);

  Future<void> init() async {
    var applicationInfo = await _applicationInfoRepository.getApplicationInfo();
    if (applicationInfo != null) return;
    applicationInfo = ApplicationInfo();
    await _applicationInfoRepository.saveApplicationInfo(applicationInfo);
  }
}
