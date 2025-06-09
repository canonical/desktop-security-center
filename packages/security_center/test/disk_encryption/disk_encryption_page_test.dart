import 'package:barcode_widget/barcode_widget.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  testWidgets('recovery key is valid', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.diskEncryptionPageCheckKey), findsOneWidget);
    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheckKey));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) =>
            w is TextField &&
            w.decoration?.labelText ==
                tester.l10n.diskEncryptionPageRecoveryKey,
      ),
      'abcdef',
    );
    await tester.pump();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheck));
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.diskEncryptionPageKeyWorks), findsOneWidget);
  });

  testWidgets('error is thrown checking recovery key', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(
      checkRecoveryKey: false,
      checkError: true,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.diskEncryptionPageCheckKey), findsOneWidget);
    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheckKey));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) =>
            w is TextField &&
            w.decoration?.labelText ==
                tester.l10n.diskEncryptionPageRecoveryKey,
      ),
      'abcdef',
    );
    await tester.pump();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheck));
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.diskEncryptionPageError), findsOneWidget);
  });

  testWidgets('recovery key is invalid', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(checkRecoveryKey: false);
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.diskEncryptionPageCheckKey), findsOneWidget);
    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheckKey));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) =>
            w is TextField &&
            w.decoration?.labelText ==
                tester.l10n.diskEncryptionPageRecoveryKey,
      ),
      'abcdef',
    );
    await tester.pump();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheck));
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageKeyDoesntWork),
      findsOneWidget,
    );
  });

  group('replace recovery key', () {
    final cases = <({String name, bool replaceError})>[
      (name: 'success', replaceError: false),
      (name: 'error', replaceError: true),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(replaceError: tc.replaceError);

        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open dialog
        expect(
          find.text(tester.l10n.diskEncryptionPageReplaceButton),
          findsOneWidget,
        );
        await tester.tap(
          find.text(tester.l10n.diskEncryptionPageReplaceButton),
        );
        await tester.pumpAndSettle();

        expect(find.text('mock-recovery-key'), findsOneWidget);

        // Checkbox starts unchecked and replace button disabled
        final checkBox = find.byType(YaruCheckButton);
        expect(tester.widget<YaruCheckButton>(checkBox).value, isFalse);

        final replaceButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.diskEncryptionPageReplaceDialogReplace,
        );
        expect(tester.widget<ElevatedButton>(replaceButton).enabled, isFalse);

        // Tick and submit
        await tester.tap(checkBox);
        await tester.pumpAndSettle();
        expect(tester.widget<YaruCheckButton>(checkBox).value, isTrue);
        expect(tester.widget<ElevatedButton>(replaceButton).enabled, isTrue);

        await tester.tap(replaceButton);
        await tester.pumpAndSettle();

        // Verify outcome
        if (tc.replaceError) {
          expect(
            find.text(tester.l10n.diskEncryptionPageError),
            findsOneWidget,
          );
        } else {
          expect(
            find.text(tester.l10n.diskEncryptionPageReplaceDialogSuccessHeader),
            findsOneWidget,
          );
        }
      });
    }
  });

  testWidgets('discard replacement recovery key', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceButton),
      findsOneWidget,
    );
    await tester.tap(find.text(tester.l10n.diskEncryptionPageReplaceButton));
    await tester.pumpAndSettle();

    final discardButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogDiscard,
    );
    expect(discardButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(discardButton).enabled, equals(true));

    await tester.tap(discardButton);
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceButton),
      findsOneWidget,
    );
    expect(discardButton, findsNothing);
  });

  testWidgets('Show recovery key replacement QR code', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceButton),
      findsOneWidget,
    );
    await tester.tap(find.text(tester.l10n.diskEncryptionPageReplaceButton));
    await tester.pumpAndSettle();

    final qrCodeButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogShowQR,
    );
    expect(qrCodeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(qrCodeButton).enabled, equals(true));

    await tester.tap(qrCodeButton);
    await tester.pumpAndSettle();

    final qrCode = find.byType(BarcodeWidget);
    expect(qrCode, findsOneWidget);
    expect(find.text('mock-recovery-key'), findsAtLeast(2));
  });

  testWidgets('Show recovery key replacement QR code', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceButton),
      findsOneWidget,
    );
    await tester.tap(find.text(tester.l10n.diskEncryptionPageReplaceButton));
    await tester.pumpAndSettle();

    final qrCodeButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogShowQR,
    );
    expect(qrCodeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(qrCodeButton).enabled, equals(true));

    await tester.tap(qrCodeButton);
    await tester.pumpAndSettle();

    final qrCode = find.byType(BarcodeWidget);
    expect(qrCode, findsOneWidget);
    expect(find.text('mock-recovery-key'), findsAtLeast(2));
  });

  group('save key to file', () {
    final cases = [
      (
        name: 'valid path writes file',
        uri: Uri.file('/home/user/key.txt'),
        mount: '/dev/sda1',
        expectError: false,
      ),
      (
        name: 'blocked: /target/',
        uri: Uri.file('/target/foo.txt'),
        mount: '/dev/sda1',
        expectError: true,
      ),
      (
        name: 'blocked: cow overlay',
        uri: Uri.file('/any/f.txt'),
        mount: '/cow',
        expectError: true,
      ),
      (
        name: 'blocked: tmpfs',
        uri: Uri.file('/tmp/f.txt'),
        mount: 'tmpfs',
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        // 1) Prepare container with mocks

        final memFs = MemoryFileSystem();
        memFs.directory(p.dirname(tc.uri.path)).createSync(recursive: true);
        final fsOv = fileSystemOverride(memFs);
        final pickerOv = filePickerOverride(tc.uri);
        final runnerOv = processRunnerOverride({
          p.dirname(tc.uri.path): tc.mount,
        });

        final container = createContainer(
          overrides: [pickerOv, fsOv, runnerOv],
        );
        registerMockDiskEncryptionService();

        // 2) Pump the page
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        expect(
          find.text(tester.l10n.diskEncryptionPageReplaceButton),
          findsOneWidget,
        );
        await tester.tap(
          find.text(tester.l10n.diskEncryptionPageReplaceButton),
        );
        await tester.pumpAndSettle();

        // 4) Click “Save to file”
        final saveBtn = find.text(
          tester.l10n.diskEncryptionPageReplaceDialogSave,
        );
        await tester.tap(saveBtn);
        await tester.pumpAndSettle();

        // 5) Assert
        if (tc.expectError) {
          expect(
            find.text(tester.l10n.diskEncryptionPageError),
            findsOneWidget,
          );
        } else {
          // verify the in-memory FS got the right content
          final content = memFs.file(tc.uri.path).readAsStringSync();
          expect(content, 'mock-recovery-key');
        }
      });
    }
  });
}
