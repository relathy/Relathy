import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

void main() {
  runApp(RelathyApp(repository: InMemoryRelathyRepository()));
}

class RelathyApp extends StatelessWidget {
  const RelathyApp({super.key, required this.repository});

  final InMemoryRelathyRepository repository;

  @override
  Widget build(BuildContext context) {
    final store = AppStore(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Relathy',
      themeMode: ThemeMode.dark,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: Observer(
        builder: (_) {
          final user = store.currentUser.value;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: user == null ? AuthScreen(store: store) : HomeScreen(store: store),
          );
        },
      ),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(seedColor: const Color(0xFF7C4DFF), brightness: brightness);

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: isDark ? const Color(0xFF0B1020) : const Color(0xFFF5F7FB),
    cardTheme: CardThemeData(
      elevation: 0,
      color: isDark ? const Color(0xFF131A2C) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      margin: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      foregroundColor: isDark ? Colors.white : const Color(0xFF111827),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark ? const Color(0xFF151D31) : const Color(0xFFF1F4FA),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: isDark ? const Color(0xFF0E1526) : Colors.white.withOpacity(0.9),
      indicatorColor: scheme.primary.withOpacity(0.16),
      height: 78,
      labelTextStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : const Color(0xFF111827),
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: isDark ? const Color(0xFF1A2238) : const Color(0xFFEEF2FF),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      labelStyle: TextStyle(
        color: isDark ? Colors.white : const Color(0xFF111827),
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    ),
  );
}

enum AuthProviderType { google, apple }

enum RelationshipKind { self, pair, group }

enum MembershipStatus { pending, accepted }

enum MemberRole { owner, member }

enum AgreementVote { pending, agree, disagree, discussMore }

enum RequestState { open, inProgress, resolved }

enum RelationshipArea { essentials, agreements, preferences, requests }

class UserProfile {
  UserProfile({required this.id, required this.name, required this.tagline, required this.avatarEmoji});

  final String id;
  final String name;
  final String tagline;
  final String avatarEmoji;
}

class EssentialNode {
  EssentialNode({required this.id, required this.title, List<EssentialNode>? children})
    : children = children ?? [];

  final String id;
  String title;
  final List<EssentialNode> children;
}

class RelationshipMember {
  RelationshipMember({
    required this.userId,
    required this.status,
    required this.role,
    List<EssentialNode>? essentials,
    List<String>? preferences,
  }) : essentials = essentials ?? [],
       preferences = preferences ?? [];

  final String userId;
  MembershipStatus status;
  MemberRole role;
  final List<EssentialNode> essentials;
  final List<String> preferences;
}

class Agreement {
  Agreement({
    required this.id,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.votes,
  });

  final String id;
  String title;
  String description;
  final String createdBy;
  final DateTime createdAt;
  final Map<String, AgreementVote> votes;
}

class RelationshipRequest {
  RelationshipRequest({
    required this.id,
    required this.title,
    required this.details,
    required this.fromUserId,
    required this.toUserIds,
    required this.createdAt,
    this.state = RequestState.open,
  });

  final String id;
  String title;
  String details;
  final String fromUserId;
  final List<String> toUserIds;
  final DateTime createdAt;
  RequestState state;
}

class Relationship {
  Relationship({
    required this.id,
    required this.title,
    required this.kind,
    required this.createdAt,
    List<RelationshipMember>? members,
    List<Agreement>? agreements,
    List<RelationshipRequest>? requests,
  }) : members = members ?? [],
       agreements = agreements ?? [],
       requests = requests ?? [];

  final String id;
  String title;
  final RelationshipKind kind;
  final DateTime createdAt;
  final List<RelationshipMember> members;
  final List<Agreement> agreements;
  final List<RelationshipRequest> requests;
}

class InMemoryRelathyRepository {
  InMemoryRelathyRepository() {
    _users.addAll([
      UserProfile(id: 'maya', name: 'Maya', tagline: 'Warm, direct, reflective', avatarEmoji: '🌷'),
      UserProfile(id: 'noah', name: 'Noah', tagline: 'Calm, consistent, caring', avatarEmoji: '🌿'),
      UserProfile(id: 'sofia', name: 'Sofia', tagline: 'Honest, playful, grounded', avatarEmoji: '☀️'),
      UserProfile(id: 'liam', name: 'Liam', tagline: 'Curious, kind, practical', avatarEmoji: '🪴'),
    ]);
  }

  final Random _random = Random();
  final List<UserProfile> _users = [];
  final List<Relationship> _relationships = [];

  List<UserProfile> get profiles => List.unmodifiable(_users);

  UserProfile signIn({required AuthProviderType provider, required String userId}) {
    final user = _users.firstWhere((profile) => profile.id == userId);
    ensureSelfRelationship(user.id);
    _seedDemoDataFor(user.id);
    return user;
  }

  void ensureSelfRelationship(String userId) {
    final exists = _relationships.any(
      (relationship) =>
          relationship.kind == RelationshipKind.self &&
          relationship.members.any((member) => member.userId == userId),
    );

    if (exists) return;

    _relationships.insert(
      0,
      Relationship(
        id: _id(),
        title: 'Relationship with myself',
        kind: RelationshipKind.self,
        createdAt: DateTime.now(),
        members: [
          RelationshipMember(
            userId: userId,
            status: MembershipStatus.accepted,
            role: MemberRole.owner,
            essentials: [
              EssentialNode(
                id: _id(),
                title: 'Emotional safety',
                children: [
                  EssentialNode(id: _id(), title: 'I need time before hard talks'),
                  EssentialNode(id: _id(), title: 'I want honesty without sharpness'),
                ],
              ),
              EssentialNode(id: _id(), title: 'Rest and personal space'),
            ],
            preferences: [
              'I prefer direct communication over guessing.',
              'I like a gentle check-in before discussing something intense.',
              'I recharge best with quiet evenings and long walks.',
            ],
          ),
        ],
        agreements: [
          Agreement(
            id: _id(),
            title: 'Pause before reacting',
            description: 'When emotions spike, I choose a short pause before replying.',
            createdBy: userId,
            createdAt: DateTime.now().subtract(const Duration(days: 2)),
            votes: {userId: AgreementVote.agree},
          ),
        ],
        requests: [
          RelationshipRequest(
            id: _id(),
            title: 'Plan a quiet reset night',
            details: 'Put one evening this week aside for rest, journaling, and no pressure.',
            fromUserId: userId,
            toUserIds: [userId],
            createdAt: DateTime.now().subtract(const Duration(hours: 20)),
          ),
        ],
      ),
    );
  }

  void _seedDemoDataFor(String userId) {
    final hasShared = _relationships.any(
      (relationship) =>
          relationship.kind != RelationshipKind.self &&
          relationship.members.any((member) => member.userId == userId),
    );

    if (hasShared) return;

    final others = _users.where((user) => user.id != userId).toList();
    if (others.isEmpty) return;

    _relationships.add(
      Relationship(
        id: _id(),
        title: 'Clarity Circle',
        kind: RelationshipKind.group,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        members: [
          RelationshipMember(
            userId: userId,
            status: MembershipStatus.accepted,
            role: MemberRole.owner,
            essentials: [EssentialNode(id: _id(), title: 'Shared follow-through')],
            preferences: ['I like a clear next step after emotional conversations.'],
          ),
          for (final other in others.take(2))
            RelationshipMember(
              userId: other.id,
              status: MembershipStatus.accepted,
              role: MemberRole.member,
              essentials: [EssentialNode(id: _id(), title: 'Respectful tone')],
              preferences: ['I appreciate short check-ins during the week.'],
            ),
          if (others.length > 2)
            RelationshipMember(
              userId: others[2].id,
              status: MembershipStatus.pending,
              role: MemberRole.member,
              essentials: [],
              preferences: [],
            ),
        ],
        agreements: [
          Agreement(
            id: _id(),
            title: 'Assume good intent, ask for clarity',
            description: 'We ask for context before we jump to conclusions.',
            createdBy: userId,
            createdAt: DateTime.now().subtract(const Duration(days: 3)),
            votes: {
              userId: AgreementVote.agree,
              for (final other in others.take(2)) other.id: AgreementVote.agree,
              if (others.length > 2) others[2].id: AgreementVote.pending,
            },
          ),
        ],
        requests: [
          RelationshipRequest(
            id: _id(),
            title: 'Schedule our monthly alignment chat',
            details: 'Can we pick one evening this week for an honest reset conversation?',
            fromUserId: userId,
            toUserIds: others.take(2).map((e) => e.id).toList(),
            createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
          ),
        ],
      ),
    );

    _relationships.add(
      Relationship(
        id: _id(),
        title: 'You & ${others.first.name}',
        kind: RelationshipKind.pair,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        members: [
          RelationshipMember(
            userId: userId,
            status: MembershipStatus.accepted,
            role: MemberRole.owner,
            essentials: [
              EssentialNode(
                id: _id(),
                title: 'Repair after tension',
                children: [EssentialNode(id: _id(), title: 'Acknowledge impact before explaining intent')],
              ),
            ],
            preferences: ['I prefer voice notes over long text threads when things feel delicate.'],
          ),
          RelationshipMember(
            userId: others.first.id,
            status: MembershipStatus.pending,
            role: MemberRole.member,
            essentials: [],
            preferences: [],
          ),
        ],
      ),
    );
  }

  List<Relationship> relationshipsFor(String userId) {
    final relationships = _relationships
        .where((relationship) => relationship.members.any((member) => member.userId == userId))
        .toList();

    relationships.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return relationships;
  }

  List<UserProfile> usersExcept(String userId) =>
      _users.where((user) => user.id != userId).toList(growable: false);

  Relationship createRelationship({
    required RelationshipKind kind,
    required String ownerId,
    required String title,
    required List<String> invitedUserIds,
  }) {
    final relationship = Relationship(
      id: _id(),
      title: title.trim().isEmpty ? _defaultRelationshipTitle(kind, ownerId, invitedUserIds) : title.trim(),
      kind: kind,
      createdAt: DateTime.now(),
      members: [
        RelationshipMember(
          userId: ownerId,
          status: MembershipStatus.accepted,
          role: MemberRole.owner,
          essentials: [],
          preferences: [],
        ),
        for (final inviteeId in invitedUserIds)
          RelationshipMember(
            userId: inviteeId,
            status: MembershipStatus.pending,
            role: MemberRole.member,
            essentials: [],
            preferences: [],
          ),
      ],
    );

    _relationships.insert(0, relationship);
    return relationship;
  }

  void acceptInvite({required String relationshipId, required String userId}) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    final member = relationship.members.firstWhere((item) => item.userId == userId);
    member.status = MembershipStatus.accepted;

    for (final agreement in relationship.agreements) {
      agreement.votes.putIfAbsent(userId, () => AgreementVote.pending);
    }
  }

  void addEssential({
    required String relationshipId,
    required String userId,
    required String title,
    String? parentId,
  }) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    final member = relationship.members.firstWhere((item) => item.userId == userId);
    final node = EssentialNode(id: _id(), title: title.trim());

    if (parentId == null) {
      member.essentials.insert(0, node);
      return;
    }

    final parent = _findEssential(member.essentials, parentId);
    if (parent != null) {
      parent.children.insert(0, node);
    }
  }

  void addPreference({required String relationshipId, required String userId, required String value}) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    final member = relationship.members.firstWhere((item) => item.userId == userId);
    member.preferences.insert(0, value.trim());
  }

  void addAgreement({
    required String relationshipId,
    required String createdBy,
    required String title,
    required String description,
  }) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    relationship.agreements.insert(
      0,
      Agreement(
        id: _id(),
        title: title.trim(),
        description: description.trim(),
        createdBy: createdBy,
        createdAt: DateTime.now(),
        votes: {
          for (final member in relationship.members)
            if (member.status == MembershipStatus.accepted)
              member.userId: member.userId == createdBy ? AgreementVote.agree : AgreementVote.pending,
        },
      ),
    );
  }

  void setAgreementVote({
    required String relationshipId,
    required String agreementId,
    required String userId,
    required AgreementVote vote,
  }) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    final agreement = relationship.agreements.firstWhere((item) => item.id == agreementId);
    agreement.votes[userId] = vote;
  }

  void addRequest({
    required String relationshipId,
    required String fromUserId,
    required List<String> toUserIds,
    required String title,
    required String details,
  }) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    relationship.requests.insert(
      0,
      RelationshipRequest(
        id: _id(),
        title: title.trim(),
        details: details.trim(),
        fromUserId: fromUserId,
        toUserIds: toUserIds,
        createdAt: DateTime.now(),
      ),
    );
  }

  void advanceRequestState({required String relationshipId, required String requestId}) {
    final relationship = _relationships.firstWhere((item) => item.id == relationshipId);
    final request = relationship.requests.firstWhere((item) => item.id == requestId);

    switch (request.state) {
      case RequestState.open:
        request.state = RequestState.inProgress;
        break;
      case RequestState.inProgress:
        request.state = RequestState.resolved;
        break;
      case RequestState.resolved:
        request.state = RequestState.open;
        break;
    }
  }

  EssentialNode? _findEssential(List<EssentialNode> nodes, String id) {
    for (final node in nodes) {
      if (node.id == id) return node;
      final child = _findEssential(node.children, id);
      if (child != null) return child;
    }
    return null;
  }

  String _defaultRelationshipTitle(RelationshipKind kind, String ownerId, List<String> invitedUserIds) {
    if (kind == RelationshipKind.pair && invitedUserIds.isNotEmpty) {
      final other = _users.firstWhere((user) => user.id == invitedUserIds.first);
      return 'You & ${other.name}';
    }
    if (kind == RelationshipKind.group) {
      const names = ['Connection Circle', 'Sunday Reset', 'Care Team', 'Shared Ground'];
      return names[_random.nextInt(names.length)];
    }
    final owner = _users.firstWhere((user) => user.id == ownerId);
    return 'Relationship with ${owner.name}';
  }

  String _id() => '${DateTime.now().microsecondsSinceEpoch}${_random.nextInt(9999)}';
}

class AppStore {
  AppStore(this.repository) {
    _relationshipsComputed = Computed(() {
      refreshVersion.value;
      final user = currentUser.value;
      if (user == null) return <Relationship>[];
      return repository.relationshipsFor(user.id);
    });

    _selectedRelationshipComputed = Computed(() {
      refreshVersion.value;
      final items = relationships;
      if (items.isEmpty) return null;
      final selectedId = selectedRelationshipId.value;
      if (selectedId == null) return items.first;
      return items.firstWhere((relationship) => relationship.id == selectedId, orElse: () => items.first);
    });

    _pendingInvitesComputed = Computed(() {
      refreshVersion.value;
      final user = currentUser.value;
      if (user == null) return <Relationship>[];
      return relationships.where((relationship) {
        final member = relationship.members.firstWhere(
          (item) => item.userId == user.id,
          orElse: () =>
              RelationshipMember(userId: user.id, status: MembershipStatus.pending, role: MemberRole.member),
        );
        return member.status == MembershipStatus.pending;
      }).toList();
    });
  }

  final InMemoryRelathyRepository repository;

  final Observable<UserProfile?> currentUser = Observable(null);
  final Observable<int> navIndex = Observable(0);
  final Observable<int> refreshVersion = Observable(0);
  final Observable<String?> selectedRelationshipId = Observable(null);
  final Observable<RelationshipArea> selectedArea = Observable(RelationshipArea.essentials);

  late final Computed<List<Relationship>> _relationshipsComputed;
  late final Computed<Relationship?> _selectedRelationshipComputed;
  late final Computed<List<Relationship>> _pendingInvitesComputed;

  List<Relationship> get relationships => _relationshipsComputed.value;
  Relationship? get selectedRelationship => _selectedRelationshipComputed.value;
  List<Relationship> get pendingInvites => _pendingInvitesComputed.value;

  List<UserProfile> get availableProfiles {
    refreshVersion.value;
    return repository.profiles;
  }

  List<UserProfile> inviteCandidates() {
    final user = currentUser.value;
    if (user == null) return [];
    return repository.usersExcept(user.id);
  }

  RelationshipMember? currentMember(Relationship relationship) {
    final user = currentUser.value;
    if (user == null) return null;
    for (final member in relationship.members) {
      if (member.userId == user.id) return member;
    }
    return null;
  }

  UserProfile userById(String userId) => availableProfiles.firstWhere((profile) => profile.id == userId);

  bool isCurrentUser(String userId) => currentUser.value?.id == userId;

  void signIn(AuthProviderType provider, String userId) {
    final user = repository.signIn(provider: provider, userId: userId);
    runInAction(() {
      currentUser.value = user;
      navIndex.value = 0;
      selectedArea.value = RelationshipArea.essentials;
      refreshVersion.value++;
      selectedRelationshipId.value = repository.relationshipsFor(user.id).firstOrNull?.id;
    });
  }

  void signOut() {
    runInAction(() {
      currentUser.value = null;
      navIndex.value = 0;
      selectedRelationshipId.value = null;
      selectedArea.value = RelationshipArea.essentials;
      refreshVersion.value++;
    });
  }

  void selectRelationship(String relationshipId) {
    runInAction(() => selectedRelationshipId.value = relationshipId);
  }

  void selectArea(RelationshipArea area) {
    runInAction(() => selectedArea.value = area);
  }

  void setNavigationIndex(int index) {
    runInAction(() => navIndex.value = index);
  }

  void createRelationship({
    required RelationshipKind kind,
    required String title,
    required List<String> invitedUserIds,
  }) {
    final user = currentUser.value;
    if (user == null) return;
    final relationship = repository.createRelationship(
      kind: kind,
      ownerId: user.id,
      title: title,
      invitedUserIds: invitedUserIds,
    );
    _bump();
    selectRelationship(relationship.id);
    setNavigationIndex(0);
  }

  void acceptInvite(String relationshipId) {
    final user = currentUser.value;
    if (user == null) return;
    repository.acceptInvite(relationshipId: relationshipId, userId: user.id);
    _bump();
    selectRelationship(relationshipId);
    setNavigationIndex(0);
  }

  void addEssential(String title, {String? parentId}) {
    final relationship = selectedRelationship;
    final user = currentUser.value;
    if (relationship == null || user == null || title.trim().isEmpty) return;
    repository.addEssential(
      relationshipId: relationship.id,
      userId: user.id,
      title: title,
      parentId: parentId,
    );
    _bump();
  }

  void addPreference(String value) {
    final relationship = selectedRelationship;
    final user = currentUser.value;
    if (relationship == null || user == null || value.trim().isEmpty) return;
    repository.addPreference(relationshipId: relationship.id, userId: user.id, value: value);
    _bump();
  }

  void addAgreement({required String title, required String description}) {
    final relationship = selectedRelationship;
    final user = currentUser.value;
    if (relationship == null || user == null || title.trim().isEmpty) return;
    repository.addAgreement(
      relationshipId: relationship.id,
      createdBy: user.id,
      title: title,
      description: description,
    );
    _bump();
  }

  void voteAgreement(String agreementId, AgreementVote vote) {
    final relationship = selectedRelationship;
    final user = currentUser.value;
    if (relationship == null || user == null) return;
    repository.setAgreementVote(
      relationshipId: relationship.id,
      agreementId: agreementId,
      userId: user.id,
      vote: vote,
    );
    _bump();
  }

  void addRequest({required String title, required String details, required List<String> recipients}) {
    final relationship = selectedRelationship;
    final user = currentUser.value;
    if (relationship == null || user == null || title.trim().isEmpty || recipients.isEmpty) return;
    repository.addRequest(
      relationshipId: relationship.id,
      fromUserId: user.id,
      toUserIds: recipients,
      title: title,
      details: details,
    );
    _bump();
  }

  void advanceRequestState(String requestId) {
    final relationship = selectedRelationship;
    if (relationship == null) return;
    repository.advanceRequestState(relationshipId: relationship.id, requestId: requestId);
    _bump();
  }

  void _bump() {
    runInAction(() => refreshVersion.value++);
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF090E1C), Color(0xFF141B32), Color(0xFF211748)],
          ),
        ),
        child: Stack(
          children: [
            const _AuroraBackground(),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 520,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                                ),
                                child: const Text(
                                  'Relathy • healthier relationships, clearer communication',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'Build the kind of relationships that feel safe, honest, and shared.',
                                style: theme.textTheme.displaySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Relathy gives you one clear place for essentials, agreements, preferences, and requests — so people understand what matters, what is shared, and what needs attention now.',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.82),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 28),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: const [
                                  _PillLabel(
                                    icon: Icons.self_improvement,
                                    text: 'Automatic self relationship',
                                  ),
                                  _PillLabel(icon: Icons.groups_2_outlined, text: 'Pair and group spaces'),
                                  _PillLabel(icon: Icons.favorite_border, text: 'Requests with care'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 420,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(32),
                                  border: Border.all(color: Colors.white.withOpacity(0.12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.22),
                                      blurRadius: 40,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Mock authentication',
                                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Choose a sign-in provider, then pick a demo account. You can switch accounts later to test invitations and agreement votes.',
                                      style: TextStyle(color: Colors.white, height: 1.45),
                                    ),
                                    const SizedBox(height: 24),
                                    _AuthButton(
                                      label: 'Continue with Google',
                                      icon: const _LetterBadge(letter: 'G'),
                                      onTap: () => _showSignInSheet(context, store, AuthProviderType.google),
                                    ),
                                    const SizedBox(height: 14),
                                    _AuthButton(
                                      label: 'Continue with Apple',
                                      icon: const Icon(Icons.apple, color: Colors.white, size: 22),
                                      onTap: () => _showSignInSheet(context, store, AuthProviderType.apple),
                                    ),
                                    const SizedBox(height: 24),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.06),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.auto_awesome_outlined, color: Colors.white70),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              'Every account gets a self relationship automatically, plus seeded demo relationships to explore the full MVP.',
                                              style: TextStyle(color: Colors.white70, height: 1.4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignInSheet(BuildContext context, AppStore store, AuthProviderType provider) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        final profiles = store.availableProfiles;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF11182A).withOpacity(0.96),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider == AuthProviderType.google
                            ? 'Choose a Google demo account'
                            : 'Choose an Apple demo account',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'All data lives in memory, so you can switch accounts and test the invitation flow instantly.',
                        style: TextStyle(color: Colors.white70, height: 1.4),
                      ),
                      const SizedBox(height: 18),
                      for (final profile in profiles)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              store.signIn(provider, profile.id);
                            },
                            borderRadius: BorderRadius.circular(22),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: Row(
                                children: [
                                  _EmojiAvatar(emoji: profile.avatarEmoji, size: 54),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profile.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(profile.tagline, style: const TextStyle(color: Colors.white70)),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white38,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Observer(
      builder: (_) {
        final user = store.currentUser.value!;
        final currentIndex = store.navIndex.value;

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            toolbarHeight: 84,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${user.name}',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text(
                  'Build clarity, care, and shared understanding.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilledButton.icon(
                  onPressed: () => _showCreateRelationshipSheet(context, store),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('New relationship'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: PopupMenuButton<String>(
                  position: PopupMenuPosition.under,
                  color: Theme.of(context).cardColor,
                  onSelected: (value) {
                    if (value == 'sign_out') {
                      store.signOut();
                    }
                  },
                  itemBuilder: (context) => const [PopupMenuItem(value: 'sign_out', child: Text('Sign out'))],
                  child: _EmojiAvatar(emoji: user.avatarEmoji, size: 46),
                ),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [theme.colorScheme.primary.withOpacity(0.08), Colors.transparent],
              ),
            ),
            child: IndexedStack(
              index: currentIndex,
              children: [
                DashboardPage(store: store),
                RelationshipsPage(store: store),
                InvitesPage(store: store),
                MePage(store: store),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: store.setNavigationIndex,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard_rounded),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: 'Relationships',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: store.pendingInvites.isNotEmpty,
                  label: Text('${store.pendingInvites.length}'),
                  child: const Icon(Icons.mail_outline_rounded),
                ),
                selectedIcon: Badge(
                  isLabelVisible: store.pendingInvites.isNotEmpty,
                  label: Text('${store.pendingInvites.length}'),
                  child: const Icon(Icons.mark_email_read_rounded),
                ),
                label: 'Invites',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person_rounded),
                label: 'Me',
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCreateRelationshipSheet(BuildContext context, AppStore store) {
    RelationshipKind kind = RelationshipKind.pair;
    final titleController = TextEditingController();
    final selectedUsers = <String>{};

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final users = store.inviteCandidates();
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Material(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create a relationship',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Choose a pair or group space. Invited members stay pending until they accept.',
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 10,
                        children: [
                          ChoiceChip(
                            label: const Text('Pair'),
                            selected: kind == RelationshipKind.pair,
                            onSelected: (_) {
                              setSheetState(() {
                                kind = RelationshipKind.pair;
                                if (selectedUsers.length > 1) {
                                  final first = selectedUsers.first;
                                  selectedUsers
                                    ..clear()
                                    ..add(first);
                                }
                              });
                            },
                          ),
                          ChoiceChip(
                            label: const Text('Group'),
                            selected: kind == RelationshipKind.group,
                            onSelected: (_) => setSheetState(() => kind = RelationshipKind.group),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Relationship title',
                          hintText: 'Optional for pair, nice for groups',
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Invite members', style: TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: min(MediaQuery.of(context).size.height * 0.32, 280),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (final user in users)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setSheetState(() {
                                        if (kind == RelationshipKind.pair) {
                                          selectedUsers
                                            ..clear()
                                            ..add(user.id);
                                        } else {
                                          if (!selectedUsers.add(user.id)) {
                                            selectedUsers.remove(user.id);
                                          }
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(22),
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: selectedUsers.contains(user.id)
                                            ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
                                            : Theme.of(
                                                context,
                                              ).colorScheme.surfaceContainerHighest.withOpacity(0.35),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: Row(
                                        children: [
                                          _EmojiAvatar(emoji: user.avatarEmoji, size: 44),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.name,
                                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  user.tagline,
                                                  style: TextStyle(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.onSurface.withOpacity(0.7),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            selectedUsers.contains(user.id)
                                                ? Icons.check_circle_rounded
                                                : Icons.radio_button_unchecked_rounded,
                                            color: selectedUsers.contains(user.id)
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).colorScheme.onSurface.withOpacity(0.35),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: selectedUsers.isEmpty
                              ? null
                              : () {
                                  store.createRelationship(
                                    kind: kind,
                                    title: titleController.text,
                                    invitedUserIds: selectedUsers.toList(),
                                  );
                                  Navigator.pop(context);
                                },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('Create relationship'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final relationships = store.relationships;
        final selectedRelationship = store.selectedRelationship;

        if (relationships.isEmpty || selectedRelationship == null) {
          return const Center(child: Text('No relationships yet.'));
        }

        final currentMember = store.currentMember(selectedRelationship);
        final pending = currentMember?.status == MembershipStatus.pending;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          children: [
            _HeroSummaryCard(store: store, relationship: selectedRelationship),
            const SizedBox(height: 18),
            SizedBox(
              height: 132,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: relationships.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final relationship = relationships[index];
                  final selected = relationship.id == selectedRelationship.id;
                  final member = store.currentMember(relationship);
                  return _RelationshipMiniCard(
                    relationship: relationship,
                    userCount: relationship.members.length,
                    isSelected: selected,
                    isPending: member?.status == MembershipStatus.pending,
                    onTap: () => store.selectRelationship(relationship.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _SectionSwitch(store: store),
            const SizedBox(height: 16),
            if (pending)
              _PendingInviteBanner(
                relationship: selectedRelationship,
                onAccept: () => store.acceptInvite(selectedRelationship.id),
              )
            else
              _RelationshipDetailCard(store: store, relationship: selectedRelationship),
          ],
        );
      },
    );
  }
}

class RelationshipsPage extends StatelessWidget {
  const RelationshipsPage({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final relationships = store.relationships;
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          itemCount: relationships.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _SectionIntroCard(
                title: 'All relationships',
                subtitle:
                    'Self, pair, and group spaces — each one with personal essentials, shared agreements, preferences, and requests.',
                icon: Icons.favorite_rounded,
              );
            }
            final relationship = relationships[index - 1];
            final accepted = relationship.members
                .where((member) => member.status == MembershipStatus.accepted)
                .length;
            final pending = relationship.members
                .where((member) => member.status == MembershipStatus.pending)
                .length;
            return InkWell(
              onTap: () {
                store.selectRelationship(relationship.id);
                store.setNavigationIndex(0);
              },
              borderRadius: BorderRadius.circular(28),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _KindBadge(kind: relationship.kind),
                          const Spacer(),
                          if (pending > 0) Chip(label: Text('$pending pending')),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        relationship.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _StatPill(icon: Icons.people_outline, label: '$accepted accepted'),
                          _StatPill(
                            icon: Icons.rule_folder_outlined,
                            label: '${relationship.agreements.length} agreements',
                          ),
                          _StatPill(
                            icon: Icons.campaign_outlined,
                            label: '${relationship.requests.length} requests',
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: relationship.members.map((member) {
                          final user = store.userById(member.userId);
                          return Chip(
                            avatar: Text(user.avatarEmoji),
                            label: Text(
                              '${user.name}${member.status == MembershipStatus.pending ? ' • pending' : ''}',
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class InvitesPage extends StatelessWidget {
  const InvitesPage({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final invites = store.pendingInvites;
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          itemCount: invites.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _SectionIntroCard(
                title: 'Invitations',
                subtitle: invites.isEmpty
                    ? 'You are all caught up. Switch demo accounts to test the acceptance flow.'
                    : 'Accept invitations to activate shared spaces and participate in agreements.',
                icon: Icons.mail_rounded,
              );
            }
            final invite = invites[index - 1];
            final owner = invite.members.firstWhere((member) => member.role == MemberRole.owner);
            final ownerProfile = store.userById(owner.userId);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _KindBadge(kind: invite.kind),
                        const Spacer(),
                        Text(
                          'Invited by ${ownerProfile.name}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      invite.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      invite.kind == RelationshipKind.group
                          ? 'Join the group and start shaping agreements together.'
                          : 'Accept to make this shared relationship active.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 18),
                    FilledButton.icon(
                      onPressed: () => store.acceptInvite(invite.id),
                      icon: const Icon(Icons.check_rounded),
                      label: const Text('Accept invitation'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MePage extends StatelessWidget {
  const MePage({super.key, required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final user = store.currentUser.value!;
        final selfRelationship = store.relationships.firstWhere(
          (relationship) => relationship.kind == RelationshipKind.self,
        );
        final me = store.currentMember(selfRelationship)!;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _EmojiAvatar(emoji: user.avatarEmoji, size: 60),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.tagline,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _StatPill(
                          icon: Icons.nest_cam_wired_stand_outlined,
                          label: '${me.essentials.length} essentials',
                        ),
                        _StatPill(icon: Icons.tune_rounded, label: '${me.preferences.length} preferences'),
                        _StatPill(
                          icon: Icons.favorite_rounded,
                          label: '${store.relationships.length} relationships',
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Relathy starts with the relationship you have with yourself. This space gives you a quiet place to define what matters before you ask others to meet you there.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.78),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _SectionIntroCard(
              title: 'Personal essentials preview',
              subtitle: me.essentials.isEmpty
                  ? 'Add a few practical essentials in your self relationship.'
                  : me.essentials.map((e) => e.title).take(3).join(' • '),
              icon: Icons.spa_rounded,
            ),
          ],
        );
      },
    );
  }
}

class _HeroSummaryCard extends StatelessWidget {
  const _HeroSummaryCard({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    final member = store.currentMember(relationship)!;
    final accepted = relationship.members.where((item) => item.status == MembershipStatus.accepted).length;
    final pending = relationship.members.where((item) => item.status == MembershipStatus.pending).length;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.16),
            Theme.of(context).colorScheme.secondary.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _KindBadge(kind: relationship.kind),
              const Spacer(),
              if (member.status == MembershipStatus.pending) Chip(label: const Text('Pending acceptance')),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            relationship.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Text(
            _relationshipSummary(relationship.kind),
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75), height: 1.5),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _StatPill(icon: Icons.people_alt_outlined, label: '$accepted accepted'),
              if (pending > 0) _StatPill(icon: Icons.timelapse_rounded, label: '$pending pending'),
              _StatPill(icon: Icons.rule_rounded, label: '${relationship.agreements.length} agreements'),
              _StatPill(icon: Icons.campaign_outlined, label: '${relationship.requests.length} requests'),
            ],
          ),
        ],
      ),
    );
  }

  String _relationshipSummary(RelationshipKind kind) {
    switch (kind) {
      case RelationshipKind.self:
        return 'Your personal space to define essentials, preferences, and requests to yourself.';
      case RelationshipKind.pair:
        return 'A shared space for two people to create explicit agreements and make caring requests.';
      case RelationshipKind.group:
        return 'A shared group container for clarity, mutual expectations, and direct communication.';
    }
  }
}

class _RelationshipMiniCard extends StatelessWidget {
  const _RelationshipMiniCard({
    required this.relationship,
    required this.userCount,
    required this.isSelected,
    required this.isPending,
    required this.onTap,
  });

  final Relationship relationship;
  final int userCount;
  final bool isSelected;
  final bool isPending;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 240,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.14)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.28)
                : Theme.of(context).colorScheme.outlineVariant.withOpacity(0.22),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _KindBadge(kind: relationship.kind),
                const Spacer(),
                if (isPending) const Icon(Icons.schedule_rounded, size: 18),
              ],
            ),
            const Spacer(),
            Text(
              relationship.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '$userCount members • ${relationship.requests.length} requests',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.68)),
            ),
          ],
        ),
      ),
    );
  }
}

class _PendingInviteBanner extends StatelessWidget {
  const _PendingInviteBanner({required this.relationship, required this.onAccept});

  final Relationship relationship;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.mail_outline_rounded),
                SizedBox(width: 10),
                Text('Invitation pending', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Accept this invitation to join ${relationship.title} and start contributing your essentials, preferences, agreement votes, and requests.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
                height: 1.45,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onAccept,
              icon: const Icon(Icons.check_circle_outline_rounded),
              label: const Text('Accept and continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RelationshipDetailCard extends StatelessWidget {
  const _RelationshipDetailCard({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(
          builder: (_) {
            switch (store.selectedArea.value) {
              case RelationshipArea.essentials:
                return _EssentialsSection(store: store, relationship: relationship);
              case RelationshipArea.agreements:
                return _AgreementsSection(store: store, relationship: relationship);
              case RelationshipArea.preferences:
                return _PreferencesSection(store: store, relationship: relationship);
              case RelationshipArea.requests:
                return _RequestsSection(store: store, relationship: relationship);
            }
          },
        ),
      ),
    );
  }
}

class _EssentialsSection extends StatelessWidget {
  const _EssentialsSection({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    final member = store.currentMember(relationship)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Essentials',
          subtitle: 'What truly matters to you here: needs, boundaries, and practical non-negotiables.',
          actionLabel: 'Add essential',
          onPressed: () => _showEssentialDialog(context, store),
        ),
        const SizedBox(height: 16),
        if (member.essentials.isEmpty)
          const _EmptyState(
            icon: Icons.spa_outlined,
            title: 'No essentials yet',
            subtitle: 'Start with one clear thing that helps this relationship feel safe and workable.',
          )
        else
          Column(
            children: member.essentials
                .map(
                  (essential) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _EssentialTile(store: store, node: essential, depth: 0),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _showEssentialDialog(BuildContext context, AppStore store, {String? parentId, String? parentTitle}) {
    final controller = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(28),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parentId == null ? 'Add an essential' : 'Add detail under "$parentTitle"',
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Keep it specific and practical, so someone else could actually understand and respond to it.',
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Example: I need 24 hours before resolving conflict by text.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        store.addEssential(controller.text, parentId: parentId);
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text('Save essential'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EssentialTile extends StatelessWidget {
  const _EssentialTile({required this.store, required this.node, required this.depth});

  final AppStore store;
  final EssentialNode node;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final section = _EssentialsSection(store: store, relationship: store.selectedRelationship!);
    return Container(
      margin: EdgeInsets.only(left: depth * 16.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.28),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(node.title, style: const TextStyle(fontWeight: FontWeight.w700, height: 1.4)),
              ),
              IconButton(
                onPressed: () =>
                    section._showEssentialDialog(context, store, parentId: node.id, parentTitle: node.title),
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
            ],
          ),
          if (node.children.isNotEmpty) ...[
            const SizedBox(height: 8),
            Column(
              children: node.children
                  .map(
                    (child) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _EssentialTile(store: store, node: child, depth: depth + 1),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _PreferencesSection extends StatelessWidget {
  const _PreferencesSection({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    final member = store.currentMember(relationship)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Preferences',
          subtitle: 'Helpful details that make day-to-day relating easier, softer, and clearer.',
          actionLabel: 'Add preference',
          onPressed: () => _showAddPreference(context, store),
        ),
        const SizedBox(height: 16),
        if (member.preferences.isEmpty)
          const _EmptyState(
            icon: Icons.tune_rounded,
            title: 'No preferences yet',
            subtitle:
                'Preferences are not demands — they simply help others understand how you best connect.',
          )
        else
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: member.preferences
                .map(
                  (item) => Container(
                    constraints: const BoxConstraints(minWidth: 180, maxWidth: 340),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.28),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(item, style: const TextStyle(height: 1.4, fontWeight: FontWeight.w600)),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _showAddPreference(BuildContext context, AppStore store) {
    final controller = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Add a preference', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                const SizedBox(height: 8),
                const Text('Example: I prefer hearing a heads-up before plans change.'),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  maxLines: 3,
                  decoration: const InputDecoration(hintText: 'Write your preference'),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      store.addPreference(controller.text);
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Save preference'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AgreementsSection extends StatelessWidget {
  const _AgreementsSection({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Agreements',
          subtitle: 'Shared principles that everyone can see, respond to, and refine together.',
          actionLabel: 'Propose agreement',
          onPressed: () => _showAddAgreement(context, store),
        ),
        const SizedBox(height: 16),
        if (relationship.agreements.isEmpty)
          const _EmptyState(
            icon: Icons.handshake_outlined,
            title: 'No agreements yet',
            subtitle: 'Create one simple agreement to define how this relationship wants to function.',
          )
        else
          Column(
            children: relationship.agreements
                .map(
                  (agreement) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _AgreementCard(store: store, relationship: relationship, agreement: agreement),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _showAddAgreement(BuildContext context, AppStore store) {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Propose an agreement',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                const SizedBox(height: 8),
                const Text('Example: We name tension directly instead of going distant.'),
                const SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Agreement title'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: detailsController,
                  maxLines: 4,
                  decoration: const InputDecoration(labelText: 'Why this matters'),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      store.addAgreement(title: titleController.text, description: detailsController.text);
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Create agreement'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AgreementCard extends StatelessWidget {
  const _AgreementCard({required this.store, required this.relationship, required this.agreement});

  final AppStore store;
  final Relationship relationship;
  final Agreement agreement;

  @override
  Widget build(BuildContext context) {
    final currentUserId = store.currentUser.value!.id;
    final currentVote = agreement.votes[currentUserId] ?? AgreementVote.pending;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.28),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(agreement.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
          const SizedBox(height: 8),
          Text(
            agreement.description,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.76), height: 1.45),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: relationship.members.where((member) => member.status == MembershipStatus.accepted).map((
              member,
            ) {
              final user = store.userById(member.userId);
              final vote = agreement.votes[member.userId] ?? AgreementVote.pending;
              return Chip(avatar: Text(user.avatarEmoji), label: Text('${user.name} • ${vote.label}'));
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text('Your response', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AgreementVote.values
                .map(
                  (vote) => ChoiceChip(
                    selected: currentVote == vote,
                    label: Text(vote.label),
                    onSelected: (_) => store.voteAgreement(agreement.id, vote),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _RequestsSection extends StatelessWidget {
  const _RequestsSection({required this.store, required this.relationship});

  final AppStore store;
  final Relationship relationship;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          title: 'Requests',
          subtitle: 'Specific, current asks between members when something needs care, attention, or change.',
          actionLabel: 'New request',
          onPressed: () => _showAddRequest(context, store, relationship),
        ),
        const SizedBox(height: 16),
        if (relationship.requests.isEmpty)
          const _EmptyState(
            icon: Icons.favorite_border_rounded,
            title: 'No requests yet',
            subtitle:
                'Requests help people move from tension or ambiguity into something clear and actionable.',
          )
        else
          Column(
            children: relationship.requests
                .map(
                  (request) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RequestCard(store: store, request: request),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  void _showAddRequest(BuildContext context, AppStore store, Relationship relationship) {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();
    final currentUserId = store.currentUser.value!.id;
    final recipients = <String>{if (relationship.kind == RelationshipKind.self) currentUserId};

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final members = relationship.members
                .where((member) => member.status == MembershipStatus.accepted)
                .toList();
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Material(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(28),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create a request',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      const Text('Make it specific, actionable, and connected to what needs care right now.'),
                      const SizedBox(height: 16),
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Request title'),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: detailsController,
                        maxLines: 4,
                        decoration: const InputDecoration(labelText: 'More context'),
                      ),
                      const SizedBox(height: 16),
                      const Text('Directed to', style: TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: members.map((member) {
                          final user = store.userById(member.userId);
                          final isSelected = recipients.contains(user.id);
                          final selectable =
                              relationship.kind == RelationshipKind.self || user.id != currentUserId;
                          return FilterChip(
                            selected: isSelected,
                            label: Text(user.id == currentUserId ? '${user.name} (me)' : user.name),
                            avatar: Text(user.avatarEmoji),
                            onSelected: !selectable
                                ? null
                                : (selected) {
                                    setSheetState(() {
                                      if (selected) {
                                        recipients.add(user.id);
                                      } else {
                                        recipients.remove(user.id);
                                      }
                                    });
                                  },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: recipients.isEmpty
                              ? null
                              : () {
                                  store.addRequest(
                                    title: titleController.text,
                                    details: detailsController.text,
                                    recipients: recipients.toList(),
                                  );
                                  Navigator.pop(context);
                                },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('Send request'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard({required this.store, required this.request});

  final AppStore store;
  final RelationshipRequest request;

  @override
  Widget build(BuildContext context) {
    final sender = store.userById(request.fromUserId);
    final recipients = request.toUserIds.map(store.userById).toList();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.28),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _RequestStateChip(state: request.state),
              const Spacer(),
              Text(
                _timeAgo(request.createdAt),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.64),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(request.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
          const SizedBox(height: 8),
          Text(
            request.details,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.76), height: 1.45),
          ),
          const SizedBox(height: 14),
          Text(
            'From ${sender.name} → ${recipients.map((user) => user.id == store.currentUser.value!.id ? '${user.name} (me)' : user.name).join(', ')}',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => store.advanceRequestState(request.id),
            icon: const Icon(Icons.loop_rounded),
            label: const Text('Advance status'),
          ),
        ],
      ),
    );
  }
}

class _SectionSwitch extends StatelessWidget {
  const _SectionSwitch({required this.store});

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SegmentedButton<RelationshipArea>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(
              value: RelationshipArea.essentials,
              label: Text('Essentials'),
              icon: Icon(Icons.spa_outlined),
            ),
            ButtonSegment(
              value: RelationshipArea.agreements,
              label: Text('Agreements'),
              icon: Icon(Icons.handshake_outlined),
            ),
            ButtonSegment(
              value: RelationshipArea.preferences,
              label: Text('Preferences'),
              icon: Icon(Icons.tune_rounded),
            ),
            ButtonSegment(
              value: RelationshipArea.requests,
              label: Text('Requests'),
              icon: Icon(Icons.campaign_outlined),
            ),
          ],
          selected: {store.selectedArea.value},
          onSelectionChanged: (selection) => store.selectArea(selection.first),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.72),
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        FilledButton.tonalIcon(
          onPressed: onPressed,
          icon: const Icon(Icons.add_rounded),
          label: Text(actionLabel),
        ),
      ],
    );
  }
}

class _SectionIntroCard extends StatelessWidget {
  const _SectionIntroCard({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.12),
            Theme.of(context).colorScheme.tertiary.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.72),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.2),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Icon(icon, size: 34),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.72), height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _KindBadge extends StatelessWidget {
  const _KindBadge({required this.kind});

  final RelationshipKind kind;

  @override
  Widget build(BuildContext context) {
    final icon = switch (kind) {
      RelationshipKind.self => Icons.self_improvement_rounded,
      RelationshipKind.pair => Icons.favorite_outline_rounded,
      RelationshipKind.group => Icons.groups_2_outlined,
    };

    final label = switch (kind) {
      RelationshipKind.self => 'Self',
      RelationshipKind.pair => 'Pair',
      RelationshipKind.group => 'Group',
    };

    return Chip(avatar: Icon(icon, size: 18), label: Text(label));
  }
}

class _RequestStateChip extends StatelessWidget {
  const _RequestStateChip({required this.state});

  final RequestState state;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(state.label),
      avatar: Icon(switch (state) {
        RequestState.open => Icons.mark_email_unread_outlined,
        RequestState.inProgress => Icons.timelapse_rounded,
        RequestState.resolved => Icons.check_circle_outline_rounded,
      }, size: 18),
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _PillLabel extends StatelessWidget {
  const _PillLabel({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({required this.label, required this.icon, required this.onTap});

  final String label;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const Icon(Icons.arrow_forward_rounded, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

class _LetterBadge extends StatelessWidget {
  const _LetterBadge({required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        letter,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _EmojiAvatar extends StatelessWidget {
  const _EmojiAvatar({required this.emoji, this.size = 48});

  final String emoji;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.14),
        borderRadius: BorderRadius.circular(size / 2.2),
      ),
      child: Text(emoji, style: TextStyle(fontSize: size * 0.42)),
    );
  }
}

class _AuroraBackground extends StatelessWidget {
  const _AuroraBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: const [
          _BlurOrb(alignment: Alignment(-0.9, -0.8), color: Color(0xFF7C4DFF), size: 280),
          _BlurOrb(alignment: Alignment(1.0, -0.5), color: Color(0xFF00BCD4), size: 240),
          _BlurOrb(alignment: Alignment(-0.2, 0.9), color: Color(0xFFFF6B9E), size: 300),
        ],
      ),
    );
  }
}

class _BlurOrb extends StatelessWidget {
  const _BlurOrb({required this.alignment, required this.color, required this.size});

  final Alignment alignment;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.34)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

extension on AgreementVote {
  String get label {
    switch (this) {
      case AgreementVote.pending:
        return 'Pending';
      case AgreementVote.agree:
        return 'Agree';
      case AgreementVote.disagree:
        return 'Disagree';
      case AgreementVote.discussMore:
        return 'Discuss more';
    }
  }
}

extension on RequestState {
  String get label {
    switch (this) {
      case RequestState.open:
        return 'Open';
      case RequestState.inProgress:
        return 'In progress';
      case RequestState.resolved:
        return 'Resolved';
    }
  }
}

String _timeAgo(DateTime dateTime) {
  final difference = DateTime.now().difference(dateTime);
  if (difference.inDays >= 1) return '${difference.inDays}d ago';
  if (difference.inHours >= 1) return '${difference.inHours}h ago';
  if (difference.inMinutes >= 1) return '${difference.inMinutes}m ago';
  return 'just now';
}

extension<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
