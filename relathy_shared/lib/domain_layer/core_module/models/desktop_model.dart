import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class DesktopModelIds {
  static const desktop = ObjectId(
    Flags.isDebug
        ? "desktop [Model] 963e6439-2306-4674-a617-f53194feeffe"
        : "963e6439-2306-4674-a617-f53194feeffe",
  );
}

abstract class DesktopTypeIds {}
