import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_client.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository(ref.watch(supabaseClientProvider));
});

class AdminUserRow {
  const AdminUserRow({
    required this.id,
    this.displayName,
    required this.role,
    required this.isAdmin,
    required this.accountStatus,
    required this.verificationStatus,
    required this.verified,
    this.verificationNote,
  });

  final String id;
  final String? displayName;
  final String role;
  final bool isAdmin;
  final String accountStatus;
  final String verificationStatus;
  final bool verified;
  final String? verificationNote;

  factory AdminUserRow.fromJson(Map<String, dynamic> json) {
    return AdminUserRow(
      id: json['id'] as String,
      displayName: json['display_name'] as String?,
      role: json['role'] as String? ?? 'civilian',
      isAdmin: json['is_admin'] as bool? ?? false,
      accountStatus: json['account_status'] as String? ?? 'active',
      verificationStatus: json['verification_status'] as String? ?? 'none',
      verified: json['verified'] as bool? ?? false,
      verificationNote: json['verification_note'] as String?,
    );
  }
}

class IssueReportRow {
  const IssueReportRow({
    required this.id,
    this.reporterId,
    required this.subject,
    required this.body,
    required this.status,
    this.relatedUserId,
    this.relatedListingId,
    this.adminNotes,
    required this.createdAt,
  });

  final String id;
  final String? reporterId;
  final String subject;
  final String body;
  final String status;
  final String? relatedUserId;
  final String? relatedListingId;
  final String? adminNotes;
  final DateTime createdAt;

  factory IssueReportRow.fromJson(Map<String, dynamic> json) {
    return IssueReportRow(
      id: json['id'] as String,
      reporterId: json['reporter_id'] as String?,
      subject: json['subject'] as String? ?? '',
      body: json['body'] as String? ?? '',
      status: json['status'] as String? ?? 'open',
      relatedUserId: json['related_user_id'] as String?,
      relatedListingId: json['related_listing_id'] as String?,
      adminNotes: json['admin_notes'] as String?,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
    );
  }
}

class ListingReportRow {
  const ListingReportRow({
    required this.id,
    required this.listingId,
    required this.reporterId,
    required this.reason,
    required this.status,
    this.adminNotes,
    required this.createdAt,
  });

  final String id;
  final String listingId;
  final String reporterId;
  final String reason;
  final String status;
  final String? adminNotes;
  final DateTime createdAt;

  factory ListingReportRow.fromJson(Map<String, dynamic> json) {
    return ListingReportRow(
      id: json['id'] as String,
      listingId: json['listing_id'] as String,
      reporterId: json['reporter_id'] as String,
      reason: json['reason'] as String? ?? '',
      status: json['status'] as String? ?? 'open',
      adminNotes: json['admin_notes'] as String?,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
    );
  }
}

class AnnouncementRow {
  const AnnouncementRow({
    required this.id,
    this.authorId,
    required this.title,
    required this.body,
    required this.active,
    required this.createdAt,
  });

  final String id;
  final String? authorId;
  final String title;
  final String body;
  final bool active;
  final DateTime createdAt;

  factory AnnouncementRow.fromJson(Map<String, dynamic> json) {
    return AnnouncementRow(
      id: json['id'] as String,
      authorId: json['author_id'] as String?,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      active: json['active'] as bool? ?? true,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
    );
  }
}

class AdminRepository {
  AdminRepository(this._client);

  final SupabaseClient? _client;

  SupabaseClient get _db {
    final c = _client;
    if (c == null) throw StateError('Supabase is not configured');
    return c;
  }

  Future<List<AdminUserRow>> listUsers({String? query}) async {
    var builder = _db.from('profiles').select(
          'id, display_name, role, is_admin, account_status, '
          'verification_status, verified, verification_note',
        );
    if (query != null && query.trim().isNotEmpty) {
      builder = builder.ilike('display_name', '%${query.trim()}%');
    }
    final rows = await builder.order('created_at', ascending: false).limit(100);
    return rows
        .map((r) => AdminUserRow.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<List<AdminUserRow>> pendingVerifications() async {
    final rows = await _db
        .from('profiles')
        .select(
          'id, display_name, role, is_admin, account_status, '
          'verification_status, verified, verification_note',
        )
        .eq('verification_status', 'pending')
        .order('updated_at', ascending: false);
    return rows
        .map((r) => AdminUserRow.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<void> reviewVerification({
    required String userId,
    required bool approve,
    String? note,
  }) async {
    await _db.from('profiles').update({
      'verification_status': approve ? 'verified' : 'rejected',
      'verified': approve,
      'verification_note': note,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userId);
  }

  Future<void> setAccountStatus({
    required String userId,
    required String status,
  }) async {
    await _db.from('profiles').update({
      'account_status': status,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userId);
  }

  Future<void> setAdmin({
    required String userId,
    required bool isAdmin,
  }) async {
    await _db.from('profiles').update({
      'is_admin': isAdmin,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userId);
  }

  Future<void> softDeleteUser(String userId) async {
    await _db.from('profiles').update({
      'account_status': 'deleted',
      'display_name': 'Deleted user',
      'avatar_url': null,
      'is_admin': false,
      'verified': false,
      'verification_status': 'none',
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userId);
  }

  Future<List<IssueReportRow>> issueReports({String? status}) async {
    var builder = _db.from('issue_reports').select();
    if (status != null) builder = builder.eq('status', status);
    final rows = await builder.order('created_at', ascending: false).limit(100);
    return rows
        .map((r) => IssueReportRow.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<void> submitIssueReport({
    required String subject,
    required String body,
    String? relatedUserId,
    String? relatedListingId,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    await _db.from('issue_reports').insert({
      'reporter_id': uid,
      'subject': subject.trim(),
      'body': body.trim(),
      if (relatedUserId != null) 'related_user_id': relatedUserId,
      if (relatedListingId != null) 'related_listing_id': relatedListingId,
    });
  }

  Future<void> updateIssueStatus({
    required String id,
    required String status,
    String? adminNotes,
  }) async {
    await _db.from('issue_reports').update({
      'status': status,
      if (adminNotes != null) 'admin_notes': adminNotes,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', id);
  }

  Future<List<ListingReportRow>> listingReports({String? status}) async {
    var builder = _db.from('listing_reports').select();
    if (status != null) builder = builder.eq('status', status);
    final rows = await builder.order('created_at', ascending: false).limit(100);
    return rows
        .map((r) => ListingReportRow.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<void> updateListingReportStatus({
    required String id,
    required String status,
  }) async {
    await _db.from('listing_reports').update({
      'status': status,
    }).eq('id', id);
  }

  Future<List<AnnouncementRow>> announcements({bool adminAll = false}) async {
    var builder = _db.from('announcements').select();
    if (!adminAll) builder = builder.eq('active', true);
    final rows = await builder.order('created_at', ascending: false).limit(50);
    return rows
        .map((r) => AnnouncementRow.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<void> createAnnouncement({
    required String title,
    required String body,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    await _db.from('announcements').insert({
      'author_id': uid,
      'title': title.trim(),
      'body': body.trim(),
      'active': true,
    });
  }

  Future<void> setAnnouncementActive({
    required String id,
    required bool active,
  }) async {
    await _db.from('announcements').update({'active': active}).eq('id', id);
  }

  Future<void> requestVerification() async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    await _db.from('profiles').update({
      'verification_status': 'pending',
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', uid);
  }
}
