import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_download.dart';
import '../../core/theme/app_tokens.dart';

/// Shows the website APK install prompt (web only).
Future<void> showAppDownloadDialog(BuildContext context) async {
  if (!kIsWeb) return;
  if (!context.mounted) return;

  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      final theme = Theme.of(ctx);
      return AlertDialog(
        title: const Text('Get Terrava on Android'),
        content: const Text(
          'For the best experience, install the Terrava Android app. '
          'You can keep using the website anytime.',
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actionsPadding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.md,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Not now',
              style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
          FilledButton.icon(
            onPressed: () async {
              final uri = Uri.base.resolve(kAndroidApkDownloadPath);
              await launchUrl(uri, webOnlyWindowName: '_self');
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            icon: const Icon(Icons.download_rounded),
            label: const Text('Download APK'),
          ),
        ],
      );
    },
  );
}
