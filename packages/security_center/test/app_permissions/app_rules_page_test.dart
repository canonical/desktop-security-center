import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/app_permissions/app_rules_page.dart';
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';

void main() {
  testWidgets(
    'display and delete rules original API',
    (tester) => displayAndDeleteRulesTest(
      tester: tester,
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: {
            'path-pattern': '/home/ubuntu/**',
            'permissions': ['read', 'write'],
          },
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
      ],
    ),
  );

  testWidgets(
    'display and delete rules new API',
    (tester) => displayAndDeleteRulesTest(
      tester: tester,
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: {
            'path-pattern': '/home/ubuntu/**',
            // multiple permissions get removed individually
            'permissions': {
              'read': {
                'outcome': 'allow',
                'lifespan': 'forever',
              },
            },
          },
        ),
      ],
    ),
  );

  testWidgets('remove individual permission new API', (tester) async {
    final container = createContainer();
    final mockRulesService = registerMockAppPermissionsService(
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: {
            'path-pattern': '/home/ubuntu/**',
            'permissions': {
              'read': {
                'outcome': 'allow',
                'lifespan': 'forever',
              },
              'write': {
                'outcome': 'allow',
                'lifespan': 'forever',
              },
            },
          },
        ),
      ],
    );
    registerMockLocalSnapData();
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const AppRulesPage(
          snap: 'firefox',
          interface: SnapdInterface.home,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('firefox'), findsOneWidget);

    await tester.tap(
      find.descendant(
        of: find.byWidgetPredicate(
          (widget) =>
              widget is RuleTile &&
              widget.ruleFragment.ruleId == 'ruleId' &&
              widget.ruleFragment.permissions.contains(Permission.read),
        ),
        matching: find.byType(YaruIconButton),
      ),
    );
    verify(
      mockRulesService.patchRule(
        'ruleId',
        {
          'permissions': {'read': null},
        },
      ),
    ).called(1);
    expect(find.text('firefox'), findsOneWidget);

    final removeAll = find.text(tester.l10n.snapRulesRemoveAll);
    await tester.ensureVisible(removeAll);
    await tester.tap(removeAll);
    verify(mockRulesService.removeAllRules(snap: 'firefox', interface: 'home'))
        .called(1);
  });

  testWidgets('no rules', (tester) async {
    final container = createContainer();
    registerMockAppPermissionsService();
    registerMockLocalSnapData();
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const AppRulesPage(
          snap: 'firefox',
          interface: SnapdInterface.home,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('firefox'), findsOneWidget);
    expect(find.text(tester.l10n.snapRulesPageEmptyTileLabel), findsOneWidget);
  });
}

Future<void> displayAndDeleteRulesTest({
  required WidgetTester tester,
  required List<SnapdRule> rules,
}) async {
  final container = createContainer();
  final mockRulesService = registerMockAppPermissionsService(rules: rules);
  registerMockLocalSnapData();
  await tester.pumpApp(
    (_) => UncontrolledProviderScope(
      container: container,
      child: const AppRulesPage(
        snap: 'firefox',
        interface: SnapdInterface.home,
      ),
    ),
  );
  await tester.pump();

  expect(find.text('firefox'), findsOneWidget);

  await tester.tap(
    find.descendant(
      of: find.byWidgetPredicate(
        (widget) =>
            widget is RuleTile && widget.ruleFragment.ruleId == 'ruleId',
      ),
      matching: find.byType(YaruIconButton),
    ),
  );
  verify(mockRulesService.removeRule('ruleId')).called(1);

  final removeAll = find.text(tester.l10n.snapRulesRemoveAll);
  await tester.ensureVisible(removeAll);
  await tester.tap(removeAll);
  verify(mockRulesService.removeAllRules(snap: 'firefox', interface: 'home'))
      .called(1);
}
