// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmutableRelathyData _$ImmutableRelathyDataFromJson(
  Map<String, dynamic> json,
) => ImmutableRelathyData(
  currentUserId: UserId.fromJson(json['currentUserId'] as String),
  userMap: const _UserMapConverter().fromJson(
    json['userMap'] as Map<String, dynamic>,
  ),
  relationshipMap: const _RelationshipMapConverter().fromJson(
    json['relationshipMap'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ImmutableRelathyDataToJson(
  ImmutableRelathyData instance,
) => <String, dynamic>{
  'currentUserId': instance.currentUserId.toJson(),
  'userMap': const _UserMapConverter().toJson(instance.userMap),
  'relationshipMap': const _RelationshipMapConverter().toJson(
    instance.relationshipMap,
  ),
};

ImmutableUserData _$ImmutableUserDataFromJson(Map<String, dynamic> json) =>
    ImmutableUserData(
      userId: UserId.fromJson(json['userId'] as String),
      displayName: json['displayName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ImmutableUserDataToJson(ImmutableUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId.toJson(),
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

ImmutableRelationshipData _$ImmutableRelationshipDataFromJson(
  Map<String, dynamic> json,
) => ImmutableRelationshipData(
  relationshipId: RelationshipId.fromJson(json['relationshipId'] as String),
  kind: $enumDecode(_$RelationshipKindEnumMap, json['kind']),
  status: $enumDecode(_$RelationshipStatusEnumMap, json['status']),
  title: json['title'] as String?,
  description: json['description'] as String?,
  createdByUserId: UserId.fromJson(json['createdByUserId'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  memberMap: const _MemberMapConverter().fromJson(
    json['memberMap'] as Map<String, dynamic>,
  ),
  agreementMap: const _AgreementMapConverter().fromJson(
    json['agreementMap'] as Map<String, dynamic>,
  ),
  requestMap: const _RequestMapConverter().fromJson(
    json['requestMap'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ImmutableRelationshipDataToJson(
  ImmutableRelationshipData instance,
) => <String, dynamic>{
  'relationshipId': instance.relationshipId.toJson(),
  'kind': _$RelationshipKindEnumMap[instance.kind]!,
  'status': _$RelationshipStatusEnumMap[instance.status]!,
  'title': instance.title,
  'description': instance.description,
  'createdByUserId': instance.createdByUserId.toJson(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'memberMap': const _MemberMapConverter().toJson(instance.memberMap),
  'agreementMap': const _AgreementMapConverter().toJson(instance.agreementMap),
  'requestMap': const _RequestMapConverter().toJson(instance.requestMap),
};

const _$RelationshipKindEnumMap = {
  RelationshipKind.self: 'self',
  RelationshipKind.pair: 'pair',
  RelationshipKind.group: 'group',
};

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.pending: 'pending',
  RelationshipStatus.active: 'active',
  RelationshipStatus.archived: 'archived',
};

ImmutableRelationshipMemberData _$ImmutableRelationshipMemberDataFromJson(
  Map<String, dynamic> json,
) => ImmutableRelationshipMemberData(
  memberId: MemberId.fromJson(json['memberId'] as String),
  userId: UserId.fromJson(json['userId'] as String),
  status: $enumDecode(_$MembershipStatusEnumMap, json['status']),
  role: $enumDecode(_$MemberRoleEnumMap, json['role']),
  invitedByUserId: json['invitedByUserId'] == null
      ? null
      : UserId.fromJson(json['invitedByUserId'] as String),
  invitedAt: DateTime.parse(json['invitedAt'] as String),
  respondedAt: json['respondedAt'] == null
      ? null
      : DateTime.parse(json['respondedAt'] as String),
  joinedAt: json['joinedAt'] == null
      ? null
      : DateTime.parse(json['joinedAt'] as String),
  essentialMap: const _EssentialMapConverter().fromJson(
    json['essentialMap'] as Map<String, dynamic>,
  ),
  preferenceMap: const _PreferenceMapConverter().fromJson(
    json['preferenceMap'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ImmutableRelationshipMemberDataToJson(
  ImmutableRelationshipMemberData instance,
) => <String, dynamic>{
  'memberId': instance.memberId.toJson(),
  'userId': instance.userId.toJson(),
  'status': _$MembershipStatusEnumMap[instance.status]!,
  'role': _$MemberRoleEnumMap[instance.role]!,
  'invitedByUserId': instance.invitedByUserId?.toJson(),
  'invitedAt': instance.invitedAt.toIso8601String(),
  'respondedAt': instance.respondedAt?.toIso8601String(),
  'joinedAt': instance.joinedAt?.toIso8601String(),
  'essentialMap': const _EssentialMapConverter().toJson(instance.essentialMap),
  'preferenceMap': const _PreferenceMapConverter().toJson(
    instance.preferenceMap,
  ),
};

const _$MembershipStatusEnumMap = {
  MembershipStatus.pending: 'pending',
  MembershipStatus.accepted: 'accepted',
  MembershipStatus.declined: 'declined',
  MembershipStatus.left: 'left',
  MembershipStatus.removed: 'removed',
};

const _$MemberRoleEnumMap = {
  MemberRole.owner: 'owner',
  MemberRole.member: 'member',
};

ImmutableEssentialData _$ImmutableEssentialDataFromJson(
  Map<String, dynamic> json,
) => ImmutableEssentialData(
  essentialId: EssentialId.fromJson(json['essentialId'] as String),
  parentEssentialId: json['parentEssentialId'] == null
      ? null
      : EssentialId.fromJson(json['parentEssentialId'] as String),
  title: json['title'] as String,
  description: json['description'] as String?,
  isBoundary: json['isBoundary'] as bool,
  sortOrder: (json['sortOrder'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ImmutableEssentialDataToJson(
  ImmutableEssentialData instance,
) => <String, dynamic>{
  'essentialId': instance.essentialId.toJson(),
  'parentEssentialId': instance.parentEssentialId?.toJson(),
  'title': instance.title,
  'description': instance.description,
  'isBoundary': instance.isBoundary,
  'sortOrder': instance.sortOrder,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

ImmutablePreferenceData _$ImmutablePreferenceDataFromJson(
  Map<String, dynamic> json,
) => ImmutablePreferenceData(
  preferenceId: PreferenceId.fromJson(json['preferenceId'] as String),
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] as String?,
  sortOrder: (json['sortOrder'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ImmutablePreferenceDataToJson(
  ImmutablePreferenceData instance,
) => <String, dynamic>{
  'preferenceId': instance.preferenceId.toJson(),
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'sortOrder': instance.sortOrder,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

ImmutableAgreementData _$ImmutableAgreementDataFromJson(
  Map<String, dynamic> json,
) => ImmutableAgreementData(
  agreementId: AgreementId.fromJson(json['agreementId'] as String),
  title: json['title'] as String,
  description: json['description'] as String?,
  status: $enumDecode(_$AgreementStatusEnumMap, json['status']),
  createdByMemberId: MemberId.fromJson(json['createdByMemberId'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  decisionMap: const _AgreementMemberDecisionMapConverter().fromJson(
    json['decisionMap'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ImmutableAgreementDataToJson(
  ImmutableAgreementData instance,
) => <String, dynamic>{
  'agreementId': instance.agreementId.toJson(),
  'title': instance.title,
  'description': instance.description,
  'status': _$AgreementStatusEnumMap[instance.status]!,
  'createdByMemberId': instance.createdByMemberId.toJson(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'decisionMap': const _AgreementMemberDecisionMapConverter().toJson(
    instance.decisionMap,
  ),
};

const _$AgreementStatusEnumMap = {
  AgreementStatus.proposed: 'proposed',
  AgreementStatus.active: 'active',
  AgreementStatus.archived: 'archived',
};

ImmutableAgreementMemberDecisionData
_$ImmutableAgreementMemberDecisionDataFromJson(Map<String, dynamic> json) =>
    ImmutableAgreementMemberDecisionData(
      memberId: MemberId.fromJson(json['memberId'] as String),
      decision: $enumDecode(_$AgreementDecisionStatusEnumMap, json['decision']),
      note: json['note'] as String?,
      decidedAt: json['decidedAt'] == null
          ? null
          : DateTime.parse(json['decidedAt'] as String),
    );

Map<String, dynamic> _$ImmutableAgreementMemberDecisionDataToJson(
  ImmutableAgreementMemberDecisionData instance,
) => <String, dynamic>{
  'memberId': instance.memberId.toJson(),
  'decision': _$AgreementDecisionStatusEnumMap[instance.decision]!,
  'note': instance.note,
  'decidedAt': instance.decidedAt?.toIso8601String(),
};

const _$AgreementDecisionStatusEnumMap = {
  AgreementDecisionStatus.pending: 'pending',
  AgreementDecisionStatus.agreed: 'agreed',
  AgreementDecisionStatus.disagreed: 'disagreed',
  AgreementDecisionStatus.discussMore: 'discussMore',
};

ImmutableRequestData _$ImmutableRequestDataFromJson(
  Map<String, dynamic> json,
) => ImmutableRequestData(
  requestId: RequestId.fromJson(json['requestId'] as String),
  createdByMemberId: MemberId.fromJson(json['createdByMemberId'] as String),
  title: json['title'] as String,
  description: json['description'] as String,
  status: $enumDecode(_$RequestStatusEnumMap, json['status']),
  priority: $enumDecode(_$RequestPriorityEnumMap, json['priority']),
  targetMemberIds: const _MemberIdListConverter().fromJson(
    json['targetMemberIds'] as List,
  ),
  relatedAgreementId: json['relatedAgreementId'] == null
      ? null
      : AgreementId.fromJson(json['relatedAgreementId'] as String),
  relatedEssentialId: json['relatedEssentialId'] == null
      ? null
      : EssentialId.fromJson(json['relatedEssentialId'] as String),
  dueAt: json['dueAt'] == null ? null : DateTime.parse(json['dueAt'] as String),
  resolvedAt: json['resolvedAt'] == null
      ? null
      : DateTime.parse(json['resolvedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ImmutableRequestDataToJson(
  ImmutableRequestData instance,
) => <String, dynamic>{
  'requestId': instance.requestId.toJson(),
  'createdByMemberId': instance.createdByMemberId.toJson(),
  'title': instance.title,
  'description': instance.description,
  'status': _$RequestStatusEnumMap[instance.status]!,
  'priority': _$RequestPriorityEnumMap[instance.priority]!,
  'targetMemberIds': const _MemberIdListConverter().toJson(
    instance.targetMemberIds,
  ),
  'relatedAgreementId': instance.relatedAgreementId?.toJson(),
  'relatedEssentialId': instance.relatedEssentialId?.toJson(),
  'dueAt': instance.dueAt?.toIso8601String(),
  'resolvedAt': instance.resolvedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$RequestStatusEnumMap = {
  RequestStatus.open: 'open',
  RequestStatus.inDiscussion: 'inDiscussion',
  RequestStatus.accepted: 'accepted',
  RequestStatus.declined: 'declined',
  RequestStatus.completed: 'completed',
  RequestStatus.cancelled: 'cancelled',
};

const _$RequestPriorityEnumMap = {
  RequestPriority.low: 'low',
  RequestPriority.normal: 'normal',
  RequestPriority.high: 'high',
  RequestPriority.urgent: 'urgent',
};
