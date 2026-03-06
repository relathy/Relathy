import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class InboxModelIds {
  static const inbox = ObjectId(
    Flags.isDebug
        ? "inbox [Model] 1c970e47-a8cc-4f11-a128-a642443c79b6"
        : "1c970e47-a8cc-4f11-a128-a642443c79b6",
  );
}

abstract class InboxTypeIds {
  static const inbox = ObjectId(
    Flags.isDebug
        ? "inbox [Type] 089d9126-f986-46dc-9e59-500dc462cb38"
        : "089d9126-f986-46dc-9e59-500dc462cb38",
  );

  static const inboxObject = ObjectId(
    Flags.isDebug
        ? "inboxObject [Type] 283441e3-b9a0-4d69-8405-19c4af739258"
        : "283441e3-b9a0-4d69-8405-19c4af739258",
  );
}
