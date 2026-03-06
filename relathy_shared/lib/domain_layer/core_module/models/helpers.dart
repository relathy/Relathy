import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';

extension ReadAttributesExtension on ReadAttributes {
  ObjectId getType() {
    return readObject(ObjectPropertyTypes.type)!;
  }

  ObjectId? getSyncStatus() {
    return readCategory(ObjectPropertyTypes.syncStatus);
  }

  String getName() {
    return readText(NamedObjectRolePropertyTypes.name)!;
  }
}
