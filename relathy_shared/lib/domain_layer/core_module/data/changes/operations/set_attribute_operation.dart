import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/object_changes.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
part 'set_attribute_operation.g.dart';

@JsonSerializable()
@immutable
class SetAttributeOperation extends AttributeOperation {
  final Object? oldRawValue;
  final Object? newRawValue;

  SetAttributeOperation({
    required super.operationId,
    required super.objectId,
    required super.attributeTypeId,
    required this.oldRawValue,
    required this.newRawValue,
  });

  Map<String, dynamic> toJson() => _$SetAttributeOperationToJson(this);

  factory SetAttributeOperation.fromJson(Map<String, dynamic> json) => _$SetAttributeOperationFromJson(json);
}
