import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/constants.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:yaru/yaru.dart';

class DetachDialog extends ConsumerWidget {
  const DetachDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final provider = ref.watch(ubuntuProAttachModelProvider);

    if (provider.state is UbuntuProAttachStateSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProDisablePro),
      ),
      titlePadding: EdgeInsets.zero,
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(l10n.ubuntuProCancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.error,
          ),
          onPressed: provider.state is UbuntuProAttachStateLoading
              ? null
              : () async {
                  await ref
                      .read(ubuntuProAttachModelProvider.notifier)
                      .detach();
                },
          child: provider.state is UbuntuProAttachStateLoading
              ? SizedBox.square(
                  dimension: theme.textTheme.bodyMedium?.fontSize,
                  child: YaruCircularProgressIndicator(
                    strokeWidth: 2,
                  ),
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
