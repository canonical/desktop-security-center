import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/disk_encryption/disk_encryption_l10n.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';
import 'package:yaru/yaru.dart';

const defaultRecoveryKeyFileName = 'recovery-key.txt';

class RecoveryKeyPanel extends ConsumerStatefulWidget {
  const RecoveryKeyPanel({
    required this.recoveryKey,
    required this.actionsEnabled,
    super.key,
  });

  final AsyncValue<String> recoveryKey;
  final bool actionsEnabled;

  @override
  ConsumerState<RecoveryKeyPanel> createState() => RecoveryKeyPanelState();
}

class RecoveryKeyPanelState extends ConsumerState<RecoveryKeyPanel> {
  RecoveryKeyException? _saveError;

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
    final fileSystem = ref.read(fileSystemProvider);
    setState(() => _saveError = null);
    RecoveryKeyException? error;
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
        error = RecoveryKeyExceptionFilePermission();
      } else if (uri != null) {
        await fileSystem.file(uri.path).writeAsString(key);
      }
    } on Exception catch (e) {
      error = RecoveryKeyException.from(e);
    }
    // The dialog can close while the file picker is open
    if (mounted) setState(() => _saveError = error);
  }

  Future<void> _showQRCode(BuildContext context, String key) async {
    const RecoveryKeyQRCodeNotification(isShown: true).dispatch(context);
    await showDialog<void>(
      context: context,
      // The dialog holding the panel already dims the page
      barrierColor: Colors.transparent,
      builder: (_) => _RecoveryKeyQRDialog(recoveryKey: key),
    );
    if (context.mounted) {
      const RecoveryKeyQRCodeNotification(isShown: false).dispatch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final key = widget.recoveryKey.valueOrNull;
    final error = _saveError;
    // The copy button fills the field's suffix slot, so its 24 px icon isn't
    // squeezed into Yaru's 20 px default button
    const copyButtonSize = 32.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.recoveryKey is AsyncLoading)
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
        Row(
          children: [
            OutlinedButton(
              onPressed: widget.actionsEnabled && key != null
                  ? () => _saveToFile(context, ref, key)
                  : null,
              child: Text(l10n.diskEncryptionPageReplaceDialogSave),
            ),
            OutlinedButton(
              onPressed: widget.actionsEnabled && key != null
                  ? () => _showQRCode(context, key)
                  : null,
              child: Text(l10n.diskEncryptionPageReplaceDialogShowQR),
            ),
          ].separatedBy(const SizedBox(width: 8)),
        ),
        if (error != null)
          YaruInfoBox(
            title: Text(error.localizedTitle(l10n)),
            subtitle: Text(error.localizedBody(l10n)),
            yaruInfoType: YaruInfoType.danger,
          ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}

/// Dispatched by [RecoveryKeyPanel] when its QR code dialog opens and closes.
class RecoveryKeyQRCodeNotification extends Notification {
  const RecoveryKeyQRCodeNotification({required this.isShown});

  final bool isShown;
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
      content: SizedBox(
        width: 460,
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
              // At least the blank border of 4 modules that QR readers need,
              // as in the design
              padding: const EdgeInsets.all(24),
              width: 200,
              height: 200,
            ),
            Text(recoveryKey),
          ],
        ),
      ),
    );
  }
}
