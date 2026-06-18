import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/constants.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:yaru/yaru.dart';

class DetachDialog extends ConsumerStatefulWidget {
  const DetachDialog({super.key});

  @override
  ConsumerState<DetachDialog> createState() => _DetachDialogState();
}

class _DetachDialogState extends ConsumerState<DetachDialog> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProDisablePro),
      ),
      titlePadding: EdgeInsets.zero,
      actions: [
        OutlinedButton(
          onPressed: _loading ? null : Navigator.of(context).pop,
          child: Text(l10n.ubuntuProCancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.error,
          ),
          onPressed: _loading
              ? null
              : () async {
                  setState(() => _loading = true);
                  await ref.read(ubuntuProPageModelProvider.notifier).detach();
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                },
          child: _loading
              ? SizedBox.square(
                  dimension: theme.textTheme.bodyMedium?.fontSize,
                  child: const YaruCircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.ubuntuProDisable),
        ),
      ],
      content: Container(
        constraints: BoxConstraints(maxWidth: kDialogWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.ubuntuProDisablePrompt),
          ],
        ),
      ),
    );
  }
}
