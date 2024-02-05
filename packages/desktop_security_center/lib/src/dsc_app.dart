import 'package:desktop_security_center/src/ubuntu_pro/ubuntu_pro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

typedef AppPage = ({
  Widget Function(BuildContext context, bool selected) tileBuilder,
  WidgetBuilder pageBuilder,
  String Function(BuildContext context) label,
});

final pages = <AppPage>[
  (
    tileBuilder: (context, selected) => YaruMasterTile(
          title: Text(UbuntuProPage.pageDetail(context).label),
          leading: Icon(UbuntuProPage.pageDetail(context).iconData),
        ),
    pageBuilder: (_) => const UbuntuProPage(),
    label: (context) => UbuntuProPage.pageDetail(context).label,
  ),
];

final yaruPageControllerProvider =
    Provider((ref) => YaruPageController(length: pages.length));

class DesktopSecurityCenterApp extends ConsumerWidget {
  const DesktopSecurityCenterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    YaruWindow.of(context).setTitle(l10n.appTitle);
    return YaruMasterDetailPage(
      appBar: YaruWindowTitleBar(
        title: Text(l10n.appTitle),
      ),
      controller: ref.watch(yaruPageControllerProvider),
      tileBuilder: (context, index, selected, availableWidth) =>
          pages[index].tileBuilder(context, selected),
      pageBuilder: (context, index) => Scaffold(
        appBar: YaruWindowTitleBar(
          title: Text(
            pages[index].label(context),
          ),
        ),
        body: pages[index].pageBuilder(context),
      ),
      layoutDelegate: const YaruMasterFixedPaneDelegate(
        paneWidth: 204.0,
      ),
      breakpoint: 0,
    );
  }
}
