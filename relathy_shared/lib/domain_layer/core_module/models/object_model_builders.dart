import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';

abstract class ObjectBuilder {
  ObjectId objectId;
  ToolId toolId;
  ObjectId createdBy;
  ObjectId type;

  ObjectBuilder({
    ObjectId? objectId,
    required this.toolId,
    this.createdBy = ObjectActorIds.system,
    required this.type,
  }) : objectId = objectId ?? ObjectId.generate();

  ImmutableWebObject build() => mutableBuild().toImmutable();

  MutableWebObject mutableBuild() => MutableWebObject(objectId: objectId, toolId: toolId)
    //..setObject(ObjectPropertyTypes.createdBy, createdBy)
    ..setObject(ObjectPropertyTypes.type, type);
}

abstract class ComplexRelationshipBuilder extends ObjectBuilder {
  ComplexRelationshipBuilder({
    required super.objectId,
    required super.toolId,
    super.createdBy,
    required super.type,
  });
}

abstract class ClassBuilder extends ObjectBuilder {
  bool isAbstract;
  String name;
  ClassBuilder({
    required this.name,
    required super.objectId,
    super.createdBy,
    required super.toolId,
    required super.type,
    required this.isAbstract,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setCategoryConditional(ClassPropertyTypes.isAbstract, ObjectTraitIds.abstractClass, isAbstract);
}

class ObjectRoleBuilder extends ClassBuilder {
  ObjectId ownedByModel;
  List<ObjectId>? extendsRoles;
  ObjectRoleBuilder({
    super.createdBy,
    super.type = ObjectTypeIds.objectRole,
    required super.objectId,
    required super.name,
    required this.ownedByModel,
    this.extendsRoles,
    required super.toolId,
  }) : super(isAbstract: true);

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(RolePropertyTypes.ownedByModel, ownedByModel)
    ..setToMany(RolePropertyTypes.extendsObjectRoles, extendsRoles);
}

class ObjectTypeBuilder extends ClassBuilder {
  ObjectId? extendsType;
  List<ObjectId>? extendsRoles;
  bool isStandalone;
  bool isSingleton;
  ObjectId ownedByModel;
  bool isExtension;
  ObjectTypeBuilder({
    super.createdBy,
    super.type = ObjectTypeIds.objectType,
    required super.objectId,
    required super.name,
    required this.extendsType,
    required super.isAbstract,
    required this.ownedByModel,
    required super.toolId,
    this.extendsRoles,
    this.isExtension = false,
    this.isSingleton = false,
    this.isStandalone = false,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(TypePropertyTypes.extendsObjectType, extendsType)
    ..setCategoryConditional(TypePropertyTypes.isStandalone, ObjectTraitIds.standaloneType, isStandalone)
    ..setCategoryConditional(TypePropertyTypes.isSingleton, ObjectTraitIds.singletonType, isSingleton)
    ..setCategoryConditional(TypePropertyTypes.isExtension, ObjectTraitIds.extensionType, isExtension)
    ..setToOne(TypePropertyTypes.ownedByModel, ownedByModel)
    ..setToMany(TypePropertyTypes.extendsObjectRoles, extendsRoles ?? []);
}

class ObjectCategoryBuilder extends ClassBuilder {
  ObjectId? ownedByCategoryAttributeType;
  ObjectId? ownedByAndExtendsCategory;

  ObjectCategoryBuilder({
    super.createdBy,
    super.type = ObjectTypeIds.objectCategory,
    required super.objectId,
    required super.name,
    required this.ownedByCategoryAttributeType,
    required super.isAbstract,
    required super.toolId,
    this.ownedByAndExtendsCategory,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(ObjectCategoryPropertyTypes.ownedByObjectCategoryAttributeType, ownedByCategoryAttributeType)
    ..setToOne(ObjectCategoryPropertyTypes.extendsObjectCategory, ownedByAndExtendsCategory);
}

class ObjectPhaseBuilder extends ClassBuilder {
  ObjectId? ownedByPhaseAttributeType;
  ObjectId? ownedByAndExtendsPhase;

  ObjectPhaseBuilder({
    super.createdBy,
    super.type = ObjectTypeIds.objectPhase,
    required super.objectId,
    required super.name,
    required this.ownedByPhaseAttributeType,
    required super.isAbstract,
    required super.toolId,
    this.ownedByAndExtendsPhase,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(ObjectPhasePropertyTypes.ownedByObjectPhaseAttributeType, ownedByPhaseAttributeType)
    ..setToOne(ObjectPhasePropertyTypes.extendsObjectPhase, ownedByAndExtendsPhase);
}

class PageBuilder extends ObjectBuilder {
  String name;
  PageBuilder({
    required super.objectId,
    super.createdBy,
    required this.name,
    required super.toolId,
    super.type = ObjectTypeIds.page,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()..setText(NamedObjectRolePropertyTypes.name, name);
}

class ComplexRelationshipTypeBuilder extends ObjectTypeBuilder {
  ComplexRelationshipTypeBuilder({
    super.createdBy,
    super.type = ObjectTypeIds.complexRelationshipType,
    required super.objectId,
    required super.isAbstract,
    required super.name,
    required super.toolId,
    required super.ownedByModel,
    required super.extendsType,
  });
}

// class PageBuilder extends DivisionBuilder {
//   PageBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.page,
//     super.kinds,
//     super.phases,
//     required super.name,
//     required super.ownedByObjects,
//   });
// }

class ModelBuilder extends ObjectBuilder {
  ObjectId ownedByOwner;
  String? importedFrom;
  String name;
  ModelBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.model,
    required this.name,
    required super.toolId,
    required this.ownedByOwner,
    this.importedFrom,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setToOne(ModelPropertyTypes.ownedByOwner, ownedByOwner)
    ..setReference(ModelPropertyTypes.importedFrom, importedFrom)
    ..setText(NamedObjectRolePropertyTypes.name, name);
}

// class NestedToolBuilder extends ObjectBuilder {
//   String name;
//   String importedFrom;
//   List<String> ownedByObjects;
//   NestedToolBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.nestedTool,
//     required this.importedFrom,
//     required this.name,
//     required this.ownedByObjects,
//   });

//   @override
//   MutableWebObject mutableBuild() => super.mutableBuild()
//     ..setText(ToolRolePropertyTypes.name, name)
//     ..setText(ToolRolePropertyTypes.importedFrom, importedFrom)
//     ..setToMany(DivisionRolePropertyTypes.ownedByObjects, ownedByObjects);
// }

// class ModelBuilder extends ObjectBuilder {
//   String? importedFrom;
//   String name;
//   List<String> ownedByObjects;
//   ModelBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.model,
//     required this.name,
//     required this.ownedByObjects,
//     this.importedFrom,
//   });

//   @override
//   MutableWebObject mutableBuild() => super.mutableBuild()
//     ..setText(ModelPropertyTypes.importedFrom, importedFrom)
//     ..setText(ModelPropertyTypes.name, name)
//     ..setToMany(DivisionRolePropertyTypes.ownedByObjects, ownedByObjects);
// }

class SubmodelBuilder extends ObjectBuilder {
  String name;
  ObjectId ownedByModel;
  SubmodelBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.submodel,
    required this.name,
    required super.toolId,
    required this.ownedByModel,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(SubmodelPropertyTypes.ownedByModel, ownedByModel);
}

class ToolBuilder extends ObjectBuilder {
  String importedFrom;
  String name;
  ToolBuilder({
    required super.objectId,
    super.createdBy,
    required super.type,
    required super.toolId,
    required this.importedFrom,
    required this.name,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setReference(ToolPropertyTypes.importedFrom, importedFrom)
    ..setText(NamedObjectRolePropertyTypes.name, name);
}

// class CollectionBuilder extends DivisionBuilder {
//   CollectionBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.collection,
//     super.kinds,
//     super.phases,
//     required super.name,
//     required super.ownedByObjects,
//   });
// }

class ValueTypeBuilder extends ObjectBuilder {
  String name;
  ObjectId ownedByModel;
  ValueTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.toolId,
    super.type = ObjectTypeIds.valueType,
    required this.name,
    required this.ownedByModel,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(ValueTypePropertyTypes.ownedByModel, ownedByModel);
}

class SystemActorBuilder extends ActorRoleBuilder {
  String name;
  SystemActorBuilder({
    required super.objectId,
    super.createdBy,
    required super.toolId,
    super.type = ObjectTypeIds.systemActor,
    required this.name,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()..setText(NamedObjectRolePropertyTypes.name, name);
}

class CompositeValueTypeBuilder extends ValueTypeBuilder {
  CompositeValueTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.toolId,
    super.type = ObjectTypeIds.compositeValueType,
    required super.name,
    required super.ownedByModel,
  });
}

abstract class PropertyTypeBuilder extends ObjectBuilder {
  String name;
  ObjectId $class;
  PropertyDerivedMode? derivedMode;

  PropertyTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.type,
    required this.name,
    this.derivedMode,
    required super.toolId,
    required this.$class,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToOne(PropertyTypePropertyTypes.ownedByClass, $class)
    ..setCategoryConditional(
      PropertyTypePropertyTypes.isDerived,
      ObjectTraitIds.derivedPropertyType,
      derivedMode == PropertyDerivedMode.derived,
    )
    ..setCategoryConditional(
      PropertyTypePropertyTypes.isDerived,
      ObjectTraitIds.virtualDerivedPropertyType,
      derivedMode == PropertyDerivedMode.virtualDerived,
    );
}

abstract class AttributeTypeBuilder extends PropertyTypeBuilder {
  ObjectId valueType;
  AttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.type,
    required super.toolId,
    super.derivedMode,
    required super.name,
    required super.$class,
    required this.valueType,
  });

  @override
  MutableWebObject mutableBuild() =>
      super.mutableBuild()..setObject(AttributeTypePropertyTypes.valueType, valueType);
}

class CategoryAttributeTypeBuilder extends AttributeTypeBuilder {
  CategoryAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.toolId,
    super.derivedMode,
    required super.name,
    super.type = ObjectTypeIds.categoryAttributeType,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.object);
}

enum PropertyDerivedMode { derived, virtualDerived }

class PhaseAttributeTypeBuilder extends AttributeTypeBuilder {
  PhaseAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.derivedMode,
    super.type = ObjectTypeIds.phaseAttributeType,
    required super.name,
    required super.$class,
    required super.toolId,
  }) : super(valueType: ObjectValueTypeIds.object);
}

class TextAttributeTypeBuilder extends AttributeTypeBuilder {
  bool isDisplayed;
  TextAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.textAttributeType,
    required super.name,
    super.derivedMode,
    required super.toolId,
    required super.$class,
    required this.isDisplayed,
  }) : super(valueType: ObjectValueTypeIds.text);

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setCategoryConditional(
      TextAttributeTypePropertyTypes.isDisplayed,
      ObjectTraitIds.displayedStringAttributeType,
      isDisplayed,
    );
}

class ReferenceAttributeTypeBuilder extends AttributeTypeBuilder {
  ReferenceAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.referenceAttributeType,
    required super.name,
    required super.toolId,
    super.derivedMode,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.reference);
}

class ReferenceListAttributeTypeBuilder extends AttributeTypeBuilder {
  ReferenceListAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.referenceListAttributeType,
    required super.name,
    required super.toolId,
    super.derivedMode,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.referenceList);
}

class ContentAttributeTypeBuilder extends AttributeTypeBuilder {
  ContentAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.contentAttributeType,
    required super.name,
    required super.toolId,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.content);
}

class ObjectAttributeTypeBuilder extends AttributeTypeBuilder {
  ObjectAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.objectAttributeType,
    required super.name,
    required super.toolId,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.object);
}

class ObjectListAttributeTypeBuilder extends AttributeTypeBuilder {
  ObjectListAttributeTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.objectListAttributeType,
    required super.name,
    required super.toolId,
    required super.$class,
  }) : super(valueType: ObjectValueTypeIds.objectList);
}

enum Cardinality { many, one }

ObjectId? _systemCardinalityToKind(Cardinality cardinality) {
  switch (cardinality) {
    case Cardinality.many:
      return ObjectTraitIds.manyRelationshipType;
    case Cardinality.one:
      return ObjectTraitIds.oneRelationshipType;
  }
}

abstract class RelationshipTypeBuilder extends PropertyTypeBuilder {
  ObjectId toClass;
  Cardinality cardinality;
  ObjectId inverseRelationshipType;

  RelationshipTypeBuilder({
    required super.objectId,
    super.createdBy,
    required super.type,
    required super.name,
    required super.toolId,
    super.derivedMode,
    required super.$class,
    required this.toClass,
    required this.cardinality,
    required this.inverseRelationshipType,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setCategory(RelationshipTypePropertyTypes.cardinality, _systemCardinalityToKind(cardinality))
    ..setObject(RelationshipTypePropertyTypes.toClass, toClass)
    ..setObject(RelationshipTypePropertyTypes.inverseRelationshipType, inverseRelationshipType);
}

class AssociationRelationshipTypeBuilder extends RelationshipTypeBuilder {
  AssociationRelationshipTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.associationRelationshipType,
    required super.name,
    required super.toolId,
    required super.$class,
    super.derivedMode,
    required super.cardinality,
    required super.toClass,
    required super.inverseRelationshipType,
  });
}

class OwnerRelationshipTypeBuilder extends RelationshipTypeBuilder {
  ObjectId? defaultChildType;
  OwnerRelationshipTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.ownerRelationshipType,
    required super.name,
    required super.$class,
    required super.cardinality,
    required super.toClass,
    required super.toolId,
    required super.inverseRelationshipType,
    this.defaultChildType,
  });

  @override
  MutableWebObject mutableBuild() =>
      super.mutableBuild()..setObject(OwnerRelationshipTypePropertyTypes.defaultChildType, defaultChildType);
}

class OwnedRelationshipTypeBuilder extends RelationshipTypeBuilder {
  OwnedRelationshipTypeBuilder({
    required super.objectId,
    super.createdBy,
    super.type = ObjectTypeIds.ownedRelationshipType,
    required super.name,
    required super.$class,
    required super.toolId,
    required super.cardinality,
    required super.toClass,
    required super.inverseRelationshipType,
  });
}

abstract class ActorRoleBuilder extends ObjectBuilder {
  ActorRoleBuilder({required super.objectId, super.createdBy, required super.type, required super.toolId});
}

abstract class UserRoleBuilder extends ActorRoleBuilder {
  String name;
  String email;
  String link;
  ObjectId ownedByTool;
  UserRoleBuilder({
    required super.objectId,
    super.createdBy,
    required super.type,
    required super.toolId,
    required this.name,
    required this.email,
    required this.link,
    required this.ownedByTool,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(UserRolePropertyTypes.email, email)
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setText(UserRolePropertyTypes.link, link)
    ..setToOne(UserRolePropertyTypes.ownedByTool, ownedByTool);
}

class CollectionBuilder extends ObjectBuilder {
  String name;
  List<ObjectId>? contains;
  List<ObjectId> ownedByObjects;

  CollectionBuilder({
    required super.objectId,
    required this.name,
    required super.toolId,
    super.createdBy,
    super.type = ObjectTypeIds.collection,
    this.contains,
    required this.ownedByObjects,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(CollectionRolePropertyTypes.contains, contains)
    ..setToMany(DivisionRolePropertyTypes.ownedByObjects, ownedByObjects);
}

class ContentIdeaBuilder extends ObjectBuilder {
  List<ObjectId>? assignedTo;
  List<ObjectId> ownedByObjects;
  String? name;
  ContentIdeaBuilder({
    super.objectId,
    required this.assignedTo,
    required super.toolId,
    required this.ownedByObjects,
    super.createdBy,
    super.type = ObjectTypeIds.contentIdea,
    this.name,
  });

  @override
  MutableWebObject mutableBuild() => super.mutableBuild()
    ..setText(NamedObjectRolePropertyTypes.name, name)
    ..setToMany(ContentIdeaPropertyTypes.ownedByObjects, ownedByObjects)
    ..setToMany(ContentIdeaPropertyTypes.assignedTo, assignedTo);
}

// class BlockTypeBuilder extends ObjectBuilder {
//   String name;
//   String ownedByModel;
//   BlockTypeBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.blockType,
//     required this.name,
//     required this.ownedByModel,
//   });

//   @override
//   MutableObject mutableBuild() => super.mutableBuild()
//     ..setString(BlockTypePropertyTypes.name, name)
//     ..setToOne(BlockTypePropertyTypes.ownedByDataModel, ownedByModel);
// }

// class InlineTypeBuilder extends ObjectBuilder {
//   String name;
//   String ownedByModel;
//   InlineTypeBuilder({
//     required super.objectId,
//     super.createdBy,
//     super.type = ObjectTypeIds.inlineType,

//     required this.name,
//     required this.ownedByModel,
//   });

//   @override
//   MutableObject mutableBuild() => super.mutableBuild()
//     ..setString(InlineTypePropertyTypes.name, name)
//     ..setToOne(InlineTypePropertyTypes.ownedByDataModel, ownedByModel);
// }
