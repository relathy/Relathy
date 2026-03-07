import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';

part 'data.freezed.dart';
part 'data.g.dart';

enum RelationshipKind { self, pair, group }

enum RelationshipStatus { pending, active, archived }

enum MembershipStatus { pending, accepted, declined, left, removed }

enum MemberRole { owner, member }

enum AgreementStatus { proposed, active, archived }

enum AgreementDecisionStatus { pending, agreed, disagreed, discussMore }

enum RequestStatus { open, inDiscussion, accepted, declined, completed, cancelled }

enum RequestPriority { low, normal, high, urgent }

abstract interface class RelathyData {
  UserId get currentUserId;

  ReadOnlyMap<UserId, UserData> get userMap;

  ReadOnlyMap<RelationshipId, RelationshipData> get relationshipMap;
}

abstract interface class UserData {
  UserId get userId;

  String get displayName;

  String? get avatarUrl;

  DateTime get createdAt;

  DateTime get updatedAt;
}

abstract interface class RelationshipData {
  RelationshipId get relationshipId;

  RelationshipKind get kind;

  RelationshipStatus get status;

  String? get title;

  String? get description;

  UserId get createdByUserId;

  DateTime get createdAt;

  DateTime get updatedAt;

  ReadOnlyMap<MemberId, RelationshipMemberData> get memberMap;

  ReadOnlyMap<AgreementId, AgreementData> get agreementMap;

  ReadOnlyMap<RequestId, RequestData> get requestMap;
}

abstract interface class RelationshipMemberData {
  MemberId get memberId;

  UserId get userId;

  MembershipStatus get status;

  MemberRole get role;

  UserId? get invitedByUserId;

  DateTime get invitedAt;

  DateTime? get respondedAt;

  DateTime? get joinedAt;

  ReadOnlyMap<EssentialId, EssentialData> get essentialMap;

  ReadOnlyMap<PreferenceId, PreferenceData> get preferenceMap;
}

abstract interface class EssentialData {
  EssentialId get essentialId;

  EssentialId? get parentEssentialId;

  String get title;

  String? get description;

  bool get isBoundary;

  int get sortOrder;

  DateTime get createdAt;

  DateTime get updatedAt;
}

abstract interface class PreferenceData {
  PreferenceId get preferenceId;

  String get title;

  String? get description;

  String? get category;

  int get sortOrder;

  DateTime get createdAt;

  DateTime get updatedAt;
}

abstract interface class AgreementData {
  AgreementId get agreementId;

  String get title;

  String? get description;

  AgreementStatus get status;

  MemberId get createdByMemberId;

  DateTime get createdAt;

  DateTime get updatedAt;

  ReadOnlyMap<MemberId, AgreementMemberDecisionData> get decisionMap;
}

abstract interface class AgreementMemberDecisionData {
  MemberId get memberId;

  AgreementDecisionStatus get decision;

  String? get note;

  DateTime? get decidedAt;
}

abstract interface class RequestData {
  RequestId get requestId;

  MemberId get createdByMemberId;

  String get title;

  String get description;

  RequestStatus get status;

  RequestPriority get priority;

  ReadOnlyList<MemberId> get targetMemberIds;

  AgreementId? get relatedAgreementId;

  EssentialId? get relatedEssentialId;

  DateTime? get dueAt;

  DateTime? get resolvedAt;

  DateTime get createdAt;

  DateTime get updatedAt;
}

@Freezed(toJson: false, fromJson: false)
abstract class UserId with _$UserId {
  const UserId._();

  static UserId generate() => UserId(UuidService.generate());

  const factory UserId(String value) = _UserId;

  factory UserId.fromJson(String json) => UserId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class RelationshipId with _$RelationshipId {
  const RelationshipId._();

  static RelationshipId generate() => RelationshipId(UuidService.generate());

  const factory RelationshipId(String value) = _RelationshipId;

  factory RelationshipId.fromJson(String json) => RelationshipId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class MemberId with _$MemberId {
  const MemberId._();

  static MemberId generate() => MemberId(UuidService.generate());

  const factory MemberId(String value) = _MemberId;

  factory MemberId.fromJson(String json) => MemberId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class EssentialId with _$EssentialId {
  const EssentialId._();

  static EssentialId generate() => EssentialId(UuidService.generate());

  const factory EssentialId(String value) = _EssentialId;

  factory EssentialId.fromJson(String json) => EssentialId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class PreferenceId with _$PreferenceId {
  const PreferenceId._();

  static PreferenceId generate() => PreferenceId(UuidService.generate());

  const factory PreferenceId(String value) = _PreferenceId;

  factory PreferenceId.fromJson(String json) => PreferenceId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class AgreementId with _$AgreementId {
  const AgreementId._();

  static AgreementId generate() => AgreementId(UuidService.generate());

  const factory AgreementId(String value) = _AgreementId;

  factory AgreementId.fromJson(String json) => AgreementId(json);
  String toJson() => value;
}

@Freezed(toJson: false, fromJson: false)
abstract class RequestId with _$RequestId {
  const RequestId._();

  static RequestId generate() => RequestId(UuidService.generate());

  const factory RequestId(String value) = _RequestId;

  factory RequestId.fromJson(String json) => RequestId(json);
  String toJson() => value;
}

@JsonSerializable(explicitToJson: true)
class ImmutableRelathyData implements RelathyData {
  @override
  final UserId currentUserId;

  @override
  @_UserMapConverter()
  final ImmutableMap<UserId, ImmutableUserData> userMap;

  @override
  @_RelationshipMapConverter()
  final ImmutableMap<RelationshipId, ImmutableRelationshipData> relationshipMap;

  ImmutableRelathyData({required this.currentUserId, required this.userMap, required this.relationshipMap});

  factory ImmutableRelathyData.fromJson(Map<String, dynamic> json) => _$ImmutableRelathyDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRelathyDataToJson(this);

  MutableRelathyData toMutable() => MutableRelathyData(
    currentUserId: currentUserId,
    userMap: userMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    relationshipMap: relationshipMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableUserData implements UserData {
  @override
  final UserId userId;

  @override
  final String displayName;

  @override
  final String? avatarUrl;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImmutableUserData({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImmutableUserData.fromJson(Map<String, dynamic> json) => _$ImmutableUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableUserDataToJson(this);

  MutableUserData toMutable() => MutableUserData(
    userId: userId,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableRelationshipData implements RelationshipData {
  @override
  final RelationshipId relationshipId;

  @override
  final RelationshipKind kind;

  @override
  final RelationshipStatus status;

  @override
  final String? title;

  @override
  final String? description;

  @override
  final UserId createdByUserId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  @override
  @_MemberMapConverter()
  final ImmutableMap<MemberId, ImmutableRelationshipMemberData> memberMap;

  @override
  @_AgreementMapConverter()
  final ImmutableMap<AgreementId, ImmutableAgreementData> agreementMap;

  @override
  @_RequestMapConverter()
  final ImmutableMap<RequestId, ImmutableRequestData> requestMap;

  ImmutableRelationshipData({
    required this.relationshipId,
    required this.kind,
    required this.status,
    required this.title,
    required this.description,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.memberMap,
    required this.agreementMap,
    required this.requestMap,
  });

  factory ImmutableRelationshipData.fromJson(Map<String, dynamic> json) =>
      _$ImmutableRelationshipDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRelationshipDataToJson(this);

  MutableRelationshipData toMutable() => MutableRelationshipData(
    relationshipId: relationshipId,
    kind: kind,
    status: status,
    title: title,
    description: description,
    createdByUserId: createdByUserId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    memberMap: memberMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    agreementMap: agreementMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    requestMap: requestMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableRelationshipMemberData implements RelationshipMemberData {
  @override
  final MemberId memberId;

  @override
  final UserId userId;

  @override
  final MembershipStatus status;

  @override
  final MemberRole role;

  @override
  final UserId? invitedByUserId;

  @override
  final DateTime invitedAt;

  @override
  final DateTime? respondedAt;

  @override
  final DateTime? joinedAt;

  @override
  @_EssentialMapConverter()
  final ImmutableMap<EssentialId, ImmutableEssentialData> essentialMap;

  @override
  @_PreferenceMapConverter()
  final ImmutableMap<PreferenceId, ImmutablePreferenceData> preferenceMap;

  ImmutableRelationshipMemberData({
    required this.memberId,
    required this.userId,
    required this.status,
    required this.role,
    required this.invitedByUserId,
    required this.invitedAt,
    required this.respondedAt,
    required this.joinedAt,
    required this.essentialMap,
    required this.preferenceMap,
  });

  factory ImmutableRelationshipMemberData.fromJson(Map<String, dynamic> json) =>
      _$ImmutableRelationshipMemberDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRelationshipMemberDataToJson(this);

  MutableRelationshipMemberData toMutable() => MutableRelationshipMemberData(
    memberId: memberId,
    userId: userId,
    status: status,
    role: role,
    invitedByUserId: invitedByUserId,
    invitedAt: invitedAt,
    respondedAt: respondedAt,
    joinedAt: joinedAt,
    essentialMap: essentialMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    preferenceMap: preferenceMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableEssentialData implements EssentialData {
  @override
  final EssentialId essentialId;

  @override
  final EssentialId? parentEssentialId;

  @override
  final String title;

  @override
  final String? description;

  @override
  final bool isBoundary;

  @override
  final int sortOrder;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImmutableEssentialData({
    required this.essentialId,
    required this.parentEssentialId,
    required this.title,
    required this.description,
    required this.isBoundary,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImmutableEssentialData.fromJson(Map<String, dynamic> json) =>
      _$ImmutableEssentialDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableEssentialDataToJson(this);

  MutableEssentialData toMutable() => MutableEssentialData(
    essentialId: essentialId,
    parentEssentialId: parentEssentialId,
    title: title,
    description: description,
    isBoundary: isBoundary,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutablePreferenceData implements PreferenceData {
  @override
  final PreferenceId preferenceId;

  @override
  final String title;

  @override
  final String? description;

  @override
  final String? category;

  @override
  final int sortOrder;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImmutablePreferenceData({
    required this.preferenceId,
    required this.title,
    required this.description,
    required this.category,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImmutablePreferenceData.fromJson(Map<String, dynamic> json) =>
      _$ImmutablePreferenceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutablePreferenceDataToJson(this);

  MutablePreferenceData toMutable() => MutablePreferenceData(
    preferenceId: preferenceId,
    title: title,
    description: description,
    category: category,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableAgreementData implements AgreementData {
  @override
  final AgreementId agreementId;

  @override
  final String title;

  @override
  final String? description;

  @override
  final AgreementStatus status;

  @override
  final MemberId createdByMemberId;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  @override
  @_AgreementMemberDecisionMapConverter()
  final ImmutableMap<MemberId, ImmutableAgreementMemberDecisionData> decisionMap;

  ImmutableAgreementData({
    required this.agreementId,
    required this.title,
    required this.description,
    required this.status,
    required this.createdByMemberId,
    required this.createdAt,
    required this.updatedAt,
    required this.decisionMap,
  });

  factory ImmutableAgreementData.fromJson(Map<String, dynamic> json) =>
      _$ImmutableAgreementDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableAgreementDataToJson(this);

  MutableAgreementData toMutable() => MutableAgreementData(
    agreementId: agreementId,
    title: title,
    description: description,
    status: status,
    createdByMemberId: createdByMemberId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    decisionMap: decisionMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableAgreementMemberDecisionData implements AgreementMemberDecisionData {
  @override
  final MemberId memberId;

  @override
  final AgreementDecisionStatus decision;

  @override
  final String? note;

  @override
  final DateTime? decidedAt;

  ImmutableAgreementMemberDecisionData({
    required this.memberId,
    required this.decision,
    required this.note,
    required this.decidedAt,
  });

  factory ImmutableAgreementMemberDecisionData.fromJson(Map<String, dynamic> json) =>
      _$ImmutableAgreementMemberDecisionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableAgreementMemberDecisionDataToJson(this);

  MutableAgreementMemberDecisionData toMutable() => MutableAgreementMemberDecisionData(
    memberId: memberId,
    decision: decision,
    note: note,
    decidedAt: decidedAt,
  );
}

@JsonSerializable(explicitToJson: true)
class ImmutableRequestData implements RequestData {
  @override
  final RequestId requestId;

  @override
  final MemberId createdByMemberId;

  @override
  final String title;

  @override
  final String description;

  @override
  final RequestStatus status;

  @override
  final RequestPriority priority;

  @override
  @_MemberIdListConverter()
  final ImmutableList<MemberId> targetMemberIds;

  @override
  final AgreementId? relatedAgreementId;

  @override
  final EssentialId? relatedEssentialId;

  @override
  final DateTime? dueAt;

  @override
  final DateTime? resolvedAt;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImmutableRequestData({
    required this.requestId,
    required this.createdByMemberId,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.targetMemberIds,
    required this.relatedAgreementId,
    required this.relatedEssentialId,
    required this.dueAt,
    required this.resolvedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImmutableRequestData.fromJson(Map<String, dynamic> json) => _$ImmutableRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImmutableRequestDataToJson(this);

  MutableRequestData toMutable() => MutableRequestData(
    requestId: requestId,
    createdByMemberId: createdByMemberId,
    title: title,
    description: description,
    status: status,
    priority: priority,
    targetMemberIds: targetMemberIds,
    relatedAgreementId: relatedAgreementId,
    relatedEssentialId: relatedEssentialId,
    dueAt: dueAt,
    resolvedAt: resolvedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

class MutableRelathyData implements RelathyData {
  @override
  final UserId currentUserId;

  @override
  final MutableMap<UserId, MutableUserData> userMap;

  @override
  final MutableMap<RelationshipId, MutableRelationshipData> relationshipMap;

  MutableRelathyData({
    required this.currentUserId,
    Map<UserId, MutableUserData>? userMap,
    Map<RelationshipId, MutableRelationshipData>? relationshipMap,
  }) : userMap = ArgsHelper.toMutableMap(userMap),
       relationshipMap = ArgsHelper.toMutableMap(relationshipMap);

  ImmutableRelathyData toImmutable() => ImmutableRelathyData(
    currentUserId: currentUserId,
    userMap: ImmutableMap.of(userMap.map((k, v) => MapEntry(k, v.toImmutable()))),
    relationshipMap: ImmutableMap.of(relationshipMap.map((k, v) => MapEntry(k, v.toImmutable()))),
  );
}

class MutableUserData implements UserData {
  @override
  final UserId userId;

  @override
  String displayName;

  @override
  String? avatarUrl;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  MutableUserData({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  ImmutableUserData toImmutable() => ImmutableUserData(
    userId: userId,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

class MutableRelationshipData implements RelationshipData {
  @override
  final RelationshipId relationshipId;

  @override
  RelationshipKind kind;

  @override
  RelationshipStatus status;

  @override
  String? title;

  @override
  String? description;

  @override
  final UserId createdByUserId;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  @override
  final MutableMap<MemberId, MutableRelationshipMemberData> memberMap;

  @override
  final MutableMap<AgreementId, MutableAgreementData> agreementMap;

  @override
  final MutableMap<RequestId, MutableRequestData> requestMap;

  MutableRelationshipData({
    required this.relationshipId,
    required this.kind,
    required this.status,
    required this.title,
    required this.description,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
    Map<MemberId, MutableRelationshipMemberData>? memberMap,
    Map<AgreementId, MutableAgreementData>? agreementMap,
    Map<RequestId, MutableRequestData>? requestMap,
  }) : memberMap = ArgsHelper.toMutableMap(memberMap),
       agreementMap = ArgsHelper.toMutableMap(agreementMap),
       requestMap = ArgsHelper.toMutableMap(requestMap);

  ImmutableRelationshipData toImmutable() => ImmutableRelationshipData(
    relationshipId: relationshipId,
    kind: kind,
    status: status,
    title: title,
    description: description,
    createdByUserId: createdByUserId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    memberMap: ImmutableMap.of(memberMap.map((k, v) => MapEntry(k, v.toImmutable()))),
    agreementMap: ImmutableMap.of(agreementMap.map((k, v) => MapEntry(k, v.toImmutable()))),
    requestMap: ImmutableMap.of(requestMap.map((k, v) => MapEntry(k, v.toImmutable()))),
  );
}

class MutableRelationshipMemberData implements RelationshipMemberData {
  @override
  final MemberId memberId;

  @override
  final UserId userId;

  @override
  MembershipStatus status;

  @override
  MemberRole role;

  @override
  UserId? invitedByUserId;

  @override
  DateTime invitedAt;

  @override
  DateTime? respondedAt;

  @override
  DateTime? joinedAt;

  @override
  final MutableMap<EssentialId, MutableEssentialData> essentialMap;

  @override
  final MutableMap<PreferenceId, MutablePreferenceData> preferenceMap;

  MutableRelationshipMemberData({
    required this.memberId,
    required this.userId,
    required this.status,
    required this.role,
    required this.invitedByUserId,
    required this.invitedAt,
    required this.respondedAt,
    required this.joinedAt,
    Map<EssentialId, MutableEssentialData>? essentialMap,
    Map<PreferenceId, MutablePreferenceData>? preferenceMap,
  }) : essentialMap = ArgsHelper.toMutableMap(essentialMap),
       preferenceMap = ArgsHelper.toMutableMap(preferenceMap);

  ImmutableRelationshipMemberData toImmutable() => ImmutableRelationshipMemberData(
    memberId: memberId,
    userId: userId,
    status: status,
    role: role,
    invitedByUserId: invitedByUserId,
    invitedAt: invitedAt,
    respondedAt: respondedAt,
    joinedAt: joinedAt,
    essentialMap: ImmutableMap.of(essentialMap.map((k, v) => MapEntry(k, v.toImmutable()))),
    preferenceMap: ImmutableMap.of(preferenceMap.map((k, v) => MapEntry(k, v.toImmutable()))),
  );
}

class MutableEssentialData implements EssentialData {
  @override
  final EssentialId essentialId;

  @override
  EssentialId? parentEssentialId;

  @override
  String title;

  @override
  String? description;

  @override
  bool isBoundary;

  @override
  int sortOrder;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  MutableEssentialData({
    required this.essentialId,
    required this.parentEssentialId,
    required this.title,
    required this.description,
    required this.isBoundary,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  ImmutableEssentialData toImmutable() => ImmutableEssentialData(
    essentialId: essentialId,
    parentEssentialId: parentEssentialId,
    title: title,
    description: description,
    isBoundary: isBoundary,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

class MutablePreferenceData implements PreferenceData {
  @override
  final PreferenceId preferenceId;

  @override
  String title;

  @override
  String? description;

  @override
  String? category;

  @override
  int sortOrder;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  MutablePreferenceData({
    required this.preferenceId,
    required this.title,
    required this.description,
    required this.category,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  ImmutablePreferenceData toImmutable() => ImmutablePreferenceData(
    preferenceId: preferenceId,
    title: title,
    description: description,
    category: category,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

class MutableAgreementData implements AgreementData {
  @override
  final AgreementId agreementId;

  @override
  String title;

  @override
  String? description;

  @override
  AgreementStatus status;

  @override
  final MemberId createdByMemberId;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  @override
  final MutableMap<MemberId, MutableAgreementMemberDecisionData> decisionMap;

  MutableAgreementData({
    required this.agreementId,
    required this.title,
    required this.description,
    required this.status,
    required this.createdByMemberId,
    required this.createdAt,
    required this.updatedAt,
    Map<MemberId, MutableAgreementMemberDecisionData>? decisionMap,
  }) : decisionMap = ArgsHelper.toMutableMap(decisionMap);

  ImmutableAgreementData toImmutable() => ImmutableAgreementData(
    agreementId: agreementId,
    title: title,
    description: description,
    status: status,
    createdByMemberId: createdByMemberId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    decisionMap: ImmutableMap.of(decisionMap.map((k, v) => MapEntry(k, v.toImmutable()))),
  );
}

class MutableAgreementMemberDecisionData implements AgreementMemberDecisionData {
  @override
  final MemberId memberId;

  @override
  AgreementDecisionStatus decision;

  @override
  String? note;

  @override
  DateTime? decidedAt;

  MutableAgreementMemberDecisionData({
    required this.memberId,
    required this.decision,
    required this.note,
    required this.decidedAt,
  });

  ImmutableAgreementMemberDecisionData toImmutable() => ImmutableAgreementMemberDecisionData(
    memberId: memberId,
    decision: decision,
    note: note,
    decidedAt: decidedAt,
  );
}

class MutableRequestData implements RequestData {
  @override
  final RequestId requestId;

  @override
  final MemberId createdByMemberId;

  @override
  String title;

  @override
  String description;

  @override
  RequestStatus status;

  @override
  RequestPriority priority;

  @override
  final MutableList<MemberId> targetMemberIds;

  @override
  AgreementId? relatedAgreementId;

  @override
  EssentialId? relatedEssentialId;

  @override
  DateTime? dueAt;

  @override
  DateTime? resolvedAt;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  MutableRequestData({
    required this.requestId,
    required this.createdByMemberId,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    Iterable<MemberId>? targetMemberIds,
    required this.relatedAgreementId,
    required this.relatedEssentialId,
    required this.dueAt,
    required this.resolvedAt,
    required this.createdAt,
    required this.updatedAt,
  }) : targetMemberIds = ArgsHelper.toMutableList(targetMemberIds);

  ImmutableRequestData toImmutable() => ImmutableRequestData(
    requestId: requestId,
    createdByMemberId: createdByMemberId,
    title: title,
    description: description,
    status: status,
    priority: priority,
    targetMemberIds: targetMemberIds.toImmutableList(),
    relatedAgreementId: relatedAgreementId,
    relatedEssentialId: relatedEssentialId,
    dueAt: dueAt,
    resolvedAt: resolvedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

class _UserMapConverter
    implements JsonConverter<ImmutableMap<UserId, ImmutableUserData>, Map<String, dynamic>> {
  const _UserMapConverter();

  @override
  ImmutableMap<UserId, ImmutableUserData> fromJson(Map<String, dynamic> json) => ImmutableMap.fromJson(
    json,
    fromJsonK: UserId.fromJson,
    fromJsonV: (value) => ImmutableUserData.fromJson(value as Map<String, dynamic>),
  );

  @override
  Map<String, dynamic> toJson(ImmutableMap<UserId, ImmutableUserData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _RelationshipMapConverter
    implements JsonConverter<ImmutableMap<RelationshipId, ImmutableRelationshipData>, Map<String, dynamic>> {
  const _RelationshipMapConverter();

  @override
  ImmutableMap<RelationshipId, ImmutableRelationshipData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: RelationshipId.fromJson,
        fromJsonV: (value) => ImmutableRelationshipData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<RelationshipId, ImmutableRelationshipData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _MemberMapConverter
    implements JsonConverter<ImmutableMap<MemberId, ImmutableRelationshipMemberData>, Map<String, dynamic>> {
  const _MemberMapConverter();

  @override
  ImmutableMap<MemberId, ImmutableRelationshipMemberData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: MemberId.fromJson,
        fromJsonV: (value) => ImmutableRelationshipMemberData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<MemberId, ImmutableRelationshipMemberData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _AgreementMapConverter
    implements JsonConverter<ImmutableMap<AgreementId, ImmutableAgreementData>, Map<String, dynamic>> {
  const _AgreementMapConverter();

  @override
  ImmutableMap<AgreementId, ImmutableAgreementData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: AgreementId.fromJson,
        fromJsonV: (value) => ImmutableAgreementData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<AgreementId, ImmutableAgreementData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _RequestMapConverter
    implements JsonConverter<ImmutableMap<RequestId, ImmutableRequestData>, Map<String, dynamic>> {
  const _RequestMapConverter();

  @override
  ImmutableMap<RequestId, ImmutableRequestData> fromJson(Map<String, dynamic> json) => ImmutableMap.fromJson(
    json,
    fromJsonK: RequestId.fromJson,
    fromJsonV: (value) => ImmutableRequestData.fromJson(value as Map<String, dynamic>),
  );

  @override
  Map<String, dynamic> toJson(ImmutableMap<RequestId, ImmutableRequestData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _EssentialMapConverter
    implements JsonConverter<ImmutableMap<EssentialId, ImmutableEssentialData>, Map<String, dynamic>> {
  const _EssentialMapConverter();

  @override
  ImmutableMap<EssentialId, ImmutableEssentialData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: EssentialId.fromJson,
        fromJsonV: (value) => ImmutableEssentialData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<EssentialId, ImmutableEssentialData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _PreferenceMapConverter
    implements JsonConverter<ImmutableMap<PreferenceId, ImmutablePreferenceData>, Map<String, dynamic>> {
  const _PreferenceMapConverter();

  @override
  ImmutableMap<PreferenceId, ImmutablePreferenceData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: PreferenceId.fromJson,
        fromJsonV: (value) => ImmutablePreferenceData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<PreferenceId, ImmutablePreferenceData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _AgreementMemberDecisionMapConverter
    implements
        JsonConverter<ImmutableMap<MemberId, ImmutableAgreementMemberDecisionData>, Map<String, dynamic>> {
  const _AgreementMemberDecisionMapConverter();

  @override
  ImmutableMap<MemberId, ImmutableAgreementMemberDecisionData> fromJson(Map<String, dynamic> json) =>
      ImmutableMap.fromJson(
        json,
        fromJsonK: MemberId.fromJson,
        fromJsonV: (value) => ImmutableAgreementMemberDecisionData.fromJson(value as Map<String, dynamic>),
      );

  @override
  Map<String, dynamic> toJson(ImmutableMap<MemberId, ImmutableAgreementMemberDecisionData> object) =>
      object.toJson(toJsonK: (key) => key.toJson(), toJsonV: (value) => value.toJson());
}

class _MemberIdListConverter implements JsonConverter<ImmutableList<MemberId>, List<dynamic>> {
  const _MemberIdListConverter();

  @override
  ImmutableList<MemberId> fromJson(List<dynamic> json) =>
      ImmutableList.fromJson(json, (item) => MemberId.fromJson(item as String));

  @override
  List<dynamic> toJson(ImmutableList<MemberId> object) => object.toJson((item) => item.toJson());
}
