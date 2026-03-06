import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

abstract class JournalModelIds {
  static const journal = ObjectId(
    Flags.isDebug
        ? "journal [Model] 4aef6f4d-df22-4955-957e-d2aef2238664"
        : "4aef6f4d-df22-4955-957e-d2aef2238664",
  );
}

abstract class JournalTypeIds {
  static const journal = ObjectId(
    Flags.isDebug
        ? "journal [Type] 6e583494-ae94-4807-85f3-61edd1dc8f2a"
        : "6e583494-ae94-4807-85f3-61edd1dc8f2a",
  );

  static const journalObject = ObjectId(
    Flags.isDebug
        ? "journalObject [Type] abdf5793-ac04-4f79-b628-42acb2c56b24"
        : "abdf5793-ac04-4f79-b628-42acb2c56b24",
  );
}
