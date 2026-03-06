import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model_builders.dart';
import 'package:relathy_shared/domain_layer/core_module/models/webverse_model.dart';

class WorldBuilder extends ObjectBuilder {
  String name;
  String link;
  ObjectId partOfAccount;
  List<ObjectId>? builtByCitizens;
  WorldBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    super.type = WebverseTypeIds.world,
    required this.name,
    required this.link,
    this.builtByCitizens,
    required this.partOfAccount,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setText(WorldPropertyTypes.link, link)
    ..setToMany(WorldPropertyTypes.builtByCitizens, builtByCitizens ?? [])
    ..setToOne(WorldPropertyTypes.partOfAccount, partOfAccount)
    ..setToOne(WorldPropertyTypes.ownedByTool, WebverseToolIds.webverse.asObjectId());
}

class PublishedToolBuilder extends ObjectBuilder {
  String name;
  ObjectId ownedByWorld;

  PublishedToolBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    super.type = WebverseTypeIds.publishedTool,
    required this.name,
    required this.ownedByWorld,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(PublishedToolPropertyTypes.ownedByWorld, ownedByWorld);
}

class PublishedToolVersionBuilder extends ObjectBuilder {
  String version;
  ObjectId ownedByPublishedTool;

  PublishedToolVersionBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    super.type = WebverseTypeIds.publishedToolVersion,
    required this.version,
    required this.ownedByPublishedTool,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(PublishedToolVersionPropertyTypes.version, version)
    ..setToOne(PublishedToolVersionPropertyTypes.ownedByPublishedTool, ownedByPublishedTool);
}

class PublishedModelBuilder extends ObjectBuilder {
  String name;
  ObjectId ownedByWorld;

  PublishedModelBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    super.type = WebverseTypeIds.publishedModel,
    required this.name,
    required this.ownedByWorld,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(PublishedModelPropertyTypes.ownedByWorld, ownedByWorld);
}

class PublishedModelVersionBuilder extends ObjectBuilder {
  String version;
  ObjectId ownedByPublishedModel;

  PublishedModelVersionBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    super.type = WebverseTypeIds.publishedModelVersion,
    required this.version,
    required this.ownedByPublishedModel,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(PublishedModelVersionPropertyTypes.version, version)
    ..setToOne(PublishedModelVersionPropertyTypes.ownedByPublishedModel, ownedByPublishedModel);
}

class CitizenBuilder extends UserRoleBuilder {
  ObjectId partOfAccount;
  List<ObjectId>? usesTools;

  CitizenBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    required super.name,
    required super.email,
    required this.partOfAccount,
    required super.link,
    this.usesTools,
  }) : super(type: WebverseTypeIds.citizen, ownedByTool: WebverseToolIds.webverse.asObjectId());

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(CitizenPropertyTypes.partOfAccount, partOfAccount)
    ..setToMany(CitizenPropertyTypes.usesTools, usesTools ?? []);
}

class AccountBuilder extends ObjectBuilder {
  String email;
  AccountBuilder({required super.objectId, required super.toolId, super.createdBy, required this.email})
    : super(type: WebverseTypeIds.account);

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(AccountPropertyTypes.email, email)
    ..setToOne(AccountPropertyTypes.ownedByTool, WebverseToolIds.webverse.asObjectId());
}
