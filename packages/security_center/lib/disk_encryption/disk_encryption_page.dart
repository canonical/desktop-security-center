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
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';
import 'package:yaru/yaru.dart';

const _learnMoreUrl =
    'https://canonical-ubuntu-desktop-documentation.readthedocs-hosted.com/en/latest/explanation/hardware-backed-disk-encryption/#recovery-key';
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
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YaruBorderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  leading: const Icon(YaruIcons.lock, size: 24),
                  title: Text(
                    l10n.recoveryKeyTPMEnabled,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                if (data != AuthMode.none) ...[
                  const Divider(),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    leading: const Icon(YaruIcons.ok_simple, size: 24),
                    title: Text(
                      data == AuthMode.pin
                          ? l10n.recoveryKeyPinEnabled
                          : l10n.recoveryKeyPassphraseEnabled,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.recoveryKeyTPMExplanationBody,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.diskEncryptionPageRecoveryKey,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          MarkdownText(
            l10n.diskEncryptionPageStoreYourKeyWithLink(
              l10n.diskEncryptionPageLearnMore.link(_learnMoreUrl),
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          // TPM Authentication specific content
          switch (data) {
            AuthMode.pin => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.recoveryKeyPinHeader,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.recoveryKeyPinBody),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      ref
                          .read(changeAuthDialogModelProvider.notifier)
                          .authMode = AuthMode.pin;
                      showChangeAuthDialog(context, AuthMode.pin);
                    },
                    child: Text(l10n.recoveryKeyPinButton),
                  ),
                ],
              ),
            AuthMode.passphrase => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.recoveryKeyEncrpytionPassphraseHeader,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.recoveryKeyPassphraseBody),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      ref
                          .read(changeAuthDialogModelProvider.notifier)
                          .authMode = AuthMode.passphrase;
                      showChangeAuthDialog(context, AuthMode.passphrase);
                    },
                    child: Text(l10n.recoveryKeyPassphraseButton),
                  ),
                ],
              ),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
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
              style: const TextStyle(fontFamily: 'monospace'),
              decoration: InputDecoration(
                labelText: l10n.diskEncryptionPageRecoveryKey,
                hintText: 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX-XXXXX',
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
                child: Text(l10n.diskEncryptionPageCheck),
              ),
            ),
            if (data is CheckRecoveryKeyDialogStateLoading)
              const YaruCircularProgressIndicator(),
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
                title: Text(l10n.diskEncryptionPageError),
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
                  onChanged:
                      replaceDialogState is ReplaceRecoveryKeyDialogStateInput
                          ? (_) => replaceNotifier.acknowledge()
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
                    title: Text(l10n.diskEncryptionPageError),
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
