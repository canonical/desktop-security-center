import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/disk_encryption/recovery_key_panel.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  group('recovery key panel', () {
    const recoveryKey = 'mock-recovery-key';
    final cases = [
      (
        name: 'loading shows progress',
        recoveryKey: const AsyncLoading<String>(),
        actionsEnabled: true,
        saveError: null,
        expectProgress: true,
        expectKey: false,
        expectActionsEnabled: false,
      ),
      (
        name: 'key is shown',
        recoveryKey: const AsyncData(recoveryKey),
        actionsEnabled: true,
        saveError: null,
        expectProgress: false,
        expectKey: true,
        expectActionsEnabled: true,
      ),
      (
        name: 'actions disabled',
        recoveryKey: const AsyncData(recoveryKey),
        actionsEnabled: false,
        saveError: null,
        expectProgress: false,
        expectKey: true,
        expectActionsEnabled: false,
      ),
      (
        name: 'save error is shown',
        recoveryKey: const AsyncData(recoveryKey),
        actionsEnabled: true,
        saveError: RecoveryKeyExceptionFilePermission(),
        expectProgress: false,
        expectKey: true,
        expectActionsEnabled: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        await tester.pumpAppWithProviders(
          (_) => RecoveryKeyPanel(
            recoveryKey: tc.recoveryKey,
            actionsEnabled: tc.actionsEnabled,
            saveError: tc.saveError,
            onSaveErrorChanged: (_) {},
            onSaveToFile: (_, __) async {},
          ),
          container,
        );

        expect(
          find.byType(YaruLinearProgressIndicator),
          tc.expectProgress ? findsOneWidget : findsNothing,
        );
        expect(
          find.text(recoveryKey),
          tc.expectKey ? findsOneWidget : findsNothing,
        );

        final saveButton = find.widgetWithText(
          OutlinedButton,
          tester.l10n.diskEncryptionPageReplaceDialogSave,
        );
        expect(
          tester.widget<OutlinedButton>(saveButton).enabled,
          tc.expectActionsEnabled,
        );
        final qrCodeButton = find.widgetWithText(
          OutlinedButton,
          tester.l10n.diskEncryptionPageReplaceDialogShowQR,
        );
        expect(
          tester.widget<OutlinedButton>(qrCodeButton).enabled,
          tc.expectActionsEnabled,
        );

        expect(
          find.text(tester.l10n.recoveryKeyExceptionFilePermissionTitle),
          tc.saveError != null ? findsOneWidget : findsNothing,
        );
      });
    }
  });
}
