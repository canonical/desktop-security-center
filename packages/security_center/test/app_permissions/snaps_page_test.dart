import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/app_permissions/snaps_page.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';

import '../test_utils.dart';

void main() {
  testWidgets('display snaps', (tester) async {
    final container = createContainer();
    registerMockAppPermissionsService(
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: {},
        ),
        SnapdRule(
          id: 'ruleId2',
          timestamp: DateTime(2024),
          snap: 'libreoffice',
          interface: 'home',
          constraints: {},
        ),
        SnapdRule(
          id: 'ruleId3',
          timestamp: DateTime(2024),
          snap: 'libreoffice',
          interface: 'home',
          constraints: {},
        ),
      ],
    );
    registerMockLocalSnapData();
    registerMockSnapdService();
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const SnapsPage(interface: SnapdInterface.home),
      ),
    );
    await tester.pump();

    final firefoxTile = find.ancestor(
      of: find.text('firefox'),
      matching: find.byType(ListTile),
    );
    expect(firefoxTile, findsOneWidget);
    expect(
      find.descendant(
        of: firefoxTile,
        matching: find.text(tester.l10n.snapRulesCount(1)),
      ),
      findsOneWidget,
    );

    final libreofficeTile = find.ancestor(
      of: find.text('libreoffice'),
      matching: find.byType(ListTile),
    );
    expect(libreofficeTile, findsOneWidget);
    expect(
      find.descendant(
        of: libreofficeTile,
        matching: find.text(tester.l10n.snapRulesCount(2)),
      ),
      findsOneWidget,
    );
  });

  group('camera interface', () {
    testWidgets('display camera interface page with snaps', (tester) async {
      final container = createContainer();
      registerMockAppPermissionsService(
        rules: [
          SnapdRule(
            id: 'cameraRule1',
            timestamp: DateTime(2024),
            snap: 'firefox',
            interface: 'camera',
            constraints: {
              'permissions': {
                'access': {
                  'outcome': 'allow',
                  'lifespan': 'forever',
                },
              },
            },
          ),
          SnapdRule(
            id: 'cameraRule2',
            timestamp: DateTime(2024),
            snap: 'cheese',
            interface: 'camera',
            constraints: {},
          ),
          SnapdRule(
            id: 'cameraRule3',
            timestamp: DateTime(2024),
            snap: 'obs-studio',
            interface: 'camera',
            constraints: {},
          ),
        ],
        snaps: ['firefox', 'cheese', 'obs-studio'],
      );
      registerMockLocalSnapData();
      registerMockSnapdService();

      await tester.pumpApp(
        (_) => UncontrolledProviderScope(
          container: container,
          child: const SnapsPage(interface: SnapdInterface.camera),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(SnapdInterface.camera.localizedTitle(tester.l10n)),
        findsOneWidget,
      );
      expect(
        find.text(SnapdInterface.camera.localizedDescription(tester.l10n)),
        findsOneWidget,
      );

      final firefoxTile = find.ancestor(
        of: find.text('firefox'),
        matching: find.byType(ListTile),
      );
      expect(firefoxTile, findsOneWidget);

      final cheeseTile = find.ancestor(
        of: find.text('cheese'),
        matching: find.byType(ListTile),
      );
      expect(cheeseTile, findsOneWidget);

      final obsStudioTile = find.ancestor(
        of: find.text('obs-studio'),
        matching: find.byType(ListTile),
      );
      expect(obsStudioTile, findsOneWidget);
    });

    testWidgets('camera interface toggle functionality', (tester) async {
      final container = createContainer();
      final service = registerMockAppPermissionsService(
        rules: [
          SnapdRule(
            id: 'cameraRule1',
            timestamp: DateTime(2024),
            snap: 'firefox',
            interface: 'camera',
            constraints: {},
          ),
        ],
        snaps: ['firefox'],
      );
      registerMockLocalSnapData();
      registerMockSnapdService();

      await tester.pumpApp(
        (_) => UncontrolledProviderScope(
          container: container,
          child: const SnapsPage(interface: SnapdInterface.camera),
        ),
      );
      await tester.pumpAndSettle();

      final firefoxTile = find.ancestor(
        of: find.text('firefox'),
        matching: find.byType(ListTile),
      );
      expect(firefoxTile, findsOneWidget);

      final switchWidget = find.descendant(
        of: firefoxTile,
        matching: find.byType(Switch),
      );
      expect(switchWidget, findsOneWidget);

      final switchValue = tester.widget<Switch>(switchWidget).value;
      expect(switchValue, false);

      await tester.tap(switchWidget);
      await tester.pump();

      verify(service.removeAllRules(snap: 'firefox', interface: 'camera'))
          .called(1);
      verify(
        service.addRule(
          SnapdRuleMask(
            snap: 'firefox',
            interface: 'camera',
            constraints: {
              'permissions': {
                'access': {
                  'outcome': 'allow',
                  'lifespan': 'forever',
                  'expiration': null,
                },
              },
            },
          ),
        ),
      ).called(1);
    });
  });
}
