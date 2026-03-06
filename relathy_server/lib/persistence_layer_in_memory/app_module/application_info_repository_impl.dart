import 'package:relathy_server/application_layer/app_module/repositories/application_info_repository.dart';
import 'package:relathy_server/domain_layer/app_module/data/application_info.dart';

class InMemoryApplicationInfoRepositoryImpl implements ApplicationInfoRepository {
  ApplicationInfo? _applicationInfo;

  InMemoryApplicationInfoRepositoryImpl({ApplicationInfo? applicationInfo})
    : _applicationInfo = applicationInfo;

  @override
  Future<void> saveApplicationInfo(ApplicationInfo? applicationInfo) async {
    _applicationInfo = applicationInfo;
  }

  @override
  Future<ApplicationInfo?> getApplicationInfo() async {
    return _applicationInfo;
  }
}
