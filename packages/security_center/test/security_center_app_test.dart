import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';
import 'package:security_center/security_center_app.dart';
import 'package:snapd/snapd.dart';
import 'package:yaru/yaru.dart';

import 'test_utils.dart';

void main() {
  group('app routes', () {
    final cases = [
      (
        name: 'all routes enabled',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'disk encryption hidden - inactive',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.inactive,
      ),
      (
        name: 'disk encryption shown - failed',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.failed,
      ),
    ];
    for (final tc in cases) {
      for (final route in Routes.values) {
        testWidgets('${tc.name}: route ${route.route}', (tester) async {
          registerMockDiskEncryptionService(
            storageEncryptionStatus: tc.storageEncryptionStatus,
          );
          await AvailableRoutes.init();

          final container = createContainer();
          await tester.pumpApp(
            (_) => UncontrolledProviderScope(
              container: container,
              child: const SecurityCenterApp(),
            ),
          );
          await tester.pump();

          final navigator = container.read(appNavigatorProvider);
          unawaited(navigator.currentState!.pushNamed(route.route));
          await tester.pumpAndSettle();

          // Assert availableRoutes is built correctly based on storage encryption status
          expect(Routes.availableRoutes, contains(Routes.appPermissions));
          final shouldShowDiskEncryption = tc.storageEncryptionStatus !=
              SnapdStorageEncryptionStatus.inactive;
          expect(
            Routes.availableRoutes,
            shouldShowDiskEncryption
                ? contains(Routes.diskEncryption)
                : isNot(contains(Routes.diskEncryption)),
          );

          // Assert we only build routes of supported features
          expect(
            find.descendant(
              of: find.byType(YaruMasterTile),
              matching: find.text(Routes.appPermissions.title(tester.l10n)),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(YaruMasterTile),
              matching: find.text(Routes.diskEncryption.title(tester.l10n)),
            ),
            shouldShowDiskEncryption ? findsOneWidget : findsNothing,
          );
        });
      }
    }
  });
}
