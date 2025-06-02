import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/widgets/scrollable_page.dart';

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
          final dataAsync = ref.watch(systemContainersModelProvider);
          return dataAsync.when(
            loading: () => AlertDialog(
              title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
              content: SizedBox(
                height: 80,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            error: (e, _) => AlertDialog(
              title: const Text('Something went wrong'),
              content: Text(e.toString()),
            ),
            data: (data) {
              return AlertDialog(
                title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.diskEncryptionPageRecoveryKey,
                      ),
                      onChanged: ref
                          .read(systemContainersModelProvider.notifier)
                          .setRecoveryKeyToCheck,
                    ),
                    const SizedBox(height: 16),
                    if (data.dialogStatusMessage != null)
                      Text(
                        data.dialogStatusMessage!,
                        style: TextStyle(
                          color: data.dialogStatusMessage ==
                                  l10n.diskEncryptionPageValidKey
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      final notifier = ref.read(
                        systemContainersModelProvider.notifier,
                      );
                      notifier.setIsChecking(true);
                      final valid = await notifier.checkRecoveryKey(
                        data.recoveryKeyToCheck,
                      );
                      notifier.setDialogStatusMessage(
                        valid
                            ? l10n.diskEncryptionPageValidKey
                            : l10n.diskEncryptionPageInvalidKey,
                      );
                      notifier.setIsChecking(false);
                    },
                    child: Text(l10n.diskEncryptionPageCheck),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
