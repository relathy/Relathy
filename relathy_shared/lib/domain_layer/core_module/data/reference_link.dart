import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relathy_shared/domain_layer/core_module/data/object.dart';

part 'reference_link.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ReferenceLink with _$ReferenceLink {
  const ReferenceLink._();

  const factory ReferenceLink(Uri uri) = _ReferenceLink;

  factory ReferenceLink.fromRawValue(Object value) => ReferenceLink.fromString(value as String);

  Object toRawValue() => toJson();

  factory ReferenceLink.fromString(String input) {
    final uri = Uri.tryParse(input.trim());
    if (uri == null) {
      throw ArgumentError('Invalid URI: $input');
    }
    return ReferenceLink(uri);
  }
  @override
  String toString() => uri.toString();

  factory ReferenceLink.fromJson(String json) => ReferenceLink.fromString(json);

  String toJson() => toString();

  ReferenceLinkInfo toInfo() {
    if (uri.host != 'webverse.link') {
      return ReferenceLinkInfo.plainReferenceLinkInfo(this, referenceUrl: uri.host + uri.path);
    }

    final segments = uri.pathSegments;
    if (segments.length < 2) {
      return ReferenceLinkInfo.plainReferenceLinkInfo(this, referenceUrl: uri.host + uri.path);
    }

    return ReferenceLinkInfo.objectReferenceLinkInfo(
      this,
      toolId: ToolId(segments[0]),
      objectId: ObjectId(segments[1]),
    );
  }
}

@freezed
sealed class ReferenceLinkInfo with _$ReferenceLinkInfo {
  const factory ReferenceLinkInfo.plainReferenceLinkInfo(ReferenceLink link, {required String referenceUrl}) =
      PlainReferenceLinkInfo;
  const factory ReferenceLinkInfo.objectReferenceLinkInfo(
    ReferenceLink link, {
    required ObjectId objectId,
    required ToolId toolId,
  }) = ObjectReferenceLinkInfo;
}
