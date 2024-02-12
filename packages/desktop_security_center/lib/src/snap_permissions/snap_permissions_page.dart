import 'package:desktop_security_center/src/snap_permissions/snap_list_page.dart';
import 'package:desktop_security_center/src/spacing.dart';
import 'package:desktop_security_center/src/widgets/feature_switch.dart';
import 'package:desktop_security_center/src/widgets/tile_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru_icons/yaru_icons.dart';

class SnapPermissionsPage extends ConsumerStatefulWidget {
  const SnapPermissionsPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return const SnapPermissionsPage();
  }

  static ({IconData iconData, String label}) pageDetail(BuildContext context) =>
      (
        iconData: YaruIcons.key_filled,
        label: AppLocalizations.of(context).snapPermissions,
      );

  @override
  ConsumerState<SnapPermissionsPage> createState() =>
      _SnapPermissionsPageState();
}

class _SnapPermissionsPageState extends ConsumerState<SnapPermissionsPage> {
  bool isManageEnabled = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kLargePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureSwitch(
              titleLabel: l10n.snapRequireSystemPermission,
              descriptionLabel: l10n.snapRequireSystemPermissionDesc,
              switchValue: isManageEnabled,
              isExperimental: true,
              onChanged: () {
                //TODO: Implement logic for enabling/disabling the switch
                setState(() {
                  isManageEnabled = !isManageEnabled;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kLargePadding),
              child: !isManageEnabled
                  ? const Divider()
                  : TileMenu(
                      tiles: [
                        Tile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SnapListPage(),
                              ),
                            );
                          },
                          label: 'Home Folder',
                          subLabel: '7 apps',
                          icon: const Icon(
                            YaruIcons.folder,
                            size: kLargePadding * 2,
                          ),
                        ),
                      ],
                    ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: l10n.snapManageOtherAppPermissionsIn,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: l10n.snapSettingsApplicationsPathLabel,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //launchUrlString();
                      },
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
