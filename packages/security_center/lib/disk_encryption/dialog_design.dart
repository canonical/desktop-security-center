import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

// The disk encryption design's sizes, which differ from Yaru's
const _dialogRadius = 12.0;
const _fieldRadius = 4.0;
const _fieldHeight = 36.0;

// Yaru pads its 20 px toggle indicators by 6 px on each side to widen their
// click area
const _togglePadding = 6.0;
const _toggleSize = 20 + 2 * _togglePadding;

/// The corner radius of buttons, info boxes and lists in the design.
const dialogControlRadius = 6.0;

/// The padding around the content of a disk encryption dialog.
const dialogContentPadding = EdgeInsets.fromLTRB(24, 29, 24, 29);

/// The shape of a [YaruDialogTitleBar] in a [DialogDesignTheme].
///
/// The title bar paints its own background, so its corners must follow the
/// dialog's.
const dialogTitleBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(_dialogRadius)),
);

/// Sizes what is below it as the disk encryption design does: 12 px dialog
/// corners, and 36 px buttons and fields with 6 px and 4 px corners.
class DialogDesignTheme extends StatelessWidget {
  const DialogDesignTheme({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final input = theme.inputDecorationTheme;
    return Theme(
      data: theme.copyWith(
        dialogTheme: theme.dialogTheme.copyWith(
          shape: _withRadius(theme.dialogTheme.shape, _dialogRadius),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: _buttonStyle(theme.outlinedButtonTheme.style),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: _buttonStyle(theme.elevatedButtonTheme.style),
        ),
        // 34 px, so the show button inside a passphrase field keeps it 36 px
        textButtonTheme: TextButtonThemeData(
          style: theme.textButtonTheme.style?.copyWith(
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16, vertical: 14.5),
            ),
          ),
        ),
        inputDecorationTheme: input.copyWith(
          border: _withRadius(input.border, _fieldRadius),
          enabledBorder: _withRadius(input.enabledBorder, _fieldRadius),
          focusedBorder: _withRadius(input.focusedBorder, _fieldRadius),
          errorBorder: _withRadius(input.errorBorder, _fieldRadius),
          focusedErrorBorder:
              _withRadius(input.focusedErrorBorder, _fieldRadius),
          disabledBorder: _withRadius(input.disabledBorder, _fieldRadius),
          // 36 px tall around a 21 px line, after the compact density's -8
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 11),
          // Not the 40 px tap target, which stretches fields with a suffix,
          // such as the passphrase's show button
          suffixIconConstraints: const BoxConstraints(
            minWidth: _fieldHeight,
            minHeight: _fieldHeight,
          ),
          // 12 px once floated, as Flutter shrinks floating labels to 0.75
          floatingLabelStyle: input.labelStyle?.copyWith(fontSize: 12 / 0.75),
        ),
        // The design sets every field in body text, not just the key fields
        textTheme: theme.textTheme.copyWith(
          bodyLarge: theme.textTheme.bodyMedium,
        ),
      ),
      child: child,
    );
  }
}

ButtonStyle? _buttonStyle(ButtonStyle? style) => style?.copyWith(
      shape: WidgetStateProperty.resolveWith(
        (states) =>
            _withRadius(style.shape?.resolve(states), dialogControlRadius),
      ),
      // 36 px tall around the 21 px label, once the compact density takes 8
      // off each side
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 15.5),
      ),
      // Yaru's, as the design fits buttons to their labels. The app's wider
      // minimum is for the page's actions
      minimumSize: const WidgetStatePropertyAll(Size.square(kYaruButtonHeight)),
    );

// Keeps the side, which outlines dialogs in dark themes and elevated buttons
// in high contrast
T? _withRadius<T extends ShapeBorder>(T? shape, double radius) {
  final borderRadius = BorderRadius.circular(radius);
  return switch (shape) {
    final RoundedRectangleBorder shape =>
      shape.copyWith(borderRadius: borderRadius) as T,
    final OutlineInputBorder shape =>
      shape.copyWith(borderRadius: borderRadius) as T,
    _ => shape,
  };
}

/// Like [YaruInfoBox], with the design's 6 px corners and 20 px lines.
///
/// YaruInfoBox ignores its borderRadius as of yaru 10.2.0.
class DialogInfoBox extends StatelessWidget {
  const DialogInfoBox({
    required this.title,
    required this.yaruInfoType,
    this.subtitle,
    this.child,
    super.key,
  }) : assert(
          (subtitle != null) ^ (child != null),
          'Either a subtitle or a child must be provided',
        );

  final Widget title;
  final Widget? subtitle;

  /// Below the title in place of a [subtitle], such as text with a button.
  final Widget? child;
  final YaruInfoType yaruInfoType;

  @override
  Widget build(BuildContext context) {
    final color = yaruInfoType.getColor(context);
    final body = Theme.of(context).textTheme.bodyMedium!;
    final lineStyle = body.copyWith(height: 20 / body.fontSize!);
    return YaruTranslucentContainer(
      color: color,
      borderRadius: BorderRadius.circular(dialogControlRadius),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Icon(yaruInfoType.iconData, size: 24, color: color),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle.merge(
                  style: lineStyle.copyWith(fontWeight: FontWeight.bold),
                  child: title,
                ),
                DefaultTextStyle.merge(
                  style: lineStyle,
                  child: (subtitle ?? child)!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Lays out a [YaruCheckButton] or [YaruRadioButton] as the design does: in a
/// row [height] px tall, with the indicator [indent] px in and the title 8 px
/// after it.
///
/// The row grows with larger text. The toggle keeps its own size, so its hover
/// effect paints past the row.
class DialogToggle extends StatelessWidget {
  const DialogToggle({
    required this.height,
    required this.child,
    this.indent = 0,
    super.key,
  });

  final double height;
  final double indent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shift = indent - _togglePadding;
    final toggleTheme =
        YaruToggleButtonTheme.of(context) ?? const YaruToggleButtonThemeData();
    return Align(
      alignment: AlignmentDirectional.centerStart,
      heightFactor: height / _toggleSize,
      child: Transform.translate(
        offset: Offset(
          Directionality.of(context) == TextDirection.rtl ? -shift : shift,
          0,
        ),
        child: YaruToggleButtonTheme(
          data: toggleTheme.copyWith(horizontalSpacing: 8 - _togglePadding),
          child: child,
        ),
      ),
    );
  }
}
