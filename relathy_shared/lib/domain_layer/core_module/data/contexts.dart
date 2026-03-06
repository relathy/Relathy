import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/domain_layer/core_module/models/object_model.dart';
import 'package:relathy_shared/domain_layer/core_module/models/webverse_model.dart';

part 'contexts.g.dart';

@JsonSerializable()
@immutable
class ActorContext {
  static final webverseSystem = ActorContext(
    actorId: ObjectActorIds.system,
    toolId: WebverseToolIds.webverse,
  );

  final ObjectId actorId;
  final ToolId toolId;
  const ActorContext({required this.actorId, required this.toolId});
  const ActorContext.webverseCitizen({required this.actorId}) : toolId = WebverseToolIds.webverse;
  const ActorContext.system({required this.toolId}) : actorId = ObjectActorIds.system;
  factory ActorContext.fromJson(Map<String, dynamic> json) => _$ActorContextFromJson(json);

  Map<String, dynamic> toJson() => _$ActorContextToJson(this);
}
