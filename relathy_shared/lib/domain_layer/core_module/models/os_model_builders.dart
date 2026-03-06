import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model_builders.dart';
import 'package:relathy_shared/domain_layer/core_module/models/os_model.dart';

abstract class OSBuilder extends ToolBuilder {
  OSBuilder({
    required super.name,
    required super.objectId,
    super.createdBy,
    required super.type,
    required super.toolId,
    required super.importedFrom,
  });
}

class PersonalOSBuilder extends OSBuilder {
  PersonalOSBuilder({
    required super.objectId,
    super.createdBy,
    required super.name,
    required super.importedFrom,
    required super.toolId,
  }) : super(type: OSTypeIds.personalOS);
}

class CollectiveOSBuilder extends OSBuilder {
  CollectiveOSBuilder({
    required super.objectId,
    super.createdBy,
    required super.name,
    required super.importedFrom,
    required super.toolId,
  }) : super(type: OSTypeIds.collectiveOS);
}

class OSUserBuilder extends UserRoleBuilder {
  OSUserBuilder({
    required super.objectId,
    super.createdBy,
    required super.name,
    required super.email,
    required super.link,
    required super.ownedByTool,
    required super.toolId,
  }) : super(type: OSTypeIds.user);

  factory OSUserBuilder.fromWebUser(WebObject user, {required ObjectId ownedByTool}) {
    return OSUserBuilder(
      objectId: user.objectId,
      toolId: user.toolId,
      ownedByTool: ownedByTool,
      link: user.readText(UserRolePropertyTypes.link)!,
      //createdBy: user.readObject(ObjectPropertyTypes.createdBy)!,
      name: user.readText(NamedObjectRolePropertyTypes.name)!,
      email: user.readText(UserRolePropertyTypes.email)!,
    );
  }
}
