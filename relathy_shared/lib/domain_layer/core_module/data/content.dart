import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'content.g.dart';
part 'content.freezed.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ContentPointer {
  final DateTime dateTime;
  final ContentId contentId;

  ContentPointer({required this.dateTime, required this.contentId});

  factory ContentPointer.fromRawValue(Object value) => ContentPointer.fromJson(value as Map<String, dynamic>);

  Object toRawValue() => toJson();

  factory ContentPointer.fromJson(Map<String, dynamic> json) => _$ContentPointerFromJson(json);

  Map<String, dynamic> toJson() => _$ContentPointerToJson(this);

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String toFriendlyString() {
    String formatted =
        '${dateTime.year}-'
        '${_twoDigits(dateTime.month)}-'
        '${_twoDigits(dateTime.day)} '
        '${_twoDigits(dateTime.hour)}:'
        '${_twoDigits(dateTime.minute)}:'
        '${_twoDigits(dateTime.second)}';

    return formatted;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContentPointer && other.dateTime == dateTime && other.contentId == contentId;
  }

  @override
  int get hashCode => dateTime.hashCode ^ contentId.hashCode;
}

@Immutable()
@JsonSerializable()
class ImmutableContentData {
  @ImmutableStringObjectMapConverter()
  final ImmutableMap<String, Object> data;

  const ImmutableContentData(this.data);

  factory ImmutableContentData.fromJson(Map<String, dynamic> json) => _$ImmutableContentDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableContentDataToJson(this);

  MutableContentData toMutable() =>
      MutableContentData(EditorState(document: Document.fromJson(data.toMap())));
}

@Immutable()
@JsonSerializable()
class ImmutableContent {
  final ObjectId objectId;
  final ContentId contentId;
  final ImmutableContentData? data;

  const ImmutableContent({required this.objectId, required this.contentId, required this.data});

  factory ImmutableContent.fromJson(Map<String, dynamic> json) => _$ImmutableContentFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableContentToJson(this);

  MutableContent toMutable() => MutableContent(
    contentId: contentId,
    data: data?.toMutable() ?? MutableContentData.empty(),
    objectId: objectId,
  );
}

class MutableContent {
  final ContentId contentId;
  final ObjectId objectId;
  final MutableContentData data;

  MutableContent({required this.objectId, required this.contentId, required this.data});

  ImmutableContent toImmutable() =>
      ImmutableContent(contentId: contentId, data: data.toImmutable(), objectId: objectId);
}

class MutableContentData {
  final EditorState editorState;
  MutableContentData.empty() : this(EditorState.blank());
  MutableContentData(this.editorState);

  ImmutableContentData toImmutable() => ImmutableContentData(ImmutableMap.of(editorState.document.toJson()));
}

@Freezed(toJson: false, fromJson: false)
abstract class ContentId with _$ContentId {
  const ContentId._();
  static ContentId generate() => ContentId(UuidService.generate());

  const factory ContentId(String value) = _ContentId;

  factory ContentId.fromJson(String json) => ContentId(json);
  String toJson() => value;
}

class ImmutableContentIdKeyMapConverter<V>
    implements JsonConverter<ImmutableMap<ContentId, V>, Map<String, V>> {
  const ImmutableContentIdKeyMapConverter();

  @override
  ImmutableMap<ContentId, V> fromJson(Map<String, V> json) =>
      ImmutableMap.of(json.map((k, v) => MapEntry(ContentId(k), v)));

  @override
  Map<String, V> toJson(ImmutableMap<ContentId, V> object) => object.map((k, v) => MapEntry(k.value, v));
}
