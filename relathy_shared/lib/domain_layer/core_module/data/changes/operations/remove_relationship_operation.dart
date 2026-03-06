import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/object_changes.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/operation.dart';
part 'remove_relationship_operation.g.dart';

@JsonSerializable()
@immutable
class RemoveRelationshipOperation extends RelationshipOperation {
  final ObjectId toObjectId;
  final bool deletingObject;

  RemoveRelationshipOperation({
    required super.operationId,
    required super.objectId,
    required super.relationshipTypeId,
    required this.toObjectId,
    required this.deletingObject,
  });

  Map<String, dynamic> toJson() => _$RemoveRelationshipOperationToJson(this);

  factory RemoveRelationshipOperation.fromJson(Map<String, dynamic> json) =>
      _$RemoveRelationshipOperationFromJson(json);
}
