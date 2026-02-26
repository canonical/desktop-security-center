import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/ubuntu_pro/compliance_page.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';
import '../utils/ubuntu_pro_utils.dart';

void main() {
  group('pro compliance', () {
    testWidgets('not entitled', (tester) async {
      registerMockGSettingsIconService();
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      await _pumpCompliancePage(tester);

      expect(find.byType(YaruSwitchListTile), findsExactly(2));
      expect(
        tester
            .widgetList<YaruSwitchListTile>(find.byType(YaruSwitchListTile))
            .every((w) => w.onChanged == null),
        isTrue,
      );
    });

    testWidgets('USG toggleable', (tester) async {
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
      );
      await _pumpCompliancePage(tester);

      final usgTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProComplianceUSGTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final usgSwitch =
          find.descendant(of: usgTile, matching: find.byType(YaruSwitch));
      expect(usgTile, findsOne);
      expect(usgSwitch, findsOne);
      expect(tester.widget<YaruSwitch>(usgSwitch).checked, isFalse);

      await tester.tap(usgTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(usgSwitch).checked, isTrue);

      await tester.tap(usgTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(usgSwitch).checked, isFalse);
    });

    testWidgets('FIPS toggleable', (tester) async {
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
      );
      await _pumpCompliancePage(tester);

      final fipsTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProComplianceFIPSTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final fipsSwitch =
          find.descendant(of: fipsTile, matching: find.byType(YaruSwitch));
      expect(fipsTile, findsOne);
      expect(fipsSwitch, findsOne);
      expect(tester.widget<YaruSwitch>(fipsSwitch).checked, isFalse);

      await tester.tap(fipsTile);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);

      final fipsUpdates = find.ancestor(
        of: find.text(tester.l10n.ubuntuProComplianceFIPSUpdates),
        matching: find.byType(YaruRadioListTile<FIPSType>),
      );
      final fipsNoUpdates = find.ancestor(
        of: find.text(tester.l10n.ubuntuProComplianceFIPSNoUpdates),
        matching: find.byType(YaruRadioListTile<FIPSType>),
      );
      expect(fipsUpdates, findsOne);
      expect(fipsNoUpdates, findsOne);

      expect(
        tester.widget<YaruRadioListTile<FIPSType>>(fipsUpdates).groupValue,
        tester.widget<YaruRadioListTile<FIPSType>>(fipsUpdates).value,
      );

      await tester.ensureVisible(fipsNoUpdates);
      await tester.tap(fipsNoUpdates);
      await tester.pumpAndSettle();

      expect(
        tester.widget<YaruRadioListTile<FIPSType>>(fipsNoUpdates).groupValue,
        tester.widget<YaruRadioListTile<FIPSType>>(fipsNoUpdates).value,
      );

      await tester.tap(fipsUpdates);
      await tester.pumpAndSettle();

      expect(
        tester.widget<YaruRadioListTile<FIPSType>>(fipsUpdates).groupValue,
        tester.widget<YaruRadioListTile<FIPSType>>(fipsUpdates).value,
      );

      await tester.tap(find.text(tester.l10n.ubuntuProEnable));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(tester.widget<YaruSwitch>(fipsSwitch).checked, isTrue);
      expect(tester.widget<YaruSwitchListTile>(fipsTile).onChanged, isNull);

      // we do not care about testing if we can toggle off from here since FIPS
      // is a one-way operation
    });
  });
}

Future<void> _pumpCompliancePage(WidgetTester tester) async {
  final container = createContainer();

  await tester.pumpAppWithProviders(
    (_) => const ComplianceHardeningPage(),
    container,
  );
  await tester.pumpAndSettle();
}
