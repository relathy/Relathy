// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'data.dart';

// **************************************************************************
// ImmutableMutableGenerator
// **************************************************************************

class ImmutableRelathyData implements RelathyData {
  @override
  final UserId currentUserId;

  @override
  final ImmutableMap<UserId, ImmutableUserData> userMap;

  @override
  final ImmutableMap<RelationshipId, ImmutableRelationshipData> relationshipMap;

  ImmutableRelathyData({
    required this.currentUserId,
    required this.userMap,
    required this.relationshipMap,
  });

  factory ImmutableRelathyData.fromJson(Map<String, dynamic> json) =>
      ImmutableRelathyData(
        currentUserId: UserId.fromJson(json['currentUserId'] as String),
        userMap: ImmutableMap.fromJson(
          (json['userMap'] as Map<String, dynamic>),
          fromJsonK: (key) => UserId.fromJson(key),
          fromJsonV: (value) =>
              ImmutableUserData.fromJson(value as Map<String, dynamic>),
        ),
        relationshipMap: ImmutableMap.fromJson(
          (json['relationshipMap'] as Map<String, dynamic>),
          fromJsonK: (key) => RelationshipId.fromJson(key),
          fromJsonV: (value) =>
              ImmutableRelationshipData.fromJson(value as Map<String, dynamic>),
        ),
      );

  Map<String, dynamic> toJson() => {
    'currentUserId': currentUserId.toJson(),
    'userMap': userMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
    'relationshipMap': relationshipMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
  };

  MutableRelathyData toMutable() => MutableRelathyData(
    currentUserId: currentUserId,
    userMap: userMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
    relationshipMap: relationshipMap.mapToPlainMap(
      (k, v) => MapEntry(k, v.toMutable()),
    ),
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
    userMap: ImmutableMap.of(
      userMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
    relationshipMap: ImmutableMap.of(
      relationshipMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
  );
}

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

  factory ImmutableUserData.fromJson(Map<String, dynamic> json) =>
      ImmutableUserData(
        userId: UserId.fromJson(json['userId'] as String),
        displayName: json['displayName'] as String,
        avatarUrl: json['avatarUrl'] == null
            ? null
            : json['avatarUrl'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
    'userId': userId.toJson(),
    'displayName': displayName,
    'avatarUrl': avatarUrl,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  MutableUserData toMutable() => MutableUserData(
    userId: userId,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
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
  final ImmutableMap<MemberId, ImmutableRelationshipMemberData> memberMap;

  @override
  final ImmutableMap<AgreementId, ImmutableAgreementData> agreementMap;

  @override
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
      ImmutableRelationshipData(
        relationshipId: RelationshipId.fromJson(
          json['relationshipId'] as String,
        ),
        kind: RelationshipKind.values.byName(json['kind'] as String),
        status: RelationshipStatus.values.byName(json['status'] as String),
        title: json['title'] == null ? null : json['title'] as String,
        description: json['description'] == null
            ? null
            : json['description'] as String,
        createdByUserId: UserId.fromJson(json['createdByUserId'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        memberMap: ImmutableMap.fromJson(
          (json['memberMap'] as Map<String, dynamic>),
          fromJsonK: (key) => MemberId.fromJson(key),
          fromJsonV: (value) => ImmutableRelationshipMemberData.fromJson(
            value as Map<String, dynamic>,
          ),
        ),
        agreementMap: ImmutableMap.fromJson(
          (json['agreementMap'] as Map<String, dynamic>),
          fromJsonK: (key) => AgreementId.fromJson(key),
          fromJsonV: (value) =>
              ImmutableAgreementData.fromJson(value as Map<String, dynamic>),
        ),
        requestMap: ImmutableMap.fromJson(
          (json['requestMap'] as Map<String, dynamic>),
          fromJsonK: (key) => RequestId.fromJson(key),
          fromJsonV: (value) =>
              ImmutableRequestData.fromJson(value as Map<String, dynamic>),
        ),
      );

  Map<String, dynamic> toJson() => {
    'relationshipId': relationshipId.toJson(),
    'kind': kind.name,
    'status': status.name,
    'title': title,
    'description': description,
    'createdByUserId': createdByUserId.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'memberMap': memberMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
    'agreementMap': agreementMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
    'requestMap': requestMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
  };

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
    agreementMap: agreementMap.mapToPlainMap(
      (k, v) => MapEntry(k, v.toMutable()),
    ),
    requestMap: requestMap.mapToPlainMap((k, v) => MapEntry(k, v.toMutable())),
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
    memberMap: ImmutableMap.of(
      memberMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
    agreementMap: ImmutableMap.of(
      agreementMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
    requestMap: ImmutableMap.of(
      requestMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
  );
}

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
  final ImmutableMap<EssentialId, ImmutableEssentialData> essentialMap;

  @override
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
      ImmutableRelationshipMemberData(
        memberId: MemberId.fromJson(json['memberId'] as String),
        userId: UserId.fromJson(json['userId'] as String),
        status: MembershipStatus.values.byName(json['status'] as String),
        role: MemberRole.values.byName(json['role'] as String),
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
        essentialMap: ImmutableMap.fromJson(
          (json['essentialMap'] as Map<String, dynamic>),
          fromJsonK: (key) => EssentialId.fromJson(key),
          fromJsonV: (value) =>
              ImmutableEssentialData.fromJson(value as Map<String, dynamic>),
        ),
        preferenceMap: ImmutableMap.fromJson(
          (json['preferenceMap'] as Map<String, dynamic>),
          fromJsonK: (key) => PreferenceId.fromJson(key),
          fromJsonV: (value) =>
              ImmutablePreferenceData.fromJson(value as Map<String, dynamic>),
        ),
      );

  Map<String, dynamic> toJson() => {
    'memberId': memberId.toJson(),
    'userId': userId.toJson(),
    'status': status.name,
    'role': role.name,
    'invitedByUserId': invitedByUserId?.toJson(),
    'invitedAt': invitedAt.toIso8601String(),
    'respondedAt': respondedAt?.toIso8601String(),
    'joinedAt': joinedAt?.toIso8601String(),
    'essentialMap': essentialMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
    'preferenceMap': preferenceMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
  };

  MutableRelationshipMemberData toMutable() => MutableRelationshipMemberData(
    memberId: memberId,
    userId: userId,
    status: status,
    role: role,
    invitedByUserId: invitedByUserId,
    invitedAt: invitedAt,
    respondedAt: respondedAt,
    joinedAt: joinedAt,
    essentialMap: essentialMap.mapToPlainMap(
      (k, v) => MapEntry(k, v.toMutable()),
    ),
    preferenceMap: preferenceMap.mapToPlainMap(
      (k, v) => MapEntry(k, v.toMutable()),
    ),
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
  final UserId? invitedByUserId;

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

  ImmutableRelationshipMemberData toImmutable() =>
      ImmutableRelationshipMemberData(
        memberId: memberId,
        userId: userId,
        status: status,
        role: role,
        invitedByUserId: invitedByUserId,
        invitedAt: invitedAt,
        respondedAt: respondedAt,
        joinedAt: joinedAt,
        essentialMap: ImmutableMap.of(
          essentialMap.map((k, v) => MapEntry(k, v.toImmutable())),
        ),
        preferenceMap: ImmutableMap.of(
          preferenceMap.map((k, v) => MapEntry(k, v.toImmutable())),
        ),
      );
}

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
      ImmutableEssentialData(
        essentialId: EssentialId.fromJson(json['essentialId'] as String),
        parentEssentialId: json['parentEssentialId'] == null
            ? null
            : EssentialId.fromJson(json['parentEssentialId'] as String),
        title: json['title'] as String,
        description: json['description'] == null
            ? null
            : json['description'] as String,
        isBoundary: json['isBoundary'] as bool,
        sortOrder: (json['sortOrder'] as num).toInt(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
    'essentialId': essentialId.toJson(),
    'parentEssentialId': parentEssentialId?.toJson(),
    'title': title,
    'description': description,
    'isBoundary': isBoundary,
    'sortOrder': sortOrder,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

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

class MutableEssentialData implements EssentialData {
  @override
  final EssentialId essentialId;

  @override
  final EssentialId? parentEssentialId;

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
      ImmutablePreferenceData(
        preferenceId: PreferenceId.fromJson(json['preferenceId'] as String),
        title: json['title'] as String,
        description: json['description'] == null
            ? null
            : json['description'] as String,
        category: json['category'] == null ? null : json['category'] as String,
        sortOrder: (json['sortOrder'] as num).toInt(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
    'preferenceId': preferenceId.toJson(),
    'title': title,
    'description': description,
    'category': category,
    'sortOrder': sortOrder,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

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
  final ImmutableMap<MemberId, ImmutableAgreementMemberDecisionData>
  decisionMap;

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
      ImmutableAgreementData(
        agreementId: AgreementId.fromJson(json['agreementId'] as String),
        title: json['title'] as String,
        description: json['description'] == null
            ? null
            : json['description'] as String,
        status: AgreementStatus.values.byName(json['status'] as String),
        createdByMemberId: MemberId.fromJson(
          json['createdByMemberId'] as String,
        ),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        decisionMap: ImmutableMap.fromJson(
          (json['decisionMap'] as Map<String, dynamic>),
          fromJsonK: (key) => MemberId.fromJson(key),
          fromJsonV: (value) => ImmutableAgreementMemberDecisionData.fromJson(
            value as Map<String, dynamic>,
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
    'agreementId': agreementId.toJson(),
    'title': title,
    'description': description,
    'status': status.name,
    'createdByMemberId': createdByMemberId.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'decisionMap': decisionMap.toJson(
      toJsonK: (key) => key.toJson(),
      toJsonV: (value) => value.toJson(),
    ),
  };

  MutableAgreementData toMutable() => MutableAgreementData(
    agreementId: agreementId,
    title: title,
    description: description,
    status: status,
    createdByMemberId: createdByMemberId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    decisionMap: decisionMap.mapToPlainMap(
      (k, v) => MapEntry(k, v.toMutable()),
    ),
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
    decisionMap: ImmutableMap.of(
      decisionMap.map((k, v) => MapEntry(k, v.toImmutable())),
    ),
  );
}

class ImmutableAgreementMemberDecisionData
    implements AgreementMemberDecisionData {
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

  factory ImmutableAgreementMemberDecisionData.fromJson(
    Map<String, dynamic> json,
  ) => ImmutableAgreementMemberDecisionData(
    memberId: MemberId.fromJson(json['memberId'] as String),
    decision: AgreementDecisionStatus.values.byName(json['decision'] as String),
    note: json['note'] == null ? null : json['note'] as String,
    decidedAt: json['decidedAt'] == null
        ? null
        : DateTime.parse(json['decidedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'memberId': memberId.toJson(),
    'decision': decision.name,
    'note': note,
    'decidedAt': decidedAt?.toIso8601String(),
  };

  MutableAgreementMemberDecisionData toMutable() =>
      MutableAgreementMemberDecisionData(
        memberId: memberId,
        decision: decision,
        note: note,
        decidedAt: decidedAt,
      );
}

class MutableAgreementMemberDecisionData
    implements AgreementMemberDecisionData {
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

  ImmutableAgreementMemberDecisionData toImmutable() =>
      ImmutableAgreementMemberDecisionData(
        memberId: memberId,
        decision: decision,
        note: note,
        decidedAt: decidedAt,
      );
}

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

  factory ImmutableRequestData.fromJson(Map<String, dynamic> json) =>
      ImmutableRequestData(
        requestId: RequestId.fromJson(json['requestId'] as String),
        createdByMemberId: MemberId.fromJson(
          json['createdByMemberId'] as String,
        ),
        title: json['title'] as String,
        description: json['description'] as String,
        status: RequestStatus.values.byName(json['status'] as String),
        priority: RequestPriority.values.byName(json['priority'] as String),
        targetMemberIds: ImmutableList.fromJson(
          (json['targetMemberIds'] as List<dynamic>),
          (item) => MemberId.fromJson(item as String),
        ),
        relatedAgreementId: json['relatedAgreementId'] == null
            ? null
            : AgreementId.fromJson(json['relatedAgreementId'] as String),
        relatedEssentialId: json['relatedEssentialId'] == null
            ? null
            : EssentialId.fromJson(json['relatedEssentialId'] as String),
        dueAt: json['dueAt'] == null
            ? null
            : DateTime.parse(json['dueAt'] as String),
        resolvedAt: json['resolvedAt'] == null
            ? null
            : DateTime.parse(json['resolvedAt'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
    'requestId': requestId.toJson(),
    'createdByMemberId': createdByMemberId.toJson(),
    'title': title,
    'description': description,
    'status': status.name,
    'priority': priority.name,
    'targetMemberIds': targetMemberIds.toJson((item) => item.toJson()),
    'relatedAgreementId': relatedAgreementId?.toJson(),
    'relatedEssentialId': relatedEssentialId?.toJson(),
    'dueAt': dueAt?.toIso8601String(),
    'resolvedAt': resolvedAt?.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  MutableRequestData toMutable() => MutableRequestData(
    requestId: requestId,
    createdByMemberId: createdByMemberId,
    title: title,
    description: description,
    status: status,
    priority: priority,
    targetMemberIds: targetMemberIds.mapToMutableList((x) => x),
    relatedAgreementId: relatedAgreementId,
    relatedEssentialId: relatedEssentialId,
    dueAt: dueAt,
    resolvedAt: resolvedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
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
  final AgreementId? relatedAgreementId;

  @override
  final EssentialId? relatedEssentialId;

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
    targetMemberIds: targetMemberIds.mapToImmutableList((x) => x),
    relatedAgreementId: relatedAgreementId,
    relatedEssentialId: relatedEssentialId,
    dueAt: dueAt,
    resolvedAt: resolvedAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
