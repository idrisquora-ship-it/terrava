import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../auth/controllers/auth_controller.dart';
import '../models/chat_models.dart';
import '../repositories/chat_repository.dart';

class ChatThreadScreen extends ConsumerStatefulWidget {
  const ChatThreadScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  ConsumerState<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

class _ChatThreadScreenState extends ConsumerState<ChatThreadScreen> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();
  final List<ChatMessage> _messages = [];
  RealtimeChannel? _channel;
  bool _loading = true;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    try {
      final rows = await ref
          .read(chatRepositoryProvider)
          .messages(widget.conversationId);
      if (!mounted) return;
      setState(() {
        _messages
          ..clear()
          ..addAll(rows);
        _loading = false;
      });
      _channel = ref.read(chatRepositoryProvider).subscribeMessages(
            conversationId: widget.conversationId,
            onInsert: (message) {
              if (!mounted) return;
              if (_messages.any((m) => m.id == message.id)) return;
              setState(() => _messages.add(message));
              _scrollToEnd();
            },
          );
      _scrollToEnd();
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final me = ref.watch(currentUserProvider)?.id;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.chatThreadTitle),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                    ? Center(child: Text(l10n.chatNoMessagesYet))
                    : ListView.builder(
                        controller: _scroll,
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final m = _messages[index];
                          final mine = m.senderId == me;
                          return Align(
                            alignment: mine
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: AppSpacing.sm),
                              padding: const EdgeInsets.all(AppSpacing.md),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.75,
                              ),
                              decoration: BoxDecoration(
                                color: mine
                                    ? theme.colorScheme.primaryContainer
                                    : theme.cardTheme.color,
                                borderRadius: AppRadius.mdAll,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (m.hasMedia &&
                                      m.mediaType == ChatMediaType.image)
                                    GestureDetector(
                                      onTap: () => _openUrl(m.mediaUrl!),
                                      child: ClipRRect(
                                        borderRadius: AppRadius.smAll,
                                        child: CachedNetworkImage(
                                          imageUrl: m.mediaUrl!,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  if (m.hasMedia &&
                                      m.mediaType == ChatMediaType.video)
                                    InkWell(
                                      onTap: () => _openUrl(m.mediaUrl!),
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(
                                          AppSpacing.lg,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.surface,
                                          borderRadius: AppRadius.smAll,
                                        ),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.play_circle_fill_rounded,
                                              size: 48,
                                            ),
                                            const SizedBox(height: AppSpacing.xs),
                                            Text(l10n.chatOpenVideo),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (m.body.isNotEmpty) ...[
                                    if (m.hasMedia)
                                      const SizedBox(height: AppSpacing.sm),
                                    Text(m.body),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.md,
              ),
              child: Row(
                children: [
                  IconButton(
                    tooltip: l10n.chatAttachMedia,
                    onPressed: _sending ? null : _pickMedia,
                    icon: const Icon(Icons.attach_file_rounded),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _send(),
                      decoration: InputDecoration(
                        hintText: l10n.chatInputHint,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  IconButton.filled(
                    onPressed: _sending ? null : _send,
                    icon: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _pickMedia() async {
    final l10n = context.l10n;
    final choice = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_outlined),
              title: Text(l10n.chatAttachImage),
              onTap: () => Navigator.pop(context, 'image'),
            ),
            ListTile(
              leading: const Icon(Icons.videocam_outlined),
              title: Text(l10n.chatAttachVideo),
              onTap: () => Navigator.pop(context, 'video'),
            ),
          ],
        ),
      ),
    );
    if (choice == null || !mounted) return;

    final picker = ImagePicker();
    final file = choice == 'video'
        ? await picker.pickVideo(
            source: ImageSource.gallery,
            maxDuration: const Duration(minutes: 2),
          )
        : await picker.pickImage(
            source: ImageSource.gallery,
            maxWidth: 1600,
            imageQuality: 85,
          );
    if (file == null || !mounted) return;

    setState(() => _sending = true);
    try {
      final bytes = await file.readAsBytes();
      final name = file.name.toLowerCase();
      final mediaType =
          choice == 'video' ? ChatMediaType.video : ChatMediaType.image;
      final ext = choice == 'video'
          ? (name.endsWith('.mov')
              ? 'mov'
              : name.endsWith('.webm')
                  ? 'webm'
                  : 'mp4')
          : (name.endsWith('.png')
              ? 'png'
              : name.endsWith('.webp')
                  ? 'webp'
                  : 'jpg');
      final repo = ref.read(chatRepositoryProvider);
      final url = await repo.uploadMedia(
        conversationId: widget.conversationId,
        bytes: bytes,
        ext: ext,
        mediaType: mediaType,
      );
      final caption = _controller.text.trim();
      final msg = await repo.sendMessage(
        conversationId: widget.conversationId,
        body: caption,
        mediaUrl: url,
        mediaType: mediaType,
      );
      _controller.clear();
      if (!_messages.any((m) => m.id == msg.id)) {
        setState(() => _messages.add(msg));
      }
      _scrollToEnd();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatSendFailed)),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      final msg = await ref.read(chatRepositoryProvider).sendMessage(
            conversationId: widget.conversationId,
            body: text,
          );
      _controller.clear();
      if (!_messages.any((m) => m.id == msg.id)) {
        setState(() => _messages.add(msg));
      }
      _scrollToEnd();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatSendFailed)),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }
}
