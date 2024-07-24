import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/app_permissions/interfaces_page.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  testWidgets('display interfaces', (tester) async {
    final container = createContainer();
    registerMockRulesService(
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: const SnapdConstraints(),
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
      ],
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const InterfacesPage(),
      ),
    );
    await tester.pumpAndSettle();

    final homeInterfaceTile = find.ancestor(
      of: find.text(SnapdInterface.home.localizedTitle(tester.l10n)),
      matching: find.byType(ListTile),
    );
    expect(homeInterfaceTile, findsOneWidget);
    expect(
      find.descendant(
        of: homeInterfaceTile,
        matching: find.text(tester.l10n.interfaceSnapCount(1)),
      ),
      findsOneWidget,
    );
  });

  group('toggle prompting', () {
    group('toggling', () {
      for (final testCase in <({
        String name,
        bool enabled,
        void Function(AppPermissionsService) expectedCallback,
      })>[
        (
          name: 'enable',
          enabled: false,
          expectedCallback: (service) => service.enable(),
        ),
        (
          name: 'disable',
          enabled: true,
          expectedCallback: (service) => service.disable(),
        ),
      ]) {
        testWidgets(testCase.name, (tester) async {
          final container = createContainer();
          final service = registerMockRulesService(enabled: testCase.enabled);
          await tester.pumpApp(
            (_) => UncontrolledProviderScope(
              container: container,
              child: const InterfacesPage(),
            ),
          );
          await tester.pump();

          final toggle = find.byType(YaruSwitchListTile);
          expect(toggle, findsOneWidget);
          expect(
            tester.widget<YaruSwitchListTile>(toggle).value,
            equals(testCase.enabled),
          );

          await tester.tap(toggle);
          await tester.pump();

          verify(testCase.expectedCallback(service)).called(1);
        });
      }
    });
    group('loading state', () {
      for (final testCase in <({
        String name,
        AppPermissionsServiceStatus status,
        String Function(AppLocalizations) expectedLabel,
      })>[
        (
          name: 'enabling',
          status: AppPermissionsServiceStatusEnabling(0.0),
          expectedLabel: (l10n) => l10n.snapPermissionsEnablingLabel,
        ),
        (
          name: 'disabling',
          status: AppPermissionsServiceStatusDisabling(0.0),
          expectedLabel: (l10n) => l10n.snapPermissionsDisablingLabel,
        ),
      ]) {
        testWidgets(testCase.name, (tester) async {
          final container = createContainer();
          registerMockRulesService();
          await tester.pumpApp(
            (_) => UncontrolledProviderScope(
              container: container,
              child: const InterfacesPage(),
            ),
          );
          container.read(promptingStatusModelProvider.notifier).state =
              AsyncData(testCase.status);
          await tester.pump();

          expect(
            find.text(testCase.expectedLabel(tester.l10n)),
            findsOneWidget,
          );
          expect(find.byType(YaruLinearProgressIndicator), findsOneWidget);
        });
      }
    });
  });
}
