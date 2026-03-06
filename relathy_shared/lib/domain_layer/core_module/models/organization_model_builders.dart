import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/organization_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model_builders.dart';

abstract class WorkspaceBuilder extends ObjectBuilder {
  WorkspaceBuilder({required super.objectId, super.createdBy, required super.type, required super.toolId});
}

class PersonalWorkspaceBuilder extends WorkspaceBuilder {
  ObjectId parentOS;

  PersonalWorkspaceBuilder({
    super.objectId,
    super.createdBy,
    required super.toolId,
    super.type = OrganizationTypeIds.personalWorkspace,
    required this.parentOS,
  });

  @override
  MutableWebObject mutableBuild() =>
      super.mutableBuild()..setToOne(PersonalWorkspacePropertyTypes.ownedByPersonalOS, parentOS);
}

class FavoritesBuilder extends ObjectBuilder {
  ObjectId attachedTo;
  List<ObjectId>? contains;
  FavoritesBuilder({
    super.objectId,
    required super.toolId,
    required this.attachedTo,
    super.createdBy,
    super.type = OrganizationTypeIds.favorites,
    this.contains,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setObjectList(ReferenceCollectionRolePropertyTypes.contains, contains)
    ..setObject(FavoritesPropertyTypes.attachedTo, attachedTo);
}

class WorkSessionBuilder extends ObjectBuilder {
  ObjectId? linkedToWorkItem;
  String position;
  String? name;
  WorkSessionBuilder({
    super.objectId,
    super.createdBy,
    required super.toolId,
    super.type = OrganizationTypeIds.workSession,
    required this.position,
    this.name,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(WorkSessionPropertyTypes.position, position)
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setObject(WorkSessionPropertyTypes.linkedToWorkItem, linkedToWorkItem);
}
