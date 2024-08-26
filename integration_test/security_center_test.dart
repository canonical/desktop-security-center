import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:security_center/app_permissions/app_rules_page.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/main.dart' as app;
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import '../test/test_utils.dart';

const testRulesPath = 'integration_test/assets/test_rules.json';

void main() {
  tearDown(resetAllServices);
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('display and delete rules', (tester) async {
    await writeSnapdRules();

    await app.main([]);
    await tester.pumpAndSettle();

    await tester
        .tap(find.text(SnapdInterface.home.localizedTitle(tester.l10n)));
    await tester.pumpAndSettle();

    await tester.tap(find.text('firefox'));
    await tester.pumpAndSettle();

    final testRules = getTestRules(interface: 'home', snap: 'firefox');

    for (final rule in testRules) {
      expectRule(tester, rule);
    }

    await expectSnapdRules(testRules);

    await tester.tap(find.text(tester.l10n.snapRulesRemoveAll));
    await tester.pumpAndSettle();

    await expectSnapdRules([]);
  });
}

void expectRule(WidgetTester tester, SnapdRuleMask rule) {
  // This verifies that the specified rule is displayed in the UI by checking
  // that the widgets in the following list share a unique common ancestor.
  final tile = [
    find.text(rule.constraints.pathPattern!),
    find.text(
      rule.constraints.permissions!
          .map(
            (permission) =>
                Permission.fromString(permission).localize(tester.l10n),
          )
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
    return (snap == rule.snap) &&
        (interface == rule.interface) &&
        (constraints == rule.constraints) &&
        (outcome == rule.outcome) &&
        (lifespan == rule.lifespan);
  }
}
