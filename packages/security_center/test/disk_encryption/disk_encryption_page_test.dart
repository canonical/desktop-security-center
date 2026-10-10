import 'package:barcode_widget/barcode_widget.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as p;
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:snapd/snapd.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  const debounceDelay = Duration(milliseconds: 500);

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

    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsOneWidget,
    );
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
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsOneWidget,
    );
  });

  testWidgets('recovery key is invalid', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(authCancelled: true);
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
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsNothing,
    );

    // Check button is still enabled.
    final checkButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageCheck,
    );
    expect(checkButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(checkButton).enabled, isTrue);
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
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
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

  testWidgets('recovery key generation auth cancelled', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(generateAuthCancelled: true);
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

    // Dialog should be closed automatically
    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceDialogHeader),
      findsNothing,
    );
    // Should be back to main page
    expect(
      find.text(tester.l10n.diskEncryptionPageReplaceButton),
      findsOneWidget,
    );
  });

  group('save key to file', () {
    final cases = [
      (
        name: 'valid path writes file',
        uri: Uri.file('/home/user/key.txt'),
        expectError: false,
      ),
      (
        name: 'error on restriced path',
        uri: Uri.file('/root/key.txt'),
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        // Prepare container with mocks
        final memFs = MemoryFileSystem();
        if (!tc.expectError) {
          memFs.directory(p.dirname(tc.uri.path)).createSync(recursive: true);
        }
        final fsOv = fileSystemOverride(memFs);
        final pickerOv =
            filePickerOverride(tc.expectError ? Uri.parse('') : tc.uri);
        final runnerOv = processRunnerOverride({
          p.dirname(tc.uri.path): '/dev/sda1',
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
            find.text(tester.l10n.recoveryKeyExceptionFilePermissionTitle),
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
        expectError: false,
      ),
      (
        name: 'error on restricted path',
        uri: Uri.file('/root/key.txt'),
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        // Prepare container with mocks
        final memFs = MemoryFileSystem();
        if (!tc.expectError) {
          memFs.directory(p.dirname(tc.uri.path)).createSync(recursive: true);
        }
        final fsOv = fileSystemOverride(memFs);
        final pickerOv =
            filePickerOverride(tc.expectError ? Uri.parse('') : tc.uri);
        final runnerOv = processRunnerOverride({
          p.dirname(tc.uri.path): '/dev/sda1',
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
            find.text(tester.l10n.recoveryKeyExceptionFilePermissionTitle),
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

    // Find Show button
    final showButtons = find.text(tester.l10n.recoveryKeyPassphraseShow);
    expect(showButtons, findsOneWidget);

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
    final hideButton = find.text(tester.l10n.recoveryKeyPassphraseHide);
    expect(hideButton, findsOneWidget);
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
        await tester.pumpAndSettle(debounceDelay);

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

  group('change auth - entropy hinting', () {
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

        // Enter auth that is too short
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '1234');
          await tester.enterText(textFields.at(1), '321');
          await tester.enterText(textFields.at(2), '321');
        } else {
          await tester.enterText(textFields.at(0), 'currentpass');
          await tester.enterText(textFields.at(1), 'new');
          await tester.enterText(textFields.at(2), 'new');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should still be disabled due to validation error
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);

        // Check that we have a below min error hint
        final expectedError = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyBelowMin
            : tester.l10n.recoveryKeyPassphraseEntropyBelowMin;
        expect(find.text(expectedError), findsOneWidget);

        // Enter auth that is at min entropy threshold
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(1), '3210');
          await tester.enterText(textFields.at(2), '3210');
        } else {
          await tester.enterText(textFields.at(1), 'newp');
          await tester.enterText(textFields.at(2), 'newp');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should be active
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isTrue);

        // Check that we have a below optimal hint
        final expectedBelowOptimal = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyBelowOptimal
            : tester.l10n.recoveryKeyPassphraseEntropyBelowOptimal;
        expect(find.text(expectedBelowOptimal), findsOneWidget);

        // Enter auth that is at opimal entropy threshold
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(1), '321098');
          await tester.enterText(textFields.at(2), '321098');
        } else {
          await tester.enterText(textFields.at(1), 'newpas');
          await tester.enterText(textFields.at(2), 'newpas');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should still be active
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isTrue);

        // Check that we have optimal hint
        final expectedOptimal = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyOptimal
            : tester.l10n.recoveryKeyPassphraseEntropyOptimal;
        expect(find.text(expectedOptimal), findsOneWidget);
      });
    }
  });

  testWidgets('change auth - snapd errors are fatal', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(entropyCheckError: true);
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(find.text(tester.l10n.recoveryKeyPinButton), findsOneWidget);
    await tester.tap(find.text(tester.l10n.recoveryKeyPinButton));
    await tester.pumpAndSettle(debounceDelay);

    // Find new auth text field and enter text
    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(3));

    await tester.enterText(textFields.at(1), '5678');
    await tester.pumpAndSettle(debounceDelay);

    // Find the snapd error header
    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsOneWidget,
    );

    // All text fields are disabled on a fatal error
    for (var i = 0; i < 3; i++) {
      final textField = tester.widget<TextField>(textFields.at(i));
      expect(textField.enabled, isFalse);
    }

    // Submit button is disabled
    final changeButton = find.widgetWithText(
      ElevatedButton,
      tester.l10n.recoveryKeyPassphraseChange,
    );
    expect(changeButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(changeButton).enabled, isFalse);
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
        await tester.pumpAndSettle(debounceDelay);

        // Button should now be enabled with valid inputs
        expect(tester.widget<ElevatedButton>(changeButton).enabled, isTrue);

        // Submit the form
        await tester.tap(changeButton);
        await tester.pumpAndSettle(debounceDelay);

        // Check the result based on success/failure
        if (tc.changePinPassphraseError) {
          // Should show error message
          expect(
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
            findsOneWidget,
          );
          expect(
            find.text('Exception: Mock change PIN/passphrase error'),
            findsOneWidget,
          );
          expect(
            find.textContaining('TpmFdeOperationException'),
            findsNothing,
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

  testWidgets('change auth - auth cancelled preserves input with no error',
      (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(
      changePinPassphraseSnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.recoveryKeyPinButton));
    await tester.pumpAndSettle();

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), '1234');
    await tester.enterText(textFields.at(1), '5678');
    await tester.enterText(textFields.at(2), '5678');
    await tester.pumpAndSettle(debounceDelay);

    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        tester.l10n.recoveryKeyPassphraseChange,
      ),
    );
    await tester.pumpAndSettle(debounceDelay);

    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsNothing,
    );
    expect(find.byType(TextField), findsNWidgets(3));
    expect(tester.widget<TextField>(textFields.at(0)).controller?.text, '1234');
    expect(tester.widget<TextField>(textFields.at(1)).controller?.text, '5678');
    expect(tester.widget<TextField>(textFields.at(2)).controller?.text, '5678');
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
        await tester.pumpAndSettle(debounceDelay);

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

  group('TPM authentication error handling', () {
    testWidgets('storage encryption status parse error', (tester) async {
      final container = createContainer();
      registerMockDiskEncryptionService(
        storageEncryptionError: ArgumentError('Unknown enum value'),
      );
      await tester.pumpAppWithProviders(
        (_) => const DiskEncryptionPage(),
        container,
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
          tester.l10n.diskEncryptionPageErrorFailedToRetrieveStatusHeader,
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          tester.l10n.diskEncryptionPageErrorFailedToRetrieveStatusBody,
        ),
        findsOneWidget,
      );
    });

    final cases = [
      (
        name: '404 error from enumerate keyslots API',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: true,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'general failure from enumerate keyslots endpoint',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: true,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'Status banners shown - authmode none',
        authMode: AuthMode.none,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'Status banners shown - authmode PIN',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'Status banners shown - authmode passphrase',
        authMode: AuthMode.passphrase,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'storage encryption status inactive',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.inactive,
      ),
      (
        name: 'storage encryption status failed',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.failed,
      ),
      (
        name: 'storage encryption status degraded - success',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.degraded,
      ),
      (
        name: 'storage encryption status recovery - success',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.recovery,
      ),
      (
        name: 'storage encryption status indeterminate - error after retries',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.indeterminate,
      ),
      (
        name:
            '403 error from enumerate keyslots API (snap-fde-control interface)',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: true,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: false,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'missing default keyslot',
        authMode: AuthMode.pin,
        enumerateKeySlots404Error: false,
        enumerateKeySlots403Error: false,
        enumerateKeySlotsFailure: false,
        missingDefaultKeySlot: true,
        invalidTpmPlatformName: false,
        authModeMismatch: false,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final prevMaxRetry = TpmAuthenticationModel.maxRetryDuration;
        final prevInitialDelay = TpmAuthenticationModel.initialRetryDelay;
        TpmAuthenticationModel.maxRetryDuration = Duration.zero;
        TpmAuthenticationModel.initialRetryDelay = Duration.zero;
        addTearDown(() {
          TpmAuthenticationModel.maxRetryDuration = prevMaxRetry;
          TpmAuthenticationModel.initialRetryDelay = prevInitialDelay;
        });
        final container = createContainer();
        registerMockDiskEncryptionService(
          enumerateKeySlots404Error: tc.enumerateKeySlots404Error,
          enumerateKeySlots403Error: tc.enumerateKeySlots403Error,
          enumerateKeySlotsFailure: tc.enumerateKeySlotsFailure,
          missingDefaultKeySlot: tc.missingDefaultKeySlot,
          invalidTpmPlatformName: tc.invalidTpmPlatformName,
          authMode: tc.authMode,
          authModeMismatch: tc.authModeMismatch,
          storageEncryptionStatus: tc.storageEncryptionStatus,
        );
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Check if this is a happy path (no errors)
        final isHappyPath = !tc.enumerateKeySlots404Error &&
            !tc.enumerateKeySlots403Error &&
            !tc.enumerateKeySlotsFailure &&
            !tc.missingDefaultKeySlot &&
            tc.storageEncryptionStatus !=
                SnapdStorageEncryptionStatus.inactive &&
            tc.storageEncryptionStatus != SnapdStorageEncryptionStatus.failed &&
            tc.storageEncryptionStatus !=
                SnapdStorageEncryptionStatus.indeterminate;

        if (isHappyPath) {
          // Verify TPM enabled message is always shown in happy path
          expect(
            find.text(tester.l10n.recoveryKeyTPMEnabled),
            findsOneWidget,
          );

          // Verify auth mode specific message based on auth mode
          switch (tc.authMode) {
            case AuthMode.none:
              // For none mode, no additional auth text should be shown
              expect(
                find.text(tester.l10n.recoveryKeyPinEnabled),
                findsNothing,
              );
              expect(
                find.text(tester.l10n.recoveryKeyPassphraseEnabled),
                findsNothing,
              );
              break;
            case AuthMode.pin:
              expect(
                find.text(tester.l10n.recoveryKeyPinEnabled),
                findsOneWidget,
              );
              break;
            case AuthMode.passphrase:
              expect(
                find.text(
                  tester.l10n.recoveryKeyPassphraseEnabled,
                ),
                findsOneWidget,
              );
              break;
          }
        } else {
          // Verify the expected error message is displayed based on the error type
          if (tc.enumerateKeySlots404Error) {
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorUnsupportedSnapdHeader,
              ),
              findsOneWidget,
            );
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorUnsupportedSnapdBody,
              ),
              findsOneWidget,
            );
          } else if (tc.enumerateKeySlots403Error) {
            expect(
              find.text(
                tester
                    .l10n.diskEncryptionPageErrorUnconnectedSnapInterfaceHeader,
              ),
              findsOneWidget,
            );
            expect(
              find.byWidgetPredicate(
                (widget) =>
                    widget is RichText &&
                    widget.text.toPlainText().contains(
                          tester.l10n
                              .diskEncryptionPageErrorUnconnectedSnapInterfaceBody,
                        ),
              ),
              findsOneWidget,
            );
          } else if (tc.enumerateKeySlotsFailure ||
              tc.storageEncryptionStatus ==
                  SnapdStorageEncryptionStatus.inactive ||
              tc.storageEncryptionStatus ==
                  SnapdStorageEncryptionStatus.failed ||
              tc.storageEncryptionStatus ==
                  SnapdStorageEncryptionStatus.indeterminate) {
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorFailedToRetrieveStatusHeader,
              ),
              findsOneWidget,
            );
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorFailedToRetrieveStatusBody,
              ),
              findsOneWidget,
            );
          } else if (tc.missingDefaultKeySlot) {
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorFailedToRetrieveStatusHeader,
              ),
              findsOneWidget,
            );
            expect(
              find.text(
                tester.l10n.diskEncryptionPageErrorUnsupportedStateBody,
              ),
              findsOneWidget,
            );
          }
        }
      });
    }
  });

  group('add auth mode - show toggles visibility', () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'Passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: AuthMode.none);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Find and tap the appropriate add button
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageAddPinButton
            : tester.l10n.diskEncryptionPageAddPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find Show button
        final showButtons = find.text(tester.l10n.recoveryKeyPassphraseShow);
        expect(showButtons, findsOneWidget);

        // Find the text fields and enter text
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(2));

        await tester.enterText(textFields.at(0), '5678');
        await tester.enterText(textFields.at(1), '5678');
        await tester.pump();

        // Verify text is obscured initially
        expect(tester.widget<TextField>(textFields.at(0)).obscureText, isTrue);
        expect(tester.widget<TextField>(textFields.at(1)).obscureText, isTrue);

        // Tap the show button
        await tester.tap(showButtons.first);
        await tester.pumpAndSettle();

        // Verify text is now not obscured
        expect(tester.widget<TextField>(textFields.at(0)).obscureText, isFalse);
        expect(tester.widget<TextField>(textFields.at(1)).obscureText, isFalse);

        // Verify buttons now show 'Hide' instead of 'Show'
        final hideButton = find.text(tester.l10n.recoveryKeyPassphraseHide);
        expect(hideButton, findsOneWidget);
        expect(find.text(tester.l10n.recoveryKeyPassphraseShow), findsNothing);
      });
    }
  });

  group('add auth mode - submit disabled when new and confirm do not match',
      () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'Passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: AuthMode.none);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open add dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageAddPinButton
            : tester.l10n.diskEncryptionPageAddPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields and save button
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(2));

        final saveButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
        );
        expect(saveButton, findsOneWidget);

        // Initially button should be disabled (no input)
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);

        // Enter valid new auth, but mismatched confirm
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '5678');
          await tester.enterText(textFields.at(1), '9999');
        } else {
          await tester.enterText(textFields.at(0), 'newpass');
          await tester.enterText(textFields.at(1), 'different');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should still be disabled due to validation error
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);

        // Check that appropriate mismatch error message is visible
        final expectedError = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinConfirmError
            : tester.l10n.recoveryKeyPassphraseConfirmError;
        expect(find.text(expectedError), findsOneWidget);
      });
    }
  });

  group('add auth mode - entropy hinting', () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'Passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: AuthMode.none);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open add dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageAddPinButton
            : tester.l10n.diskEncryptionPageAddPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields and save button
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(2));

        final saveButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
        );
        expect(saveButton, findsOneWidget);

        // Initially button should be disabled (no input)
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);

        // Enter auth that is too short
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '321');
          await tester.enterText(textFields.at(1), '321');
        } else {
          await tester.enterText(textFields.at(0), 'new');
          await tester.enterText(textFields.at(1), 'new');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should still be disabled due to validation error
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);

        // Check that we have a below min error hint
        final expectedError = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyBelowMin
            : tester.l10n.recoveryKeyPassphraseEntropyBelowMin;
        expect(find.text(expectedError), findsOneWidget);

        // Enter auth that is at min entropy threshold
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '3210');
          await tester.enterText(textFields.at(1), '3210');
        } else {
          await tester.enterText(textFields.at(0), 'newp');
          await tester.enterText(textFields.at(1), 'newp');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should be active
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isTrue);

        // Check that we have a below optimal hint
        final expectedBelowOptimal = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyBelowOptimal
            : tester.l10n.recoveryKeyPassphraseEntropyBelowOptimal;
        expect(find.text(expectedBelowOptimal), findsOneWidget);

        // Enter auth that is at optimal entropy threshold
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '321098');
          await tester.enterText(textFields.at(1), '321098');
        } else {
          await tester.enterText(textFields.at(0), 'newpas');
          await tester.enterText(textFields.at(1), 'newpas');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should still be active
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isTrue);

        // Check that we have optimal hint
        final expectedOptimal = tc.authMode == AuthMode.pin
            ? tester.l10n.recoveryKeyPinEntropyOptimal
            : tester.l10n.recoveryKeyPassphraseEntropyOptimal;
        expect(find.text(expectedOptimal), findsOneWidget);
      });
    }
  });

  testWidgets('add auth mode - snapd errors are fatal', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(
      authMode: AuthMode.none,
      entropyCheckError: true,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.diskEncryptionPageAddPassphraseButton),
      findsOneWidget,
    );
    await tester
        .tap(find.text(tester.l10n.diskEncryptionPageAddPassphraseButton));
    await tester.pumpAndSettle(debounceDelay);

    // Find new auth text field and enter text
    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(2));

    await tester.enterText(textFields.at(0), '5678');
    await tester.pumpAndSettle(debounceDelay);

    // Find the snapd error header
    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsOneWidget,
    );

    // All text fields are disabled on a fatal error
    for (var i = 0; i < 2; i++) {
      final textField = tester.widget<TextField>(textFields.at(i));
      expect(textField.enabled, isFalse);
    }

    // Submit button is disabled
    final saveButton = find.widgetWithText(
      ElevatedButton,
      tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
    );
    expect(saveButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);
  });

  group('add auth mode - submit with valid inputs', () {
    final cases = [
      (
        name: 'Pin success',
        authMode: AuthMode.pin,
        replacePlatformKeyError: false,
      ),
      (
        name: 'Pin failure',
        authMode: AuthMode.pin,
        replacePlatformKeyError: true,
      ),
      (
        name: 'Passphrase success',
        authMode: AuthMode.passphrase,
        replacePlatformKeyError: false,
      ),
      (
        name: 'Passphrase failure',
        authMode: AuthMode.passphrase,
        replacePlatformKeyError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(
          authMode: AuthMode.none,
          replacePlatformKeyError: tc.replacePlatformKeyError,
        );
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open add dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageAddPinButton
            : tester.l10n.diskEncryptionPageAddPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields and save button
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(2));

        final saveButton = find.widgetWithText(
          ElevatedButton,
          tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
        );
        expect(saveButton, findsOneWidget);

        // Initially button should be disabled (no input)
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);

        // Enter valid inputs for both fields
        if (tc.authMode == AuthMode.pin) {
          await tester.enterText(textFields.at(0), '5678');
          await tester.enterText(textFields.at(1), '5678');
        } else {
          await tester.enterText(textFields.at(0), 'newpass');
          await tester.enterText(textFields.at(1), 'newpass');
        }
        await tester.pumpAndSettle(debounceDelay);

        // Button should now be enabled with valid inputs
        expect(tester.widget<ElevatedButton>(saveButton).enabled, isTrue);

        await tester.tap(saveButton);
        await tester.pumpAndSettle();

        // Check the result based on success/failure
        if (tc.replacePlatformKeyError) {
          expect(
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
            findsOneWidget,
          );
          expect(
            find.text('Exception: Mock replace platform key error'),
            findsOneWidget,
          );
          expect(
            find.textContaining('TpmFdeOperationException'),
            findsNothing,
          );

          // Add buttons should be re-enabled after error
          final addButtonText = tc.authMode == AuthMode.pin
              ? tester.l10n.diskEncryptionPageAddPinButton
              : tester.l10n.diskEncryptionPageAddPassphraseButton;
          final addButton = find.widgetWithText(OutlinedButton, addButtonText);
          expect(tester.widget<OutlinedButton>(addButton).enabled, isTrue);
        } else {
          expect(
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
            findsNothing,
          );
        }
      });
    }
  });

  testWidgets('add auth mode - auth cancelled preserves input with no error',
      (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(
      authMode: AuthMode.none,
      replacePlatformKeySnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageAddPinButton));
    await tester.pumpAndSettle();

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), '5678');
    await tester.enterText(textFields.at(1), '5678');
    await tester.pumpAndSettle(debounceDelay);

    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsNothing,
    );
    expect(find.byType(TextField), findsNWidgets(2));
    expect(tester.widget<TextField>(textFields.at(0)).controller?.text, '5678');
    expect(tester.widget<TextField>(textFields.at(1)).controller?.text, '5678');
  });

  testWidgets('add auth mode - generic snapd error shows cause message',
      (tester) async {
    const snapdKind = 'some-other-snapd-error';
    final container = createContainer();
    registerMockDiskEncryptionService(
      authMode: AuthMode.none,
      replacePlatformKeySnapdErrorKind: snapdKind,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageAddPinButton));
    await tester.pumpAndSettle();

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), '5678');
    await tester.enterText(textFields.at(1), '5678');
    await tester.pumpAndSettle(debounceDelay);

    await tester.tap(
      find.widgetWithText(
        ElevatedButton,
        tester.l10n.diskEncryptionPageAddPinDialogSaveButton,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Mock replace platform key snapd error'),
      findsOneWidget,
    );
    expect(
      find.textContaining('SnapdException(kind: $snapdKind'),
      findsNothing,
    );
    expect(find.textContaining('TpmFdeOperationException'), findsNothing);
  });

  group('add auth mode - input filtering validation', () {
    final cases = [
      (name: 'Pin', authMode: AuthMode.pin),
      (name: 'Passphrase', authMode: AuthMode.passphrase),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(authMode: AuthMode.none);
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Open add dialog based on auth mode
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageAddPinButton
            : tester.l10n.diskEncryptionPageAddPassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();

        // Find the text fields
        final textFields = find.byType(TextField);
        expect(textFields, findsNWidgets(2));

        // Test input filtering by entering mixed alphanumeric text
        const mixedInput = 'a1b2c3d4';

        // Enter mixed text in both fields
        await tester.enterText(textFields.at(0), mixedInput);
        await tester.enterText(textFields.at(1), mixedInput);
        await tester.pumpAndSettle(debounceDelay);

        // Check the actual text in the controllers based on auth mode
        final expectedText = tc.authMode == AuthMode.pin ? '1234' : mixedInput;

        // Verify filtering behavior in both text fields
        for (var i = 0; i < 2; i++) {
          final textField = tester.widget<TextField>(textFields.at(i));
          expect(textField.controller?.text, expectedText);
        }
      });
    }
  });

  group('remove auth mode', () {
    final cases = [
      (
        name: 'Remove PIN success',
        authMode: AuthMode.pin,
        replacePlatformKeyError: false,
      ),
      (
        name: 'Remove PIN failure',
        authMode: AuthMode.pin,
        replacePlatformKeyError: true,
      ),
      (
        name: 'Remove passphrase success',
        authMode: AuthMode.passphrase,
        replacePlatformKeyError: false,
      ),
      (
        name: 'Remove passphrase failure',
        authMode: AuthMode.passphrase,
        replacePlatformKeyError: true,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final container = createContainer();
        registerMockDiskEncryptionService(
          authMode: tc.authMode,
          replacePlatformKeyError: tc.replacePlatformKeyError,
        );
        await tester.pumpAppWithProviders(
          (_) => const DiskEncryptionPage(),
          container,
        );
        await tester.pumpAndSettle();

        // Find and tap the appropriate remove button
        final buttonText = tc.authMode == AuthMode.pin
            ? tester.l10n.diskEncryptionPageRemovePinButton
            : tester.l10n.diskEncryptionPageRemovePassphraseButton;

        expect(find.text(buttonText), findsOneWidget);
        await tester.tap(find.text(buttonText));

        await tester.pumpAndSettle();

        if (tc.replacePlatformKeyError) {
          // On error, verify error box appears on main page
          expect(
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
            findsOneWidget,
          );
          // Button should still be visible and re-enabled
          final removeButton = find.widgetWithText(OutlinedButton, buttonText);
          expect(removeButton, findsOneWidget);
          expect(
            tester.widget<OutlinedButton>(removeButton).enabled,
            isTrue,
          );
          final statusText = tc.authMode == AuthMode.pin
              ? tester.l10n.recoveryKeyPinEnabled
              : tester.l10n.recoveryKeyPassphraseEnabled;
          expect(find.text(statusText), findsOneWidget);
        } else {
          expect(
            find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
            findsNothing,
          );
        }
      });
    }
  });

  testWidgets('remove auth mode - auth cancelled leaves state unchanged',
      (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(
      replacePlatformKeySnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
    );
    await tester.pumpAppWithProviders(
      (_) => const DiskEncryptionPage(),
      container,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageRemovePinButton));
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.recoveryKeySomethingWentWrongHeader),
      findsNothing,
    );
    expect(find.text(tester.l10n.recoveryKeyPinEnabled), findsOneWidget);
    final removeButton = find.widgetWithText(
      OutlinedButton,
      tester.l10n.diskEncryptionPageRemovePinButton,
    );
    expect(removeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(removeButton).enabled, isTrue);
  });

  group('TpmAuthenticationModel retry logic', () {
    final cases = [
      (
        name: 'retries on indeterminate status and resolves when active',
        indeterminateCallCount: 3,
        maxRetryDuration: const Duration(minutes: 2),
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
        expectError: false,
      ),
      (
        name: 'fails after maxRetryDuration with persistent indeterminate',
        indeterminateCallCount: 0,
        maxRetryDuration: Duration.zero,
        storageEncryptionStatus: SnapdStorageEncryptionStatus.indeterminate,
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final prevMaxRetry = TpmAuthenticationModel.maxRetryDuration;
        final prevInitialDelay = TpmAuthenticationModel.initialRetryDelay;
        TpmAuthenticationModel.maxRetryDuration = tc.maxRetryDuration;
        TpmAuthenticationModel.initialRetryDelay = Duration.zero;
        addTearDown(() {
          TpmAuthenticationModel.maxRetryDuration = prevMaxRetry;
          TpmAuthenticationModel.initialRetryDelay = prevInitialDelay;
        });

        final service = registerMockDiskEncryptionService(
          storageEncryptionStatus: tc.storageEncryptionStatus,
          indeterminateCallCount: tc.indeterminateCallCount,
        );

        final container = createContainer();
        if (tc.expectError) {
          await expectLater(
            container.read(tpmAuthenticationModelProvider.future),
            throwsA(isA<TpmStateExceptionFailed>()),
          );
        } else {
          await container.read(tpmAuthenticationModelProvider.future);
        }

        verify(service.getStorageEncrypted())
            .called(tc.indeterminateCallCount + 1);
      });
    }
  });

  group('TpmAuthenticationModel repair status', () {
    final cases = [
      (
        name: 'reads recommendations when encryption is active',
        status: SnapdStorageEncryptionStatus.active,
        expectError: false,
      ),
      (
        name: 'reads recommendations when encryption is degraded',
        status: SnapdStorageEncryptionStatus.degraded,
        expectError: false,
      ),
      (
        name: 'reads recommendations after a recovery key boot',
        status: SnapdStorageEncryptionStatus.recovery,
        expectError: false,
      ),
      (
        name: 'rejects recommendations when encryption is inactive',
        status: SnapdStorageEncryptionStatus.inactive,
        expectError: true,
      ),
      (
        name: 'rejects recommendations when encryption has failed',
        status: SnapdStorageEncryptionStatus.failed,
        expectError: true,
      ),
      (
        name: 'rejects recommendations while status remains indeterminate',
        status: SnapdStorageEncryptionStatus.indeterminate,
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final previousMaxRetry = TpmAuthenticationModel.maxRetryDuration;
        TpmAuthenticationModel.maxRetryDuration = Duration.zero;
        addTearDown(() {
          TpmAuthenticationModel.maxRetryDuration = previousMaxRetry;
        });

        final service = registerMockDiskEncryptionService(
          storageEncryptionStatus: tc.status,
          autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        if (tc.expectError) {
          await expectLater(
            container.read(tpmAuthenticationModelProvider.future),
            throwsA(isA<TpmStateExceptionFailed>()),
          );
          verifyNever(service.enumerateKeySlots());
        } else {
          final state =
              await container.read(tpmAuthenticationModelProvider.future);
          expect(state.needsRepair, isTrue);
          verify(service.enumerateKeySlots()).called(1);
        }
        verify(service.getStorageEncrypted()).called(1);
      });
    }
  });

  group('TpmAuthenticationModel needsRepair', () {
    final cases = [
      (
        name: 'needs repair when auto-repair failed platform init',
        autoRepairResult: SnapdAutoRepairResult.failedPlatformInit,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'needs repair when auto-repair failed keyslots',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'needs repair when auto-repair failed encryption support',
        autoRepairResult: SnapdAutoRepairResult.failedEncryptionSupport,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'needs repair when auto-repair was not attempted',
        autoRepairResult: SnapdAutoRepairResult.notAttempted,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'needs repair when snapd sends no auto-repair result',
        autoRepairResult: null,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'no repair before auto-repair is initialized',
        autoRepairResult: SnapdAutoRepairResult.notInitialized,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: true,
        expectNeedsRepair: false,
      ),
      (
        name: 'no repair when repair is not supported',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        supportsReprovision: false,
        expectNeedsRepair: false,
      ),
      (
        name: 'no repair when snapd only recommends permit-manual',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.permitManual],
        supportsReprovision: true,
        expectNeedsRepair: false,
      ),
      (
        name: 'needs repair when reprovision and manual repair are recommended',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [
          SnapdRecommendedRemedialAction.requireReprovision,
          SnapdRecommendedRemedialAction.permitManual,
        ],
        supportsReprovision: true,
        expectNeedsRepair: true,
      ),
      (
        name: 'no repair when snapd only recommends require-platform-reset',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.requirePlatformReset],
        supportsReprovision: true,
        expectNeedsRepair: false,
      ),
      (
        name: 'no repair without recommendations',
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: <SnapdRecommendedRemedialAction>[],
        supportsReprovision: true,
        expectNeedsRepair: false,
      ),
      (
        name: 'no repair after successful auto-repair without a recommendation',
        autoRepairResult: SnapdAutoRepairResult.success,
        recommendations: <SnapdRecommendedRemedialAction>[],
        supportsReprovision: true,
        expectNeedsRepair: false,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        registerMockDiskEncryptionService(
          autoRepairResult: tc.autoRepairResult,
          recommendations: tc.recommendations,
        );
        registerMockFeatureService(supportsReprovision: tc.supportsReprovision);
        final container = createContainer();

        final state =
            await container.read(tpmAuthenticationModelProvider.future);

        expect(state.needsRepair, tc.expectNeedsRepair);
      });
    }

    test('changeAuthMode keeps needsRepair', () async {
      final service = registerMockDiskEncryptionService(
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      );
      registerMockFeatureService(supportsReprovision: true);
      final container = createContainer();
      final model = container.read(tpmAuthenticationModelProvider.notifier);
      await container.read(tpmAuthenticationModelProvider.future);

      await model.changeAuthMode(
        AuthMode.passphrase,
        passphrase: 'a passphrase',
      );

      final state = container.read(tpmAuthenticationModelProvider).value!;
      expect(state.currentAuthMode, AuthMode.passphrase);
      expect(state.pendingOperation, isNull);
      expect(state.operationError, isNull);
      expect(state.needsRepair, isTrue);
      verify(service.getStorageEncrypted()).called(2);
      verify(service.enumerateKeySlots()).called(2);
    });
  });

  group('TpmAuthenticationModel repair', () {
    final cases = [
      (
        name: 'reprovisions and refreshes the state',
        newMode: null,
        passphrase: null,
        reprovisionError: false,
        reprovisionSnapdAuthErrorKind: null,
        replacePlatformKeyError: false,
        expectAuthorized: true,
        expectAuthMode: AuthMode.none,
        expectErrorOperation: null,
      ),
      (
        name: 'enrols the chosen PIN after the repair',
        newMode: AuthMode.pin,
        passphrase: '1234',
        reprovisionError: false,
        reprovisionSnapdAuthErrorKind: null,
        replacePlatformKeyError: false,
        expectAuthorized: true,
        expectAuthMode: AuthMode.pin,
        expectErrorOperation: null,
      ),
      (
        name: 'reports a failed repair',
        newMode: null,
        passphrase: null,
        reprovisionError: true,
        reprovisionSnapdAuthErrorKind: null,
        replacePlatformKeyError: false,
        expectAuthorized: true,
        expectAuthMode: AuthMode.pin,
        expectErrorOperation: TpmFdeOperation.repair,
      ),
      (
        name: 'reports a cancelled repair',
        newMode: null,
        passphrase: null,
        reprovisionError: false,
        reprovisionSnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
        replacePlatformKeyError: false,
        expectAuthorized: false,
        expectAuthMode: AuthMode.pin,
        expectErrorOperation: TpmFdeOperation.repair,
      ),
      (
        name: 'reports a failed PIN enrolment after a successful repair',
        newMode: AuthMode.pin,
        passphrase: '1234',
        reprovisionError: false,
        reprovisionSnapdAuthErrorKind: null,
        replacePlatformKeyError: true,
        expectAuthorized: true,
        expectAuthMode: AuthMode.none,
        expectErrorOperation: TpmFdeOperation.addPin,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          reprovisionError: tc.reprovisionError,
          reprovisionSnapdAuthErrorKind: tc.reprovisionSnapdAuthErrorKind,
          replacePlatformKeyError: tc.replacePlatformKeyError,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        final model = container.read(tpmAuthenticationModelProvider.notifier);
        await container.read(tpmAuthenticationModelProvider.future);

        var authorized = false;
        await model.repair(
          newMode: tc.newMode,
          passphrase: tc.passphrase,
          onAuthorized: () => authorized = true,
        );

        final state = container.read(tpmAuthenticationModelProvider).value!;
        expect(authorized, tc.expectAuthorized);
        expect(state.pendingOperation, isNull);
        expect(state.operationError?.operation, tc.expectErrorOperation);
        expect(state.currentAuthMode, tc.expectAuthMode);
        verify(service.reprovision(onAuthorized: anyNamed('onAuthorized')))
            .called(1);
      });
    }
  });

  group('RepairDialogModel issues', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableTpmViaFirmware],
    );
    const rebootRequired = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.rebootRequired,
      message: 'Mock issue',
      actions: [SnapdFixAction.reboot],
    );
    const tpmFailure = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceFailure,
      message: 'Mock issue',
      actions: [SnapdFixAction.contactOem],
    );
    const noPcrBank = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.noSuitablePcrBank,
      message: 'Mock issue',
    );
    const reason = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.internalError,
      message: 'Mock unavailable reason',
    );

    final cases = [
      (
        name: 'shows the top-priority issue',
        availabilityCheckErrors: [tpmDisabled, noPcrBank],
        encryptionSupport: null,
        expectState: RepairDialogState.issue(tpmDisabled),
      ),
      (
        name: 'shows an issue the user fixes outside the app',
        availabilityCheckErrors: [rebootRequired],
        encryptionSupport: null,
        expectState: RepairDialogState.issue(rebootRequired),
      ),
      (
        name: 'shows an issue only the vendor can fix as unavailable',
        availabilityCheckErrors: [tpmFailure],
        encryptionSupport: null,
        expectState: RepairDialogState.unavailable(tpmFailure),
      ),
      (
        name: 'shows an issue without fixes as unavailable',
        availabilityCheckErrors: [noPcrBank],
        encryptionSupport: null,
        expectState: RepairDialogState.unavailable(noPcrBank),
      ),
      (
        name: 'shows the reason when snapd sends no issues',
        availabilityCheckErrors: <SnapdAvailabilityCheckError>[],
        encryptionSupport: SnapdStorageEncryptionSupport.unavailable,
        expectState: RepairDialogState.unavailable(reason),
      ),
      (
        name: 'treats defective support as unavailable',
        availabilityCheckErrors: <SnapdAvailabilityCheckError>[],
        encryptionSupport: SnapdStorageEncryptionSupport.defective,
        expectState: RepairDialogState.unavailable(reason),
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          availabilityCheckErrors: tc.availabilityCheckErrors,
          encryptionSupport: tc.encryptionSupport,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        expect(await _openRepairDialog(container), tc.expectState);
      });
    }
  });

  group('RepairDialogModel steps', () {
    final cases = [
      (
        name: 'asks for a PIN or passphrase when the check requires one',
        volumesAuthRequired: true,
        authMode: AuthMode.none,
        expectState: RepairDialogState.setPinOrPassphrase(),
      ),
      (
        name: 'asks for a new PIN or passphrase instead of the current one',
        volumesAuthRequired: true,
        authMode: AuthMode.pin,
        expectState: RepairDialogState.setPinOrPassphrase(),
      ),
      (
        name: 'warns that the current PIN or passphrase will be removed',
        volumesAuthRequired: false,
        authMode: AuthMode.pin,
        expectState: RepairDialogState.pinOrPassphraseWillBeRemoved(),
      ),
      (
        name: 'goes straight to the recovery key otherwise',
        volumesAuthRequired: false,
        authMode: AuthMode.none,
        expectState: RepairDialogState.saveKey(
          const SnapdGenerateReprovisionRecoveryKeyResponse(
            recoveryKey: 'mock-reprovision-key',
          ),
          false,
        ),
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          volumesAuthRequired: tc.volumesAuthRequired,
          authMode: tc.authMode,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        expect(await _openRepairDialog(container), tc.expectState);
      });
    }
  });

  group('RepairDialogModel check', () {
    final cases = [
      (
        name: 'closes when the admin prompt is cancelled',
        getSystemsError: null,
        getSystemsSnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
        expectState: RepairDialogState.authCancelled(),
      ),
      (
        name: 'fails when snapd sends a value it does not know',
        getSystemsError: ArgumentError('Mock unknown value'),
        getSystemsSnapdAuthErrorKind: null,
        expectState: RepairDialogState.error(TpmStateExceptionFailed()),
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          getSystemsError: tc.getSystemsError,
          getSystemsSnapdAuthErrorKind: tc.getSystemsSnapdAuthErrorKind,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        expect(await _openRepairDialog(container), tc.expectState);
      });
    }
  });

  group('RepairDialogModel availability', () {
    final cases = [
      (
        name: 'fails while the status is indeterminate',
        // The page, then the dialog's check
        statusSequence: [
          SnapdStorageEncryptionStatus.active,
          SnapdStorageEncryptionStatus.indeterminate,
        ],
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      ),
      (
        name: 'fails while auto-repair is not initialized',
        statusSequence: null,
        autoRepairResult: SnapdAutoRepairResult.notInitialized,
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      ),
      (
        name: 'fails when snapd no longer recommends a repair',
        statusSequence: null,
        autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
        recommendations: <SnapdRecommendedRemedialAction>[],
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          storageEncryptionStatusSequence: tc.statusSequence,
          autoRepairResult: tc.autoRepairResult,
          recommendations: tc.recommendations,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        expect(
          await _openRepairDialog(container),
          isA<RepairDialogStateError>()
              .having((s) => s.e, 'e', isA<RepairNotAvailableException>()),
        );
        verifyNever(service.getSystems());
      });
    }
  });

  group('RepairDialogModel applyFix', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableTpmViaFirmware],
    );
    const noHardwareRootOfTrust = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.noHardwareRootOfTrust,
      message: 'Mock issue',
      actions: [SnapdFixAction.proceed],
    );
    final fixError = Exception('Mock fix encryption support error');

    final cases = [
      (
        name: 'applies the fix and goes on with the new check',
        fixEncryptionSupportError: null,
        fixEncryptionSupportSnapdAuthErrorKind: null,
        expectState: RepairDialogState.saveKey(
          const SnapdGenerateReprovisionRecoveryKeyResponse(
            recoveryKey: 'mock-reprovision-key',
          ),
          false,
        ),
      ),
      (
        name: 'returns to the issue when the admin prompt is cancelled',
        fixEncryptionSupportError: null,
        fixEncryptionSupportSnapdAuthErrorKind:
            SnapdAuthErrorKind.authCancelled,
        expectState: RepairDialogState.issue(tpmDisabled),
      ),
      (
        name: 'fails when the fix fails',
        fixEncryptionSupportError: fixError,
        fixEncryptionSupportSnapdAuthErrorKind: null,
        expectState: RepairDialogState.error(fixError),
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          authMode: AuthMode.none,
          availabilityCheckErrors: [tpmDisabled],
          fixEncryptionSupportError: tc.fixEncryptionSupportError,
          fixEncryptionSupportSnapdAuthErrorKind:
              tc.fixEncryptionSupportSnapdAuthErrorKind,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _openRepairDialog(container);

        await container
            .read(repairDialogModelProvider.notifier)
            .applyFix(SnapdFixAction.enableTpmViaFirmware);

        expect(
          container.read(repairDialogModelProvider).dialogState,
          tc.expectState,
        );
        verify(
          service.fixEncryptionSupport(SnapdFixAction.enableTpmViaFirmware),
        ).called(1);
      });
    }

    test('accepts only the current issue when it proceeds', () async {
      final service = registerMockDiskEncryptionService(
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        authMode: AuthMode.none,
        availabilityCheckErrors: [noHardwareRootOfTrust],
      );
      registerMockFeatureService(supportsReprovision: true);
      final container = createContainer();
      await _openRepairDialog(container);

      await container
          .read(repairDialogModelProvider.notifier)
          .applyFix(SnapdFixAction.proceed);

      verify(
        service.fixEncryptionSupport(
          SnapdFixAction.proceed,
          args: {
            'error-kinds': ['no-hardware-root-of-trust'],
          },
        ),
      ).called(1);
    });
  });

  group('RepairDialogModel clearing the TPM', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableAndClearTpmViaFirmware],
    );

    final cases = [
      (
        name: 'refuses before the recovery key is checked',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.degraded,
        checkKey: false,
        checkRecoveryKey: true,
        expectError: true,
      ),
      (
        name: 'refuses when the recovery key check fails',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.degraded,
        checkKey: true,
        checkRecoveryKey: false,
        expectError: true,
      ),
      (
        name: 'applies the fix after the recovery key is checked',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.degraded,
        checkKey: true,
        checkRecoveryKey: true,
        expectError: false,
      ),
      (
        name: 'applies the fix after a recovery key boot',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.recovery,
        checkKey: false,
        checkRecoveryKey: true,
        expectError: false,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          storageEncryptionStatus: tc.storageEncryptionStatus,
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          authMode: AuthMode.none,
          availabilityCheckErrors: [tpmDisabled],
          checkRecoveryKey: tc.checkRecoveryKey,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _openRepairDialog(container);
        if (tc.checkKey) {
          // The repair dialog watches the check, which keeps its model alive
          container.listen(checkRecoveryKeyDialogModelProvider, (_, __) {});
          final keyCheck =
              container.read(checkRecoveryKeyDialogModelProvider.notifier);
          keyCheck.setKeyToCheck('abcdef');
          await keyCheck.checkRecoveryKey();
        }
        final model = container.read(repairDialogModelProvider.notifier);

        if (tc.expectError) {
          await expectLater(
            model.applyFix(SnapdFixAction.enableAndClearTpmViaFirmware),
            throwsA(isA<StateError>()),
          );
          expect(
            container.read(repairDialogModelProvider).dialogState,
            RepairDialogState.issue(tpmDisabled),
          );
          verifyNever(
            service.fixEncryptionSupport(any, args: anyNamed('args')),
          );
        } else {
          await model.applyFix(SnapdFixAction.enableAndClearTpmViaFirmware);
          verify(
            service.fixEncryptionSupport(
              SnapdFixAction.enableAndClearTpmViaFirmware,
            ),
          ).called(1);
        }
      });
    }
  });

  group('RepairDialogModel recovery key', () {
    final cases = [
      (
        name: 'closes when the admin prompt after the check is cancelled',
        volumesAuthRequired: false,
        authMode: AuthMode.none,
        expectState: RepairDialogState.authCancelled(),
      ),
      (
        name: 'returns to the PIN step when the admin prompt is cancelled',
        volumesAuthRequired: true,
        authMode: AuthMode.none,
        expectState: RepairDialogState.setPinOrPassphrase(),
      ),
      (
        name: 'returns to the warning when the admin prompt is cancelled',
        volumesAuthRequired: false,
        authMode: AuthMode.pin,
        expectState: RepairDialogState.pinOrPassphraseWillBeRemoved(),
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          volumesAuthRequired: tc.volumesAuthRequired,
          authMode: tc.authMode,
          generateReprovisionRecoveryKeySnapdAuthErrorKind:
              SnapdAuthErrorKind.authCancelled,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        final step = await _openRepairDialog(container);
        final model = container.read(repairDialogModelProvider.notifier);

        if (step is RepairDialogStateSetPinOrPassphrase) {
          final pinModel = container
              .read(changeAuthModeDialogModelProvider(AuthMode.pin).notifier);
          await pinModel.setNewPass('1234');
          await pinModel.setConfirmPass('1234');
          await pumpEventQueue();
          await model.continueWithPinOrPassphrase(AuthMode.pin);
        } else if (step is RepairDialogStatePinOrPassphraseWillBeRemoved) {
          await model.continueToKey();
        }

        expect(
          container.read(repairDialogModelProvider).dialogState,
          tc.expectState,
        );
        verify(service.generateReprovisionRecoveryKey()).called(1);
      });
    }
  });

  group('RepairDialogModel startRepair', () {
    test('starts the repair, then adds the chosen PIN', () async {
      final service = registerMockDiskEncryptionService(
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        authMode: AuthMode.none,
        volumesAuthRequired: true,
      );
      registerMockFeatureService(supportsReprovision: true);
      final container = createContainer();
      await _openRepairDialog(container);
      final pinModel = container
          .read(changeAuthModeDialogModelProvider(AuthMode.pin).notifier);
      await pinModel.setNewPass('1234');
      await pinModel.setConfirmPass('1234');
      await pumpEventQueue();
      final model = container.read(repairDialogModelProvider.notifier);
      await model.continueWithPinOrPassphrase(AuthMode.pin);
      model.acknowledge(true);

      var authorized = false;
      await model.startRepair(onAuthorized: () => authorized = true);

      final state = container.read(tpmAuthenticationModelProvider).value!;
      expect(authorized, isTrue);
      expect(state.operationError, isNull);
      // Reprovisioning removes the PIN, so it's only set if added afterwards
      expect(state.currentAuthMode, AuthMode.pin);
      verify(service.reprovision(onAuthorized: anyNamed('onAuthorized')))
          .called(1);
      verify(
        service.replacePlatformKey(
          authMode: AuthMode.pin,
          pin: '1234',
          onAuthorized: anyNamed('onAuthorized'),
        ),
      ).called(1);
    });

    test('refuses to start before the new key is acknowledged', () async {
      final service = registerMockDiskEncryptionService(
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        authMode: AuthMode.none,
      );
      registerMockFeatureService(supportsReprovision: true);
      final container = createContainer();
      final saveKey = await _openRepairDialog(container);
      final model = container.read(repairDialogModelProvider.notifier);

      await expectLater(model.startRepair(), throwsA(isA<StateError>()));

      expect(container.read(repairDialogModelProvider).dialogState, saveKey);
      verifyNever(
        service.reprovision(onAuthorized: anyNamed('onAuthorized')),
      );
    });

    final cases = [
      (
        name: 'returns to the key when the admin prompt is cancelled',
        reprovisionSnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
        reprovisionSnapdErrorKind: null,
        expectError: false,
      ),
      (
        name: 'shows the error when snapd refuses the repair',
        reprovisionSnapdAuthErrorKind: null,
        reprovisionSnapdErrorKind: 'snap-change-conflict',
        expectError: true,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          authMode: AuthMode.none,
          reprovisionSnapdAuthErrorKind: tc.reprovisionSnapdAuthErrorKind,
          reprovisionSnapdErrorKind: tc.reprovisionSnapdErrorKind,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _openRepairDialog(container);
        final model = container.read(repairDialogModelProvider.notifier);
        model.acknowledge(true);
        final saveKey = container.read(repairDialogModelProvider).dialogState;

        var authorized = false;
        await model.startRepair(onAuthorized: () => authorized = true);

        final tpmState = container.read(tpmAuthenticationModelProvider).value!;
        final dialogState =
            container.read(repairDialogModelProvider).dialogState;
        expect(authorized, isFalse);
        if (tc.expectError) {
          expect(
            dialogState,
            RepairDialogState.error(tpmState.operationError!),
          );
        } else {
          expect(dialogState, saveKey);
          expect(tpmState.operationError, isNull);
        }
        verify(service.reprovision(onAuthorized: anyNamed('onAuthorized')))
            .called(1);
      });
    }
  });

  group('RepairDialogModel startRepair availability', () {
    final cases = [
      (
        name: 'refuses to start while the status is indeterminate',
        // The page, the dialog's check, then the check before the repair
        statusSequence: [
          SnapdStorageEncryptionStatus.active,
          SnapdStorageEncryptionStatus.active,
          SnapdStorageEncryptionStatus.indeterminate,
        ],
        autoRepairResultSequence: null,
      ),
      (
        name: 'refuses to start while auto-repair is not initialized',
        statusSequence: null,
        autoRepairResultSequence: [
          SnapdAutoRepairResult.failedKeyslots,
          SnapdAutoRepairResult.failedKeyslots,
          SnapdAutoRepairResult.notInitialized,
        ],
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          authMode: AuthMode.none,
          storageEncryptionStatusSequence: tc.statusSequence,
          autoRepairResultSequence: tc.autoRepairResultSequence,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _openRepairDialog(container);
        final model = container.read(repairDialogModelProvider.notifier);
        model.acknowledge(true);

        await model.startRepair();

        expect(
          container.read(repairDialogModelProvider).dialogState,
          isA<RepairDialogStateError>()
              .having((s) => s.e, 'e', isA<RepairNotAvailableException>()),
        );
        verifyNever(
          service.reprovision(onAuthorized: anyNamed('onAuthorized')),
        );
      });
    }
  });

  group('RepairDialogModel retry', () {
    test('starts over from the check', () async {
      final service = registerMockDiskEncryptionService(
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        authMode: AuthMode.none,
        generateReprovisionRecoveryKeyError: true,
      );
      registerMockFeatureService(supportsReprovision: true);
      final container = createContainer();
      expect(
        await _openRepairDialog(container),
        isA<RepairDialogStateError>(),
      );

      container.read(repairDialogModelProvider.notifier).retry();
      await pumpEventQueue();

      expect(
        container.read(repairDialogModelProvider).dialogState,
        isA<RepairDialogStateError>(),
      );
      // The page, then each of the dialog's checks
      verify(service.getStorageEncrypted()).called(3);
      verify(service.getSystems()).called(2);
      verify(service.generateReprovisionRecoveryKey()).called(2);
    });
  });

  group('repair dialog shows', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [
        SnapdFixAction.enableTpmViaFirmware,
        SnapdFixAction.rebootToFwSettings,
      ],
    );
    const tpmDisabledOneFix = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableTpmViaFirmware, SnapdFixAction.contactOem],
    );
    const noRootOfTrust = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.noHardwareRootOfTrust,
      message: 'Mock issue',
      actions: [SnapdFixAction.proceed],
    );
    const tpmFailure = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceFailure,
      message: 'Mock issue',
      actions: [SnapdFixAction.contactOem],
    );

    final cases = <({
      String name,
      List<SnapdRecommendedRemedialAction> recommendations,
      List<SnapdAvailabilityCheckError> availabilityCheckErrors,
      Object? getSystemsError,
      List<String> Function(AppLocalizations l10n) expectTexts,
    })>[
      (
        name: 'each solution to the issue',
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        availabilityCheckErrors: [tpmDisabled],
        getSystemsError: null,
        expectTexts: (l10n) => [
              l10n.tpmActionPageTitleActionable,
              l10n.tpmActionErrorSupportLabel,
              l10n.tpmActionErrorKindTpmDeviceDisabled,
              l10n.tpmActionSolutionLabel(
                1,
                l10n.tpmActionFixActionEnableTpmViaFirmware,
              ),
              l10n.tpmActionSolutionLabel(
                2,
                l10n.tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled,
              ),
            ],
      ),
      (
        name: 'the only solution, without contacting the vendor',
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        availabilityCheckErrors: [tpmDisabledOneFix],
        getSystemsError: null,
        expectTexts: (l10n) => [
              l10n.tpmActionErrorSupportSingleLabel,
              l10n.tpmActionSingleSolutionLabel(
                l10n.tpmActionFixActionEnableTpmViaFirmware,
              ),
            ],
      ),
      (
        name: 'an issue the user can only ignore',
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        availabilityCheckErrors: [noRootOfTrust],
        getSystemsError: null,
        expectTexts: (l10n) => [
              l10n.tpmActionFixActionProceedDescription,
              l10n.tpmActionErrorKindNoHardwareRootOfTrust,
              l10n.tpmActionIgnoreAndContinueLabel,
            ],
      ),
      (
        name: 'an issue without fixes',
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        availabilityCheckErrors: [tpmFailure],
        getSystemsError: null,
        expectTexts: (l10n) => [
              l10n.diskEncryptionPageRepairDialogErrorHeader,
              l10n.tpmActionErrorKindGenericTpm,
            ],
      ),
      (
        name: 'a failed check',
        recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
        availabilityCheckErrors: [],
        getSystemsError: Exception('Mock get systems error'),
        expectTexts: (l10n) => [l10n.diskEncryptionPageRepairDialogErrorHeader],
      ),
      (
        name: 'that no repair is needed',
        recommendations: [],
        availabilityCheckErrors: [],
        getSystemsError: null,
        expectTexts: (l10n) => [l10n.diskEncryptionPageRepairDialogNotNeeded],
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        registerMockDiskEncryptionService(
          recommendations: tc.recommendations,
          availabilityCheckErrors: tc.availabilityCheckErrors,
          getSystemsError: tc.getSystemsError,
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();

        await _showRepairDialog(tester, container);

        for (final text in tc.expectTexts(tester.l10n)) {
          expect(find.text(text), findsOneWidget);
        }
      });
    }
  });

  group('repair dialog applies', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableTpmViaFirmware, SnapdFixAction.proceed],
    );
    const noRootOfTrust = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.noHardwareRootOfTrust,
      message: 'Mock issue',
      actions: [SnapdFixAction.proceed],
    );

    final cases = <({
      String name,
      SnapdAvailabilityCheckError issue,
      String Function(AppLocalizations l10n)? solution,
      String Function(AppLocalizations l10n) button,
      SnapdFixAction expectAction,
      Map<String, dynamic>? expectArgs,
    })>[
      (
        name: 'a fix that snapd runs',
        issue: tpmDisabled,
        solution: (l10n) => l10n.tpmActionSolutionLabel(
              1,
              l10n.tpmActionFixActionEnableTpmViaFirmware,
            ),
        button: (l10n) => l10n.tpmActionFixActionEnableTpmViaFirmware,
        expectAction: SnapdFixAction.enableTpmViaFirmware,
        expectArgs: null,
      ),
      (
        name: 'ignoring the issue',
        issue: tpmDisabled,
        solution: (l10n) =>
            l10n.tpmActionSolutionLabel(2, l10n.tpmActionFixActionProceed),
        button: (l10n) => l10n.tpmActionIgnoreAndContinueLabel,
        expectAction: SnapdFixAction.proceed,
        expectArgs: {
          'error-kinds': ['tpm-device-disabled'],
        },
      ),
      (
        name: 'ignoring the only fix',
        issue: noRootOfTrust,
        solution: null,
        button: (l10n) => l10n.tpmActionIgnoreAndContinueLabel,
        expectAction: SnapdFixAction.proceed,
        expectArgs: {
          'error-kinds': ['no-hardware-root-of-trust'],
        },
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          availabilityCheckErrors: [tc.issue],
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _showRepairDialog(tester, container);

        if (tc.solution != null) {
          await tester.tap(find.text(tc.solution!(tester.l10n)));
          await tester.pumpAndSettle();
        }
        await tester.tap(find.text(tc.button(tester.l10n)));
        await tester.pump();

        verify(
          service.fixEncryptionSupport(tc.expectAction, args: tc.expectArgs),
        ).called(1);
      });
    }
  });

  testWidgets('repair dialog leaves a restart to the user', (tester) async {
    registerMockDiskEncryptionService(
      recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      availabilityCheckErrors: [
        const SnapdAvailabilityCheckError(
          kind: SnapdAvailabilityCheckErrorKind.rebootRequired,
          message: 'Mock issue',
          actions: [SnapdFixAction.reboot],
        ),
      ],
    );
    registerMockFeatureService(supportsReprovision: true);
    final container = createContainer();
    await _showRepairDialog(tester, container);

    await tester.tap(
      find.text(
        tester.l10n.tpmActionSingleSolutionLabel(
          tester.l10n.tpmActionFixActionReboot,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text(tester.l10n.tpmActionFixActionRebootDescription),
      findsOneWidget,
    );
    expect(find.byType(OutlinedButton), findsNothing);
  });

  group('repair dialog clearing the TPM', () {
    const tpmDisabled = SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message: 'Mock issue',
      actions: [SnapdFixAction.enableAndClearTpmViaFirmware],
    );

    final cases = [
      (
        name: 'needs the recovery key and the risk accepted',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.degraded,
        expectKeyCheck: true,
      ),
      (
        name: 'needs only the risk accepted after a recovery key boot',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.recovery,
        expectKeyCheck: false,
      ),
    ];

    for (final tc in cases) {
      testWidgets(tc.name, (tester) async {
        final service = registerMockDiskEncryptionService(
          recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
          storageEncryptionStatus: tc.storageEncryptionStatus,
          availabilityCheckErrors: [tpmDisabled],
        );
        registerMockFeatureService(supportsReprovision: true);
        final container = createContainer();
        await _showRepairDialog(tester, container);

        final l10n = tester.l10n;
        await tester.tap(
          find.text(
            l10n.tpmActionSingleSolutionLabel(
              l10n.tpmActionFixActionEnableAndClearTpmViaFirmware,
            ),
          ),
        );
        await tester.pumpAndSettle();
        final fixButton = find.widgetWithText(
          OutlinedButton,
          l10n.tpmActionFixActionEnableAndClearTpmViaFirmware,
        );
        expect(tester.widget<OutlinedButton>(fixButton).enabled, isFalse);

        final riskCheck =
            find.text(l10n.tpmActionFixActionClearTpmConfirmationLabel);
        await tester.ensureVisible(riskCheck);
        await tester.tap(riskCheck);
        await tester.pumpAndSettle();
        expect(
          tester.widget<OutlinedButton>(fixButton).enabled,
          !tc.expectKeyCheck,
        );
        expect(
          find.byType(TextField),
          tc.expectKeyCheck ? findsOneWidget : findsNothing,
        );

        if (tc.expectKeyCheck) {
          await tester.enterText(find.byType(TextField), 'mock-recovery-key');
          await tester.pump();
          final checkButton = find.text(l10n.diskEncryptionPageCheck);
          await tester.ensureVisible(checkButton);
          await tester.tap(checkButton);
          await tester.pumpAndSettle();
          expect(tester.widget<OutlinedButton>(fixButton).enabled, isTrue);
        }

        await tester.ensureVisible(fixButton);
        await tester.tap(fixButton);
        await tester.pump();
        verify(
          service.fixEncryptionSupport(
            SnapdFixAction.enableAndClearTpmViaFirmware,
          ),
        ).called(1);
      });
    }
  });

  testWidgets('repair dialog retries a failed check', (tester) async {
    final service = registerMockDiskEncryptionService(
      recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      getSystemsError: Exception('Mock get systems error'),
    );
    registerMockFeatureService(supportsReprovision: true);
    final container = createContainer();
    await _showRepairDialog(tester, container);

    await tester.tap(
      find.text(UbuntuLocalizations.of(tester.context).retryLabel),
    );
    await tester.pumpAndSettle();

    verify(service.getSystems()).called(2);
  });

  testWidgets('repair dialog closes when the admin prompt is cancelled',
      (tester) async {
    registerMockDiskEncryptionService(
      recommendations: [SnapdRecommendedRemedialAction.requireReprovision],
      getSystemsSnapdAuthErrorKind: SnapdAuthErrorKind.authCancelled,
    );
    registerMockFeatureService(supportsReprovision: true);
    final container = createContainer();
    await _showRepairDialog(tester, container);

    expect(find.byType(RepairDialog), findsNothing);
  });
}

// The dialog model is auto-dispose, so keep it alive while its check runs
Future<RepairDialogState> _openRepairDialog(
  ProviderContainer container,
) async {
  await container.read(tpmAuthenticationModelProvider.future);
  container.listen(repairDialogModelProvider, (_, __) {});
  await pumpEventQueue();
  return container.read(repairDialogModelProvider).dialogState;
}

// The page opens the dialog only once its state has loaded
Future<void> _showRepairDialog(
  WidgetTester tester,
  ProviderContainer container,
) async {
  await tester.pumpAppWithProviders((_) => const SizedBox(), container);
  await container.read(tpmAuthenticationModelProvider.future);
  showRepairDialog(tester.context);
  await tester.pumpAndSettle();
}
