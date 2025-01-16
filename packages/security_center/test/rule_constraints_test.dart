import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/rules_providers.dart';

void main() {
  testWidgets('parse old home interface constraints', (tester) async {
    final rule = SnapdRule(
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
    );

    final fragments = SnapdHomeRuleFragment.fromRule(rule);
    expect(
      fragments,
      equals(
        [
          const SnapdHomeRuleFragment(
            ruleId: 'ruleId',
            deleteRuleOnRemoval: true,
            snap: 'firefox',
            pathPattern: '/home/ubuntu/**',
            permissions: [Permission.read, Permission.write],
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.forever,
          ),
        ],
      ),
    );
  });

  testWidgets('parse new home interface constraints single', (tester) async {
    final rule = SnapdRule(
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
        },
      },
    );

    final fragments = SnapdHomeRuleFragment.fromRule(rule);
    expect(
      fragments,
      equals(
        [
          const SnapdHomeRuleFragment(
            ruleId: 'ruleId',
            deleteRuleOnRemoval: true,
            snap: 'firefox',
            pathPattern: '/home/ubuntu/**',
            permissions: [Permission.read],
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.forever,
          ),
        ],
      ),
    );
  });

  testWidgets('parse new home interface constraints multiple', (tester) async {
    final rule = SnapdRule(
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
            'outcome': 'deny',
            'lifespan': 'session',
          },
        },
      },
    );

    final fragments = SnapdHomeRuleFragment.fromRule(rule);
    expect(
      fragments,
      equals(
        [
          const SnapdHomeRuleFragment(
            ruleId: 'ruleId',
            deleteRuleOnRemoval: false,
            snap: 'firefox',
            pathPattern: '/home/ubuntu/**',
            permissions: [Permission.read],
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.forever,
          ),
          const SnapdHomeRuleFragment(
            ruleId: 'ruleId',
            deleteRuleOnRemoval: false,
            snap: 'firefox',
            pathPattern: '/home/ubuntu/**',
            permissions: [Permission.write],
            outcome: SnapdRequestOutcome.deny,
            lifespan: SnapdRequestLifespan.session,
          ),
        ],
      ),
    );
  });
}
