import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'operation.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class OperationId with _$OperationId {
  const OperationId._();
  static OperationId generate() => OperationId(UuidService.generate());

  const factory OperationId(String value) = _OperationId;

  factory OperationId.fromJson(String json) => OperationId(json);
  String toJson() => value;
}

class ImmutableOperationIdKeyMapConverter<V>
    implements JsonConverter<ImmutableMap<OperationId, V>, Map<String, V>> {
  const ImmutableOperationIdKeyMapConverter();

  @override
  ImmutableMap<OperationId, V> fromJson(Map<String, V> json) =>
      ImmutableMap.of(json.map((k, v) => MapEntry(OperationId(k), v)));

  @override
  Map<String, V> toJson(ImmutableMap<OperationId, V> object) => object.map((k, v) => MapEntry(k.value, v));
}

@immutable
class Operation {
  final ObjectId objectId;
  final OperationId operationId;

  Operation({OperationId? operationId, required this.objectId})
    : operationId = operationId ?? OperationId.generate();
}
