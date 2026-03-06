import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/add_relationship_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/remove_relationship_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/set_attribute_operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations.dart';
import 'package:relathy_shared/domain_layer/core_module/data/content.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';

part 'object_changes.g.dart';

abstract interface class ObjectChanges {
  ObjectId get objectId;

  ReadOnlyMap<ContentId, ImmutableContentData> get contentMap;

  ReadOnlyMap<ObjectId, AttributeChanges> get attributeChangesMap;

  ReadOnlyMap<ObjectId, RelationshipsChanges> get relationshipsChangesMap;
}

abstract interface class AttributeChanges {
  SetAttributeOperation? get setAttribute;
}

abstract interface class RelationshipsChanges {
  ReadOnlyList<AddRelationshipOperation> get addRelationships;

  ReadOnlyList<RemoveRelationshipOperation> get removeRelationships;
}

class ObjectChangesList extends DelegatingList<ImmutableObjectChanges> {
  ObjectChangesList({List<ImmutableObjectChanges>? values}) : super(values ?? []);
}

@immutable
class AttributeOperation extends Operation {
  final ObjectId attributeTypeId;

  AttributeOperation({required this.attributeTypeId, required super.operationId, required super.objectId});
}

@immutable
class RelationshipOperation extends Operation {
  final ObjectId relationshipTypeId;

  RelationshipOperation({required this.relationshipTypeId, super.operationId, required super.objectId});
}

@JsonSerializable()
class ImmutableAttributeChanges implements AttributeChanges {
  @override
  final SetAttributeOperation? setAttribute;

  ImmutableAttributeChanges({required this.setAttribute});

  factory ImmutableAttributeChanges.fromJson(Map<String, dynamic> json) =>
      _$ImmutableAttributeChangesFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableAttributeChangesToJson(this);

  MutableAttributeChanges toMutable() => MutableAttributeChanges(setAttribute: setAttribute);
}

@JsonSerializable()
class ImmutableRelationshipsChanges implements RelationshipsChanges {
  @override
  @ImmutableListConverter<AddRelationshipOperation>()
  final ImmutableList<AddRelationshipOperation> addRelationships;

  @override
  @ImmutableListConverter<RemoveRelationshipOperation>()
  final ImmutableList<RemoveRelationshipOperation> removeRelationships;

  ImmutableRelationshipsChanges({required this.addRelationships, required this.removeRelationships});

  factory ImmutableRelationshipsChanges.fromJson(Map<String, dynamic> json) =>
      _$ImmutableRelationshipsChangesFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRelationshipsChangesToJson(this);

  MutableRelationshipsChanges toMutable() => MutableRelationshipsChanges(
    addRelationships: addRelationships.toPlainList(),
    removeRelationships: removeRelationships.toPlainList(),
  );
}

@JsonSerializable()
class ImmutableObjectChanges implements ObjectChanges {
  @override
  final ObjectId objectId;

  @override
  @_ContentMapConverter()
  final ImmutableMap<ContentId, ImmutableContentData> contentMap;

  @override
  @_AttributeChangesMapConverter()
  final ImmutableMap<ObjectId, ImmutableAttributeChanges> attributeChangesMap;

  @override
  @_RelationshipsChangesMapConverter()
  final ImmutableMap<ObjectId, ImmutableRelationshipsChanges> relationshipsChangesMap;

  ImmutableObjectChanges({
    required this.objectId,
    required this.contentMap,
    required this.attributeChangesMap,
    required this.relationshipsChangesMap,
  });

  factory ImmutableObjectChanges.fromJson(Map<String, dynamic> json) =>
      _$ImmutableObjectChangesFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableObjectChangesToJson(this);

  MutableObjectChanges toMutable() => MutableObjectChanges(
    objectId: objectId,
    attributeChangesMap: attributeChangesMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    relationshipsChangesMap: relationshipsChangesMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    contentMap: contentMap.mapToPlainMap((k, v) => MapEntry(k, v)),
  );
}

class MutableAttributeChanges implements AttributeChanges {
  final Observable<SetAttributeOperation?> _setAttributeObs;

  MutableAttributeChanges({SetAttributeOperation? setAttribute})
    : _setAttributeObs = Observable(setAttribute);

  @override
  SetAttributeOperation? get setAttribute => _setAttributeObs.value;
  set setAttribute(SetAttributeOperation? value) => _setAttributeObs.value = value;

  ImmutableAttributeChanges toImmutable() => ImmutableAttributeChanges(setAttribute: setAttribute);
}

class MutableRelationshipsChanges implements RelationshipsChanges {
  @override
  final MutableList<AddRelationshipOperation> addRelationships;
  @override
  final MutableList<RemoveRelationshipOperation> removeRelationships;

  MutableRelationshipsChanges({
    List<AddRelationshipOperation>? addRelationships,
    List<RemoveRelationshipOperation>? removeRelationships,
  }) : addRelationships = ArgsHelper.toMutableList(addRelationships),
       removeRelationships = ArgsHelper.toMutableList(removeRelationships);

  ImmutableRelationshipsChanges toImmutable() => ImmutableRelationshipsChanges(
    addRelationships: addRelationships.toImmutableList(),
    removeRelationships: removeRelationships.toImmutableList(),
  );
}

class MutableObjectChanges implements ObjectChanges {
  @override
  final ObjectId objectId;
  @override
  final MutableMap<ContentId, ImmutableContentData> contentMap;
  @override
  final MutableMap<ObjectId, MutableAttributeChanges> attributeChangesMap;
  @override
  final MutableMap<ObjectId, MutableRelationshipsChanges> relationshipsChangesMap;

  MutableObjectChanges({
    required this.objectId,
    Map<ContentId, ImmutableContentData>? contentMap,
    Map<ObjectId, MutableAttributeChanges>? attributeChangesMap,
    Map<ObjectId, MutableRelationshipsChanges>? relationshipsChangesMap,
  }) : attributeChangesMap = ArgsHelper.toMutableMap(attributeChangesMap),
       relationshipsChangesMap = ArgsHelper.toMutableMap(relationshipsChangesMap),
       contentMap = ArgsHelper.toMutableMap(contentMap);

  ImmutableObjectChanges toImmutable() => ImmutableObjectChanges(
    objectId: objectId,
    attributeChangesMap: ImmutableMap.of(attributeChangesMap.map((k, v) => MapEntry(k, v.toImmutable()))),
    relationshipsChangesMap: ImmutableMap.of(
      relationshipsChangesMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
    contentMap: ImmutableMap.of(contentMap.map((k, v) => MapEntry(k, v))),
  );

  bool hasChanges() {
    for (final x in attributeChangesMap.values) {
      if (x.setAttribute != null) return true;
    }
    for (final x in relationshipsChangesMap.values) {
      if (x.addRelationships.isNotEmpty || x.removeRelationships.isNotEmpty) return true;
    }
    return false;
  }

  MutableAttributeChanges getAttributeChanges(ObjectId attributeTypeId) {
    var attributeChanges = attributeChangesMap[attributeTypeId];
    if (attributeChanges == null) {
      attributeChanges = MutableAttributeChanges();
      attributeChangesMap[attributeTypeId] = attributeChanges;
    }
    return attributeChanges;
  }

  MutableRelationshipsChanges getRelationshipsChanges(ObjectId relationshipTypeId) {
    var relationshipsChanges = relationshipsChangesMap[relationshipTypeId];
    if (relationshipsChanges == null) {
      relationshipsChanges = MutableRelationshipsChanges();
      relationshipsChangesMap[relationshipTypeId] = relationshipsChanges;
    }
    return relationshipsChanges;
  }
}

class _ContentMapConverter extends ImmutableContentIdKeyMapConverter<ImmutableContentData> {
  const _ContentMapConverter();
}

class _AttributeChangesMapConverter extends ImmutableObjectIdKeyMapConverter<ImmutableAttributeChanges> {
  const _AttributeChangesMapConverter();
}

class _RelationshipsChangesMapConverter
    extends ImmutableObjectIdKeyMapConverter<ImmutableRelationshipsChanges> {
  const _RelationshipsChangesMapConverter();
}
