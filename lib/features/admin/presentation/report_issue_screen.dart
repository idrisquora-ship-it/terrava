import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n_extensions.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/terrava_app_bar.dart';
import '../../../shared/widgets/terrava_button.dart';
import '../../../shared/widgets/terrava_text_field.dart';
import '../repositories/admin_repository.dart';

class ReportIssueScreen extends ConsumerStatefulWidget {
  const ReportIssueScreen({
    super.key,
    this.relatedUserId,
    this.relatedListingId,
    this.initialSubject,
  });

  final String? relatedUserId;
  final String? relatedListingId;
  final String? initialSubject;

  @override
  ConsumerState<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends ConsumerState<ReportIssueScreen> {
  late final TextEditingController _subject;
  final _body = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _subject = TextEditingController(text: widget.initialSubject ?? '');
  }

  @override
  void dispose() {
    _subject.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: TerravaAppBar(title: l10n.reportIssueTitle),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.reportIssueIntro),
          const SizedBox(height: AppSpacing.lg),
          TerravaTextField(
            controller: _subject,
            label: l10n.reportIssueSubject,
          ),
          const SizedBox(height: AppSpacing.md),
          TerravaTextField(
            controller: _body,
            label: l10n.reportIssueBody,
            maxLines: 6,
          ),
          const SizedBox(height: AppSpacing.xl),
          TerravaButton(
            label: l10n.reportIssueSubmit,
            isLoading: _saving,
            onPressed: () async {
              if (_subject.text.trim().isEmpty || _body.text.trim().isEmpty) {
                return;
              }
              final messenger = ScaffoldMessenger.of(context);
              final navigator = Navigator.of(context);
              setState(() => _saving = true);
              try {
                await ref.read(adminRepositoryProvider).submitIssueReport(
                      subject: _subject.text,
                      body: _body.text,
                      relatedUserId: widget.relatedUserId,
                      relatedListingId: widget.relatedListingId,
                    );
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.reportIssueSubmitted)),
                );
                navigator.pop();
              } catch (_) {
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.reportIssueFailed)),
                );
              } finally {
                if (mounted) setState(() => _saving = false);
              }
            },
          ),
        ],
      ),
    );
  }
}
