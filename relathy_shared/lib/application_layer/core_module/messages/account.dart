import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:relathy_shared/domain_layer/core_module/data/contexts.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
part 'account.g.dart';

@JsonSerializable()
@immutable
class CreateAccount extends CommandWithContext<ObjectId, ActorContext> {
  final String email;

  CreateAccount({required this.email, required super.context});

  factory CreateAccount.fromJson(Map<String, dynamic> json) => _$CreateAccountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateAccountToJson(this);

  @override
  acceptVisitor(RequestVisitor visitor) => visitor.visit(this);
}
