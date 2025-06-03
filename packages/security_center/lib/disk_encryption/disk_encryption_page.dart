import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
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
          final dataAsync = ref.watch(systemContainersModelProvider);
          return dataAsync.when(
            loading: () => AlertDialog(
              title: YaruDialogTitleBar(
                title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
              ),
              titlePadding: EdgeInsets.zero,
              content: SizedBox(
                width: 450,
                height: 80,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            error: (e, _) => AlertDialog(
              title: const Text('Error'),
              content: Text(e.toString()),
            ),
            data: (data) {
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
                          hintText:
                              'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX',
                        ),
                        onChanged: ref
                            .read(systemContainersModelProvider.notifier)
                            .setRecoveryKeyToCheck,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: data.recoveryKeyToCheck.isEmpty ||
                                  data.validKey != null
                              ? null
                              : () async {
                                  final notifier = ref.read(
                                    systemContainersModelProvider.notifier,
                                  );
                                  await notifier.checkRecoveryKey(
                                    data.recoveryKeyToCheck,
                                  );
                                },
                          child: Text(l10n.diskEncryptionPageCheck),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (data.validKey == null) ...[
                        SizedBox.shrink(),
                      ] else if (data.validKey!) ...[
                        YaruInfoBox(
                          title: Text(l10n.diskEncryptionPageKeyWorks),
                          subtitle: Text(l10n.diskEncryptionPageKeyWorksBody),
                          yaruInfoType: YaruInfoType.success,
                        ),
                      ] else ...[
                        YaruInfoBox(
                          title: Text(l10n.diskEncryptionPageKeyDoesntWork),
                          subtitle: Text(
                            l10n.diskEncryptionPageKeyDoesntWorkBody,
                          ),
                          yaruInfoType: YaruInfoType.danger,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
