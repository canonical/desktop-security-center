import 'package:flutter/material.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/rules/interfaces_page.dart';
import 'package:yaru/yaru.dart';

typedef AppPage = ({
  Widget Function(BuildContext context, bool selected) tileBuilder,
  WidgetBuilder pageBuilder,
});

final pages = <AppPage>[
  (
    tileBuilder: (context, selected) => YaruMasterTile(
          leading: Icon(selected ? YaruIcons.key_filled : YaruIcons.key),
          title: Text(AppLocalizations.of(context).snapPermissionsPageTitle),
        ),
    pageBuilder: (_) => const InterfacesPage(),
  ),
];
