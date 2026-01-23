import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:yaru/yaru.dart';

class DetachDialog extends ConsumerWidget {
  const DetachDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProDisable),
      ),
      titlePadding: EdgeInsets.zero,
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(l10n.ubuntuProCancel),
        ),
        FilledButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: YaruColors.red,
          ),
          onPressed: () async {
            await ref.read(ubuntuProModelProvider.notifier).detach();
          },
          child: Text(l10n.ubuntuProDisable),
        ),
      ],
      content: SizedBox(
        width: 500,
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
