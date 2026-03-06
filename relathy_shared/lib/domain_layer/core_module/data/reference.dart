// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:relathy_shared/generic_layer/collection/mutation.dart';
// part 'reference.g.dart';

// /*
//   [](webverse.link/c930ccc8-aef9-4624-95aa-8a6acee5add0/1005187d-0529-49e7-96c0-5d21f5f7d382)
// */

// abstract interface class InternalObjectReference {
//   String get toolId;
//   String get fromObjectId;
//   String get toObjectId;
//   ReadOnlyList<SourceProperty> get sourceProperties;
// }

// abstract interface class ExternalLinkReference {
//   String get toolId;
//   String get objectId;
//   String get url;
//   ReadOnlyList<SourceProperty> get sourceProperties;
// }

// abstract interface class ToExternalObjectReference {
//   String get toolId;
//   String get objectId;
//   String get toExternalObjectId;
//   String get toExternalToolId;
//   ReadOnlyList<SourceProperty> get sourceProperties;
// }

// abstract interface class FromExternalObjectReference {
//   String get toolId;
//   String get objectId;
//   String get fromExternalObjectId;
//   String get fromExternalToolId;
//   ReadOnlyList<SourceProperty> get sourceProperties;
// }

// abstract interface class ExternalObject {
//   String get toolId;
//   String get externalObjectId;
//   String get externalToolId;
//   ExternalObjectSnapshot? get snapshot;
// }

// abstract interface class ExternalLink {
//   String get url;
//   ExternalLinkSnapshot? get snapshot;
// }

// @immutable
// class ExternalLinkSnapshot {
//   final bool notFound;
//   final String? redirectedUrl;
//   final String? title;
//   final String? metaDescription;

//   ExternalLinkSnapshot({this.notFound = false, this.redirectedUrl, this.title, this.metaDescription});
// }

// @immutable
// class ExternalObjectSnapshot {
//   final bool notFound;
//   final String? redirectedUrl;
//   final String? objectDisplayName;
//   final String? classesDisplayName;
//   final DateTime? displayLastChangedAt;
//   final String? objectDisplayVersion;

//   ExternalObjectSnapshot({
//     this.notFound = false,
//     this.redirectedUrl,
//     this.objectDisplayName,
//     this.classesDisplayName,
//     this.displayLastChangedAt,
//     this.objectDisplayVersion,
//   });
// }

// @JsonSerializable()
// @immutable
// class SourcePropertyElement {
//   @ImmutableListConverter<String>()
//   final ImmutableList<String>? section;
//   final int countWithoutContext;
//   final int countWithContext;
//   final int countOutdated;

//   const SourcePropertyElement({
//     required this.section,
//     required this.countWithoutContext,
//     required this.countWithContext,
//     required this.countOutdated,
//   });

//   factory SourcePropertyElement.fromJson(Map<String, dynamic> json) => _$SourcePropertyElementFromJson(json);

//   Map<String, dynamic> toJson() => _$SourcePropertyElementToJson(this);
// }

// @JsonSerializable()
// @immutable
// class SourceProperty {
//   final String propertyTypeId;
//   @ImmutableListConverter<SourcePropertyElement>()
//   final ImmutableList<SourcePropertyElement> elements;

//   const SourceProperty({required this.propertyTypeId, required this.elements});

//   factory SourceProperty.fromJson(Map<String, dynamic> json) => _$SourcePropertyFromJson(json);

//   Map<String, dynamic> toJson() => _$SourcePropertyToJson(this);
// }

// @JsonSerializable()
// @immutable
// class ImmutableInternalObjectReference implements InternalObjectReference {
//   @override
//   final String toolId;
//   @override
//   final String fromObjectId;
//   @override
//   final String toObjectId;
//   @override
//   @ImmutableListConverter<SourceProperty>()
//   final ImmutableList<SourceProperty> sourceProperties;

//   const ImmutableInternalObjectReference({
//     required this.toolId,
//     required this.fromObjectId,
//     required this.toObjectId,
//     required this.sourceProperties,
//   });

//   factory ImmutableInternalObjectReference.fromJson(Map<String, dynamic> json) =>
//       _$ImmutableInternalObjectReferenceFromJson(json);

//   Map<String, dynamic> toJson() => _$ImmutableInternalObjectReferenceToJson(this);

//   MutableInternalObjectReference toMutable() {
//     return MutableInternalObjectReference(toolId, fromObjectId, toObjectId, sourceProperties);
//   }
// }

// class MutableInternalObjectReference implements InternalObjectReference {
//   @override
//   String toolId;
//   @override
//   String fromObjectId;
//   @override
//   String toObjectId;
//   @override
//   final MutableList<SourceProperty> sourceProperties;

//   MutableInternalObjectReference(
//     this.toolId,
//     this.fromObjectId,
//     this.toObjectId,
//     Iterable<SourceProperty>? sourceProperties,
//   ) : sourceProperties = ArgsHelper.toMutableList(sourceProperties);

//   ImmutableInternalObjectReference toImmutable() {
//     return ImmutableInternalObjectReference(
//       toolId: toolId,
//       fromObjectId: fromObjectId,
//       toObjectId: toObjectId,
//       sourceProperties: sourceProperties.toImmutableList(),
//     );
//   }
// }

// @JsonSerializable()
// @immutable
// class ImmutableToExternalObjectReference implements ToExternalObjectReference {
//   @override
//   final String toolId;
//   @override
//   final String objectId;
//   @override
//   final String toExternalObjectId;
//   @override
//   final String toExternalToolId;
//   @override
//   @ImmutableListConverter<SourceProperty>()
//   final ImmutableList<SourceProperty> sourceProperties;

//   const ImmutableToExternalObjectReference({
//     required this.toolId,
//     required this.objectId,
//     required this.toExternalObjectId,
//     required this.toExternalToolId,
//     required this.sourceProperties,
//   });

//   factory ImmutableToExternalObjectReference.fromJson(Map<String, dynamic> json) =>
//       _$ImmutableToExternalObjectReferenceFromJson(json);

//   Map<String, dynamic> toJson() => _$ImmutableToExternalObjectReferenceToJson(this);

//   MutableToExternalObjectReference toMutable() {
//     return MutableToExternalObjectReference(
//       toolId,
//       objectId,
//       toExternalObjectId,
//       toExternalToolId,
//       sourceProperties,
//     );
//   }
// }

// class MutableToExternalObjectReference implements ToExternalObjectReference {
//   @override
//   String toolId;
//   @override
//   String objectId;
//   @override
//   String toExternalObjectId;
//   @override
//   String toExternalToolId;
//   @override
//   final MutableList<SourceProperty> sourceProperties;

//   MutableToExternalObjectReference(
//     this.toolId,
//     this.objectId,
//     this.toExternalObjectId,
//     this.toExternalToolId,
//     Iterable<SourceProperty>? sourceProperties,
//   ) : sourceProperties = ArgsHelper.toMutableList(sourceProperties);

//   ImmutableToExternalObjectReference toImmutable() {
//     return ImmutableToExternalObjectReference(
//       toolId: toolId,
//       objectId: objectId,
//       toExternalObjectId: toExternalObjectId,
//       toExternalToolId: toExternalToolId,
//       sourceProperties: sourceProperties.toImmutableList(),
//     );
//   }
// }

// @JsonSerializable()
// @immutable
// class ImmutableFromExternalObjectReference implements FromExternalObjectReference {
//   @override
//   final String toolId;
//   @override
//   final String objectId;
//   @override
//   final String fromExternalObjectId;
//   @override
//   final String fromExternalToolId;
//   @override
//   @ImmutableListConverter<SourceProperty>()
//   final ImmutableList<SourceProperty> sourceProperties;

//   const ImmutableFromExternalObjectReference({
//     required this.toolId,
//     required this.objectId,
//     required this.fromExternalObjectId,
//     required this.fromExternalToolId,
//     required this.sourceProperties,
//   });

//   factory ImmutableFromExternalObjectReference.fromJson(Map<String, dynamic> json) =>
//       _$ImmutableFromExternalObjectReferenceFromJson(json);

//   Map<String, dynamic> toJson() => _$ImmutableFromExternalObjectReferenceToJson(this);

//   MutableFromExternalObjectReference toMutable() {
//     return MutableFromExternalObjectReference(
//       toolId,
//       objectId,
//       fromExternalObjectId,
//       fromExternalToolId,
//       sourceProperties,
//     );
//   }
// }

// class MutableFromExternalObjectReference implements FromExternalObjectReference {
//   @override
//   String toolId;
//   @override
//   String objectId;
//   @override
//   String fromExternalObjectId;
//   @override
//   String fromExternalToolId;
//   @override
//   final MutableList<SourceProperty> sourceProperties;

//   MutableFromExternalObjectReference(
//     this.toolId,
//     this.objectId,
//     this.fromExternalObjectId,
//     this.fromExternalToolId,
//     Iterable<SourceProperty>? sourceProperties,
//   ) : sourceProperties = ArgsHelper.toMutableList(sourceProperties);

//   ImmutableFromExternalObjectReference toImmutable() {
//     return ImmutableFromExternalObjectReference(
//       toolId: toolId,
//       objectId: objectId,
//       fromExternalObjectId: fromExternalObjectId,
//       fromExternalToolId: fromExternalToolId,
//       sourceProperties: sourceProperties.toImmutableList(),
//     );
//   }
// }

// @JsonSerializable()
// @immutable
// class ImmutableExternalLinkReference implements ExternalLinkReference {
//   @override
//   final String toolId;
//   @override
//   final String objectId;
//   @override
//   final String url;
//   @override
//   @ImmutableListConverter<SourceProperty>()
//   final ImmutableList<SourceProperty> sourceProperties;

//   const ImmutableExternalLinkReference({
//     required this.toolId,
//     required this.objectId,
//     required this.url,
//     required this.sourceProperties,
//   });

//   factory ImmutableExternalLinkReference.fromJson(Map<String, dynamic> json) =>
//       _$ImmutableExternalLinkReferenceFromJson(json);

//   Map<String, dynamic> toJson() => _$ImmutableExternalLinkReferenceToJson(this);

//   MutableExternalLinkReference toMutable() {
//     return MutableExternalLinkReference(toolId, objectId, url, sourceProperties);
//   }
// }

// class MutableExternalLinkReference implements ExternalLinkReference {
//   @override
//   String toolId;
//   @override
//   String objectId;
//   @override
//   String url;
//   @override
//   final MutableList<SourceProperty> sourceProperties;

//   MutableExternalLinkReference(
//     this.toolId,
//     this.objectId,
//     this.url,
//     Iterable<SourceProperty>? sourceProperties,
//   ) : sourceProperties = ArgsHelper.toMutableList(sourceProperties);

//   ImmutableExternalLinkReference toImmutable() {
//     return ImmutableExternalLinkReference(
//       toolId: toolId,
//       objectId: objectId,
//       url: url,
//       sourceProperties: sourceProperties.toImmutableList(),
//     );
//   }
// }
