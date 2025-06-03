import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/disk_encryption/disk_encryption_page.dart';

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
}
