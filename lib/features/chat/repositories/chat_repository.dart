import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_client.dart';
import '../models/chat_models.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepository(ref.watch(supabaseClientProvider));
});

class ChatRepository {
  ChatRepository(this._client);

  final SupabaseClient? _client;

  SupabaseClient get _db {
    final c = _client;
    if (c == null) throw StateError('Supabase is not configured');
    return c;
  }

  Future<String> startConversation({
    required String listingId,
    required String ownerUserId,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    if (uid == ownerUserId) {
      throw StateError('You cannot message your own listing');
    }

    final existing = await _db
        .from('conversations')
        .select('id')
        .eq('listing_id', listingId)
        .eq('created_by', uid)
        .limit(1);
    if (existing.isNotEmpty) {
      return existing.first['id'] as String;
    }

    final conv = await _db
        .from('conversations')
        .insert({
          'listing_id': listingId,
          'created_by': uid,
        })
        .select('id')
        .single();
    final conversationId = conv['id'] as String;

    await _db.from('conversation_participants').insert([
      {'conversation_id': conversationId, 'user_id': uid},
      {'conversation_id': conversationId, 'user_id': ownerUserId},
    ]);

    return conversationId;
  }

  Future<List<ConversationSummary>> inbox() async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) return [];

    final parts = await _db
        .from('conversation_participants')
        .select('conversation_id')
        .eq('user_id', uid);
    final ids = parts
        .map((p) => p['conversation_id'] as String)
        .toList();
    if (ids.isEmpty) return [];

    final conversations = await _db
        .from('conversations')
        .select('id, listing_id, created_by, listings(title, owner_user_id)')
        .inFilter('id', ids)
        .order('created_at', ascending: false);

    final summaries = <ConversationSummary>[];
    for (final raw in conversations) {
      final map = Map<String, dynamic>.from(raw);
      final conversationId = map['id'] as String;
      final listingId = map['listing_id'] as String;
      final listing = map['listings'] as Map<String, dynamic>?;
      final listingTitle = listing?['title'] as String? ?? 'Listing';
      final ownerId = listing?['owner_user_id'] as String? ?? '';

      final participants = await _db
          .from('conversation_participants')
          .select('user_id')
          .eq('conversation_id', conversationId);
      final otherId = participants
          .map((p) => p['user_id'] as String)
          .firstWhere((id) => id != uid, orElse: () => ownerId);

      String? otherName;
      if (otherId.isNotEmpty) {
        final profiles = await _db
            .from('profiles')
            .select('display_name')
            .eq('id', otherId)
            .limit(1);
        if (profiles.isNotEmpty) {
          otherName = profiles.first['display_name'] as String?;
        }
      }

      final msgs = await _db
          .from('messages')
          .select('body, media_type, created_at')
          .eq('conversation_id', conversationId)
          .order('created_at', ascending: false)
          .limit(1);

      String? lastPreview;
      if (msgs.isNotEmpty) {
        final last = msgs.first;
        final body = (last['body'] as String?)?.trim() ?? '';
        if (body.isNotEmpty) {
          lastPreview = body;
        } else if (last['media_type'] == 'video') {
          lastPreview = '🎬 Video';
        } else if (last['media_type'] == 'image') {
          lastPreview = '📷 Photo';
        }
      }

      summaries.add(
        ConversationSummary(
          id: conversationId,
          listingId: listingId,
          listingTitle: listingTitle,
          otherUserId: otherId,
          otherUserName: otherName,
          lastMessage: lastPreview,
          lastMessageAt: msgs.isEmpty
              ? null
              : DateTime.tryParse(msgs.first['created_at']?.toString() ?? ''),
        ),
      );
    }

    summaries.sort((a, b) {
      final at = a.lastMessageAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bt = b.lastMessageAt ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bt.compareTo(at);
    });
    return summaries;
  }

  Future<List<ChatMessage>> messages(String conversationId) async {
    final rows = await _db
        .from('messages')
        .select()
        .eq('conversation_id', conversationId)
        .order('created_at');
    return rows
        .map((r) => ChatMessage.fromJson(Map<String, dynamic>.from(r)))
        .toList();
  }

  Future<ChatMessage> sendMessage({
    required String conversationId,
    String body = '',
    String? mediaUrl,
    ChatMediaType? mediaType,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    final trimmed = body.trim();
    if (trimmed.isEmpty && (mediaUrl == null || mediaUrl.isEmpty)) {
      throw StateError('Message is empty');
    }
    final row = await _db
        .from('messages')
        .insert({
          'conversation_id': conversationId,
          'sender_id': uid,
          'body': trimmed,
          if (mediaUrl != null) 'media_url': mediaUrl,
          if (mediaType != null) 'media_type': mediaType.name,
        })
        .select()
        .single();
    return ChatMessage.fromJson(Map<String, dynamic>.from(row));
  }

  Future<String> uploadMedia({
    required String conversationId,
    required Uint8List bytes,
    required String ext,
    required ChatMediaType mediaType,
  }) async {
    final uid = _db.auth.currentUser?.id;
    if (uid == null) throw StateError('Sign in required');
    final normalized = ext.toLowerCase().replaceAll('.', '');
    final contentType = switch (normalized) {
      'png' => 'image/png',
      'webp' => 'image/webp',
      'mp4' => 'video/mp4',
      'mov' => 'video/quicktime',
      'webm' => 'video/webm',
      _ => mediaType == ChatMediaType.video ? 'video/mp4' : 'image/jpeg',
    };
    final path =
        '$uid/$conversationId/${DateTime.now().millisecondsSinceEpoch}.$normalized';
    await _db.storage.from('chat-media').uploadBinary(
          path,
          bytes,
          fileOptions: FileOptions(upsert: true, contentType: contentType),
        );
    return _db.storage.from('chat-media').getPublicUrl(path);
  }

  RealtimeChannel subscribeMessages({
    required String conversationId,
    required void Function(ChatMessage message) onInsert,
  }) {
    final channel = _db.channel('messages-$conversationId');
    channel
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'conversation_id',
            value: conversationId,
          ),
          callback: (payload) {
            final row = payload.newRecord;
            onInsert(ChatMessage.fromJson(Map<String, dynamic>.from(row)));
          },
        )
        .subscribe();
    return channel;
  }
}
