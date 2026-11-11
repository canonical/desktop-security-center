import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/constants.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/disk_encryption/recovery_key_panel.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:yaru/yaru.dart';

const diskEncryptionDocumentationUrl =
    'https://documentation.ubuntu.com/desktop/en/latest/explanation/hardware-backed-disk-encryption/';

const yaruProgressSize = 20.0;

String diskEncryptionDialogErrorMessage(Exception e) => switch (e) {
      final TpmFdeOperationException e => e.causeByMessage(),
      final SnapdException e => e.message,
      _ => e.toString(),
    };

class RecoveryKeyCheck extends ConsumerWidget {
  const RecoveryKeyCheck({super.key, this.keyDoesntWorkBody});

  // The default suggests replacing the key, which not every flow offers
  final String? keyDoesntWorkBody;

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
              subtitle: Text(
                keyDoesntWorkBody ?? l10n.diskEncryptionPageKeyDoesntWorkBody,
              ),
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

// Scaffold displays the snack bar above the barrier; forward Esc back
// to the dialog since Scaffold intercepts Esc even without a drawer.
class DiskEncryptionDialog extends StatefulWidget {
  const DiskEncryptionDialog({
    required this.title,
    required this.child,
    this.isClosable = true,
    super.key,
  });

  final String title;
  final bool isClosable;
  final Widget child;

  @override
  State<DiskEncryptionDialog> createState() => _DiskEncryptionDialogState();
}

class _DiskEncryptionDialogState extends State<DiskEncryptionDialog> {
  bool _isQRCodeShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Actions(
        actions: <Type, Action<Intent>>{
          DismissIntent: CallbackAction<DismissIntent>(
            onInvoke: (_) => Navigator.of(context).maybePop(),
          ),
        },
        // ModalRoute.isCurrentOf would hide the dialog behind the file chooser
        child: NotificationListener<RecoveryKeyQRCodeNotification>(
          onNotification: (notification) {
            setState(() => _isQRCodeShown = notification.isShown);
            return true;
          },
          child: Visibility(
            visible: !_isQRCodeShown,
            // The hidden panel must stay mounted to report the QR code closing
            maintainState: true,
            child: AlertDialog(
              title: YaruDialogTitleBar(
                title: Text(widget.title),
                isClosable: widget.isClosable,
              ),
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              // A tight width keeps AlertDialog from measuring the content's
              // intrinsics, which a scroll view can't report
              content: SizedBox(
                width: kDialogWidth,
                child: ScrollablePage(
                  padding: EdgeInsets.all(kPageSectionGap),
                  children: [widget.child],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Cancel on the left and the main action on the right, as in other dialogs in
// the system, but the main action gets the keyboard focus first
class DiskEncryptionDialogActions extends StatelessWidget {
  const DiskEncryptionDialogActions({
    required this.mainAction,
    this.cancelLabel,
    super.key,
  });

  final Widget mainAction;
  final String? cancelLabel;

  @override
  Widget build(BuildContext context) {
    // The main action takes the focus as soon as its step shows, so a key
    // still held down from the step before would press it too
    return Focus(
      canRequestFocus: false,
      onKeyEvent: (_, event) => event is KeyRepeatEvent
          ? KeyEventResult.handled
          : KeyEventResult.ignored,
      child: SizedBox(
        width: double.infinity,
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 10,
            runSpacing: 16,
            children: [
              FocusTraversalOrder(
                order: const NumericFocusOrder(2),
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    cancelLabel ?? UbuntuLocalizations.of(context).cancelLabel,
                  ),
                ),
              ),
              FocusTraversalOrder(
                order: const NumericFocusOrder(1),
                child: mainAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
