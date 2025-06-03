import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/main.dart' as app;
import 'package:security_center/services/snapd_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../test/test_utils.dart';

const testRulesPath = 'integration_test/assets/test_rules.json';
const testSnap = 'integration-test-snap';

void main() {
  tearDown(resetAllServices);
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('display and delete rules', (tester) async {
    await writeSnapdRules();

    await app.main([]);
    await tester.pumpAndSettle();

    await tester.tap(
      find.text(SnapdInterface.home.localizedTitle(tester.l10n)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(testSnap));
    await tester.pumpAndSettle();

    final testRules = getTestRules(interface: 'home', snap: testSnap);

    for (final rule in testRules) {
      expectHomeRule(tester, rule);
    }

    await expectSnapdRules(testRules);

    await tester.tap(find.text(tester.l10n.snapRulesRemoveAll));
    await tester.pumpAndSettle();

    await expectSnapdRules([]);
  });

  testWidgets('Check recovery key is valid', (tester) async {
    await app.main([]);
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageTitle));
    await tester.pumpAndSettle();

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

  testWidgets('Check recovery key is invalid', (tester) async {
    await app.main([]);
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageTitle));
    await tester.pumpAndSettle();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheckKey));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byWidgetPredicate(
        (w) =>
            w is TextField &&
            w.decoration?.labelText ==
                tester.l10n.diskEncryptionPageRecoveryKey,
      ),
      'abcde',
    );
    await tester.pump();

    await tester.tap(find.text(tester.l10n.diskEncryptionPageCheck));
    await tester.pumpAndSettle();

    expect(
        find.text(tester.l10n.diskEncryptionPageKeyDoesntWork), findsOneWidget);
  });
}

void expectHomeRule(WidgetTester tester, SnapdRuleMask rule) {
  final constraints = HomeRuleConstraints.fromJson(rule.constraints);
  final ruleFragments = SnapdHomeRuleFragment.fromConstraints(
    'ruleId',
    rule.snap,
    constraints,
  );

  for (final ruleFragment in ruleFragments) {
    // This verifies that the specified rule is displayed in the UI by checking
    // that the widgets in the following list share a unique common ancestor.
    final tile = [
      find.text(ruleFragment.pathPattern),
      find.text(
        ruleFragment.permissions
            .map((permission) => permission.localize(tester.l10n))
            .join(', '),
      ),
    ]
        // List of sets of ancestors for each text widget.
        .map(
          (finder) => find
              .ancestor(of: finder, matching: find.byType(ListTile))
              .evaluate()
              .toSet(),
        )
        // Intersection of all sets.
        .reduce((value, element) => value.intersection(element));

    expect(tile.length, equals(1));
  }
}

List<SnapdRuleMask> getTestRules({String? snap, String? interface}) {
  return (jsonDecode(File(testRulesPath).readAsStringSync()) as List)
      .map((e) => SnapdRuleMask.fromJson(e as Map<String, dynamic>))
      .where(
        (rule) =>
            (snap == null || rule.snap == snap) &&
            (interface == null || rule.interface == interface),
      )
      .toList();
}

Future<void> writeSnapdRules() async {
  final ruleMasks = getTestRules();
  final snapd = SnapdService();

  // Ensure that we start with an empty rule set
  await snapd.removeRules(testSnap);

  for (final rule in ruleMasks) {
    await snapd.addRule(rule);
  }
  snapd.close();
}

Future<void> expectSnapdRules(List<SnapdRuleMask> rules) async {
  final snapd = SnapdService();
  final actual = await snapd.getRules();
  snapd.close();

  if (rules.isEmpty) {
    expect(actual, isEmpty);
    return;
  }

  for (final rule in rules) {
    expect(actual.where(rule.matches), hasLength(1));
  }
}

extension on SnapdRuleMask {
  bool matches(SnapdRule rule) {
    final maskConstraints = HomeRuleConstraints.fromJson(constraints);
    final ruleConstraints = HomeRuleConstraints.fromJson(rule.constraints);

    // Snapd always returns an 'expiration' field in rules even when the lifespan is
    // 'forever' so we need to explicitly match on the fields we care about within
    // permissions rather than just asserting that the constraints match.
    return (snap == rule.snap) &&
        (interface == rule.interface) &&
        (maskConstraints.pathPattern == ruleConstraints.pathPattern) &&
        maskConstraints.permissions.entries.every(
          (entry) =>
              ruleConstraints.permissions[entry.key]!.outcome ==
                  entry.value.outcome &&
              ruleConstraints.permissions[entry.key]!.lifespan ==
                  entry.value.lifespan,
        );
  }
}
