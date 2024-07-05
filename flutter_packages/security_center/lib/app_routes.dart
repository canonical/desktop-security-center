import 'package:flutter/material.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/rules/interface_x.dart';
import 'package:security_center/rules/interfaces_page.dart';
import 'package:security_center/rules/snap_rules_page.dart';
import 'package:security_center/rules/snaps_page.dart';
import 'package:yaru/yaru.dart';

enum AppRoutes {
  snapPermissions(
    route: '/snap_permissions',
    builder: _snapPermissionsBuilder,
    title: _snapPermissionsTitle,
    icon: _snapPermissionsIcon,
  );

  const AppRoutes({
    required this.route,
    required this.builder,
    required this.title,
    this.icon,
  });

  factory AppRoutes.fromRoute(String route) => AppRoutes.values.firstWhere(
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

  static Widget _snapPermissionsBuilder(
    BuildContext context, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap, 'interface': final interface} =>
          SnapRulesPage(snap: snap, interface: interface),
        {'interface': final interface} => SnapsPage(interface: interface),
        _ => const InterfacesPage(),
      };
  static String _snapPermissionsTitle(
    AppLocalizations l10n, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap} => snap,
        {'interface': final interface} =>
          interface.localizeSnapdInterfaceTitle(l10n),
        _ => l10n.snapPermissionsPageTitle,
      };
  static IconData _snapPermissionsIcon(bool selected) =>
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
      builder: (context) => AppRoutes.fromRoute(route).builder(
        context,
        queryParameters,
      ),
      settings: settings,
    );
  }

  static String titleOf(AppLocalizations l10n, RouteSettings settings) {
    final (route, queryParameters) = _parseName(settings.name!);
    return AppRoutes.fromRoute(route).title(
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
