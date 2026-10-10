import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/disk_encryption/recovery_key_panel.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/hyperlink.dart';
import 'package:security_center/widgets/passphrase_widgets.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:yaru/yaru.dart';

const _learnMoreUrl =
    'https://documentation.ubuntu.com/desktop/en/latest/explanation/hardware-backed-disk-encryption/';

const yaruProgressSize = 20.0;

String _dialogErrorMessage(Exception e) => switch (e) {
      final TpmFdeOperationException e => e.causeByMessage(),
      _ => e.toString(),
    };

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
            if (data.needsRepair) ...[
              _RepairBanner(tpmState: data),
              const SizedBox(height: 32),
            ],
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
            Hyperlink(
              text: l10n.diskEncryptionPageLearnMore,
              url: _learnMoreUrl,
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
      content: const SizedBox(
        width: 460,
        child: _RecoveryKeyCheck(),
      ),
    );
  }
}

class _RecoveryKeyCheck extends ConsumerWidget {
  const _RecoveryKeyCheck();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(checkRecoveryKeyDialogModelProvider);
    final notifier = ref.read(checkRecoveryKeyDialogModelProvider.notifier);
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          style: Theme.of(context).textTheme.bodyMedium,
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
              CheckRecoveryKeyDialogStateInput() => notifier.checkRecoveryKey,
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
                RecoveryKeyPanel(
                  recoveryKey: recoveryKey.whenData((r) => r.recoveryKey),
                  actionsEnabled: replaceDialogState
                          is! ReplaceRecoveryKeyDialogStateGenerating &&
                      replaceDialogState is! ReplaceRecoveryKeyDialogStateError,
                  saveError: replaceDialogError,
                  onSaveErrorChanged: replaceNotifier.setError,
                  onSaveToFile: replaceNotifier.writeRecoveryKey,
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
                  _dialogErrorMessage(
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
                subtitle: Text(_dialogErrorMessage(e)),
                yaruInfoType: YaruInfoType.danger,
              ),
          ].separatedBy(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}

void showRepairDialog(BuildContext context) {
  // The PIN and passphrase models keep their state between dialogs
  ProviderScope.containerOf(context, listen: false)
    ..invalidate(changeAuthModeDialogModelProvider(AuthMode.pin))
    ..invalidate(changeAuthModeDialogModelProvider(AuthMode.passphrase));
  showDialog(
    context: context,
    builder: (_) => const RepairDialog(),
  );
}

class RepairDialog extends ConsumerWidget {
  const RepairDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialogState = ref.watch(repairDialogModelProvider).dialogState;
    final l10n = AppLocalizations.of(context);

    if (dialogState is RepairDialogStateAuthCancelled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
    final title = switch (dialogState) {
      RepairDialogStateSetPinOrPassphrase() =>
        l10n.diskEncryptionPageAdditionalSecurityHeader,
      RepairDialogStateGeneratingKey() ||
      RepairDialogStateSaveKey() =>
        l10n.diskEncryptionPageRecoveryKey,
      _ => l10n.diskEncryptionPageRepairDialogHeader,
    };
    // The dialog handles the admin prompt's answer, so it stays open until then
    final isStartingRepair = dialogState is RepairDialogStateStartingRepair;

    return PopScope(
      canPop: !isStartingRepair,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          title: YaruDialogTitleBar(
            title: Text(title),
            isClosable: !isStartingRepair,
          ),
          titlePadding: EdgeInsets.zero,
          content: SizedBox(
            width: 460,
            child: SingleChildScrollView(
              child: switch (dialogState) {
                RepairDialogStateIssue(:final issue) =>
                  _RepairIssue(issue: issue),
                RepairDialogStateUnavailable(:final issue) =>
                  _RepairUnavailable(issue: issue),
                RepairDialogStateSetPinOrPassphrase() =>
                  const _RepairPinOrPassphrase(),
                RepairDialogStatePinOrPassphraseWillBeRemoved() =>
                  const _RepairPinOrPassphraseRemoved(),
                RepairDialogStateGeneratingKey() => const _RepairRecoveryKey(),
                RepairDialogStateSaveKey(:final key, :final acknowledged) =>
                  _RepairRecoveryKey(
                    recoveryKey: key.recoveryKey,
                    acknowledged: acknowledged,
                  ),
                RepairDialogStateError(:final e) => _RepairError(e: e),
                _ => const YaruLinearProgressIndicator(),
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _RepairIssue extends ConsumerWidget {
  const _RepairIssue({required this.issue});

  final SnapdAvailabilityCheckError issue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    // Contacting the OEM or OS vendor isn't a fix the user can make here
    final fixes = issue.actions
        .where(
          (action) =>
              action != SnapdFixAction.contactOem &&
              action != SnapdFixAction.contactOsVendor,
        )
        .toList();
    final proceedOnly = fixes.singleOrNull == SnapdFixAction.proceed;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YaruInfoBox(
          title: Text(l10n.tpmActionPageTitleActionable),
          subtitle: Text(
            proceedOnly
                ? l10n.tpmActionFixActionProceedDescription
                : fixes.length == 1
                    ? l10n.tpmActionErrorSupportSingleLabel
                    : l10n.tpmActionErrorSupportLabel,
          ),
          yaruInfoType: YaruInfoType.warning,
        ),
        Text(issue.kind.localizedDescription(l10n)),
        if (!proceedOnly)
          YaruExpansionPanel(
            shrinkWrap: true,
            headers: [
              for (final (i, fix) in fixes.indexed)
                Text(
                  fixes.length == 1
                      ? l10n.tpmActionSingleSolutionLabel(
                          fix.localizedTitle(l10n, issue.kind),
                        )
                      : l10n.tpmActionSolutionLabel(
                          i + 1,
                          fix.localizedTitle(l10n, issue.kind),
                        ),
                ),
            ],
            children: [
              for (final fix in fixes) _RepairFix(fix: fix, kind: issue.kind),
            ],
          ),
        Hyperlink(text: l10n.diskEncryptionPageLearnMore, url: _learnMoreUrl),
        _RepairTechnicalDetails(issue: issue),
        if (proceedOnly)
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 16,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(UbuntuLocalizations.of(context).cancelLabel),
              ),
              ElevatedButton(
                onPressed: () => ref
                    .read(repairDialogModelProvider.notifier)
                    .applyFix(SnapdFixAction.proceed),
                child: Text(l10n.tpmActionIgnoreAndContinueLabel),
              ),
            ],
          ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairFix extends ConsumerStatefulWidget {
  const _RepairFix({required this.fix, required this.kind});

  final SnapdFixAction fix;
  final SnapdAvailabilityCheckErrorKind kind;

  @override
  ConsumerState<_RepairFix> createState() => _RepairFixState();
}

class _RepairFixState extends ConsumerState<_RepairFix> {
  var _riskAccepted = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fix = widget.fix;
    final description = [
      fix.localizedDescription(l10n, widget.kind),
      fix.localizedFirmwareHint(l10n, widget.kind),
    ].nonNulls.join(' ');
    final caveat = fix.localizedCaveat(l10n);
    final unlockedWithRecoveryKey = ref
        .watch(tpmAuthenticationModelProvider)
        .value!
        .unlockedWithRecoveryKey;
    final keyChecked = !fix.clearsTpm ||
        unlockedWithRecoveryKey ||
        ref.watch(checkRecoveryKeyDialogModelProvider) ==
            CheckRecoveryKeyDialogState.result(true);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kYaruPagePadding,
        0,
        kYaruPagePadding,
        kYaruPagePadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (description.isNotEmpty) Text(description),
          if (fix == SnapdFixAction.rebootToFwSettings)
            Text(l10n.tpmActionFixActionRebootToFwSettingsInstructions),
          if (caveat != null) Text(caveat),
          if (fix.clearsTpm) ...[
            YaruInfoBox(
              title: Text(l10n.tpmActionFixActionClearTpmWarningTitle),
              subtitle: Text(l10n.tpmActionFixActionClearTpmWarningBody),
              yaruInfoType: YaruInfoType.warning,
            ),
            if (!unlockedWithRecoveryKey) const _RecoveryKeyCheck(),
            YaruCheckButton(
              title: Text(
                l10n.tpmActionFixActionClearTpmConfirmationLabel,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: _riskAccepted,
              onChanged: (value) =>
                  setState(() => _riskAccepted = value ?? false),
            ),
          ],
          if (!fix.isExternal)
            OutlinedButton(
              onPressed: keyChecked && (_riskAccepted || !fix.clearsTpm)
                  ? () =>
                      ref.read(repairDialogModelProvider.notifier).applyFix(fix)
                  : null,
              child: Text(
                fix == SnapdFixAction.proceed
                    ? l10n.tpmActionIgnoreAndContinueLabel
                    : fix.localizedTitle(l10n, widget.kind),
              ),
            ),
        ].separatedBy(const SizedBox(height: 16)),
      ),
    );
  }
}

class _RepairPinOrPassphrase extends ConsumerStatefulWidget {
  const _RepairPinOrPassphrase();

  @override
  ConsumerState<_RepairPinOrPassphrase> createState() =>
      _RepairPinOrPassphraseState();
}

class _RepairPinOrPassphraseState
    extends ConsumerState<_RepairPinOrPassphrase> {
  var _authMode = AuthMode.passphrase;
  var _authModeChosen = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final continueLabel = Text(UbuntuLocalizations.of(context).continueLabel);

    if (!_authModeChosen) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.passphraseTypePageBodyAuthRequired),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YaruRadioButton(
                value: AuthMode.passphrase,
                groupValue: _authMode,
                onChanged: (_) =>
                    setState(() => _authMode = AuthMode.passphrase),
                title: Text(l10n.passphraseTypePassphraseTileTitle),
              ),
              YaruRadioButton(
                value: AuthMode.pin,
                groupValue: _authMode,
                onChanged: (_) => setState(() => _authMode = AuthMode.pin),
                title: Text(l10n.passphraseTypePinTileTitle),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => setState(() => _authModeChosen = true),
                child: continueLabel,
              ),
            ],
          ),
        ].separatedBy(const SizedBox(height: 16)),
      );
    }

    final model = ref.watch(changeAuthModeDialogModelProvider(_authMode));
    final notifier =
        ref.read(changeAuthModeDialogModelProvider(_authMode).notifier);
    final canContinue =
        model.dialogState is ChangeAuthModeDialogStateInput && notifier.isValid;
    final isPin = _authMode == AuthMode.pin;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isPin
              ? l10n.diskEncryptionPageAddPinDialogBodyMain
              : l10n.diskEncryptionPageAddPassphraseDialogBodyMain,
        ),
        Text(
          isPin
              ? l10n.diskEncryptionPageAddPinDialogBodyRecovery
              : l10n.diskEncryptionPageAddPassphraseDialogBodyRecovery,
        ),
        AddPassphraseFormField(authMode: _authMode),
        AddConfirmPassphraseFormField(authMode: _authMode),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: canContinue
                  ? () => ref
                      .read(repairDialogModelProvider.notifier)
                      .continueWithPinOrPassphrase(_authMode)
                  : null,
              child: continueLabel,
            ),
          ],
        ),
        if (model.dialogState case ChangeAuthModeDialogStateError(:final e))
          YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(_dialogErrorMessage(e)),
            yaruInfoType: YaruInfoType.danger,
          ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairPinOrPassphraseRemoved extends ConsumerWidget {
  const _RepairPinOrPassphraseRemoved();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final ubuntuL10n = UbuntuLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        YaruInfoBox(
          title: Text(
            l10n.diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader,
          ),
          subtitle: Text(
            l10n.diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody,
          ),
          yaruInfoType: YaruInfoType.warning,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(ubuntuL10n.cancelLabel),
            ),
            ElevatedButton(
              onPressed:
                  ref.read(repairDialogModelProvider.notifier).continueToKey,
              child: Text(ubuntuL10n.continueLabel),
            ),
          ].separatedBy(const SizedBox(width: 16)),
        ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairRecoveryKey extends ConsumerWidget {
  const _RepairRecoveryKey({this.recoveryKey, this.acknowledged = false});

  final String? recoveryKey;
  final bool acknowledged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final saveError = ref.watch(repairDialogModelProvider).error;
    final notifier = ref.read(repairDialogModelProvider.notifier);
    final key = recoveryKey;

    Future<void> handleRepair() async {
      final navigator = Navigator.of(context);
      await notifier.startRepair(
        onAuthorized: () {
          if (navigator.mounted) navigator.pop();
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.diskEncryptionPageRepairDialogKeyBody),
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogKeyWarningHeader),
          subtitle: Text(l10n.diskEncryptionPageRepairDialogKeyWarningBody),
          yaruInfoType: YaruInfoType.warning,
        ),
        RecoveryKeyPanel(
          recoveryKey: key == null ? const AsyncLoading() : AsyncData(key),
          actionsEnabled: true,
          saveError: saveError,
          onSaveErrorChanged: notifier.setError,
          onSaveToFile: notifier.writeRecoveryKey,
        ),
        YaruCheckButton(
          title: Text(
            l10n.diskEncryptionPageReplaceDialogAcknowledge,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          value: acknowledged,
          onChanged: key == null
              ? null
              : (value) => notifier.acknowledge(value ?? false),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(UbuntuLocalizations.of(context).cancelLabel),
            ),
            ElevatedButton(
              onPressed: acknowledged ? handleRepair : null,
              child: Text(l10n.diskEncryptionPageRepairDialogRepair),
            ),
          ].separatedBy(const SizedBox(width: 16)),
        ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairUnavailable extends StatelessWidget {
  const _RepairUnavailable({required this.issue});

  final SnapdAvailabilityCheckError issue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogErrorHeader),
          subtitle: Text(issue.kind.localizedDescription(l10n)),
          yaruInfoType: YaruInfoType.danger,
        ),
        Hyperlink(text: l10n.diskEncryptionPageLearnMore, url: _learnMoreUrl),
        _RepairTechnicalDetails(issue: issue),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairError extends ConsumerWidget {
  const _RepairError({required this.e});

  final Exception e;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    if (e is RepairNotAvailableException) {
      return YaruInfoBox(
        subtitle: Text(l10n.diskEncryptionPageRepairDialogNotNeeded),
        yaruInfoType: YaruInfoType.information,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogErrorHeader),
          subtitle: Text(
            switch (e) {
              final TpmStateException e => e.localizedBody(l10n),
              _ => _dialogErrorMessage(e),
            },
          ),
          yaruInfoType: YaruInfoType.danger,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: ref.read(repairDialogModelProvider.notifier).retry,
              child: Text(UbuntuLocalizations.of(context).retryLabel),
            ),
          ],
        ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RepairTechnicalDetails extends StatelessWidget {
  const _RepairTechnicalDetails({required this.issue});

  final SnapdAvailabilityCheckError issue;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return YaruExpandable(
      expandButtonPosition: YaruExpandableButtonPosition.start,
      expandIconSemanticLabel: l10n.tpmActionDetailsLabel,
      header: Text(l10n.tpmActionDetailsLabel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(issue.kind.name.toKebabCase()),
          Text(issue.message),
        ],
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
    final isAdding = switch (tpmState.pendingOperation) {
      TpmFdeOperation.addPin || TpmFdeOperation.addPassphrase => true,
      _ => false,
    };
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
            OutlinedButton(
              onPressed: isAdding
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
    final isRemoving = switch (tpmState.pendingOperation) {
      TpmFdeOperation.removePin || TpmFdeOperation.removePassphrase => true,
      _ => false,
    };
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
              onPressed: isRemoving
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
              onPressed: isRemoving
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
    final isRemoving = switch (tpmState.pendingOperation) {
      TpmFdeOperation.removePin || TpmFdeOperation.removePassphrase => true,
      _ => false,
    };
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
              onPressed: isRemoving
                  ? null
                  : () {
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
  const _RecoveryKeyActions();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
          leading: const Icon(YaruIcons.lock, size: 24),
          titleText: tpmState.needsRepair
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
            titleText: loadingMessage,
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8),
                YaruLinearProgressIndicator(),
              ],
            ),
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

    return YaruInfoBox(
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
    );
  }
}
