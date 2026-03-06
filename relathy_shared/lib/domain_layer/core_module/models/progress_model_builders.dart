import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/progress_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model_builders.dart';

abstract class AreaBuilder extends ObjectBuilder {
  AreaBuilder({super.objectId, required super.createdBy, required super.type, required super.toolId});
}

class MainAreaOwnedBy {
  final ObjectId? os;
  final List<ObjectId>? mainAreas;

  MainAreaOwnedBy._({required this.os, required this.mainAreas});

  MainAreaOwnedBy.os(ObjectId value) : this._(os: value, mainAreas: null);
  MainAreaOwnedBy.mainArea(List<ObjectId> value) : this._(os: null, mainAreas: value);
}

class MainAreaBuilder extends AreaBuilder {
  String name;
  MainAreaOwnedBy ownedBy;
  ObjectId? assignedToTeamWorkspace;

  MainAreaBuilder({
    super.objectId,
    required super.createdBy,
    required super.toolId,
    super.type = ProgressTypeIds.mainArea,
    required this.name,
    required this.ownedBy,
    this.assignedToTeamWorkspace,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(MainAreaPropertyTypes.assignedToTeamWorkspace, assignedToTeamWorkspace)
    ..setToOne(MainAreaPropertyTypes.ownedByOS, ownedBy.os)
    ..setToMany(MainAreaPropertyTypes.ownedByMainAreas, ownedBy.mainAreas);
}

@immutable
class WorkbaseAreaOwnedBy {
  final ObjectId? workbase;
  final List<ObjectId>? workbaseAreas;

  const WorkbaseAreaOwnedBy._({this.workbase, this.workbaseAreas});

  const WorkbaseAreaOwnedBy.workbase(ObjectId value) : this._(workbase: value);
  const WorkbaseAreaOwnedBy.workbaseAreas(List<ObjectId> value) : this._(workbaseAreas: value);
}

class WorkbaseAreaBuilder extends AreaBuilder {
  String name;
  WorkbaseAreaOwnedBy ownedBy;
  ObjectId? assignedToTeamWorkspace;

  WorkbaseAreaBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.workbaseArea,
    required this.name,
    required this.ownedBy,
    this.assignedToTeamWorkspace,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(WorkbaseAreaPropertyTypes.assignedToTeamWorkspace, assignedToTeamWorkspace)
    ..setToOne(WorkbaseAreaPropertyTypes.ownedByWorkbase, ownedBy.workbase)
    ..setToMany(WorkbaseAreaPropertyTypes.ownedByWorkbaseAreas, ownedBy.workbaseAreas);
}

class WorkspaceAreaOwnedBy {
  final ObjectId? workspace;
  final List<ObjectId>? workspaceAreas;

  const WorkspaceAreaOwnedBy._({this.workspace, this.workspaceAreas});

  const WorkspaceAreaOwnedBy.workspace(ObjectId value) : this._(workspace: value);
  const WorkspaceAreaOwnedBy.workspaceAreas(List<ObjectId> value) : this._(workspaceAreas: value);
}

class WorkspaceAreaBuilder extends AreaBuilder {
  String name;
  WorkspaceAreaOwnedBy ownedBy;

  WorkspaceAreaBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.workspaceArea,
    required this.name,
    required this.ownedBy,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(WorkspaceAreaPropertyTypes.ownedByWorkspace, ownedBy.workspace)
    ..setToMany(WorkspaceAreaPropertyTypes.ownedByWorkspaceAreas, ownedBy.workspaceAreas);
}

class GeneralAreaOwnedBy {
  final ObjectId? workspace;
  final ObjectId? workbase;

  const GeneralAreaOwnedBy._({this.workspace, this.workbase});

  const GeneralAreaOwnedBy.workspace(ObjectId value) : this._(workspace: value);
  const GeneralAreaOwnedBy.workbase(ObjectId value) : this._(workbase: value);
}

class GeneralAreaBuilder extends AreaBuilder {
  GeneralAreaOwnedBy ownedBy;

  GeneralAreaBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.generalArea,
    required this.ownedBy,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(GeneralAreaPropertyTypes.ownedByWorkspace, ownedBy.workspace)
    ..setToOne(GeneralAreaPropertyTypes.ownedByWorkbase, ownedBy.workbase);
}

class GoalBuilder extends ObjectBuilder {
  String name;
  List<ObjectId> parentAreas;
  List<ObjectId>? directSupportsGoals;
  List<ObjectId>? indirectSupportsGoals;
  GoalBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.goal,
    required this.name,
    required this.parentAreas,
    this.directSupportsGoals,
    this.indirectSupportsGoals,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(GoalPropertyTypes.ownedByAreas, parentAreas)
    ..setToMany(GoalPropertyTypes.partOfGoals, directSupportsGoals)
    ..setToMany(GoalPropertyTypes.supportsGoals, indirectSupportsGoals);
}

abstract class OperatingPrincipleBuilder extends ObjectBuilder {
  String name;

  List<ObjectId>? supportsGoals;
  OperatingPrincipleBuilder({
    super.objectId,
    required super.createdBy,
    required super.type,
    required this.name,
    required super.toolId,
    this.supportsGoals,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(OperatingPrinciplePropertyTypes.supportsGoals, supportsGoals);
}

class AreaOperatingPrincipleBuilder extends OperatingPrincipleBuilder {
  List<ObjectId> parentAreas;
  AreaOperatingPrincipleBuilder({
    super.objectId,
    required super.createdBy,
    super.type = ProgressTypeIds.operatingPrinciple,
    required super.name,
    required super.toolId,
    required this.parentAreas,
    super.supportsGoals,
  });

  @override
  MutableWebObject mutableBuild() =>
      super.mutableBuild()..setToMany(OperatingPrinciplePropertyTypes.ownedByAreas, parentAreas);
}

class SpaceOperatingPrincipleBuilder extends OperatingPrincipleBuilder {
  List<ObjectId> parentSpaces;
  SpaceOperatingPrincipleBuilder({
    super.objectId,
    required super.createdBy,
    super.type = ProgressTypeIds.spaceOperatingPrinciple,
    required super.name,
    required super.toolId,
    required this.parentSpaces,
    super.supportsGoals,
  });

  @override
  MutableWebObject mutableBuild() =>
      super.mutableBuild()..setToMany(SpaceOperatingPrinciplePropertyTypes.ownedBySpaces, parentSpaces);
}

class WorkIdeaBuilder extends ObjectBuilder {
  String name;
  List<ObjectId> parentAreas;
  List<ObjectId>? parentActions;
  List<ObjectId>? supportsGoals;

  WorkIdeaBuilder({
    super.objectId,
    required super.createdBy,
    super.type = ProgressTypeIds.workIdea,
    required this.name,
    required super.toolId,
    required this.parentAreas,
    this.parentActions,
    this.supportsGoals,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(WorkIdeaPropertyTypes.ownedByAreas, parentAreas)
    ..setToMany(WorkIdeaPropertyTypes.ownedByWorkIdeas, parentActions)
    ..setToMany(WorkIdeaPropertyTypes.supportsGoals, supportsGoals);
}

class ActivityBuilder extends ObjectBuilder {
  String name;
  List<ObjectId> parentAreas;

  ActivityBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.activity,
    required this.name,
    required this.parentAreas,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(ActivityPropertyTypes.ownedByAreas, parentAreas);
}

enum ParentOfObjectiveType { workspace, workbase }

class ObjectiveBuilder extends ObjectBuilder {
  String name;
  ObjectId goal;
  ObjectId parentOfObjective;
  ParentOfObjectiveType parentOfObjectiveType;

  ObjectiveBuilder({
    super.objectId,
    required super.toolId,
    required super.createdBy,
    super.type = ProgressTypeIds.objective,
    required this.name,
    required this.goal,
    required this.parentOfObjective,
    required this.parentOfObjectiveType,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOneConditional(
      ObjectivePropertyTypes.ownedByWorkspace,
      parentOfObjective,
      parentOfObjectiveType == ParentOfObjectiveType.workspace,
    )
    ..setToOneConditional(
      ObjectivePropertyTypes.ownedByWorkbase,
      parentOfObjective,
      parentOfObjectiveType == ParentOfObjectiveType.workbase,
    )
    ..setToOne(ObjectivePropertyTypes.partOfGoal, goal);
}
