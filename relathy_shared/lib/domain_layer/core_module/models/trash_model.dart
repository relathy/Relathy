import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';

abstract class TrashModelIds {
  static const trash = ObjectId(
    Flags.isDebug
        ? "trash [Model] 7f335e96-4e8d-4005-99be-76b621a76840"
        : "7f335e96-4e8d-4005-99be-76b621a76840",
  );
}

abstract class TrashTypeIds {}
