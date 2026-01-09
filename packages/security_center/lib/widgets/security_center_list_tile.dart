import 'package:flutter/material.dart';
import 'package:security_center/constants.dart';

/// A standardized list tile widget used throughout the Security Center.
///
/// This widget wraps a [ListTile] with consistent styling and layout:
/// - Fixed minimum height of [kMinTileHeight]
/// - Consistent content padding
/// - Title styled with [TextTheme.labelLarge] with zero letter spacing
/// - Subtitle styled with [TextTheme.labelMedium] by default
/// - Support for leading and trailing widgets
/// - Optional centered title alignment
/// - Optional enabled/disabled state
class SecurityCenterListTile extends StatelessWidget {
  const SecurityCenterListTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.centerTitle = false,
    this.enabled = true,
    super.key,
  });

  /// The primary content of the list tile, displayed with [TextTheme.labelLarge].
  final String title;

  /// Optional secondary content displayed below the title.
  final Widget? subtitle;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display after the title.
  final Widget? trailing;

  /// Called when the user taps this list tile.
  final VoidCallback? onTap;

  /// Whether to center the title text. Defaults to false.
  final bool centerTitle;

  /// Whether the list tile is enabled. Defaults to true.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: 0,
          ),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: kMinTileHeight),
      child: Center(
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          leading: leading,
          title: centerTitle ? Center(child: titleWidget) : titleWidget,
          subtitle: subtitle != null
              ? DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelMedium ??
                      const TextStyle(),
                  child: subtitle!,
                )
              : null,
          trailing: trailing,
          onTap: onTap,
          enabled: enabled,
        ),
      ),
    );
  }
}
