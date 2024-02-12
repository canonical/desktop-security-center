import 'package:desktop_security_center/src/snap_permissions/snap_detail_page.dart';
import 'package:desktop_security_center/src/spacing.dart';
import 'package:desktop_security_center/src/widgets/tile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/widgets.dart';

class SnapListPage extends ConsumerStatefulWidget {
  const SnapListPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return const SnapListPage();
  }

  static ({IconData iconData, String label}) pageDetail(BuildContext context) =>
      (
        iconData: YaruIcons.key_filled,
        label: AppLocalizations.of(context).ubuntuPro,
      );

  @override
  ConsumerState<SnapListPage> createState() => _SnapListPageState();
}

class _SnapListPageState extends ConsumerState<SnapListPage> {
  @override
  Widget build(BuildContext context) {
    //final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: YaruWindowTitleBar(
        leading: GestureDetector(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
            child: const Icon(YaruIcons.go_previous)),
        title: const Text('Home Folder'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kLargePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home Folder',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text(
                'Manage permissions to access files in your Home folder.',
              ),
              const SizedBox(height: kLargePadding),
              TileMenu(
                tiles: [
                  for (int i = 0; i < 7; i++)
                    Tile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SnapDetailPage(),
                          ),
                        );
                      },
                      label: 'Default Snap $i',
                      subLabel: '6 rules',
                      icon: const Placeholder(
                        fallbackHeight: kLargePadding,
                        fallbackWidth: kLargePadding,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
