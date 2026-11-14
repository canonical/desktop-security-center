import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_dialog_widgets.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/disk_encryption/recovery_key_panel.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/hyperlink.dart';
import 'package:security_center/widgets/passphrase_widgets.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:yaru/yaru.dart';

// The repair solutions' titles, chevrons and contents sit 12 px in from the
// list's border, as in the design
const _solutionInset = 12.0;

Future<void> showRepairDialog(BuildContext context) async {
  // The PIN and passphrase models keep their state between dialogs
  final container = ProviderScope.containerOf(context, listen: false);
  void clearPinAndPassphrase() => container
    ..invalidate(changeAuthModeDialogModelProvider(AuthMode.pin))
    ..invalidate(changeAuthModeDialogModelProvider(AuthMode.passphrase));

  clearPinAndPassphrase();
  ModalRoute<void>? route;
  await showDialog<void>(
    context: context,
    builder: (context) {
      route ??= ModalRoute.of(context);
      return const RepairDialog();
    },
  );
  // A focused field saves its text as it loses focus during the exit
  // animation, so wait until the dialog has gone
  await route?.completed;
  clearPinAndPassphrase();
}

class RepairDialog extends ConsumerWidget {
  const RepairDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialogState = ref.watch(repairDialogModelProvider);
    final l10n = AppLocalizations.of(context);

    if (dialogState is RepairDialogStateClosed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
    final title = switch (dialogState) {
      RepairDialogStateCheckKey() =>
        l10n.diskEncryptionPageDialogHeaderCheckKey,
      RepairDialogStateSetPinOrPassphrase() =>
        l10n.diskEncryptionPageAdditionalSecurityHeader,
      RepairDialogStateGeneratingKey() ||
      RepairDialogStateSaveKey() =>
        l10n.diskEncryptionPageRepairDialogKeyHeader,
      _ => l10n.diskEncryptionPageRepairDialogHeader,
    };
    // The dialog handles the admin prompt's answer, so it stays open until then
    final isStartingRepair = dialogState is RepairDialogStateStartingRepair;

    return PopScope(
      canPop: !isStartingRepair,
      child: DiskEncryptionDialog(
        title: title,
        isClosable: !isStartingRepair,
        child: switch (dialogState) {
          // A fix can lead straight to another issue, which mustn't keep the
          // open solutions or ticked checkboxes of the last one
          RepairDialogStateIssue(:final issue) =>
            _RepairIssue(key: ValueKey(issue), issue: issue),
          RepairDialogStateCheckKey(:final issue, :final action) =>
            _RepairCheckKey(fix: action, kind: issue.kind),
          final RepairDialogStateConfirmPowerAction confirm =>
            _RepairPowerAction(confirm: confirm),
          RepairDialogStateSetPinOrPassphrase(:final authModes) =>
            _RepairPinOrPassphrase(authModes: authModes),
          RepairDialogStatePinOrPassphraseWillBeRemoved() =>
            const _RepairPinOrPassphraseRemoved(),
          RepairDialogStateGeneratingKey() => const _RepairRecoveryKey(),
          final RepairDialogStateSaveKey saveKey =>
            _RepairRecoveryKey(saveKey: saveKey),
          RepairDialogStateKeyNotUsed() => YaruInfoBox(
              title: Text(l10n.diskEncryptionPageRepairDialogNotNeeded),
              subtitle: Text(l10n.diskEncryptionPageRepairDialogKeyNotUsed),
              yaruInfoType: YaruInfoType.information,
            ),
          RepairDialogStateError(:final e) => _RepairError(e: e),
          _ => YaruLinearProgressIndicator(
              semanticsLabel: l10n.diskEncryptionPageRepairing,
            ),
        },
      ),
    );
  }
}

class _RepairIssue extends ConsumerWidget {
  const _RepairIssue({required this.issue, super.key});

  final SnapdAvailabilityCheckError issue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    // Contacting the OEM or OS vendor isn't a fix the user can make here
    final fixes = issue.actions.where((action) => !action.isContact).toList();
    if (fixes.isEmpty) return _RepairUnavailable(issue: issue);
    final proceedOnly = fixes.singleOrNull == SnapdFixAction.proceed;

    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YaruInfoBox(
          title: Text(l10n.tpmActionPageTitleActionable),
          subtitle: Text(
            proceedOnly
                ? l10n.tpmActionFixActionProceedDescription
                : l10n.tpmActionErrorSupportLabel,
          ),
          yaruInfoType: YaruInfoType.warning,
        ),
        Text(issue.kind.localizedDescription(l10n)),
        if (proceedOnly) Text(l10n.tpmActionFixActionProceedDescription),
        if (!proceedOnly)
          YaruExpansionPanel(
            shrinkWrap: true,
            headerPadding: const EdgeInsets.only(left: _solutionInset),
            // Yaru's 34 px expand button already leaves 5 px around the 24 px
            // chevron. The other sides keep the panel's default 10
            expandIconPadding:
                const EdgeInsets.fromLTRB(10, 10, _solutionInset - 5, 10),
            // Extra quarter turn makes chevron point down when collapsed
            // and up when expanded, matching design.
            expandIconBuilder: (isExpanded) => AnimatedRotation(
              turns: isExpanded ? .25 : 0,
              duration: kThemeAnimationDuration,
              child: const Icon(YaruIcons.pan_down, size: 24),
            ),
            headers: [
              for (final (i, fix) in fixes.indexed)
                Text(
                  l10n.tpmActionSolutionLabel(
                    i + 1,
                    fix.localizedTitle(l10n, issue.kind),
                  ),
                ),
            ],
            children: [
              for (final fix in fixes) _RepairFix(fix: fix, kind: issue.kind),
            ],
          ),
        Hyperlink(
          text: l10n.diskEncryptionPageLearnMore,
          url: diskEncryptionDocumentationUrl,
        ),
        _RepairTechnicalDetails(issue: issue),
        if (proceedOnly)
          DiskEncryptionDialogActions(
            mainAction: OutlinedButton(
              autofocus: true,
              onPressed: () => ref
                  .read(repairDialogModelProvider.notifier)
                  .applyFix(SnapdFixAction.proceed),
              child: Text(l10n.tpmActionIgnoreAndContinueLabel),
            ),
          ),
      ],
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
    final clearsTpm = fix.clearsTpm(widget.kind);

    // The panel centres content narrower than itself
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        _solutionInset,
        0,
        _solutionInset,
        kYaruPagePadding,
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...fix.localizedBody(l10n, widget.kind).map(Text.new),
          if (clearsTpm) ...[
            YaruInfoBox(
              title: Text(l10n.tpmActionFixActionClearTpmWarningTitle),
              subtitle: Text(l10n.tpmActionFixActionClearTpmWarningBody),
              yaruInfoType: YaruInfoType.warning,
            ),
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
          OutlinedButton(
            onPressed: _riskAccepted || !clearsTpm
                ? () =>
                    ref.read(repairDialogModelProvider.notifier).applyFix(fix)
                : null,
            child: Text(
              fix.isExternal
                  ? UbuntuLocalizations.of(context).continueLabel
                  : fix == SnapdFixAction.proceed
                      ? l10n.tpmActionIgnoreAndContinueLabel
                      : fix.localizedTitle(l10n, widget.kind),
            ),
          ),
        ],
      ),
    );
  }
}

class _RepairPowerAction extends ConsumerWidget {
  const _RepairPowerAction({required this.confirm});

  final RepairDialogStateConfirmPowerAction confirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isPowerOff = confirm.action == SnapdFixAction.shutdown;
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isPowerOff
              ? l10n.diskEncryptionPageRepairDialogPowerOffBody
              : l10n.diskEncryptionPageRepairDialogRestartBody,
        ),
        if (confirm.action == SnapdFixAction.rebootToFwSettings)
          Text(l10n.tpmActionFixActionRebootToFwSettingsInstructions),
        // logind's error names D-Bus internals, so say what the user can do
        if (confirm.error != null)
          YaruInfoBox(
            title: Text(l10n.recoveryKeySomethingWentWrongHeader),
            subtitle: Text(
              isPowerOff
                  ? l10n.diskEncryptionPageRepairDialogPowerOffFailed
                  : l10n.diskEncryptionPageRepairDialogRestartFailed,
            ),
            yaruInfoType: YaruInfoType.danger,
          ),
        DiskEncryptionDialogActions(
          cancelLabel: l10n.diskEncryptionPageRepairDialogNotNow,
          mainAction: ElevatedButton(
            autofocus: true,
            onPressed: confirm.pending
                ? null
                : ref.read(repairDialogModelProvider.notifier).runPowerAction,
            child: Text(
              isPowerOff
                  ? l10n.diskEncryptionPageRepairDialogPowerOffNow
                  : l10n.diskEncryptionPageRepairDialogRestartNow,
            ),
          ),
        ),
      ],
    );
  }
}

class _RepairCheckKey extends ConsumerWidget {
  const _RepairCheckKey({required this.fix, required this.kind});

  final SnapdFixAction fix;
  final SnapdAvailabilityCheckErrorKind kind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final keyWorks = ref.watch(checkRecoveryKeyDialogModelProvider) ==
        CheckRecoveryKeyDialogState.result(true);
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.diskEncryptionPageRepairDialogCheckKeyBody),
        RecoveryKeyCheck(
          keyDoesntWorkBody:
              l10n.diskEncryptionPageRepairDialogKeyDoesntWorkBody,
        ),
        DiskEncryptionDialogActions(
          mainAction: ElevatedButton(
            onPressed: keyWorks
                ? () =>
                    ref.read(repairDialogModelProvider.notifier).applyFix(fix)
                : null,
            child: Text(fix.localizedTitle(l10n, kind)),
          ),
        ),
      ],
    );
  }
}

class _RepairPinOrPassphrase extends ConsumerStatefulWidget {
  const _RepairPinOrPassphrase({required this.authModes});

  final List<AuthMode> authModes;

  @override
  ConsumerState<_RepairPinOrPassphrase> createState() =>
      _RepairPinOrPassphraseState();
}

class _RepairPinOrPassphraseState
    extends ConsumerState<_RepairPinOrPassphrase> {
  AuthMode? _selectedAuthMode;
  bool _hasConfirmedAuthMode = false;

  AuthMode get _authMode => _selectedAuthMode ?? widget.authModes.first;
  // With one option, there is nothing to choose
  bool get _authModeChosen =>
      _hasConfirmedAuthMode || widget.authModes.length == 1;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final continueLabel = Text(UbuntuLocalizations.of(context).continueLabel);

    if (!_authModeChosen) {
      // Tighter than the other steps' 16 px, as in the design
      return Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.passphraseTypePageBodyAuthRequired),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final authMode in widget.authModes)
                YaruRadioButton(
                  value: authMode,
                  groupValue: _authMode,
                  onChanged: (_) =>
                      setState(() => _selectedAuthMode = authMode),
                  title: Text(
                    authMode == AuthMode.pin
                        ? l10n.passphraseTypePinTileTitle
                        : l10n.passphraseTypePassphraseTileTitle,
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                autofocus: true,
                onPressed: () => setState(() => _hasConfirmedAuthMode = true),
                child: continueLabel,
              ),
            ],
          ),
        ],
      );
    }

    final model = ref.watch(changeAuthModeDialogModelProvider(_authMode));
    final notifier =
        ref.read(changeAuthModeDialogModelProvider(_authMode).notifier);
    final canContinue =
        model.dialogState is ChangeAuthModeDialogStateInput && notifier.isValid;
    final isPin = _authMode == AuthMode.pin;

    return Column(
      spacing: 16,
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
        Column(
          spacing: 8,
          children: [
            AddPassphraseFormField(
              authMode: _authMode,
              labelText: _authMode.localizedHint(l10n),
            ),
            AddConfirmPassphraseFormField(authMode: _authMode),
          ],
        ),
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
            subtitle: Text(diskEncryptionDialogErrorMessage(e)),
            yaruInfoType: YaruInfoType.danger,
          ),
      ],
    );
  }
}

class _RepairPinOrPassphraseRemoved extends ConsumerWidget {
  const _RepairPinOrPassphraseRemoved();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Column(
      spacing: 16,
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
        DiskEncryptionDialogActions(
          mainAction: ElevatedButton(
            autofocus: true,
            onPressed:
                ref.read(repairDialogModelProvider.notifier).continueToKey,
            child: Text(l10n.diskEncryptionPageRepairDialogRepair),
          ),
        ),
      ],
    );
  }
}

class _RepairRecoveryKey extends ConsumerWidget {
  const _RepairRecoveryKey({this.saveKey});

  // Null while snapd generates the key
  final RepairDialogStateSaveKey? saveKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(repairDialogModelProvider.notifier);
    final saveKey = this.saveKey;
    final acknowledged = saveKey?.acknowledged ?? false;

    Future<void> handleRepair() async {
      final navigator = Navigator.of(context);
      await notifier.startRepair(
        onAuthorized: () {
          if (navigator.mounted) navigator.pop();
        },
      );
    }

    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.diskEncryptionPageRepairDialogKeyBody),
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogKeyWarningHeader),
          subtitle: Text(l10n.diskEncryptionPageRepairDialogKeyWarningBody),
          yaruInfoType: YaruInfoType.warning,
        ),
        // 28 px below the box, as in the design, so the key field's floating
        // label clears it
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: RecoveryKeyPanel(
            recoveryKey: saveKey == null
                ? const AsyncLoading()
                : AsyncData(saveKey.key.recoveryKey),
            actionsEnabled: true,
            saveError: saveKey?.saveError,
            onSaveErrorChanged: notifier.setError,
            onSaveToFile: notifier.writeRecoveryKey,
            acknowledged: acknowledged,
            onAcknowledgedChanged:
                saveKey == null ? null : notifier.acknowledge,
          ),
        ),
        DiskEncryptionDialogActions(
          mainAction: ElevatedButton(
            onPressed: acknowledged ? handleRepair : null,
            child: Text(l10n.diskEncryptionPageRepairDialogRepair),
          ),
        ),
      ],
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
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogErrorHeader),
          subtitle: Text(issue.kind.localizedDescription(l10n)),
          yaruInfoType: YaruInfoType.danger,
        ),
        Hyperlink(
          text: l10n.diskEncryptionPageLearnMore,
          url: diskEncryptionDocumentationUrl,
        ),
        _RepairTechnicalDetails(issue: issue),
      ],
    );
  }
}

class _RepairError extends ConsumerWidget {
  const _RepairError({required this.e});

  final Exception e;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        YaruInfoBox(
          title: Text(l10n.diskEncryptionPageRepairDialogErrorHeader),
          subtitle: Text(
            switch (e) {
              final TpmStateException e => e.localizedBody(l10n),
              _ => diskEncryptionDialogErrorMessage(e),
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
      ],
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
      expandIconPadding: const EdgeInsetsDirectional.only(end: 8),
      expandIconSemanticLabel: l10n.tpmActionDetailsLabel,
      header: Text(l10n.tpmActionDetailsLabel),
      // The expandable centres content narrower than itself
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(issue.kind.name.toKebabCase()),
            Text(issue.message),
          ],
        ),
      ),
    );
  }
}
