import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:yaru/yaru.dart';

/// A widget that represents the body of a popup menu item.
/// Currently used in the permission rule popup menu to display the title of a permission rule action and an optional checkmark icon if the action is selected.
/// TODO: Move a more generalized variant of this widget into the Yaru package and use it for all popup menu items in the app
class YaruPopupMenuItem<T> extends PopupMenuItem<T> {
  const YaruPopupMenuItem({
    required T value,
    required Widget child,
    this.isSelected = false,
    this.autofocus = false,
    this.showFocusBorderOnOpen = false,
    super.enabled,
    super.height,
    super.key,
  }) : super(value: value, child: child);

  final bool isSelected;
  final bool autofocus;
  final bool showFocusBorderOnOpen;

  @override
  PopupMenuItemState<T, YaruPopupMenuItem<T>> createState() =>
      _YaruPopupMenuItemState<T>();
}

class _YaruPopupMenuItemState<T>
    extends PopupMenuItemState<T, YaruPopupMenuItem<T>> {
  static final _showFocusBorder = ValueNotifier(false);
  static var _mountedItems = 0;

  var _focused = false;

  static bool _isFocusNavigationKey(LogicalKeyboardKey key) {
    return key == LogicalKeyboardKey.arrowDown ||
        key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight ||
        key == LogicalKeyboardKey.arrowUp ||
        key == LogicalKeyboardKey.end ||
        key == LogicalKeyboardKey.home ||
        key == LogicalKeyboardKey.pageDown ||
        key == LogicalKeyboardKey.pageUp ||
        key == LogicalKeyboardKey.tab;
  }

  static KeyEventResult _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent && _isFocusNavigationKey(event.logicalKey)) {
      _showFocusBorder.value = true;
    }

    return KeyEventResult.ignored;
  }

  static void _handlePointerEvent(PointerEvent event) {
    _showFocusBorder.value = false;
  }

  void _handleFocusChange(bool focused) {
    setState(() => _focused = focused);
  }

  Object? _handleActivate() {
    if (widget.enabled) {
      handleTap();
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _showFocusBorder.value = widget.showFocusBorderOnOpen;
    if (_mountedItems == 0) {
      FocusManager.instance.addEarlyKeyEventHandler(_handleKeyEvent);
      GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
    }
    _mountedItems++; // Increment the count of mounted items
  }

  @override
  void dispose() {
    _mountedItems--; // Decrement the count of mounted items before checking if it's zero
    if (_mountedItems == 0) {
      FocusManager.instance.removeEarlyKeyEventHandler(_handleKeyEvent);
      GestureBinding.instance.pointerRouter
          .removeGlobalRoute(_handlePointerEvent);
    }
    super.dispose();
  }

  @override
  Widget buildChild() {
    return Row(
      children: [
        Expanded(child: widget.child!),
        SizedBox(
          width: 16,
          child: ExcludeSemantics(
            child: widget.isSelected ? const Icon(YaruIcons.checkmark) : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSemantics({required Widget child}) {
    return Semantics(
      role: SemanticsRole.menuItem,
      enabled: widget.enabled,
      button: true,
      focused: _focused,
      selected: widget.isSelected,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _showFocusBorder,
      builder: (context, showFocusBorder, child) {
        final focused = showFocusBorder && _focused;
        return YaruFocusBorder(
          focused: true,
          borderColor: focused ? null : Colors.transparent,
          child: child!,
        );
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) => _handleActivate(),
          ),
          ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
            onInvoke: (_) => _handleActivate(),
          ),
        },
        child: Focus(
          autofocus: widget.autofocus,
          descendantsAreTraversable: false,
          includeSemantics: false,
          onFocusChange: _handleFocusChange,
          canRequestFocus: widget.enabled,
          child: Semantics(
            selected: widget.isSelected,
            child: super.build(context),
          ),
        ),
      ),
    );
  }
}
