import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/object_changes.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/operation.dart';
part 'add_relationship_operation.g.dart';

@JsonSerializable()
@immutable
class AddRelationshipOperation extends RelationshipOperation {
  final ObjectId toObjectId;
  final bool creatingObject;

  AddRelationshipOperation({
    super.operationId,
    required super.objectId,
    required super.relationshipTypeId,
    required this.toObjectId,
    this.creatingObject = false,
  });

  Map<String, dynamic> toJson() => _$AddRelationshipOperationToJson(this);

  factory AddRelationshipOperation.fromJson(Map<String, dynamic> json) =>
      _$AddRelationshipOperationFromJson(json);
}
