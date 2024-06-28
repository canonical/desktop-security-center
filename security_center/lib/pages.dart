import 'package:flutter/material.dart';
import 'package:security_center/rules/interfaces_page.dart';
import 'package:yaru/yaru.dart';

typedef AppPage = ({
  Widget Function(BuildContext context, bool selected) tileBuilder,
  WidgetBuilder pageBuilder,
});

final pages = <AppPage>[
  (
    tileBuilder: (context, selected) => const YaruMasterTile(
          title: Text('Permissions'),
        ),
    pageBuilder: (_) => const InterfacesPage(),
  ),
];
