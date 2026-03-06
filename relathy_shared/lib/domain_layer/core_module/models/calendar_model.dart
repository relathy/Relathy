import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class CalendarModelIds {
  static const calendar = ObjectId(
    Flags.isDebug
        ? "calendar [Model] def6b941-6702-4f66-b0d6-c565d5ddcfca"
        : "def6b941-6702-4f66-b0d6-c565d5ddcfca",
  );
}

abstract class CalendarTypeIds {
  static const calendar = ObjectId(
    Flags.isDebug
        ? "calendar [Type] 3a4af120-2a6e-4ba4-bb4e-911e6a1cd614"
        : "3a4af120-2a6e-4ba4-bb4e-911e6a1cd614",
  );

  static const calendarObject = ObjectId(
    Flags.isDebug
        ? "calendarObject [Type] e6a52c64-75a3-4fcb-99c6-85b6d645e62b"
        : "e6a52c64-75a3-4fcb-99c6-85b6d645e62b",
  );
}
