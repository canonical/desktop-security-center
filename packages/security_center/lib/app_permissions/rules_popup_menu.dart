import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:security_center/app_permissions/rules_category.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/widgets/yaru_popup_menu_item.dart';
import 'package:yaru/yaru.dart';

/// A popup menu widget that allows users to select a permission rule action for a snapd permission rule.
class PermissionRulePopupMenu extends StatefulWidget {
  const PermissionRulePopupMenu({
    required this.selectedAction,
    required this.onSelected,
    super.key,
  });

  final SnapdRuleAction selectedAction;

  final void Function(SnapdRuleAction action) onSelected;

  @override
  State<PermissionRulePopupMenu> createState() =>
      _PermissionRulePopupMenuState();
}

class _PermissionRulePopupMenuState extends State<PermissionRulePopupMenu> {
  var _showFocusBorderOnOpen = false;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.addEarlyKeyEventHandler(_handleKeyEvent);
  }

  @override
  void dispose() {
    FocusManager.instance.removeEarlyKeyEventHandler(_handleKeyEvent);
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.space ||
            event.logicalKey == LogicalKeyboardKey.tab)) {
      _showFocusBorderOnOpen = true;
    }

    return KeyEventResult.ignored;
  }

  /// Returns the list of available options for the popup menu.
  /// Only includes actions that are configurable from the Security Center app.
  List<SnapdRuleAction> get _options => SnapdRuleAction.values
      .where((action) => action.isConfigurableFromSecurityCenter)
      .toList();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedActionTitle = widget.selectedAction.localizedTitle(l10n);
    final theme = Theme.of(context);

    return Listener(
      onPointerDown: (_) => _showFocusBorderOnOpen = false,
      child: YaruPopupMenuButton(
        initialValue: widget.selectedAction,
        semanticLabel: l10n.permissionRulePopupMenuSemanticLabel,
        constraints: const BoxConstraints.tightFor(width: 175),
        itemBuilder: (context) => _options
            .map(
              (action) => YaruPopupMenuItem(
                value: action,
                autofocus: action == _options.first,
                isSelected: action == widget.selectedAction,
                showFocusBorderOnOpen: _showFocusBorderOnOpen,
                child: Text(
                  action.localizedTitle(l10n),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onSelected: widget.onSelected,
        style: theme.textButtonTheme.style?.copyWith(
          foregroundColor: WidgetStatePropertyAll(
            theme.textTheme.bodyMedium?.color,
          ),
        ),
        icon: Semantics(
          button: true,
          enabled: true,
          label: l10n.permissionRulePopupMenuSemanticLabel,
          child: const Icon(YaruIcons.pan_down),
        ),
        child: Text(
          selectedActionTitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
