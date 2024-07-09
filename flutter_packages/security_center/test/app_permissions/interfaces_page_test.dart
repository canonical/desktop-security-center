import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/app_permissions/interface_x.dart';
import 'package:security_center/app_permissions/interfaces_page.dart';
import 'package:security_center/services/app_permissions_service.dart';

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
    await tester.pump();

    final homeInterfaceTile = find.ancestor(
      of: find.text('home'.localizeSnapdInterfaceTitle(tester.l10n)),
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
}
