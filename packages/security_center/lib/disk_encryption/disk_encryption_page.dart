import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/passphrase_widgets.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';
import 'package:yaru/yaru.dart';

const _learnMoreUrl =
    'https://documentation.ubuntu.com/desktop/en/latest/explanation/hardware-backed-disk-encryption/';
const defaultRecoveryKeyFileName = 'recovery-key.txt';

const yaruProgressSize = 20.0;

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
            _AuthStatusTileList(tpmState: data),
            const SizedBox(height: 32),
            const _RecoveryKeyActions(),
            const SizedBox(height: 32),
            // TPM Authentication specific content
            switch (data.currentAuthMode) {
              AuthMode.pin => _PinAuthenticationActions(tpmState: data),
              AuthMode.passphrase =>
                _PassphraseAuthenticationActions(tpmState: data),
              AuthMode.none => _NoneAuthenticationActions(tpmState: data),
            },
            const SizedBox(height: 32),
            MarkdownText(
              l10n.diskEncryptionPageLearnMore.link(_learnMoreUrl),
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
            title: Text(l10n.diskEncryptionPageError),
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

class CheckRecoveryKeyDialog extends ConsumerWidget {
  const CheckRecoveryKeyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(checkRecoveryKeyDialogModelProvider);
    final notifier = ref.read(checkRecoveryKeyDialogModelProvider.notifier);
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.diskEncryptionPageDialogHeaderCheckKey),
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              style: TextStyle(
                inherit: false,
                fontFamily: 'Ubuntu Mono',
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                textBaseline: TextBaseline.alphabetic,
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.5,
              ),
              decoration: InputDecoration(
                labelText: l10n.diskEncryptionPageRecoveryKey,
                hintText: 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX',
                labelStyle: TextStyle(
                  inherit: false,
                  fontFamily: 'Ubuntu Mono',
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  textBaseline: TextBaseline.alphabetic,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.5,
                ),
                hintStyle: TextStyle(
                  inherit: false,
                  fontFamily: 'Ubuntu Mono',
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  textBaseline: TextBaseline.alphabetic,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.5,
                ),
              ),
              onChanged: notifier.setKeyToCheck,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: switch (data) {
                  CheckRecoveryKeyDialogStateInput() =>
                    notifier.checkRecoveryKey,
                  _ => null,
                },
                child: data is CheckRecoveryKeyDialogStateLoading
                    ? SizedBox.square(
                        dimension: yaruProgressSize,
                        child: YaruCircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(l10n.diskEncryptionPageCheck),
              ),
            ),
            if (data is CheckRecoveryKeyDialogStateResult)
              if (data.valid)
                YaruInfoBox(
                  title: Text(l10n.diskEncryptionPageKeyWorks),
                  subtitle: Text(l10n.diskEncryptionPageKeyWorksBody),
                  yaruInfoType: YaruInfoType.success,
                )
              else
                YaruInfoBox(
                  title: Text(l10n.diskEncryptionPageKeyDoesntWork),
                  subtitle: Text(l10n.diskEncryptionPageKeyDoesntWorkBody),
                  yaruInfoType: YaruInfoType.danger,
                ),
            if (data is CheckRecoveryKeyDialogStateError)
              YaruInfoBox(
                title: Text(l10n.recoveryKeySomethingWentWrongHeader),
                subtitle: Text(data.e.toString()),
                yaruInfoType: YaruInfoType.danger,
              ),
          ].separatedBy(const SizedBox(height: 16)),
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

  void saveToClipboard(BuildContext context, String text) {
    final l10n = AppLocalizations.of(context);
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.diskEncryptionPageClipboardNotification)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final replaceDialogModel = ref.watch(replaceRecoveryKeyDialogModelProvider);
    final replaceDialogState = replaceDialogModel.dialogState;
    final replaceDialogError = replaceDialogModel.error;
    final replaceNotifier = ref.read(
      replaceRecoveryKeyDialogModelProvider.notifier,
    );
    final recoveryKey = ref.watch(generatedRecoveryKeyModelProvider);
    final filePicker = ref.read(filePickerProvider);

    final l10n = AppLocalizations.of(context);

    // Close dialog if auth was cancelled
    if (replaceDialogState is ReplaceRecoveryKeyDialogStateAuthCancelled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
        title: YaruDialogTitleBar(
          title: Text(l10n.diskEncryptionPageReplaceDialogHeader),
        ),
        titlePadding: EdgeInsets.zero,
        content: SizedBox(
          width: 460,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.diskEncryptionPageReplaceDialogBody),
                if (recoveryKey is AsyncLoading)
                  YaruLinearProgressIndicator()
                else if (recoveryKey is AsyncData)
                  TextFormField(
                    onTap: () => saveToClipboard(
                      context,
                      recoveryKey.value!.recoveryKey,
                    ),
                    initialValue: recoveryKey.value!.recoveryKey,
                    decoration: InputDecoration(
                      labelText: l10n.diskEncryptionPageRecoveryKey,
                      suffixIcon: YaruIconButton(
                        tooltip: l10n.diskEncryptionPageCopySemanticLabel,
                        icon: Icon(
                          YaruIcons.copy,
                          size: 16,
                          semanticLabel:
                              l10n.diskEncryptionPageCopySemanticLabel,
                        ),
                        onPressed: () => saveToClipboard(
                          context,
                          recoveryKey.value!.recoveryKey,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxWidth: 32,
                        maxHeight: 32,
                      ),
                    ),
                    readOnly: true,
                    minLines: 1,
                    maxLines: 2,
                    style: TextStyle(
                      inherit: false,
                      fontFamily: 'Ubuntu Mono',
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      textBaseline: TextBaseline.alphabetic,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: replaceDialogState
                                  is! ReplaceRecoveryKeyDialogStateGenerating &&
                              replaceDialogState
                                  is! ReplaceRecoveryKeyDialogStateError
                          ? () async {
                              replaceNotifier.setError(null);
                              try {
                                final uri = await filePicker(
                                  context: context,
                                  title: l10n.recoveryKeyFilePickerTitle,
                                  defaultFileName: defaultRecoveryKeyFileName,
                                  filters: [
                                    XdgFileChooserFilter(
                                      l10n.recoveryKeyFilePickerFilter,
                                      [XdgFileChooserGlobPattern('*.txt')],
                                    ),
                                  ],
                                );
                                if (uri.toString() == '') {
                                  replaceNotifier.setError(
                                    RecoveryKeyExceptionFilePermission(),
                                  );
                                  return;
                                }
                                if (uri != null) {
                                  await replaceNotifier.writeRecoveryKey(
                                    uri,
                                    recoveryKey.value!.recoveryKey,
                                  );
                                }
                              } on Exception catch (e) {
                                replaceNotifier.setError(
                                  RecoveryKeyException.from(e),
                                );
                              }
                            }
                          : null,
                      child: Text(l10n.diskEncryptionPageReplaceDialogSave),
                    ),
                    OutlinedButton(
                      onPressed: replaceDialogState
                                  is! ReplaceRecoveryKeyDialogStateGenerating &&
                              replaceDialogState
                                  is! ReplaceRecoveryKeyDialogStateError
                          ? () => showDialog(
                                context: context,
                                builder: (_) => _RecoveryKeyQRDialog(
                                  recoveryKey: recoveryKey.value!.recoveryKey,
                                ),
                              )
                          : null,
                      child: Text(l10n.diskEncryptionPageReplaceDialogShowQR),
                    ),
                  ].separatedBy(const SizedBox(width: 16)),
                ),
                if (replaceDialogError != null)
                  YaruInfoBox(
                    title: Text(replaceDialogError.localizedTitle(l10n)),
                    subtitle: Text(replaceDialogError.localizedBody(l10n)),
                    yaruInfoType: YaruInfoType.danger,
                  ),
                YaruCheckButton(
                  title: Text(
                    l10n.diskEncryptionPageReplaceDialogAcknowledge,
                    maxLines: 2,
                    // TODO: remove hardcoded style once this is avialable in yaru.
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  value:
                      replaceDialogState is ReplaceRecoveryKeyDialogStateInput
                          ? replaceDialogState.acknowledged
                          : false,
                  onChanged: replaceDialogState
                          is ReplaceRecoveryKeyDialogStateInput
                      ? (value) => replaceNotifier.acknowledge(value ?? false)
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: replaceDialogState
                              is ReplaceRecoveryKeyDialogStateInput
                          ? () => Navigator.of(context).pop()
                          : null,
                      child: Text(l10n.diskEncryptionPageReplaceDialogDiscard),
                    ),
                    ElevatedButton(
                      onPressed: replaceDialogState
                                  is ReplaceRecoveryKeyDialogStateInput &&
                              replaceDialogState.acknowledged == true &&
                              !recoveryKey.isLoading
                          ? () => replaceNotifier.replaceRecoveryKey(
                                recoveryKey.value!.keyId,
                              )
                          : null,
                      child: replaceDialogState
                              is ReplaceRecoveryKeyDialogStateLoading
                          ? SizedBox.square(
                              dimension: yaruProgressSize,
                              child: YaruCircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              l10n.diskEncryptionPageReplaceDialogReplace,
                            ),
                    ),
                  ].separatedBy(const SizedBox(width: 16)),
                ),
                if (recoveryKey.isLoading) SizedBox.shrink(),
                if (replaceDialogState
                        is ReplaceRecoveryKeyDialogStateSuccess &&
                    replaceDialogError == null)
                  YaruInfoBox(
                    title: Text(
                      l10n.diskEncryptionPageReplaceDialogSuccessHeader,
                    ),
                    subtitle: Text(
                      l10n.diskEncryptionPageReplaceDialogSuccessBody,
                    ),
                    yaruInfoType: YaruInfoType.success,
                  ),
                if (replaceDialogState is ReplaceRecoveryKeyDialogStateError)
                  YaruInfoBox(
                    title: Text(l10n.recoveryKeySomethingWentWrongHeader),
                    subtitle: Text(replaceDialogState.e.toString()),
                    yaruInfoType: YaruInfoType.danger,
                  ),
              ].separatedBy(const SizedBox(height: 16)),
            ),
          ),
        ),
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
    final model = ref.watch(changeAuthDialogModelProvider);
    final notifier = ref.read(changeAuthDialogModelProvider.notifier);
    assert(authMode != AuthMode.none);

    final title = switch (authMode) {
      AuthMode.passphrase => l10n.recoveryKeyPassphraseHeader,
      _ => l10n.recoveryKeyPinDialogHeader,
    };

    return AlertDialog(
      title: YaruDialogTitleBar(title: Text(title)),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                title: (model.dialogState as ChangeAuthDialogStateError).fatal
                    ? Text(l10n.recoveryKeySomethingWentWrongHeader)
                    : Text(l10n.diskEncryptionPageError),
                subtitle: Text(
                  (model.dialogState as ChangeAuthDialogStateError)
                      .e
                      .toString(),
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

    return AlertDialog(
      title: YaruDialogTitleBar(title: Text(title)),
      titlePadding: EdgeInsets.zero,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(bodyMainText),
            Text(bodyRecoveryText),
            AddPassphraseFormField(authMode: authMode),
            AddConfirmPassphraseFormField(authMode: authMode),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed:
                      model.dialogState is ChangeAuthModeDialogStateInput &&
                              notifier.isValid
                          ? () {
                              Navigator.of(context).pop();
                              notifier.replaceAuthMode();
                            }
                          : null,
                  child: Text(l10n.diskEncryptionPageAddPinDialogSaveButton),
                ),
              ],
            ),
            // Show fatal errors in dialog (like entropy check failures)
            if (model.dialogState is ChangeAuthModeDialogStateError &&
                (model.dialogState as ChangeAuthModeDialogStateError).fatal)
              YaruInfoBox(
                title: Text(l10n.recoveryKeySomethingWentWrongHeader),
                subtitle: Text(
                  (model.dialogState as ChangeAuthModeDialogStateError)
                      .e
                      .toString(),
                ),
                yaruInfoType: YaruInfoType.danger,
              ),
          ].separatedBy(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

class _RecoveryKeyQRDialog extends ConsumerWidget {
  const _RecoveryKeyQRDialog({required this.recoveryKey});

  final String recoveryKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.diskEncryptionPageReplaceDialogQRHeader),
      ),
      titlePadding: EdgeInsets.zero,
      content: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.diskEncryptionPageReplaceDialogQRBody),
            BarcodeWidget(
              margin: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.onSurface,
              barcode: Barcode.qrCode(),
              data: recoveryKey,
              width: 200,
              height: 200,
            ),
            Text(
              recoveryKey,
              style: TextStyle(
                inherit: false,
                fontFamily: 'Ubuntu Mono',
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                textBaseline: TextBaseline.alphabetic,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
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
    final isAdding = tpmState.pendingOperation is AuthOperationAdding;
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.diskEncryptionPageAdditionalSecurityHeader,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
              onPressed: isAdding
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
            // FIXME: PIN support is not yet impletented in snapd
            // OutlinedButton(
            //   onPressed: isAdding
            //       ? null
            //       : () {
            //           showChangeAuthModeDialog(
            //             context,
            //             AuthMode.pin,
            //             ref,
            //           );
            //         },
            //   child: Text(l10n.diskEncryptionPageAddPinButton),
            // ),
          ],
        ),
        // Show error if present
        if (hasError) ...[
          const SizedBox(height: 8),
          YaruInfoBox(
            title: Text(l10n.diskEncryptionPageError),
            subtitle: Text(tpmState.operationError.toString()),
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
    final isRemoving = tpmState.pendingOperation is AuthOperationRemoving;
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recoveryKeyEncrpytionPassphraseHeader,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(l10n.recoveryKeyPassphraseBody),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: isRemoving
                  ? null
                  : () {
                      ref
                          .read(
                            changeAuthDialogModelProvider.notifier,
                          )
                          .authMode = AuthMode.passphrase;
                      showChangeAuthDialog(
                        context,
                        AuthMode.passphrase,
                      );
                    },
              child: Text(l10n.recoveryKeyPassphraseButton),
            ),
            OutlinedButton(
              onPressed: isRemoving
                  ? null
                  : () {
                      ref
                          .read(tpmAuthenticationModelProvider.notifier)
                          .changeAuthMode(AuthMode.none);
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
            title: Text(l10n.diskEncryptionPageError),
            subtitle: Text(tpmState.operationError.toString()),
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
    final isRemoving = tpmState.pendingOperation is AuthOperationRemoving;
    final hasError = tpmState.operationError != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recoveryKeyPinHeader,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(l10n.recoveryKeyPinBody),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: isRemoving
                  ? null
                  : () {
                      ref
                          .read(
                            changeAuthDialogModelProvider.notifier,
                          )
                          .authMode = AuthMode.pin;
                      showChangeAuthDialog(context, AuthMode.pin);
                    },
              child: Text(l10n.recoveryKeyPinButton),
            ),
            OutlinedButton(
              onPressed: isRemoving
                  ? null
                  : () {
                      ref
                          .read(tpmAuthenticationModelProvider.notifier)
                          .changeAuthMode(AuthMode.none);
                    },
              child: Text(l10n.diskEncryptionPageRemovePinButton),
            ),
          ],
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          YaruInfoBox(
            title: Text(l10n.diskEncryptionPageError),
            subtitle: Text(tpmState.operationError.toString()),
            yaruInfoType: YaruInfoType.danger,
          ),
        ],
      ],
    );
  }
}

class _RecoveryKeyActions extends StatelessWidget {
  const _RecoveryKeyActions();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.diskEncryptionPageRecoveryKey,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 8),
        Text(l10n.diskEncryptionPageStoreYourKey),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            OutlinedButton(
              onPressed: () {
                showCheckRecoveryKeyDialog(context);
              },
              child: Text(l10n.diskEncryptionPageCheckKey),
            ),
            OutlinedButton(
              onPressed: () {
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

    String? loadingMessage;
    if (pendingOperation != null) {
      loadingMessage = switch (pendingOperation) {
        AuthOperationRemoving(mode: AuthMode.pin) =>
          l10n.diskEncryptionPageRemovingPin,
        AuthOperationRemoving(mode: AuthMode.passphrase) =>
          l10n.diskEncryptionPageRemovingPassphrase,
        AuthOperationAdding(mode: AuthMode.pin) =>
          l10n.diskEncryptionPageAddingPin,
        AuthOperationAdding(mode: AuthMode.passphrase) =>
          l10n.diskEncryptionPageAddingPassphrase,
        _ => null,
      };
    }

    return TileList(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 52),
          child: Center(
            child: ListTile(
              leading: const Icon(YaruIcons.lock, size: 24),
              title: Text(l10n.recoveryKeyTPMEnabled),
            ),
          ),
        ),
        // Show enabled status row when not loading and has auth enabled
        if (currentMode != AuthMode.none && pendingOperation == null) ...[
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 52),
            child: Center(
              child: ListTile(
                leading: const Icon(YaruIcons.ok_simple, size: 24),
                title: Text(
                  currentMode == AuthMode.pin
                      ? l10n.recoveryKeyPinEnabled
                      : l10n.recoveryKeyPassphraseEnabled,
                ),
              ),
            ),
          ),
        ],
        // Show loading indicator if an operation is in progress
        if (loadingMessage != null) ...[
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 52),
            child: Center(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(loadingMessage),
                    const SizedBox(height: 8),
                    const YaruLinearProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
