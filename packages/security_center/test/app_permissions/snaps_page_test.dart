import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/app_permissions/snaps_page.dart';
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
          constraints: const SnapdConstraints(),
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
        SnapdRule(
          id: 'ruleId2',
          timestamp: DateTime(2024),
          snap: 'libreoffice',
          interface: 'home',
          constraints: const SnapdConstraints(),
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
        SnapdRule(
          id: 'ruleId3',
          timestamp: DateTime(2024),
          snap: 'libreoffice',
          interface: 'home',
          constraints: const SnapdConstraints(),
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
      ],
    );
    registerMockLocalSnapData();
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
}
