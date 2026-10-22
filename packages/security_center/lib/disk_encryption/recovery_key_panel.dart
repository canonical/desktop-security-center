import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/dialog_design.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';
import 'package:yaru/yaru.dart';

const defaultRecoveryKeyFileName = 'recovery-key.txt';

class RecoveryKeyPanel extends ConsumerWidget {
  const RecoveryKeyPanel({
    required this.recoveryKey,
    required this.actionsEnabled,
    required this.saveError,
    required this.onSaveErrorChanged,
    required this.onSaveToFile,
    super.key,
  });

  final AsyncValue<String> recoveryKey;
  final bool actionsEnabled;
  final RecoveryKeyException? saveError;
  final void Function(RecoveryKeyException? error) onSaveErrorChanged;
  final Future<void> Function(Uri uri, String recoveryKey) onSaveToFile;

  void _copyToClipboard(BuildContext context, String text) {
    final l10n = AppLocalizations.of(context);
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.diskEncryptionPageClipboardNotification)),
    );
  }

  Future<void> _saveToFile(
    BuildContext context,
    WidgetRef ref,
    String key,
  ) async {
    final l10n = AppLocalizations.of(context);
    final filePicker = ref.read(filePickerProvider);
    onSaveErrorChanged(null);
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
        onSaveErrorChanged(RecoveryKeyExceptionFilePermission());
        return;
      }
      if (uri != null) {
        await onSaveToFile(uri, key);
      }
    } on Exception catch (e) {
      onSaveErrorChanged(RecoveryKeyException.from(e));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final key = recoveryKey.valueOrNull;
    final error = saveError;
    // Fills the field's suffix slot, so the 24 px icon isn't squeezed into
    // Yaru's 20 px default button
    const copyButtonSize = 32.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (recoveryKey is AsyncLoading)
          YaruLinearProgressIndicator()
        else if (key != null)
          TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            onTap: () => _copyToClipboard(context, key),
            initialValue: key,
            decoration: InputDecoration(
              labelText: l10n.diskEncryptionPageRecoveryKey,
              suffixIcon: YaruIconButton(
                iconSize: copyButtonSize,
                tooltip: l10n.diskEncryptionPageCopySemanticLabel,
                icon: Icon(
                  YaruIcons.copy,
                  size: 24,
                  semanticLabel: l10n.diskEncryptionPageCopySemanticLabel,
                ),
                onPressed: () => _copyToClipboard(context, key),
              ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: copyButtonSize,
                maxHeight: copyButtonSize,
              ),
            ),
            readOnly: true,
            minLines: 1,
            maxLines: 2,
          ),
        // Start-aligned like a Row, since the Column centres a Wrap
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton(
                onPressed: actionsEnabled && key != null
                    ? () => _saveToFile(context, ref, key)
                    : null,
                child: Text(l10n.diskEncryptionPageReplaceDialogSave),
              ),
              OutlinedButton(
                onPressed: actionsEnabled && key != null
                    ? () => showDialog(
                          context: context,
                          builder: (_) =>
                              _RecoveryKeyQRDialog(recoveryKey: key),
                        )
                    : null,
                child: Text(l10n.diskEncryptionPageReplaceDialogShowQR),
              ),
            ],
          ),
        ),
        if (error != null)
          DialogInfoBox(
            title: Text(error.localizedTitle(l10n)),
            subtitle: Text(error.localizedBody(l10n)),
            yaruInfoType: YaruInfoType.danger,
          ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

class _RecoveryKeyQRDialog extends ConsumerWidget {
  const _RecoveryKeyQRDialog({required this.recoveryKey});

  final String recoveryKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return DialogDesignTheme(
      child: AlertDialog(
        title: YaruDialogTitleBar(
          title: Text(l10n.diskEncryptionPageReplaceDialogQRHeader),
          shape: dialogTitleBarShape,
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: dialogContentPadding,
        content: SizedBox(
          width: 435,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.diskEncryptionPageReplaceDialogQRBody),
              BarcodeWidget(
                margin: const EdgeInsets.all(16),
                // Black on white in the dark theme too, as QR readers expect
                backgroundColor: Colors.white,
                barcode: Barcode.qrCode(),
                data: recoveryKey,
                // The 4-module blank border that QR readers need, as in the
                // design: a recovery key's code is 29 modules, 37 with the border
                padding: const EdgeInsets.all(200 * 4 / 37),
                width: 200,
                height: 200,
              ),
              Text(recoveryKey),
            ],
          ),
        ),
      ),
    );
  }
}
