import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class ContactModelIds {
  static const contact = ObjectId(
    Flags.isDebug
        ? "contact [Model] 6281f8d5-faa2-4f34-b042-cee144c038d8"
        : "6281f8d5-faa2-4f34-b042-cee144c038d8",
  );
}
