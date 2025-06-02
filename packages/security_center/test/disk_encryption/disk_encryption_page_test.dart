import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  testWidgets('recovery key is valid', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
            home:
                DiskEncryptionPage()), // fix so dialogs remain in same provider scope
      ),
    );
    await tester.pump();

    expect(find.text('Check recovery key...'), findsOneWidget);
    await tester.tap(find.text('Check recovery key...'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) => w is TextField && w.decoration?.labelText == 'Recovery Key',
      ),
      'abcdef',
    );
    await tester.pump();

    await tester.tap(find.text('Check'));
    await tester.pumpAndSettle();

    expect(find.text('Valid key'), findsOneWidget);
  });

  testWidgets('recovery key is invalid', (tester) async {
    final container = createContainer();
    registerMockDiskEncryptionService(checkRecoveryKey: false);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(home: DiskEncryptionPage()),
      ),
    );
    await tester.pump();

    expect(find.text('Check recovery key...'), findsOneWidget);
    await tester.tap(find.text('Check recovery key...'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) => w is TextField && w.decoration?.labelText == 'Recovery Key',
      ),
      'abcdef',
    );
    await tester.pump();

    await tester.tap(find.text('Check'));
    await tester.pumpAndSettle();

    expect(find.text('Invalid key'), findsOneWidget);
  });
}
