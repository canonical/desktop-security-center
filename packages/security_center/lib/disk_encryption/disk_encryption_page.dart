import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
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
    return ScrollablePage(
      children: [
        Text('Recovery key', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Text(
          'You should always store the recovery key for your encrypted disk somewhere safe to avoid losing access to all your data.',
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            showRecoveryKeyDialog(context);
          },
          child: const Text('Check recovery key...'),
        ),
      ],
    );
  }
}

void showRecoveryKeyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (ctx, ref, _) {
          final dataAsync = ref.watch(systemContainersModelProvider);
          return dataAsync.when(
            loading: () => const AlertDialog(
              title: Text('Check Recovery Key'),
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
                title: const Text('Check Recovery Key'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Recovery Key',
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
                          color: data.dialogStatusMessage == 'Valid key'
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
                        valid ? 'Valid key' : 'Invalid key',
                      );
                      notifier.setIsChecking(false);
                    },
                    child: const Text('Check'),
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
