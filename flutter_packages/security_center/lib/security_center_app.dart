import 'package:flutter/material.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/pages.dart';
import 'package:yaru/yaru.dart';

class SecurityCenterApp extends StatelessWidget {
  const SecurityCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, _) => MaterialApp(
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        highContrastTheme: yaruHighContrastLight,
        highContrastDarkTheme: yaruHighContrastDark,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const _Home(),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YaruWindowTitleBar(
        title: Text(AppLocalizations.of(context).appTitle),
      ),
      body: YaruMasterDetailPage(
        tileBuilder: (context, index, selected, availableWidth) =>
            pages[index].tileBuilder(context, selected),
        pageBuilder: (context, index) => pages[index].pageBuilder(context),
        length: pages.length,
      ),
    );
  }
}
