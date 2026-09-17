import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';
import 'package:yaru/yaru.dart';

const kPaneWidth = 240.0;
const kActionButtonSize = Size(100, 40);

final yaruPageControllerProvider = Provider(
  (ref) => YaruPageController(length: Routes.availableRoutes.length),
);

class SecurityCenterApp extends StatelessWidget {
  const SecurityCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = _resolveFontLocale(
      WidgetsBinding.instance.platformDispatcher.locales,
    );

    return YaruTheme(
      builder: (context, yaru, _) => MaterialApp(
        theme: yaru.theme.customize(locale: locale),
        darkTheme: yaru.darkTheme.customize(locale: locale),
        highContrastTheme: yaruHighContrastLight.customize(locale: locale),
        highContrastDarkTheme: yaruHighContrastDark.customize(locale: locale),
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const _Home(),
      ),
    );
  }
}

// Resolves the preferred locale whose fonts should be prioritized in the
// fallback list, since Flutter has known issues with font detection on
// ARM64 (e.g. CJK glyphs failing to resolve).
Locale _resolveFontLocale(List<Locale>? preferredLocales) {
  final resolvedLocale = basicLocaleListResolution(
    preferredLocales,
    supportedLocales,
  );
  return preferredLocales
          ?.where(
            (locale) => locale.languageCode == resolvedLocale.languageCode,
          )
          .firstOrNull ??
      resolvedLocale;
}

extension SecurityCenterThemeX on ThemeData {
  ThemeData customize({required Locale locale}) {
    final cjkFallback = _cjkFallbackFor(locale);

    TextStyle? withFallback(TextStyle? style) =>
        style?.apply(fontFamilyFallback: cjkFallback);

    InputDecorationThemeData withInputFallback(
      InputDecorationThemeData theme,
    ) =>
        theme.copyWith(
          labelStyle: withFallback(theme.labelStyle),
          floatingLabelStyle: withFallback(theme.floatingLabelStyle),
          helperStyle: withFallback(theme.helperStyle),
          hintStyle: withFallback(theme.hintStyle),
          errorStyle: withFallback(theme.errorStyle),
          prefixStyle: withFallback(theme.prefixStyle),
          suffixStyle: withFallback(theme.suffixStyle),
          counterStyle: withFallback(theme.counterStyle),
        );

    WidgetStateProperty<TextStyle?>? withStateFallback(
      WidgetStateProperty<TextStyle?>? style,
    ) =>
        style == null
            ? null
            : WidgetStateProperty.resolveWith(
                (states) => withFallback(style.resolve(states)),
              );

    return copyWith(
      textTheme: textTheme.apply(fontFamilyFallback: cjkFallback),
      primaryTextTheme: primaryTextTheme.apply(fontFamilyFallback: cjkFallback),
      appBarTheme: appBarTheme.copyWith(
        toolbarTextStyle: withFallback(appBarTheme.toolbarTextStyle),
        titleTextStyle: withFallback(appBarTheme.titleTextStyle),
      ),
      navigationRailTheme: navigationRailTheme.copyWith(
        selectedLabelTextStyle: withFallback(
          navigationRailTheme.selectedLabelTextStyle,
        ),
        unselectedLabelTextStyle: withFallback(
          navigationRailTheme.unselectedLabelTextStyle,
        ),
      ),
      listTileTheme: listTileTheme.copyWith(
        titleTextStyle: withFallback(listTileTheme.titleTextStyle),
        subtitleTextStyle: withFallback(listTileTheme.subtitleTextStyle),
        leadingAndTrailingTextStyle: withFallback(
          listTileTheme.leadingAndTrailingTextStyle,
        ),
      ),
      chipTheme: chipTheme.copyWith(
        labelStyle: withFallback(chipTheme.labelStyle),
        secondaryLabelStyle: withFallback(chipTheme.secondaryLabelStyle),
      ),
      menuButtonTheme: MenuButtonThemeData(
        style: menuButtonTheme.style?.copyWith(
          textStyle: withStateFallback(menuButtonTheme.style?.textStyle),
        ),
      ),
      snackBarTheme: snackBarTheme.copyWith(
        contentTextStyle: withFallback(snackBarTheme.contentTextStyle),
      ),
      dropdownMenuTheme: dropdownMenuTheme.copyWith(
        textStyle: withFallback(dropdownMenuTheme.textStyle),
        inputDecorationTheme: dropdownMenuTheme.inputDecorationTheme == null
            ? null
            : withInputFallback(dropdownMenuTheme.inputDecorationTheme!),
      ),
      inputDecorationTheme: withInputFallback(inputDecorationTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonTheme.style?.copyWith(
          minimumSize: WidgetStateProperty.all(kActionButtonSize),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonTheme.style?.copyWith(
          minimumSize: WidgetStateProperty.all(kActionButtonSize),
        ),
      ),
    );
  }
}

// Orders the Noto Sans CJK fallback fonts so that the variant matching the
// active locale comes first.
List<String> _cjkFallbackFor(Locale locale) {
  const simplifiedChinese = 'Noto Sans CJK SC';
  const traditionalChinese = 'Noto Sans CJK TC';
  const hongKongChinese = 'Noto Sans CJK HK';
  const japanese = 'Noto Sans CJK JP';
  const korean = 'Noto Sans CJK KR';

  return switch ((locale.languageCode, locale.scriptCode, locale.countryCode)) {
    ('ja', _, _) => const [
        japanese,
        simplifiedChinese,
        traditionalChinese,
        hongKongChinese,
        korean,
      ],
    ('ko', _, _) => const [
        korean,
        simplifiedChinese,
        traditionalChinese,
        hongKongChinese,
        japanese,
      ],
    ('zh', _, 'HK') => const [
        hongKongChinese,
        traditionalChinese,
        simplifiedChinese,
        japanese,
        korean,
      ],
    ('zh', 'Hant', _) || ('zh', _, 'TW') => const [
        traditionalChinese,
        hongKongChinese,
        simplifiedChinese,
        japanese,
        korean,
      ],
    _ => const [
        simplifiedChinese,
        traditionalChinese,
        hongKongChinese,
        japanese,
        korean,
      ],
  };
}

class _Home extends ConsumerWidget {
  const _Home();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const _TitleBar(),
      body: YaruMasterDetailPage(
        tileBuilder: Routes.tileBuilder,
        pageBuilder: Routes.pageBuilder,
        controller: ref.watch(yaruPageControllerProvider),
        paneLayoutDelegate: const YaruFixedPaneDelegate(paneSize: kPaneWidth),
        breakpoint: 0,
        navigatorKey: ref.watch(appNavigatorProvider),
        navigatorObservers: [AppNavigatorObserver(ref)],
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}

class _TitleBar extends ConsumerWidget implements PreferredSizeWidget {
  const _TitleBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(appNavigatorProvider).currentState;
    final routeSettings = ref.watch(routeSettingsProvider);
    final l10n = AppLocalizations.of(context);
    final String title;
    if (routeSettings?.name != null) {
      title = Routes.titleOf(l10n, routeSettings!);
    } else {
      title = Routes
          .availableRoutes[max(ref.watch(yaruPageControllerProvider).index, 0)]
          .title(l10n);
    }
    return Row(
      children: [
        SizedBox(
          width: kPaneWidth,
          child: YaruWindowTitleBar(
            style: YaruTitleBarStyle.undecorated,
            border: BorderSide.none,
            backgroundColor: YaruMasterDetailTheme.of(context).sideBarColor,
            title: Text(AppLocalizations.of(context).appTitle),
          ),
        ),
        const SizedBox(
          height: kYaruTitleBarHeight,
          child: VerticalDivider(),
        ),
        Expanded(
          child: YaruWindowTitleBar(
            border: BorderSide.none,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: navigator?.canPop() ?? false,
                  child: YaruBackButton(
                    style: YaruBackButtonStyle.rounded,
                    onPressed: navigator?.pop,
                  ),
                ),
                const Spacer(),
                Text(title),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size(0, kYaruTitleBarHeight);
}
