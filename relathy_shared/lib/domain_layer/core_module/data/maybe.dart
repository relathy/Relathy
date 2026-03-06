import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_shared/domain_layer/core_module/data/content.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';
part 'maybe.g.dart';
part 'maybe.freezed.dart';

abstract interface class Maybe {
  MaybeId get id;
  Object get data;
}

extension MaybeExtension on Maybe {
  ContentPointer getContentData() {
    return ContentPointer.fromJson(data as Map<String, dynamic>);
  }
}

@immutable
@JsonSerializable()
class ImmutableMaybe implements Maybe {
  @override
  final MaybeId id;
  @override
  final Object data;

  const ImmutableMaybe({required this.id, required this.data});

  factory ImmutableMaybe.fromJson(Map<String, dynamic> json) => _$ImmutableMaybeFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableMaybeToJson(this);

  MutableMaybe toMutable() {
    return MutableMaybe(id, data: data);
  }
}

@JsonSerializable()
class MutableMaybe implements Maybe {
  final Observable<Object> _dataObs;
  @override
  final MaybeId id;
  @override
  Object get data => _dataObs.value;
  set data(Object value) => _dataObs.value = value;

  MutableMaybe(this.id, {required Object data}) : _dataObs = Observable(data);

  factory MutableMaybe.fromJson(Map<String, dynamic> json) => _$MutableMaybeFromJson(json);

  Map<String, dynamic> toJson() => _$MutableMaybeToJson(this);

  ImmutableMaybe toImmutable() {
    return ImmutableMaybe(id: id, data: data);
  }
}

@Freezed(toJson: false, fromJson: false)
abstract class MaybeId with _$MaybeId {
  const MaybeId._();
  static MaybeId generate() => MaybeId(UuidService.generate());

  const factory MaybeId(String value) = _MaybeId;

  factory MaybeId.fromJson(String json) => MaybeId(json);
  String toJson() => value;
}

class ImmutableMaybeIdKeyMapConverter<V> implements JsonConverter<ImmutableMap<MaybeId, V>, Map<String, V>> {
  const ImmutableMaybeIdKeyMapConverter();

  @override
  ImmutableMap<MaybeId, V> fromJson(Map<String, V> json) =>
      ImmutableMap.of(json.map((k, v) => MapEntry(MaybeId(k), v)));

  @override
  Map<String, V> toJson(ImmutableMap<MaybeId, V> object) => object.map((k, v) => MapEntry(k.value, v));
}
