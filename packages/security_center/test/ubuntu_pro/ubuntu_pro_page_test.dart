import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_page.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:yaru/yaru.dart';

import '../test_utils.dart';
import '../utils/ubuntu_pro_utils.dart';

void main() {
  group('pro attach', () {
    testWidgets('unavailable', (tester) async {
      registerMockUbuntuProManagerService(
        attached: false,
        available: false,
      );
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
        featuresEntitled: false,
      );
      await _pumpUbuntuProPage(tester);

      expect(find.textContaining(tester.l10n.ubuntuProDisabled('')), findsOne);

      expect(find.text(tester.l10n.ubuntuProESMTitle), findsNothing);
      expect(find.text(tester.l10n.ubuntuProLivepatchTitle), findsNothing);
      expect(find.text(tester.l10n.ubuntuProCompliance), findsNothing);
      expect(find.byType(ButtonStyleButton), findsNothing);
    });

    testWidgets('disable-able', (tester) async {
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService();
      await _pumpUbuntuProPage(tester);

      expect(find.text(tester.l10n.ubuntuProEnabled), findsOne);

      final disableProFinder = find.widgetWithText(
        ElevatedButton,
        tester.l10n.ubuntuProDisablePro,
      );
      expect(disableProFinder, findsOne);

      await tester.ensureVisible(disableProFinder);
      await tester.tap(disableProFinder);
      await tester.pumpAndSettle();

      final disableFinder = find.widgetWithText(
        ElevatedButton,
        tester.l10n.ubuntuProDisable,
      );

      expect(find.byType(AlertDialog), findsOne);
      expect(find.text(tester.l10n.ubuntuProDisablePrompt), findsOne);
      expect(disableFinder, findsOne);

      await tester.tap(disableFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.textContaining(tester.l10n.ubuntuProDisabled('')), findsOne);
      expect(
        find.widgetWithText(
          ElevatedButton,
          tester.l10n.ubuntuProEnablePro,
        ),
        findsOne,
      );
    });

    testWidgets('enable-able with token', (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      await _pumpUbuntuProPage(tester);

      expect(find.textContaining(tester.l10n.ubuntuProDisabled('')), findsOne);

      final enableProFinder = find.widgetWithText(
        ElevatedButton,
        tester.l10n.ubuntuProEnablePro,
      );
      expect(enableProFinder, findsOne);

      await tester.tap(enableProFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);
      expect(find.text(tester.l10n.ubuntuProEnableMagic), findsOne);
      final withTokenFinder = find.text(tester.l10n.ubuntuProEnableToken);
      expect(withTokenFinder, findsOne);

      await tester.tap(withTokenFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);
      final enableFinder = find.widgetWithText(
        ElevatedButton,
        tester.l10n.ubuntuProEnable,
      );
      expect(enableFinder, findsOne);
      expect(tester.widget<ElevatedButton>(enableFinder).enabled, isFalse);
      final tokenInput = find.byType(TextField);
      expect(tokenInput, findsOne);

      await tester.enterText(tokenInput, 'foo');
      await tester.pumpAndSettle();

      expect(tester.widget<ElevatedButton>(enableFinder).enabled, isFalse);

      await tester.enterText(tokenInput, invalidToken);
      await tester.pumpAndSettle();
      await tester.tap(enableFinder);
      await tester.pumpAndSettle();

      expect(find.text(tester.l10n.ubuntuProEnableTokenError), findsOne);

      await tester.enterText(tokenInput, validToken);
      await tester.pumpAndSettle();
      await tester.tap(enableFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text(tester.l10n.ubuntuProEnabled), findsOne);
      expect(
        find.widgetWithText(
          ElevatedButton,
          tester.l10n.ubuntuProDisablePro,
        ),
        findsOne,
      );
    });

    testWidgets('enable-able via magic link', (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      registerMockMagicAttachService();
      await _pumpUbuntuProPage(tester);

      expect(find.textContaining(tester.l10n.ubuntuProDisabled('')), findsOne);

      final enableProFinder = find.widgetWithText(
        ElevatedButton,
        tester.l10n.ubuntuProEnablePro,
      );
      expect(enableProFinder, findsOne);

      await tester.tap(enableProFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);
      expect(find.text(tester.l10n.ubuntuProEnableMagic), findsOne);
      final withLinkFinder = find.text(tester.l10n.ubuntuProEnableMagic);
      expect(withLinkFinder, findsOne);

      await tester.tap(withLinkFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOne);
      final enableFinder =
          find.widgetWithText(ElevatedButton, tester.l10n.ubuntuProEnable);
      expect(enableFinder, findsNothing);

      await tester.pumpAndSettle(MagicAttachModel.refreshDuration);

      expect(enableFinder, findsOne);

      await tester.tap(enableFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text(tester.l10n.ubuntuProEnabled), findsOne);
      expect(
        find.widgetWithText(
          ElevatedButton,
          tester.l10n.ubuntuProDisablePro,
        ),
        findsOne,
      );
    });
  });

  group('pro features', () {
    testWidgets('not entitled', (tester) async {
      registerMockGSettingsIconService();
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      await _pumpUbuntuProPage(tester);

      expect(find.byType(YaruSwitchListTile), findsExactly(4));
      expect(
        tester
            .widgetList<YaruSwitchListTile>(find.byType(YaruSwitchListTile))
            .every((w) => w.onChanged == null),
        isTrue,
      );
    });

    testWidgets('esm infra toggleable', (tester) async {
      registerMockGSettingsIconService();
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
      );
      await _pumpUbuntuProPage(tester);

      final esmInfraTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProESMMainTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final esmInfraSwitch =
          find.descendant(of: esmInfraTile, matching: find.byType(YaruSwitch));
      expect(esmInfraTile, findsOne);
      expect(tester.widget<YaruSwitch>(esmInfraSwitch).checked, isFalse);

      await tester.tap(esmInfraTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(esmInfraSwitch).checked, isTrue);

      await tester.tap(esmInfraTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(esmInfraSwitch).checked, isFalse);
    });

    testWidgets('esm apps toggleable', (tester) async {
      registerMockGSettingsIconService();
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
      );
      await _pumpUbuntuProPage(tester);

      final esmAppsTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProESMUniverseTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final esmAppsSwitch =
          find.descendant(of: esmAppsTile, matching: find.byType(YaruSwitch));
      expect(esmAppsTile, findsOne);
      expect(tester.widget<YaruSwitch>(esmAppsSwitch).checked, isFalse);

      await tester.tap(esmAppsTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(esmAppsSwitch).checked, isTrue);

      await tester.tap(esmAppsTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(esmAppsSwitch).checked, isFalse);
    });

    testWidgets('livepatch toggleable', (tester) async {
      registerMockGSettingsIconService();
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService(
        featuresEnabled: false,
      );
      await _pumpUbuntuProPage(tester);

      final livepatchTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProLivepatchEnableTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final livepatchSwitch =
          find.descendant(of: livepatchTile, matching: find.byType(YaruSwitch));
      expect(livepatchTile, findsOne);
      expect(tester.widget<YaruSwitch>(livepatchSwitch).checked, isFalse);

      final livepatchIconTile = find.ancestor(
        of: find.text(tester.l10n.ubuntuProLivepatchShowTitle),
        matching: find.byType(YaruSwitchListTile),
      );
      final livepatchIconSwitch = find.descendant(
        of: livepatchIconTile,
        matching: find.byType(YaruSwitch),
      );
      expect(livepatchIconTile, findsOne);
      expect(tester.widget<YaruSwitch>(livepatchIconSwitch).checked, isFalse);
      expect(
        tester.widget<YaruSwitchListTile>(livepatchIconTile).onChanged,
        isNull,
      );

      await tester.ensureVisible(livepatchTile);
      await tester.tap(livepatchTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(livepatchSwitch).checked, isTrue);
      expect(tester.widget<YaruSwitch>(livepatchIconSwitch).checked, isFalse);
      expect(
        tester.widget<YaruSwitchListTile>(livepatchIconTile).onChanged,
        isNotNull,
      );

      await tester.ensureVisible(livepatchIconTile);
      await tester.tap(livepatchIconTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(livepatchIconSwitch).checked, isTrue);
      expect(
        tester.widget<YaruSwitchListTile>(livepatchIconTile).onChanged,
        isNotNull,
      );

      await tester.tap(livepatchTile);
      await tester.pumpAndSettle();

      expect(tester.widget<YaruSwitch>(livepatchSwitch).checked, isFalse);
      expect(tester.widget<YaruSwitch>(livepatchIconSwitch).checked, isTrue);
      expect(
        tester.widget<YaruSwitchListTile>(livepatchIconTile).onChanged,
        isNull,
      );
    });
  });
}

Future<void> _pumpUbuntuProPage(WidgetTester tester) async {
  final container = createContainer();

  await tester.pumpAppWithProviders(
    (_) => const UbuntuProPage(),
    container,
  );
  await tester.pumpAndSettle();
}
