import 'package:flutter/material.dart';
import 'package:security_center/l10n.dart';

class EmptyRulesTile extends StatelessWidget {
  const EmptyRulesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(AppLocalizations.of(context).snapRulesPageEmptyTileLabel),
      ),
      enabled: false,
    );
  }
}
