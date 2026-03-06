//
// import 'package:relathy_shared/domain_layer/objects_module/operations/shared.dart';

// part '../change_relationships_operation.g.dart';

// @JsonSerializable()
// @immutable
// class AddRelationship {
//   final String id;
//   final String? before;

//   AddRelationship({required this.id, this.before});

//   Map<String, dynamic> toJson() => _$AddRelationshipToJson(this);

//   factory AddRelationship.fromJson(Map<String, dynamic> json) => _$AddRelationshipFromJson(json);
// }

// @JsonSerializable()
// @immutable
// class RemoveRelationship {
//   final String id;

//   RemoveRelationship({required this.id});

//   Map<String, dynamic> toJson() => _$RemoveRelationshipToJson(this);

//   factory RemoveRelationship.fromJson(Map<String, dynamic> json) => _$RemoveRelationshipFromJson(json);
// }

// @JsonSerializable()
// @immutable
// class ChangeRelationshipsOperation extends Operation {
//   final String objectId;
//   final String relationshipType;
//   final List<AddRelationship>? addRelationships;
//   final List<RemoveRelationship>? removeRelationships;

//   ChangeRelationshipsOperation(
//     super.operationId, {
//     required this.objectId,
//     required this.relationshipType,
//     required this.addRelationships,
//     required this.removeRelationships,
//   });

//   Map<String, dynamic> toJson() => _$ChangeRelationshipsOperationToJson(this);

//   factory ChangeRelationshipsOperation.fromJson(Map<String, dynamic> json) =>
//       _$ChangeRelationshipsOperationFromJson(json);
// }
