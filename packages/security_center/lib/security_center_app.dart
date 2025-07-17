import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';
import 'package:yaru/yaru.dart';

const kPaneWidth = 240.0;
const kActionButtonSize = Size(100, 40);

final yaruPageControllerProvider = Provider(
    (ref) => YaruPageController(length: Routes.availableRoutes.length));

class SecurityCenterApp extends StatelessWidget {
  const SecurityCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData? buttonOverrides(ThemeData? theme) => theme?.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: theme.elevatedButtonTheme.style?.copyWith(
              minimumSize: WidgetStateProperty.all(kActionButtonSize),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: theme.outlinedButtonTheme.style?.copyWith(
              minimumSize: WidgetStateProperty.all(kActionButtonSize),
            ),
          ),
        );
    return YaruTheme(
      builder: (context, yaru, _) => MaterialApp(
        theme: buttonOverrides(yaru.theme),
        darkTheme: buttonOverrides(yaru.darkTheme),
        highContrastTheme: buttonOverrides(yaruHighContrastLight),
        highContrastDarkTheme: buttonOverrides(yaruHighContrastDark),
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const _Home(),
      ),
    );
  }
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
