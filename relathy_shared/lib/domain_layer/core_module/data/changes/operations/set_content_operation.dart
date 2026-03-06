import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/object_changes.dart';
import 'package:relathy_shared/domain_layer/core_module/data/content.dart';
import 'package:relathy_shared/domain_layer/core_module/data/changes/operations/operation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
part 'set_content_operation.g.dart';

@JsonSerializable()
@immutable
class SetContentOperation extends AttributeOperation {
  final String contentId;
  final ImmutableContentData? oldValue;
  final ImmutableContentData? newValue;

  SetContentOperation({
    required super.operationId,
    required super.objectId,
    required super.attributeTypeId,
    required this.contentId,
    required this.oldValue,
    required this.newValue,
  });

  Map<String, dynamic> toJson() => _$SetContentOperationToJson(this);

  factory SetContentOperation.fromJson(Map<String, dynamic> json) => _$SetContentOperationFromJson(json);
}
