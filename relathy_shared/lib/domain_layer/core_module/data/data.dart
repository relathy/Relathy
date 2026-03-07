import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:relathy_shared/codegen/immutable_mutable.dart';
import 'package:relathy_shared/generic_layer/collection/mutation.dart';
import 'package:relathy_shared/generic_layer/uuid/uuid.dart';

part 'data.immut_mut.dart';
part 'data.freezed.dart';

enum RelationshipKind { self, pair, group }

enum RelationshipStatus { pending, active, archived }

enum MembershipStatus { pending, accepted, declined, left, removed }

enum MemberRole { owner, member }

enum AgreementStatus { proposed, active, archived }

enum AgreementDecisionStatus { pending, agreed, disagreed, discussMore }

enum RequestStatus { open, inDiscussion, accepted, declined, completed, cancelled }

enum RequestPriority { low, normal, high, urgent }

@GenerateImmutableMutable()
abstract interface class RelathyData {
  @immutableField
  UserId get currentUserId;

  ReadOnlyMap<UserId, UserData> get userMap;

  ReadOnlyMap<RelationshipId, RelationshipData> get relationshipMap;
}

@GenerateImmutableMutable()
abstract interface class UserData {
  @immutableField
  UserId get userId;

  String get displayName;

  String? get avatarUrl;

  DateTime get createdAt;

  DateTime get updatedAt;
}

@GenerateImmutableMutable()
abstract interface class RelationshipData {
  @immutableField
  RelationshipId get relationshipId;

  RelationshipKind get kind;

  RelationshipStatus get status;

  String? get title;

  String? get description;

  @immutableField
  UserId get createdByUserId;

  DateTime get createdAt;

  DateTime get updatedAt;

  ReadOnlyMap<MemberId, RelationshipMemberData> get memberMap;

  ReadOnlyMap<AgreementId, AgreementData> get agreementMap;

  ReadOnlyMap<RequestId, RequestData> get requestMap;
}

@GenerateImmutableMutable()
abstract interface class RelationshipMemberData {
  @immutableField
  MemberId get memberId;

  @immutableField
  UserId get userId;

  MembershipStatus get status;

  MemberRole get role;

  @immutableField
  UserId? get invitedByUserId;

  DateTime get invitedAt;

  DateTime? get respondedAt;

  DateTime? get joinedAt;

  ReadOnlyMap<EssentialId, EssentialData> get essentialMap;

  ReadOnlyMap<PreferenceId, PreferenceData> get preferenceMap;
}

@GenerateImmutableMutable()
abstract interface class EssentialData {
  @immutableField
  EssentialId get essentialId;

  @immutableField
  EssentialId? get parentEssentialId;

  String get title;

  String? get description;

  bool get isBoundary;

  int get sortOrder;

  DateTime get createdAt;

  DateTime get updatedAt;
}

@GenerateImmutableMutable()
abstract interface class PreferenceData {
  @immutableField
  PreferenceId get preferenceId;

  String get title;

  String? get description;

  String? get category;

  int get sortOrder;

  DateTime get createdAt;

  DateTime get updatedAt;
}

@GenerateImmutableMutable()
abstract interface class AgreementData {
  @immutableField
  AgreementId get agreementId;

  String get title;

  String? get description;

  AgreementStatus get status;

  @immutableField
  MemberId get createdByMemberId;

  DateTime get createdAt;

  DateTime get updatedAt;

  ReadOnlyMap<MemberId, AgreementMemberDecisionData> get decisionMap;
}

@GenerateImmutableMutable()
abstract interface class AgreementMemberDecisionData {
  @immutableField
  MemberId get memberId;

  AgreementDecisionStatus get decision;

  String? get note;

  DateTime? get decidedAt;
}

@GenerateImmutableMutable()
abstract interface class RequestData {
  @immutableField
  RequestId get requestId;

  @immutableField
  MemberId get createdByMemberId;

  String get title;

  String get description;

  RequestStatus get status;

  RequestPriority get priority;

  ReadOnlyList<MemberId> get targetMemberIds;

  @immutableField
  AgreementId? get relatedAgreementId;

  @immutableField
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
