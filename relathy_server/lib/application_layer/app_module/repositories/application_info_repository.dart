import 'package:relathy_server/domain_layer/app_module/data/application_info.dart';

abstract interface class ApplicationInfoRepository {
  Future<void> saveApplicationInfo(ApplicationInfo? applicationInfo);
  Future<ApplicationInfo?> getApplicationInfo();
}
