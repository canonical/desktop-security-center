import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/constants.dart';
import 'package:security_center/disk_encryption/disk_encryption_dialog_widgets.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/disk_encryption/recovery_key_panel.dart';
import 'package:security_center/disk_encryption/repair_dialog.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/hyperlink.dart';
import 'package:security_center/widgets/passphrase_widgets.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:yaru/yaru.dart';

class DiskEncryptionPage extends ConsumerWidget {
  const DiskEncryptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Body();
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollablePage(
      children: [
        EncryptionPageBody(),
      ],
    );
  }
}

class EncryptionPageBody extends ConsumerWidget {
  const EncryptionPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final tpmAuthenticationModel = ref.watch(tpmAuthenticationModelProvider);

    return tpmAuthenticationModel.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.needsRepair &&
                data.pendingOperation != TpmFdeOperation.repair) ...[
              _RepairBanner(tpmState: data),
              const SizedBox(height: 32),
            ],
            _AuthStatusTileList(tpmState: data),
            const SizedBox(height: 32),
            _RecoveryKeyActions(tpmState: data),
            const SizedBox(height: 32),
            // TPM Authentication specific content
            switch (data.currentAuthMode) {
              AuthMode.pin => _PinAuthenticationActions(tpmState: data),
              AuthMode.passphrase =>
                _PassphraseAuthenticationActions(tpmState: data),
              AuthMode.none => _NoneAuthenticationActions(tpmState: data),
            },
            const SizedBox(height: 32),
            Hyperlink(
              text: l10n.diskEncryptionPageLearnMore,
              url: diskEncryptionDocumentationUrl,
            ),
          ],
        );
      },
      error: (e, stack) => switch (e) {
        final SnapdStateException snapdError => YaruInfoBox(
            title: Text(snapdError.localizedHeader(l10n)),
            subtitle: _buildSnapdErrorSubtitle(context, snapdError, l10n),
            yaruInfoType: YaruInfoType.warning,
          ),
        final TpmStateException tpmError => YaruInfoBox(
            title: Text(tpmError.localizedHeader(l10n)),
            subtitle: Text(tpmError.localizedBody(l10n)),
            yaruInfoType: YaruInfoType.danger,
          ),
        _ => YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(e.toString()),
            yaruInfoType: YaruInfoType.danger,
          ),
      },
      loading: () => const YaruLinearProgressIndicator(),
    );
  }

  Widget _buildSnapdErrorSubtitle(
    BuildContext context,
    SnapdStateException error,
    AppLocalizations l10n,
  ) {
    final command = error.localizedCommand(l10n);
    if (command != null) {
      return RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(text: error.localizedBody(l10n)),
            const TextSpan(text: '\n'),
            TextSpan(
              text: command,
              // size 14 is a bit too big in monospace font from testing
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
            ),
          ],
        ),
      );
    }
    return Text(error.localizedBody(l10n));
  }
}

void showCheckRecoveryKeyDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => const CheckRecoveryKeyDialog());
}

class CheckRecoveryKeyDialog extends StatelessWidget {
  const CheckRecoveryKeyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        constraints: BoxConstraints(maxWidth: kDialogWidth),
        child: ScrollablePage(
          padding: EdgeInsets.all(kPageSectionGap),
          children: const [RecoveryKeyCheck()],
        ),
      ),
    );
  }
}

void showReplaceRecoveryKeyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const ReplaceRecoveryKeyDialog(),
  );
}

class ReplaceRecoveryKeyDialog extends ConsumerWidget {
  const ReplaceRecoveryKeyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final replaceDialogModel = ref.watch(replaceRecoveryKeyDialogModelProvider);
    final replaceDialogState = replaceDialogModel.dialogState;
    final replaceDialogError = replaceDialogModel.error;
    final replaceNotifier = ref.read(
      replaceRecoveryKeyDialogModelProvider.notifier,
    );
    final recoveryKey = ref.watch(generatedRecoveryKeyModelProvider);

    final l10n = AppLocalizations.of(context);

    // Close dialog if auth was cancelled
    if (replaceDialogState is ReplaceRecoveryKeyDialogStateAuthCancelled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
    return DiskEncryptionDialog(
      title: l10n.diskEncryptionPageReplaceDialogHeader,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.diskEncryptionPageReplaceDialogBody),
          RecoveryKeyPanel(
            recoveryKey: recoveryKey.whenData((r) => r.recoveryKey),
            actionsEnabled: replaceDialogState
                    is! ReplaceRecoveryKeyDialogStateGenerating &&
                replaceDialogState is! ReplaceRecoveryKeyDialogStateError,
            saveError: replaceDialogError,
            onSaveErrorChanged: replaceNotifier.setError,
            onSaveToFile: replaceNotifier.writeRecoveryKey,
            acknowledged:
                replaceDialogState is ReplaceRecoveryKeyDialogStateInput &&
                    replaceDialogState.acknowledged,
            onAcknowledgedChanged:
                replaceDialogState is ReplaceRecoveryKeyDialogStateInput
                    ? replaceNotifier.acknowledge
                    : null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed:
                    replaceDialogState is ReplaceRecoveryKeyDialogStateInput
                        ? () => Navigator.of(context).pop()
                        : null,
                child: Text(l10n.diskEncryptionPageReplaceDialogDiscard),
              ),
              ElevatedButton(
                onPressed:
                    replaceDialogState is ReplaceRecoveryKeyDialogStateInput &&
                            replaceDialogState.acknowledged == true &&
                            !recoveryKey.isLoading
                        ? () => replaceNotifier.replaceRecoveryKey(
                              recoveryKey.value!.keyId,
                            )
                        : null,
                child:
                    replaceDialogState is ReplaceRecoveryKeyDialogStateLoading
                        ? SizedBox.square(
                            dimension: yaruProgressSize,
                            child: YaruCircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : Text(l10n.diskEncryptionPageReplaceDialogReplace),
              ),
            ].separatedBy(const SizedBox(width: 10)),
          ),
          if (replaceDialogState is ReplaceRecoveryKeyDialogStateSuccess &&
              replaceDialogError == null)
            YaruInfoBox(
              title: Text(l10n.diskEncryptionPageReplaceDialogSuccessHeader),
              subtitle: Text(l10n.diskEncryptionPageReplaceDialogSuccessBody),
              yaruInfoType: YaruInfoType.success,
            ),
          if (replaceDialogState is ReplaceRecoveryKeyDialogStateError)
            YaruInfoBox(
              title: Text(l10n.recoveryKeySomethingWentWrongHeader),
              subtitle:
                  Text(diskEncryptionDialogErrorMessage(replaceDialogState.e)),
              yaruInfoType: YaruInfoType.danger,
            ),
        ].separatedBy(const SizedBox(height: 16)),
      ),
    );
  }
}

void showChangeAuthDialog(BuildContext context, AuthMode authMode) {
  showDialog(
    context: context,
    builder: (_) => ChangeAuthDialog(authMode: authMode),
  );
}

class ChangeAuthDialog extends ConsumerWidget {
  const ChangeAuthDialog({required this.authMode, super.key});

  final AuthMode authMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final model = ref.watch(changeAuthDialogModelProvider(authMode));
    final notifier = ref.read(changeAuthDialogModelProvider(authMode).notifier);
    assert(authMode != AuthMode.none);

    final title = switch (authMode) {
      AuthMode.passphrase => l10n.recoveryKeyPassphraseHeader,
      _ => l10n.recoveryKeyPinDialogHeader,
    };

    return AlertDialog(
      title: YaruDialogTitleBar(title: Text(title)),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 460,
        child: ScrollablePage(
          padding: const EdgeInsets.all(24),
          children: [
            CurrentPassphraseFormField(authMode: authMode),
            PassphraseFormField(authMode: authMode),
            ConfirmPassphraseFormField(authMode: authMode),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: model.dialogState is ChangeAuthDialogStateInput &&
                          notifier.isValid
                      ? notifier.changePinPassphrase
                      : null,
                  child: model.dialogState is ChangeAuthDialogStateLoading
                      ? SizedBox.square(
                          dimension: yaruProgressSize,
                          child: YaruCircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Text(l10n.recoveryKeyPassphraseChange),
                ),
              ],
            ),
            if (model.dialogState is ChangeAuthDialogStateSuccess)
              YaruInfoBox(
                title: Text(
                  authMode == AuthMode.passphrase
                      ? l10n.recoveryKeyPassphrasePassphraseSuccessHeader
                      : l10n.recoveryKeyPassphrasePinSuccessHeader,
                ),
                subtitle: Text(
                  authMode == AuthMode.passphrase
                      ? l10n.recoveryKeyPassphrasePassphraseSuccessBody
                      : l10n.recoveryKeyPassphrasePinSuccessBody,
                ),
                yaruInfoType: YaruInfoType.success,
              ),
            if (model.dialogState is ChangeAuthDialogStateError)
              YaruInfoBox(
                title: Text(l10n.recoveryKeySomethingWentWrongHeader),
                subtitle: Text(
                  diskEncryptionDialogErrorMessage(
                    (model.dialogState as ChangeAuthDialogStateError).e,
                  ),
                ),
                yaruInfoType: YaruInfoType.danger,
              ),
          ].separatedBy(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

void showChangeAuthModeDialog(
  BuildContext context,
  AuthMode authMode,
  WidgetRef ref,
) {
  // Reset the provider state to ensure clean slate when dialog opens
  ref.invalidate(changeAuthModeDialogModelProvider(authMode));
  showDialog(
    context: context,
    builder: (_) => ChangeAuthModeDialog(authMode: authMode),
  );
}

class ChangeAuthModeDialog extends ConsumerWidget {
  const ChangeAuthModeDialog({required this.authMode, super.key});

  final AuthMode authMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final model = ref.watch(changeAuthModeDialogModelProvider(authMode));
    final notifier =
        ref.read(changeAuthModeDialogModelProvider(authMode).notifier);
    assert(authMode != AuthMode.none);

    final title = switch (authMode) {
      AuthMode.passphrase => l10n.diskEncryptionPageAddPassphraseDialogHeading,
      AuthMode.pin => l10n.diskEncryptionPageAddPinDialogHeading,
      _ => '',
    };

    final bodyMainText = switch (authMode) {
      AuthMode.passphrase => l10n.diskEncryptionPageAddPassphraseDialogBodyMain,
      AuthMode.pin => l10n.diskEncryptionPageAddPinDialogBodyMain,
      _ => '',
    };

    final bodyRecoveryText = switch (authMode) {
      AuthMode.passphrase =>
        l10n.diskEncryptionPageAddPassphraseDialogBodyRecovery,
      AuthMode.pin => l10n.diskEncryptionPageAddPinDialogBodyRecovery,
      _ => '',
    };

    final canSave =
        model.dialogState is ChangeAuthModeDialogStateInput && notifier.isValid;

    Future<void> handleSubmit() async {
      final navigator = Navigator.of(context);
      await notifier.replaceAuthMode(
        onAuthorized: () {
          if (navigator.mounted) navigator.pop();
        },
      );
    }

    return AlertDialog(
      title: YaruDialogTitleBar(title: Text(title)),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
      content: SizedBox(
        width: 460,
        child: ScrollablePage(
          padding: const EdgeInsets.all(24),
          children: [
            Text(bodyMainText),
            Text(bodyRecoveryText),
            AddPassphraseFormField(authMode: authMode),
            AddConfirmPassphraseFormField(authMode: authMode),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: canSave ? handleSubmit : null,
                  child: Text(l10n.diskEncryptionPageAddPinDialogSaveButton),
                ),
              ],
            ),
            if (model.dialogState case ChangeAuthModeDialogStateError(:final e))
              YaruInfoBox(
                title: Text(l10n.recoveryKeySomethingWentWrongHeader),
                subtitle: Text(diskEncryptionDialogErrorMessage(e)),
                yaruInfoType: YaruInfoType.danger,
              ),
          ].separatedBy(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class _NoneAuthenticationActions extends ConsumerWidget {
  const _NoneAuthenticationActions({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.diskEncryptionPageAdditionalSecurityHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.diskEncryptionPageAdditionalSecurityBody,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      showChangeAuthModeDialog(
                        context,
                        AuthMode.passphrase,
                        ref,
                      );
                    },
              child: Text(
                l10n.diskEncryptionPageAddPassphraseButton,
              ),
            ),
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      showChangeAuthModeDialog(
                        context,
                        AuthMode.pin,
                        ref,
                      );
                    },
              child: Text(l10n.diskEncryptionPageAddPinButton),
            ),
          ],
        ),
        // Show error if present
        if (hasError) ...[
          const SizedBox(height: 8),
          YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(
              tpmState.operationError!.causeByMessage(),
            ),
            yaruInfoType: YaruInfoType.danger,
          ),
        ],
      ],
    );
  }
}

class _PassphraseAuthenticationActions extends ConsumerWidget {
  const _PassphraseAuthenticationActions({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recoveryKeyEncrpytionPassphraseHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Text(l10n.recoveryKeyPassphraseBody),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      showChangeAuthDialog(
                        context,
                        AuthMode.passphrase,
                      );
                    },
              child: Text(l10n.recoveryKeyPassphraseButton),
            ),
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      ref
                          .read(tpmAuthenticationModelProvider.notifier)
                          .removeAuthMode();
                    },
              child: Text(
                l10n.diskEncryptionPageRemovePassphraseButton,
              ),
            ),
          ],
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(
              tpmState.operationError!.causeByMessage(),
            ),
            yaruInfoType: YaruInfoType.danger,
          ),
        ],
      ],
    );
  }
}

class _PinAuthenticationActions extends ConsumerWidget {
  const _PinAuthenticationActions({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recoveryKeyPinHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Text(l10n.recoveryKeyPinBody),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      showChangeAuthDialog(context, AuthMode.pin);
                    },
              child: Text(l10n.recoveryKeyPinButton),
            ),
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      ref
                          .read(tpmAuthenticationModelProvider.notifier)
                          .removeAuthMode();
                    },
              child: Text(l10n.diskEncryptionPageRemovePinButton),
            ),
          ],
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(
              tpmState.operationError!.causeByMessage(),
            ),
            yaruInfoType: YaruInfoType.danger,
          ),
        ],
      ],
    );
  }
}

class _RecoveryKeyActions extends StatelessWidget {
  const _RecoveryKeyActions({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // The repair replaces the recovery key
    final isRepairing = tpmState.pendingOperation == TpmFdeOperation.repair;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.diskEncryptionPageRecoveryKey,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 8),
        Text(l10n.diskEncryptionPageStoreYourKey),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: isRepairing
                  ? null
                  : () {
                      showCheckRecoveryKeyDialog(context);
                    },
              child: Text(l10n.diskEncryptionPageCheckKey),
            ),
            OutlinedButton(
              onPressed: isRepairing
                  ? null
                  : () {
                      showReplaceRecoveryKeyDialog(context);
                    },
              child: Text(l10n.diskEncryptionPageReplaceButton),
            ),
          ],
        ),
      ],
    );
  }
}

class _AuthStatusTileList extends StatelessWidget {
  const _AuthStatusTileList({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final pendingOperation = tpmState.pendingOperation;
    final currentMode = tpmState.currentAuthMode;
    final isRepairing = pendingOperation == TpmFdeOperation.repair;

    String? loadingMessage;
    if (pendingOperation != null) {
      loadingMessage = switch (pendingOperation) {
        TpmFdeOperation.removePin => l10n.diskEncryptionPageRemovingPin,
        TpmFdeOperation.removePassphrase =>
          l10n.diskEncryptionPageRemovingPassphrase,
        TpmFdeOperation.addPin => l10n.diskEncryptionPageAddingPin,
        TpmFdeOperation.addPassphrase =>
          l10n.diskEncryptionPageAddingPassphrase,
        _ => null,
      };
    }

    return YaruTileList(
      children: [
        YaruListTile(
          leading: isRepairing
              ? const SizedBox.square(
                  dimension: yaruProgressSize,
                  child: YaruCircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(YaruIcons.lock, size: 24),
          titleText: isRepairing
              ? l10n.diskEncryptionPageRepairing
              : tpmState.needsRepair
                  ? l10n.recoveryKeyTPMNeedsRepair
                  : l10n.recoveryKeyTPMEnabled,
        ),
        // Show enabled status row when not loading and has auth enabled
        if (currentMode != AuthMode.none && pendingOperation == null) ...[
          YaruListTile(
            leading: const Icon(YaruIcons.ok_simple, size: 24),
            titleText: currentMode == AuthMode.pin
                ? l10n.recoveryKeyPinEnabled
                : l10n.recoveryKeyPassphraseEnabled,
          ),
        ],
        // Show loading indicator if an operation is in progress
        if (loadingMessage != null) ...[
          YaruListTile(
            leading: const SizedBox.square(
              dimension: yaruProgressSize,
              child: YaruCircularProgressIndicator(strokeWidth: 2),
            ),
            titleText: loadingMessage,
          ),
        ],
      ],
    );
  }
}

class _RepairBanner extends StatelessWidget {
  const _RepairBanner({required this.tpmState});

  final TpmAuthState tpmState;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Read out when it appears after the page has loaded, as after a failed
    // repair, like a snack bar
    return Semantics(
      container: true,
      liveRegion: true,
      child: YaruInfoBox(
        title: Text(l10n.diskEncryptionPageRepairHeader),
        yaruInfoType: YaruInfoType.warning,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.diskEncryptionPageRepairBody),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: tpmState.isLoading
                  ? null
                  : () {
                      showRepairDialog(context);
                    },
              child: Text(l10n.diskEncryptionPageRepairButton),
            ),
          ],
        ),
      ),
    );
  }
}
