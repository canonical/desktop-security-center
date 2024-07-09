import 'package:flutter/material.dart';
import 'package:security_center/app_permissions/app_rules_page.dart';
import 'package:security_center/app_permissions/interfaces_page.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/app_permissions/snaps_page.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

enum Routes {
  appPermissions(
    route: '/app_permissions',
    builder: _appPermissionsBuilder,
    title: _appPermissionsTitle,
    icon: _appPermissionsIcon,
  );

  const Routes({
    required this.route,
    required this.builder,
    required this.title,
    this.icon,
  });

  factory Routes.fromRoute(String route) => Routes.values.firstWhere(
        (e) => e.route == route,
        orElse: () => throw ArgumentError('Unknown route: $route'),
      );

  final String route;
  final Widget Function(
    BuildContext context, [
    Map<String, String> queryParameters,
  ]) builder;
  final String Function(
    AppLocalizations l10n, [
    Map<String, String> queryParameters,
  ]) title;
  final IconData Function(bool selected)? icon;

  static Widget _appPermissionsBuilder(
    BuildContext context, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap, 'interface': final interface} => AppRulesPage(
            snap: snap,
            interface: SnapdInterface.fromString(interface),
          ),
        {'interface': final interface} =>
          SnapsPage(interface: SnapdInterface.fromString(interface)),
        _ => const InterfacesPage(),
      };
  static String _appPermissionsTitle(
    AppLocalizations l10n, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap} => snap,
        {'interface': final interface} =>
          SnapdInterface.fromString(interface).localizedTitle(l10n),
        _ => l10n.snapPermissionsPageTitle,
      };
  static IconData _appPermissionsIcon(bool selected) =>
      selected ? YaruIcons.key_filled : YaruIcons.key;

  static (
    String route,
    Map<String, String> queryParameters,
  ) _parseName(String name) {
    final uri = Uri.parse(name);
    return (uri.path, uri.queryParameters);
  }

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final (route, queryParameters) = _parseName(settings.name!);
    return MaterialPageRoute(
      builder: (context) => Routes.fromRoute(route).builder(
        context,
        queryParameters,
      ),
      settings: settings,
    );
  }

  static String titleOf(AppLocalizations l10n, RouteSettings settings) {
    final (route, queryParameters) = _parseName(settings.name!);
    return Routes.fromRoute(route).title(
      l10n,
      queryParameters,
    );
  }

  static YaruMasterTileBuilder get tileBuilder =>
      (context, index, selected, availableWidth) => YaruMasterTile(
            leading: Icon(values[index].icon?.call(selected)),
            title: Text(values[index].title(AppLocalizations.of(context))),
          );
  static IndexedWidgetBuilder get pageBuilder =>
      (context, index) => values[index].builder(context);
}
