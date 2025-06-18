import 'package:barcode_widget/barcode_widget.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:security_center/services/disk_encryption_service.dart';
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

  testWidgets('recovery key generation fails', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(generateError: true);
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

    // Expect everything to be disabled
    final qrCodeButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogShowQR,
    );
    expect(qrCodeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(qrCodeButton).enabled, equals(false));

    final saveButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogSave,
    );
    expect(saveButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(saveButton).enabled, equals(false));

    final discardButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageReplaceDialogDiscard,
    );
    expect(discardButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(discardButton).enabled, equals(false));

    final replaceButton = find.widgetWithText(
      ElevatedButton,
      tester.l10n.diskEncryptionPageReplaceDialogReplace,
    );
    expect(replaceButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(replaceButton).enabled, equals(false));

    final checkBox = find.byType(YaruCheckButton);
    expect(tester.widget<YaruCheckButton>(checkBox).value, isFalse);
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
        // Prepare container with mocks
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

        // Pump the page
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

        // Click “Save to file”
        final saveBtn = find.text(
          tester.l10n.diskEncryptionPageReplaceDialogSave,
        );
        await tester.tap(saveBtn);
        await tester.pumpAndSettle();

        // Assert
        if (tc.expectError) {
          expect(
            find.text(tester.l10n.recoveryKeyExceptionDisallowedPathTitle),
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

  // We want the user to still be able to save the recovery key after hitting replace.
  group('save key to file post replace', () {
    final cases = [
      (
        name: 'valid path writes file',
        uri: Uri.file('/home/user/key.txt'),
        mount: '/dev/sda1',
        expectError: false,
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
        // Prepare container with mocks
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

        // Pump the page
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

        // Go through replace flow
        final checkBox = find.byType(YaruCheckButton);
        expect(tester.widget<YaruCheckButton>(checkBox).value, isFalse);

        final replaceButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.diskEncryptionPageReplaceDialogReplace,
        );
        expect(tester.widget<ElevatedButton>(replaceButton).enabled, isFalse);
        await tester.tap(checkBox);
        await tester.pumpAndSettle();
        expect(tester.widget<YaruCheckButton>(checkBox).value, isTrue);
        expect(tester.widget<ElevatedButton>(replaceButton).enabled, isTrue);
        await tester.tap(replaceButton);
        await tester.pumpAndSettle();
        expect(
          find.text(tester.l10n.diskEncryptionPageReplaceDialogSuccessHeader),
          findsOneWidget,
        );

        // Click “Save to file”
        final saveBtn = find.text(
          tester.l10n.diskEncryptionPageReplaceDialogSave,
        );
        await tester.tap(saveBtn);
        await tester.pumpAndSettle();

        // Assert
        if (tc.expectError) {
          expect(
            find.text(tester.l10n.recoveryKeyExceptionDisallowedPathTitle),
            findsOneWidget,
          );
          expect(
            find.text(tester.l10n.diskEncryptionPageReplaceDialogSuccessHeader),
            findsNothing,
          );
        } else {
          // verify the in-memory FS got the right content
          final content = memFs.file(tc.uri.path).readAsStringSync();
          expect(content, 'mock-recovery-key');
          expect(
            find.text(tester.l10n.diskEncryptionPageReplaceDialogSuccessHeader),
            findsOneWidget,
          );
        }
      });
    }
  });

  testWidgets('change passphrase - show toggles visibility', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.recoveryKeyPinButton), findsOneWidget);
    await tester.tap(find.text(tester.l10n.recoveryKeyPinButton));
    await tester.pumpAndSettle();

    // Find all Show buttons (should be 3 - current, new, confirm passphrase)
    final showButtons = find.text(tester.l10n.recoveryKeyPassphraseShow);
    expect(showButtons, findsNWidgets(3));

    // Find the text fields and enter text
    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(3));

    await tester.enterText(textFields.at(0), '1234');
    await tester.enterText(textFields.at(1), '5678');
    await tester.enterText(textFields.at(2), '5678');
    await tester.pump();

    // Verify text is obscured initially
    expect(tester.widget<TextField>(textFields.at(0)).obscureText, isTrue);
    expect(tester.widget<TextField>(textFields.at(1)).obscureText, isTrue);
    expect(tester.widget<TextField>(textFields.at(2)).obscureText, isTrue);

    // Tap the first show button
    await tester.tap(showButtons.first);
    await tester.pumpAndSettle();

    // Verify text is now not obscured
    expect(tester.widget<TextField>(textFields.at(0)).obscureText, isFalse);
    expect(tester.widget<TextField>(textFields.at(1)).obscureText, isFalse);
    expect(tester.widget<TextField>(textFields.at(2)).obscureText, isFalse);

    // Verify buttons now show 'Hide' instead of 'Show'
    final hideButtons = find.text(tester.l10n.recoveryKeyPassphraseHide);
    expect(hideButtons, findsNWidgets(3));
    expect(find.text(tester.l10n.recoveryKeyPassphraseShow), findsNothing);
  });

  group('change auth - submit disabled when new and confirm do not match', () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: tc.authMode);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open change dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinButton
            : tester.l10n.recoveryKeyPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields and change button
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(3));

        final changeButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.recoveryKeyPassphraseChange,
        );
        expect(changeButton, findsOneWidget);

        // Initially button should be disabled (no input)
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);

        // Enter valid current auth and valid new auth, but mismatched confirm
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '1234');
          await tester.enterText(textFields.at(1), '5678');
          await tester.enterText(textFields.at(2), '9999');
        } else {
          await tester.enterText(textFields.at(0), 'currentpass');
          await tester.enterText(textFields.at(1), 'newpass');
          await tester.enterText(textFields.at(2), 'different');
        }
        await tester.pump();

        // Button should still be disabled due to validation error
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);

        // Check that appropriate mismatch error message is visible
        final expectedError = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinConfirmError
            : tester.l10n.recoveryKeyPassphraseConfirmError;
        expect(find.text(expectedError), findsOneWidget);
      });
    }
  });

  group('change auth - submit with valid inputs', () {
    final cases = [
      (
        name: 'Pin success',
        authMode: AuthMode.pin,
        changePinPassphraseError: false,
      ),
      (
        name: 'Pin failure',
        authMode: AuthMode.pin,
        changePinPassphraseError: true,
      ),
      (
        name: 'passphrase success',
        authMode: AuthMode.passphrase,
        changePinPassphraseError: false,
      ),
      (
        name: 'passphrase failure',
        authMode: AuthMode.passphrase,
        changePinPassphraseError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(
          authMode: tc.authMode,
          changePinPassphraseError: tc.changePinPassphraseError,
        );
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open change dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinButton
            : tester.l10n.recoveryKeyPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields and change button
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(3));

        final changeButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.recoveryKeyPassphraseChange,
        );
        expect(changeButton, findsOneWidget);

        // Initially button should be disabled (no input)
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);

        // Enter valid inputs for all fields
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '1234');
          await tester.enterText(textFields.at(1), '5678');
          await tester.enterText(textFields.at(2), '5678');
        } else {
          await tester.enterText(textFields.at(0), 'currentpass');
          await tester.enterText(textFields.at(1), 'newpass');
          await tester.enterText(textFields.at(2), 'newpass');
        }
        await tester.pump();

        // Button should now be enabled with valid inputs
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isTrue);

        // Submit the form
        await tester.tap(changeButton);
        await tester.pumpAndSettle();

        // Check the result based on success/failure
        if (tc.changePinPassphraseError) {
          // Should show error message
          expect(
            find.text(tester.l10n.diskEncryptionPageError),
            findsOneWidget,
          );

          // Fields should remain enabled on error (so user can retry)
          for (var i = 0; i < 3; i++) {
            final textField = tester.widget<TextField>(textFields.at(i));
            expect(textField.enabled, isTrue);
          }
        } else {
          // Should show success message based on auth mode
          final expectedSuccess = tc.authMode == AuthMode.pin
              ? tester.l10n.recoveryKeyPassphrasePinSuccessHeader
              : tester.l10n.recoveryKeyPassphrasePassphraseSuccessHeader;
          expect(find.text(expectedSuccess), findsOneWidget);

          // All fields should be disabled on success
          for (var i = 0; i < 3; i++) {
            final textField = tester.widget<TextField>(textFields.at(i));
            expect(textField.enabled, isFalse);
          }
        }
        // Submit button is disabled either way
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);
      });
    }
  });

  group('change auth - input filtering validation', () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: tc.authMode);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open change dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinButton
            : tester.l10n.recoveryKeyPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(3));

        // Test input filtering by entering mixed alphanumeric text
        const mixedInput = 'a1b2c3d4';

        // Enter mixed text in all three fields
        await tester.enterText(textFields.at(0), mixedInput);
        await tester.enterText(textFields.at(1), mixedInput);
        await tester.enterText(textFields.at(2), mixedInput);
        await tester.pump();

        // Check the actual text in the controllers based on auth mode
        final expectedText = tc.authMode == AuthMode.pin ? '1234' : mixedInput;

        // Verify filtering behavior in all text fields
        for (var i = 0; i < 3; i++) {
          final textField = tester.widget<TextField>(textFields.at(i));
          expect(textField.controller?.text, expectedText);
        }
      });
    }
  });
}
