import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/rules/snap_rules_page.dart';
import 'package:security_center/services/rules_service.dart';

import '../test_utils.dart';

void main() {
  testWidgets('display and delete rules', (tester) async {
    final container = createContainer();
    final mockRulesService = registerMockRulesService(
      rules: [
        SnapdRule(
          id: 'ruleId',
          timestamp: DateTime(2024),
          snap: 'firefox',
          interface: 'home',
          constraints: const SnapdConstraints(
            pathPattern: '/home/ubuntu/**',
            permissions: ['read', 'write'],
          ),
          outcome: SnapdRequestOutcome.allow,
          lifespan: SnapdRequestLifespan.forever,
        ),
      ],
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const SnapRulesPage(
          snap: 'firefox',
          interface: 'home',
        ),
      ),
    );
    await tester.pump();

    expect(find.text('firefox'), findsOneWidget);

    await tester.tap(find.text('ruleId'));
    verify(mockRulesService.removeRule('ruleId')).called(1);

    await tester.tap(find.text('Remove all'));
    verify(mockRulesService.removeAllRules(snap: 'firefox', interface: 'home'))
        .called(1);
  });
}
