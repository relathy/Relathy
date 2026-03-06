import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/add_relationship_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/remove_relationship_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/set_attribute_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/content.dart';
import 'package:relathy_shared/domain_layer/core_module/data/maybe.dart';
import 'package:relathy_shared/domain_layer/core_module/data/reference_link.dart';
import 'package:relathy_shared/domain_layer/core_module/data/system_property_types.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_shared/generic_layer/flags/flags.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';
part 'object.g.dart';
part 'object.freezed.dart';

abstract interface class WebObject implements ReadAttributes, ReadRelationships {
  ObjectId get objectId;
  ToolId get toolId;
}

abstract interface class Attribute {
  Object? get rawValue;
  Object? get oldRawValue;
  Object? get conflictRawValue;
  bool get isChanged;
  SetAttributeOperation? get setAttributeOperation;
  ReadOnlyList<Maybe> get maybes;
}

abstract interface class PerTypeRelationships {
  ReadOnlyList<ObjectId> get addedToObjects;
  ReadOnlyList<Relationship> get removedRelationships;
  ReadOnlyList<Relationship> get relationships;
  ReadOnlyList<ObjectId>? get oldToObjects;
}

abstract interface class Relationship implements ReadAttributes {
  bool get isNew;
  bool get isDeleted;
  ObjectId get toObjectId;
  AddRelationshipOperation? get addRelationshipOperation;
  RemoveRelationshipOperation? get removeRelationshipOperation;
}

abstract interface class ReadAttributes {
  ReadOnlyMap<ObjectId, Attribute> get attributes;

  Object? getAttributeRawValue(ObjectId attributeTypeId);

  String? readText(TextAttributeType attributeType);

  ContentPointer? readContent(ContentAttributeType attributeType);

  ObjectId? readCategory(CategoryAttributeType attributeType);

  ObjectId? readObject(ObjectAttributeType attributeType);

  ReferenceLink? readReference(ReferenceAttributeType attributeType);

  List<ObjectId>? readObjectList(ObjectListAttributeType attributeType);
}

abstract interface class ReadRelationships {
  ReadOnlyMap<ObjectId, PerTypeRelationships> get perTypeRelationships;

  List<ObjectId> listRelationships(ObjectId relationshipTypeId);

  List<Relationship> listRelationshipsWithAttributes(ObjectId relationshipTypeId);

  ObjectId? readToOne(ToOneRelationshipType relationshipType);

  List<ObjectId> readToMany(ToManyRelationshipType relationshipType);

  List<ObjectId> readRelationships(RelationshipType relationshipType);

  Relationship? readToOneWithAttributes(ToOneRelationshipType relationshipType);

  List<Relationship> readToManyWithAttributes(ToManyRelationshipType relationshipType);

  List<Relationship> readRelationshipsWithAttributes(RelationshipType relationshipType);
}

extension WebObjectExtension on WebObject {
  ImmutableWebObject toImmutable() {
    final self = this;
    if (self is ImmutableWebObject) {
      return self;
    }
    if (self is MutableWebObject) {
      return self.toImmutable();
    }
    throw UnreachableCodeError();
  }
}

class WebObjectList extends DelegatingList<ImmutableWebObject> {
  final ToolId toolId;
  WebObjectList({required this.toolId, List<ImmutableWebObject>? values}) : super(values ?? []);
}

@JsonSerializable(explicitToJson: true)
@immutable
class ImmutablePerTypeRelationships implements PerTypeRelationships {
  @override
  @ImmutableListConverter<ImmutableRelationship>()
  final ImmutableList<ImmutableRelationship> relationships;

  @override
  @ImmutableListConverter<ObjectId>()
  final ImmutableList<ObjectId> addedToObjects;

  @override
  @ImmutableListConverter<ImmutableRelationship>()
  final ImmutableList<ImmutableRelationship> removedRelationships;

  @override
  @NullableImmutableListConverter<ObjectId>()
  final ImmutableList<ObjectId>? oldToObjects;

  const ImmutablePerTypeRelationships({
    this.relationships = const ImmutableList.empty(),
    this.addedToObjects = const ImmutableList.empty(),
    this.removedRelationships = const ImmutableList.empty(),
    this.oldToObjects,
  });

  factory ImmutablePerTypeRelationships.fromJson(Map<String, dynamic> json) =>
      _$ImmutablePerTypeRelationshipsFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutablePerTypeRelationshipsToJson(this);

  MutablePerTypeRelationships toMutable() {
    return MutablePerTypeRelationships(
      relationships: relationships.map((x) => x.toMutable()).toList(),
      removedRelationships: removedRelationships.map((x) => x.toMutable()).toList(),
      addedToObjects: addedToObjects.toList(),
    );
  }
}

extension AttributeExtension on Attribute {
  ContentPointer? readContentPointer() {
    return rawValue == null ? null : ContentPointer.fromJson(rawValue as Map<String, dynamic>);
  }

  ContentPointer? readOldContentPointer() {
    return oldRawValue == null ? null : ContentPointer.fromJson(oldRawValue as Map<String, dynamic>);
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
class ImmutableAttribute implements Attribute {
  @override
  final Object? rawValue;

  @override
  final Object? conflictRawValue;

  @override
  final SetAttributeOperation? setAttributeOperation;

  @override
  @ImmutableListConverter<ImmutableMaybe>()
  final ImmutableList<ImmutableMaybe> maybes;

  const ImmutableAttribute.empty() : this(rawValue: null);

  const ImmutableAttribute({
    required this.rawValue,
    this.conflictRawValue,
    this.setAttributeOperation,
    this.maybes = const ImmutableList.empty(),
  });

  factory ImmutableAttribute.fromJson(Map<String, dynamic> json) => _$ImmutableAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableAttributeToJson(this);

  @override
  bool get isChanged => setAttributeOperation != null;

  @override
  Object? get oldRawValue => setAttributeOperation?.oldRawValue;

  MutableAttribute toMutable() {
    return MutableAttribute(
      rawValue: rawValue,
      conflictValue: conflictRawValue,
      setAttributeOperation: setAttributeOperation,
      maybes: maybes.mapToMutableList((x) => x.toMutable()),
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
class ImmutableWebObject
    with ImmutableReadAttributesMixin, ImmutableReadRelationshipsMixin
    implements WebObject {
  @override
  final ObjectId objectId;

  @override
  final ToolId toolId;

  @override
  @_AttributesMapConverter()
  final ImmutableMap<ObjectId, ImmutableAttribute> attributes;

  @override
  @_PerTypeRelationshipsMapConverter()
  final ImmutableMap<ObjectId, ImmutablePerTypeRelationships> perTypeRelationships;

  const ImmutableWebObject({
    required this.objectId,
    required this.toolId,
    this.attributes = const ImmutableMap.empty(),
    this.perTypeRelationships = const ImmutableMap.empty(),
  });

  factory ImmutableWebObject.fromJson(Map<String, dynamic> json) => _$ImmutableWebObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableWebObjectToJson(this);

  MutableWebObject toMutable() {
    return MutableWebObject(
      objectId: objectId,
      toolId: toolId,
      attributes: attributes.map((k, v) => MapEntry(k, v.toMutable())),
      perTypeRelationships: perTypeRelationships.map((k, v) => MapEntry(k, v.toMutable())),
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
class ImmutableRelationship with ImmutableReadAttributesMixin implements Relationship {
  @override
  final ObjectId toObjectId;

  @override
  @_AttributesMapConverter()
  final ImmutableMap<ObjectId, ImmutableAttribute> attributes;

  @override
  final AddRelationshipOperation? addRelationshipOperation;

  @override
  final RemoveRelationshipOperation? removeRelationshipOperation;

  const ImmutableRelationship({
    required this.toObjectId,
    this.attributes = const ImmutableMap.empty(),
    this.addRelationshipOperation,
    this.removeRelationshipOperation,
  });

  factory ImmutableRelationship.fromJson(Map<String, dynamic> json) => _$ImmutableRelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRelationshipToJson(this);

  @override
  bool get isNew => addRelationshipOperation != null;

  @override
  bool get isDeleted => removeRelationshipOperation != null;

  MutableRelationship toMutable() {
    return MutableRelationship(
      toObjectId: toObjectId,
      attributes: attributes.map((k, v) => MapEntry(k, v.toMutable())),
      addRelationshipOperation: addRelationshipOperation,
      removeRelationshipOperation: removeRelationshipOperation,
    );
  }
}

mixin ImmutableReadAttributesMixin implements ReadAttributes {
  @override
  ImmutableMap<ObjectId, ImmutableAttribute> get attributes;

  @override
  Object? getAttributeRawValue(ObjectId attributeTypeId) {
    return attributes[attributeTypeId]?.rawValue;
  }

  @override
  String? readText(TextAttributeType attributeType) {
    return getAttributeRawValue(attributeType.id) as String?;
  }

  @override
  ObjectId? readCategory(CategoryAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as String?;
    return value == null ? null : ObjectId(value);
  }

  @override
  ObjectId? readObject(ObjectAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as String?;
    return value == null ? null : ObjectId(value);
  }

  @override
  ReferenceLink? readReference(ReferenceAttributeType attributeType) {
    var rawValue = getAttributeRawValue(attributeType.id);
    return rawValue == null ? null : ReferenceLink.fromRawValue(rawValue);
  }

  @override
  ContentPointer? readContent(ContentAttributeType attributeType) {
    final rawValue = getAttributeRawValue(attributeType.id);
    return rawValue == null ? null : ContentPointer.fromRawValue(rawValue);
  }

  @override
  List<ObjectId>? readObjectList(ObjectListAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as List<String>?;
    return value?.map((x) => ObjectId(x)).toList();
  }
}

mixin ImmutableReadRelationshipsMixin implements ReadRelationships {
  @override
  ImmutableMap<ObjectId, ImmutablePerTypeRelationships> get perTypeRelationships;

  @override
  ObjectId? readToOne(ToOneRelationshipType relationshipType) {
    return readRelationships(relationshipType).singleOrNull;
  }

  @override
  List<ObjectId> readToMany(ToManyRelationshipType relationshipType) {
    return readRelationships(relationshipType);
  }

  @override
  List<ObjectId> readRelationships(RelationshipType relationshipType) =>
      listRelationships(relationshipType.id);

  @override
  List<ObjectId> listRelationships(ObjectId relationshipTypeId) =>
      perTypeRelationships[relationshipTypeId]?.relationships.map((x) => x.toObjectId).toList() ?? [];

  @override
  List<Relationship> listRelationshipsWithAttributes(ObjectId relationshipTypeId) {
    return perTypeRelationships[relationshipTypeId]?.relationships.toList() ?? [];
  }

  Relationship? readToOneWithAttribute(ToOneRelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id).singleOrNull;
  }

  @override
  List<Relationship> readToManyWithAttributes(ToManyRelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id);
  }

  @override
  Relationship? readToOneWithAttributes(ToOneRelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id).singleOrNull;
  }

  @override
  List<Relationship> readRelationshipsWithAttributes(RelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id);
  }
}

class MutableAttribute implements Attribute {
  final Observable<Object?> _rawValueObs;
  final Observable<Object?> _conflictRawValueObs;
  final MutableList<MutableMaybe> _maybes;
  final Observable<SetAttributeOperation?> _setAttributeOperationObs;

  @override
  SetAttributeOperation? get setAttributeOperation => _setAttributeOperationObs.value;
  set setAttributeOperation(SetAttributeOperation? value) => _setAttributeOperationObs.value = value;
  @override
  bool get isChanged => setAttributeOperation != null;
  @override
  MutableList<MutableMaybe> get maybes => _maybes;

  @override
  Object? get rawValue => _rawValueObs.value;
  set rawValue(Object? value) => _rawValueObs.value = value;

  @override
  Object? get oldRawValue => setAttributeOperation?.oldRawValue;

  @override
  Object? get conflictRawValue => _conflictRawValueObs.value;
  set conflictRawValue(Object? value) => _conflictRawValueObs.value = value;

  MutableAttribute({
    required Object? rawValue,
    Object? conflictValue,
    SetAttributeOperation? setAttributeOperation,
    Iterable<MutableMaybe>? maybes,
  }) : _rawValueObs = Observable(rawValue),
       _setAttributeOperationObs = Observable(setAttributeOperation),
       _conflictRawValueObs = Observable(conflictValue),
       _maybes = ArgsHelper.toMutableList(maybes);

  ImmutableAttribute toImmutable() {
    return ImmutableAttribute(
      rawValue: rawValue,
      conflictRawValue: conflictRawValue,
      setAttributeOperation: setAttributeOperation,
      maybes: ImmutableList.of(_maybes.map((x) => x.toImmutable())),
    );
  }
}

class MutablePerTypeRelationships implements PerTypeRelationships {
  final Observable<MutableList<ObjectId>> _addedToObjectsObs;
  final Observable<ImmutableList<ObjectId>?> _oldToObjectsObs;
  final Observable<MutableList<MutableRelationship>> _relationshipsObs;
  final Observable<MutableList<MutableRelationship>> _removedRelationshipsObs;

  @override
  MutableList<MutableRelationship> get relationships => _relationshipsObs.value;
  set relationships(Iterable<MutableRelationship> value) => _relationshipsObs.value =
      value is MutableList<MutableRelationship> ? value : MutableList<MutableRelationship>.of(value);

  @override
  MutableList<MutableRelationship> get removedRelationships => _removedRelationshipsObs.value;
  set removedRelationships(Iterable<MutableRelationship> value) => _removedRelationshipsObs.value =
      value is MutableList<MutableRelationship> ? value : MutableList<MutableRelationship>.of(value);

  @override
  MutableList<ObjectId> get addedToObjects => _addedToObjectsObs.value;
  set addedToObjects(List<ObjectId> value) =>
      _addedToObjectsObs.value = value is MutableList<ObjectId> ? value : MutableList<ObjectId>.of(value);

  MutablePerTypeRelationships({
    List<MutableRelationship>? relationships,
    List<MutableRelationship>? removedRelationships,
    List<ObjectId>? addedToObjects,
    List<ObjectId>? oldToObjects,
  }) : _relationshipsObs = Observable(ArgsHelper.toMutableList(relationships)),
       _removedRelationshipsObs = Observable(ArgsHelper.toMutableList(removedRelationships)),
       _addedToObjectsObs = Observable(ArgsHelper.toMutableList(addedToObjects)),
       _oldToObjectsObs = Observable(ImmutableList.of(oldToObjects ?? []));

  ImmutablePerTypeRelationships toImmutable() {
    return ImmutablePerTypeRelationships(
      relationships: relationships.mapToImmutableList((x) => x.toImmutable()),
      removedRelationships: removedRelationships.mapToImmutableList((x) => x.toImmutable()),
      addedToObjects: addedToObjects.toImmutableList(),
      oldToObjects: oldToObjects,
    );
  }

  @override
  ImmutableList<ObjectId>? get oldToObjects => _oldToObjectsObs.value;
  set oldToObjects(ImmutableList<ObjectId>? value) => _oldToObjectsObs.value = value;
}

class MutableWebObject
    with
        MutableReadAttributesMixin,
        MutableWriteAttributesMixin,
        MutableReadRelationshipsMixin,
        MutableWriteRelationshipsMixin
    implements WebObject, WriteAttributes, WriteRelationships {
  @override
  final ObjectId objectId;

  @override
  final ToolId toolId;

  @override
  final MutableMap<ObjectId, MutableAttribute> attributes;
  @override
  final MutableMap<ObjectId, MutablePerTypeRelationships> perTypeRelationships;

  MutableWebObject({
    required this.objectId,
    required this.toolId,
    Map<ObjectId, MutableAttribute>? attributes,
    Map<ObjectId, MutablePerTypeRelationships>? perTypeRelationships,
  }) : attributes = ArgsHelper.toMutableMap(attributes),
       perTypeRelationships = ArgsHelper.toMutableMap(perTypeRelationships);

  ImmutableWebObject toImmutable() {
    return ImmutableWebObject(
      toolId: toolId,
      objectId: objectId,
      attributes: ImmutableMap.of(attributes.map((k, v) => MapEntry(k, v.toImmutable()))),
      perTypeRelationships: ImmutableMap.of(perTypeRelationships.map((k, v) => MapEntry(k, v.toImmutable()))),
    );
  }
}

class MutableRelationship
    with MutableReadAttributesMixin, MutableWriteAttributesMixin
    implements WriteAttributes, Relationship {
  @override
  final ObjectId toObjectId;
  final Observable<AddRelationshipOperation?> _addRelationshipOperationObs;
  final Observable<RemoveRelationshipOperation?> _removeRelationshipOperationObs;
  @override
  final MutableMap<ObjectId, MutableAttribute> attributes;
  MutableRelationship({
    required this.toObjectId,
    Map<ObjectId, MutableAttribute>? attributes,
    AddRelationshipOperation? addRelationshipOperation,
    RemoveRelationshipOperation? removeRelationshipOperation,
  }) : attributes = ArgsHelper.toMutableMap(attributes),
       _addRelationshipOperationObs = Observable(addRelationshipOperation),
       _removeRelationshipOperationObs = Observable(removeRelationshipOperation);

  ImmutableRelationship toImmutable() {
    return ImmutableRelationship(
      toObjectId: toObjectId,
      attributes: ImmutableMap.of(attributes.map((k, v) => MapEntry(k, v.toImmutable()))),
      addRelationshipOperation: addRelationshipOperation,
      removeRelationshipOperation: removeRelationshipOperation,
    );
  }

  @override
  AddRelationshipOperation? get addRelationshipOperation => _addRelationshipOperationObs.value;
  set addRelationshipOperation(AddRelationshipOperation? value) => _addRelationshipOperationObs.value = value;

  @override
  RemoveRelationshipOperation? get removeRelationshipOperation => _removeRelationshipOperationObs.value;
  set removeRelationshipOperation(RemoveRelationshipOperation? value) =>
      _removeRelationshipOperationObs.value = value;

  @override
  bool get isNew => addRelationshipOperation != null;

  @override
  bool get isDeleted => removeRelationshipOperation != null;
}

mixin MutableWriteAttributesMixin implements WriteAttributes {
  @override
  MutableMap<ObjectId, MutableAttribute> get attributes;

  void setAttributeRawValue(ObjectId attributeType, Object? value) {
    var attribute = attributes[attributeType];
    if (attribute == null) {
      attribute = MutableAttribute(rawValue: value);
      attributes[attributeType] = attribute;
    } else {
      attribute.rawValue = value;
    }
  }

  @override
  void setContent(ContentAttributeType attributeType, ContentPointer? value) {
    setAttributeRawValue(attributeType.id, value?.toJson());
  }

  @override
  void setText(TextAttributeType attributeType, String? value) {
    setAttributeRawValue(attributeType.id, value);
  }

  @override
  void setReference(ReferenceAttributeType attributeType, String? value) {
    setAttributeRawValue(attributeType.id, value);
  }

  @override
  void setObject(ObjectAttributeType attributeType, ObjectId? value) {
    setAttributeRawValue(attributeType.id, value?.value);
  }

  @override
  void setCategoryConditional(CategoryAttributeType attributeType, ObjectId category, bool value) {
    if (value) {
      setAttributeRawValue(attributeType.id, category.value);
    }
  }

  @override
  void setCategory(CategoryAttributeType attributeType, ObjectId? category) {
    setAttributeRawValue(attributeType.id, category?.value);
  }

  @override
  void setObjectList(ObjectListAttributeType attributeType, List<ObjectId>? value) {
    setAttributeRawValue(attributeType.id, value?.map((x) => x.value).toList());
  }
}

mixin MutableReadAttributesMixin implements ReadAttributes {
  @override
  MutableMap<ObjectId, MutableAttribute> get attributes;

  MutableAttribute getOrCreateAttribute(ObjectId attributeTypeId) {
    var result = attributes[attributeTypeId];
    if (result == null) {
      runInAction(() {
        result = MutableAttribute(rawValue: null);
        attributes[attributeTypeId] = result!;
      });
    }
    return result!;
  }

  @override
  ContentPointer? readContent(ContentAttributeType attributeType) {
    var rawValue = getAttributeRawValue(attributeType.id);
    return rawValue == null ? null : ContentPointer.fromRawValue(rawValue);
  }

  @override
  Object? getAttributeRawValue(ObjectId attributeTypeId) {
    return attributes[attributeTypeId]?.rawValue;
  }

  @override
  String? readText(TextAttributeType attributeType) {
    return getAttributeRawValue(attributeType.id) as String?;
  }

  @override
  ReferenceLink? readReference(ReferenceAttributeType attributeType) {
    var rawValue = getAttributeRawValue(attributeType.id);
    return rawValue == null ? null : ReferenceLink.fromRawValue(rawValue);
  }

  @override
  ObjectId? readCategory(CategoryAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as String?;
    return value == null ? null : ObjectId(value);
  }

  @override
  ObjectId? readObject(ObjectAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as String?;
    return value == null ? null : ObjectId(value);
  }

  @override
  List<ObjectId>? readObjectList(ObjectListAttributeType attributeType) {
    var value = getAttributeRawValue(attributeType.id) as List<String>?;
    return value?.map((x) => ObjectId(x)).toList();
  }
}

mixin MutableWriteRelationshipsMixin implements WriteRelationships {
  @override
  MutableMap<ObjectId, MutablePerTypeRelationships> get perTypeRelationships;

  @override
  void setToMany(ToManyRelationshipType relationshipType, Iterable<ObjectId>? value) {
    rawSetRelationships(relationshipType.id, value);
  }

  @override
  void setToManyConditional(
    ToManyRelationshipType relationshipType,
    Iterable<ObjectId>? value,
    bool condition,
  ) {
    if (condition) {
      rawSetRelationships(relationshipType.id, value);
    }
  }

  @override
  void setToOne(ToOneRelationshipType relationshipType, ObjectId? value) {
    rawSetRelationships(relationshipType.id, value != null ? [value] : []);
  }

  @override
  void setToOneConditional(ToOneRelationshipType relationshipType, ObjectId value, bool condition) {
    if (condition) {
      rawSetRelationships(relationshipType.id, condition ? [value] : []);
    }
  }

  @override
  void setRelationships(RelationshipType relationshipType, Iterable<ObjectId>? value) {
    rawSetRelationships(relationshipType.id, value);
  }

  @override
  void setToManyWithAttributes(
    ToManyRelationshipType relationshipType,
    Iterable<MutableRelationship>? value,
  ) {
    setRelationshipsWithAttributes(relationshipType, value);
  }

  @override
  void setToOneWithAttributes(ToOneRelationshipType relationshipType, MutableRelationship? value) {
    setRelationshipsWithAttributes(relationshipType, value != null ? [value] : []);
  }

  @override
  void setRelationshipsWithAttributes(
    RelationshipType relationshipType,
    Iterable<MutableRelationship>? value,
  ) {
    return rawSetRelationshipsWithAttributes(relationshipType.id, value);
  }

  void rawSetRelationships(ObjectId relationshipType, Iterable<ObjectId>? value) {
    rawSetRelationshipsWithAttributes(
      relationshipType,
      value?.map((x) => MutableRelationship(toObjectId: x)),
    );
  }

  void rawAddRelationships(ObjectId relationshipType, Iterable<ObjectId> values) {
    rawAddRelationshipsWithAttributes(
      relationshipType,
      values.map((x) => MutableRelationship(toObjectId: x)),
    );
  }

  void rawRemoveRelationships(ObjectId relationshipType, List<ObjectId> values) {
    var perType = perTypeRelationships[relationshipType];
    if (perType == null) {
      return;
    } else {
      perType.relationships.removeWhere((x) => values.contains(x.toObjectId));
    }
  }

  void rawAddRelationshipsWithAttributes(ObjectId relationshipType, Iterable<MutableRelationship> value) {
    var perType = perTypeRelationships[relationshipType];
    if (perType == null) {
      perTypeRelationships[relationshipType] = MutablePerTypeRelationships(
        relationships: ObservableList.of(value),
      );
    } else {
      perType.relationships.addAll(value);
    }
  }

  void rawSetRelationshipsWithAttributes(ObjectId relationshipType, Iterable<MutableRelationship>? value) {
    var perType = perTypeRelationships[relationshipType];
    if (perType == null) {
      perTypeRelationships[relationshipType] = MutablePerTypeRelationships(
        relationships: ObservableList.of(value ?? []),
      );
    } else {
      perType.relationships.clear();
      perType.relationships.addAll(value ?? []);
    }
  }
}

mixin MutableReadRelationshipsMixin implements ReadRelationships {
  @override
  MutableMap<ObjectId, MutablePerTypeRelationships> get perTypeRelationships;

  MutablePerTypeRelationships getOrCreatePerTypeRelationships(ObjectId relationshipTypeId) {
    var result = perTypeRelationships[relationshipTypeId];
    if (result == null) {
      runInAction(() {
        result = MutablePerTypeRelationships();
        perTypeRelationships[relationshipTypeId] = result!;
      });
    }
    return result!;
  }

  @override
  ObjectId? readToOne(ToOneRelationshipType relationshipType) {
    return readRelationships(relationshipType).singleOrNull;
  }

  @override
  List<ObjectId> readToMany(ToManyRelationshipType relationshipType) {
    return readRelationships(relationshipType);
  }

  @override
  List<ObjectId> readRelationships(RelationshipType relationshipType) =>
      listRelationships(relationshipType.id);

  @override
  List<ObjectId> listRelationships(ObjectId relationshipTypeId) =>
      perTypeRelationships[relationshipTypeId]?.relationships.map((x) => x.toObjectId).toList() ?? [];

  @override
  List<Relationship> listRelationshipsWithAttributes(ObjectId relationshipTypeId) {
    return perTypeRelationships[relationshipTypeId]?.relationships.toList() ?? [];
  }

  @override
  Relationship? readToOneWithAttributes(ToOneRelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id).singleOrNull;
  }

  @override
  List<Relationship> readToManyWithAttributes(ToManyRelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id);
  }

  @override
  List<Relationship> readRelationshipsWithAttributes(RelationshipType relationshipType) {
    return listRelationshipsWithAttributes(relationshipType.id);
  }
}

abstract interface class WriteAttributes {
  MutableMap<ObjectId, MutableAttribute> get attributes;

  void setText(TextAttributeType attributeType, String? value);

  void setContent(ContentAttributeType attributeType, ContentPointer? value);

  void setCategory(CategoryAttributeType attributeType, ObjectId? value);

  void setObject(ObjectAttributeType attributeType, ObjectId? value);

  void setReference(ReferenceAttributeType attributeType, String? value);

  void setCategoryConditional(CategoryAttributeType attributeType, ObjectId category, bool value);

  void setObjectList(ObjectListAttributeType attributeType, List<ObjectId>? value);
}

abstract interface class WriteRelationships {
  MutableMap<ObjectId, MutablePerTypeRelationships> get perTypeRelationships;

  void setToMany(ToManyRelationshipType relationshipType, Iterable<ObjectId>? value);
  void setToManyConditional(
    ToManyRelationshipType relationshipType,
    Iterable<ObjectId>? value,
    bool condition,
  );

  void setToOne(ToOneRelationshipType relationshipType, ObjectId? value);

  void setToOneConditional(ToOneRelationshipType relationshipType, ObjectId value, bool condition);
  void setRelationships(RelationshipType relationshipType, Iterable<ObjectId>? value);

  void setToManyWithAttributes(ToManyRelationshipType relationshipType, Iterable<MutableRelationship>? value);

  void setToOneWithAttributes(ToOneRelationshipType relationshipType, MutableRelationship? value);

  void setRelationshipsWithAttributes(
    RelationshipType relationshipType,
    Iterable<MutableRelationship>? value,
  );
}

@Freezed(toJson: false, fromJson: false)
abstract class ObjectId with _$ObjectId {
  const ObjectId._();
  static ObjectId generate({String? debugName}) => ObjectId(
    Flags.isDebug && debugName != null ? "$debugName ${UuidService.generate()}" : UuidService.generate(),
  );

  const factory ObjectId(String value) = _ObjectId;

  factory ObjectId.fromJson(String json) => ObjectId(json);
  String toJson() => value;

  ToolId asToolId() => ToolId(value);

  @override
  toString() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class ToolId with _$ToolId {
  const ToolId._();
  ObjectId asObjectId() => ObjectId(value);

  const factory ToolId(String value) = _ToolId;

  factory ToolId.fromJson(String json) => ToolId(json);
  String toJson() => value;
}

class ImmutableObjectIdKeyMapConverter<V>
    implements JsonConverter<ImmutableMap<ObjectId, V>, Map<String, V>> {
  const ImmutableObjectIdKeyMapConverter();

  @override
  ImmutableMap<ObjectId, V> fromJson(Map<String, V> json) =>
      ImmutableMap.of(json.map((k, v) => MapEntry(ObjectId(k), v)));

  @override
  Map<String, V> toJson(ImmutableMap<ObjectId, V> object) => object.map((k, v) => MapEntry(k.value, v));
}

extension IterableImmutableWebObjectExtensions on Iterable<ImmutableWebObject> {
  Iterable<MutableWebObject> toMutable() => map((x) => x.toMutable());
}

extension IterableMutableWebObjectExtensions on Iterable<MutableWebObject> {
  Iterable<ImmutableWebObject> toImmutable() => map((x) => x.toImmutable());
}

class _AttributesMapConverter extends ImmutableObjectIdKeyMapConverter<ImmutableAttribute> {
  const _AttributesMapConverter();
}

class _PerTypeRelationshipsMapConverter
    extends ImmutableObjectIdKeyMapConverter<ImmutablePerTypeRelationships> {
  const _PerTypeRelationshipsMapConverter();
}

extension PerTypeRelationshipsExtension on PerTypeRelationships {
  bool get isChanged => addedToObjects.isNotEmpty || removedRelationships.isNotEmpty;
}
