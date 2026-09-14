import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';
import 'package:security_center/security_center_app.dart';
import 'package:snapd/snapd.dart';
import 'package:yaru/yaru.dart';

import 'test_utils.dart';
import 'utils/ubuntu_pro_utils.dart';

void main() {
  group('font fallbacks', () {
    test('prefers the active CJK locale', () {
      for (final testCase in [
        (locale: const Locale('ja'), expected: 'Noto Sans CJK JP'),
        (locale: const Locale('ko'), expected: 'Noto Sans CJK KR'),
        (locale: const Locale('zh'), expected: 'Noto Sans CJK SC'),
        (locale: const Locale('zh', 'TW'), expected: 'Noto Sans CJK TC'),
        (locale: const Locale('zh', 'HK'), expected: 'Noto Sans CJK HK'),
        (
          locale: const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant',
          ),
          expected: 'Noto Sans CJK TC',
        ),
      ]) {
        final theme = yaruLight.customize(locale: testCase.locale);

        expect(
          theme.textTheme.bodyMedium!.fontFamilyFallback!.first,
          testCase.expected,
        );
      }
    });

    test('applies to Yaru component text styles', () {
      final theme = yaruLight.customize(locale: const Locale('ja'));
      final fallback = theme.textTheme.bodyMedium!.fontFamilyFallback;
      final inputTheme = theme.inputDecorationTheme;
      final dropdownInputTheme = theme.dropdownMenuTheme.inputDecorationTheme!;

      expect(
        _textStylesOf(theme.textTheme).map((style) => style.fontFamilyFallback),
        everyElement(fallback),
      );
      expect(
        _textStylesOf(
          theme.primaryTextTheme,
        ).map((style) => style.fontFamilyFallback),
        everyElement(fallback),
      );
      expect(theme.appBarTheme.titleTextStyle!.fontFamilyFallback, fallback);
      expect(theme.listTileTheme.titleTextStyle!.fontFamilyFallback, fallback);
      expect(
        theme.listTileTheme.subtitleTextStyle!.fontFamilyFallback,
        fallback,
      );
      expect(theme.chipTheme.labelStyle!.fontFamilyFallback, fallback);
      expect(
        theme.chipTheme.secondaryLabelStyle!.fontFamilyFallback,
        fallback,
      );
      expect(
        theme.menuButtonTheme.style!.textStyle!.resolve({})!.fontFamilyFallback,
        fallback,
      );
      expect(
        theme.snackBarTheme.contentTextStyle!.fontFamilyFallback,
        fallback,
      );
      expect(
        _textStylesOf(inputTheme).map((style) => style.fontFamilyFallback),
        everyElement(fallback),
      );
      expect(
        _textStylesOf(
          dropdownInputTheme,
        ).map((style) => style.fontFamilyFallback),
        everyElement(fallback),
      );
    });
  });

  group('app routes', () {
    final cases = [
      (
        name: 'all routes enabled',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.active,
      ),
      (
        name: 'disk encryption hidden - inactive',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.inactive,
      ),
      (
        name: 'disk encryption shown - failed',
        storageEncryptionStatus: SnapdStorageEncryptionStatus.failed,
      ),
    ];
    for (final tc in cases) {
      for (final route in Routes.values) {
        testWidgets('${tc.name}: route ${route.route}', (tester) async {
          registerMockDiskEncryptionService(
            storageEncryptionStatus: tc.storageEncryptionStatus,
          );
          registerMockUbuntuProManagerService();
          registerMockUbuntuProFeatureService();
          await AvailableRoutes.init();

          final container = createContainer();
          await tester.pumpApp(
            (_) => UncontrolledProviderScope(
              container: container,
              child: const SecurityCenterApp(),
            ),
          );
          await tester.pump();

          final navigator = container.read(appNavigatorProvider);
          unawaited(navigator.currentState!.pushNamed(route.route));
          await tester.pumpAndSettle();

          // Assert availableRoutes is built correctly based on storage encryption status
          expect(Routes.availableRoutes, contains(Routes.appPermissions));
          final shouldShowDiskEncryption = tc.storageEncryptionStatus !=
              SnapdStorageEncryptionStatus.inactive;
          expect(
            Routes.availableRoutes,
            shouldShowDiskEncryption
                ? contains(Routes.diskEncryption)
                : isNot(contains(Routes.diskEncryption)),
          );

          // Assert we only build routes of supported features
          expect(
            find.descendant(
              of: find.byType(YaruMasterTile),
              matching: find.text(Routes.appPermissions.title(tester.l10n)),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(YaruMasterTile),
              matching: find.text(Routes.diskEncryption.title(tester.l10n)),
            ),
            shouldShowDiskEncryption ? findsOneWidget : findsNothing,
          );
        });
      }
    }
  });
}

Iterable<TextStyle> _textStylesOf(Object theme) => switch (theme) {
      TextTheme() => [
          theme.displayLarge!,
          theme.displayMedium!,
          theme.displaySmall!,
          theme.headlineLarge!,
          theme.headlineMedium!,
          theme.headlineSmall!,
          theme.titleLarge!,
          theme.titleMedium!,
          theme.titleSmall!,
          theme.bodyLarge!,
          theme.bodyMedium!,
          theme.bodySmall!,
          theme.labelLarge!,
          theme.labelMedium!,
          theme.labelSmall!,
        ],
      InputDecorationThemeData() => [
          theme.errorStyle!,
          theme.helperStyle!,
          theme.hintStyle!,
          theme.labelStyle!,
          theme.prefixStyle!,
          theme.suffixStyle!,
        ],
      _ => throw ArgumentError.value(theme),
    };
