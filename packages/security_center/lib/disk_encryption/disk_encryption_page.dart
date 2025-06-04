import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:yaru/yaru.dart';

class DiskEncryptionPage extends ConsumerWidget {
  const DiskEncryptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ScrollablePage(
      children: [
        Text(
          l10n.diskEncryptionPageRecoveryKey,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Text(l10n.diskEncryptionPageStoreYourKey),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            showRecoveryKeyDialog(context);
          },
          child: Text(l10n.diskEncryptionPageCheckKey),
        ),
      ],
    );
  }
}

void showRecoveryKeyDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (ctx, ref, _) {
          final data = ref.watch(checkRecoveryKeyDialogModelProvider);
          final notifier = ref.read(
            checkRecoveryKeyDialogModelProvider.notifier,
          );
          return CheckRecoveryKeyDialog(
            l10n: l10n,
            data: data,
            notifier: notifier,
          );
        },
      );
    },
  );
}

class CheckRecoveryKeyDialog extends StatelessWidget {
  const CheckRecoveryKeyDialog({
    required this.l10n,
    required this.data,
    required this.notifier,
    super.key,
  });

  final AppLocalizations l10n;
  final CheckRecoveryKeyDialogState data;
  final CheckRecoveryKeyDialogModel notifier;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: l10n.diskEncryptionPageRecoveryKey,
                hintText: 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX',
              ),
              onChanged: notifier.setKeyToCheck,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: switch (data) {
                  CheckRecoveryKeyDialogStateInput() =>
                    notifier.checkRecoveryKey,
                  CheckRecoveryKeyDialogStateLoading() => null,
                  CheckRecoveryKeyDialogStateError() => null,
                  CheckRecoveryKeyDialogStateResult() => null,
                  CheckRecoveryKeyDialogStateEmpty() => null,
                },
                child: Text(l10n.diskEncryptionPageCheck),
              ),
            ),
            if (data is CheckRecoveryKeyDialogStateLoading) ...[
              const SizedBox(height: 16),
              const YaruCircularProgressIndicator(),
            ] else if (data is CheckRecoveryKeyDialogStateResult) ...[
              const SizedBox(height: 16),
              if (notifier.getCheckResult()) ...[
                YaruInfoBox(
                  title: Text(l10n.diskEncryptionPageKeyWorks),
                  subtitle: Text(l10n.diskEncryptionPageKeyWorksBody),
                  yaruInfoType: YaruInfoType.success,
                ),
              ] else ...[
                YaruInfoBox(
                  title: Text(l10n.diskEncryptionPageKeyDoesntWork),
                  subtitle: Text(l10n.diskEncryptionPageKeyDoesntWorkBody),
                  yaruInfoType: YaruInfoType.danger,
                ),
              ],
            ] else if (data is CheckRecoveryKeyDialogStateError) ...[
              const SizedBox(height: 16),
              YaruInfoBox(
                title: Text('Error'),
                subtitle: Text(notifier.getError().toString()),
                yaruInfoType: YaruInfoType.danger,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
