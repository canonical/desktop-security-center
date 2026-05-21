import 'package:flutter/material.dart';
import 'package:security_center/app_permissions/rules_category.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

/// A popup menu widget that allows users to select a permission rule action for a snapd permission rule.
class PermissionRulePopupMenu extends StatelessWidget {
  const PermissionRulePopupMenu({
    required this.selectedAction,
    required this.onSelected,
    super.key,
  });

  final SnapdRuleAction selectedAction;

  final void Function(SnapdRuleAction action) onSelected;

  /// Returns the list of available options for the popup menu.
  /// Only includes actions that are configurable from the Security Center app.
  List<SnapdRuleAction> get _options => SnapdRuleAction.values
      .where((action) => action.isConfigurableFromSecurityCenter)
      .toList();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedActionTitle = selectedAction.localizedTitle(l10n);
    final theme = Theme.of(context);

    return YaruPopupMenuButton(
      initialValue: selectedAction,
      semanticLabel: l10n.permissionRulePopupMenuSemanticLabel,
      itemBuilder: (context) => _options
          .map(
            (action) => PopupMenuItem(
              value: action,
              child: Text(
                action.localizedTitle(l10n),
              ),
            ),
          )
          .toList(),
      onSelected: onSelected,
      style: theme.textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStatePropertyAll(
          theme.textTheme.bodyMedium?.color,
        ),
      ),
      child: Text(
        selectedActionTitle,
        style:
            theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}
