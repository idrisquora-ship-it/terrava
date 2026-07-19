class ConversationSummary {
  const ConversationSummary({
    required this.id,
    required this.listingId,
    required this.listingTitle,
    required this.otherUserId,
    this.otherUserName,
    this.lastMessage,
    this.lastMessageAt,
  });

  final String id;
  final String listingId;
  final String listingTitle;
  final String otherUserId;
  final String? otherUserName;
  final String? lastMessage;
  final DateTime? lastMessageAt;
}

enum ChatMediaType { image, video }

class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.body,
    this.mediaUrl,
    this.mediaType,
    required this.createdAt,
  });

  final String id;
  final String conversationId;
  final String senderId;
  final String body;
  final String? mediaUrl;
  final ChatMediaType? mediaType;
  final DateTime createdAt;

  bool get hasMedia => mediaUrl != null && mediaUrl!.isNotEmpty;

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final mediaTypeRaw = json['media_type'] as String?;
    return ChatMessage(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      senderId: json['sender_id'] as String,
      body: json['body'] as String? ?? '',
      mediaUrl: json['media_url'] as String?,
      mediaType: switch (mediaTypeRaw) {
        'image' => ChatMediaType.image,
        'video' => ChatMediaType.video,
        _ => null,
      },
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
    );
  }
}
