//
// import 'package:relathy_shared/domain_layer/objects_module/operations/shared.dart';

// part '../change_set_attribute_operation.g.dart';

// @JsonSerializable()
// @immutable
// class AddSetValueOperation {
//   final String id;
//   final Object? before;
//   final Object value;

//   AddSetValueOperation({required this.id, this.before, required this.value});

//   Map<String, dynamic> toJson() => _$AddSetItemToJson(this);

//   factory AddSetValueOperation.fromJson(Map<String, dynamic> json) => _$AddSetItemFromJson(json);
// }

// @JsonSerializable()
// @immutable
// class RemoveSetValueOperation {
//   final String id;

//   RemoveSetValueOperation({required this.id});

//   Map<String, dynamic> toJson() => _$RemoveSetItemToJson(this);

//   factory RemoveSetValueOperation.fromJson(Map<String, dynamic> json) => _$RemoveSetItemFromJson(json);
// }

// @JsonSerializable()
// @immutable
// class ChangeSetAttributeOperation extends Operation {
//   final String objectId;
//   final String attributeType;
//   final List<AddSetValueOperation>? addSetItems;
//   final List<RemoveSetValueOperation>? removeSetItems;

//   ChangeSetAttributeOperation(
//     super.operationId, {
//     required this.objectId,
//     required this.attributeType,
//     required this.addSetItems,
//     required this.removeSetItems,
//   });

//   Map<String, dynamic> toJson() => _$ChangeSetAttributeOperationToJson(this);

//   factory ChangeSetAttributeOperation.fromJson(Map<String, dynamic> json) =>
//       _$ChangeSetAttributeOperationFromJson(json);
// }
