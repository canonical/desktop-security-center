import 'package:flutter/material.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';

class EmptyRulesTile extends StatelessWidget {
  const EmptyRulesTile({this.interface, super.key});

  final SnapdInterface? interface;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = switch (interface) {
      SnapdInterface.camera => l10n.cameraRulesPageEmptyTileLabel,
      _ => l10n.snapRulesPageEmptyTileLabel,
    };

    return ListTile(
      title: Center(
        child: Text(text),
      ),
      enabled: false,
    );
  }
}
