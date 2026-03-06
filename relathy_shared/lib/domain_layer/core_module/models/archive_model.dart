import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class ArchiveModelIds {
  static const archive = ObjectId(
    Flags.isDebug
        ? "archive [Model] 96bfe2c4-9a6b-48c0-9dd2-1cebfac41723"
        : "96bfe2c4-9a6b-48c0-9dd2-1cebfac41723",
  );
}

abstract class ArchiveTypeIds {}
