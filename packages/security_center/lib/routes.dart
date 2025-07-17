import 'package:flutter/material.dart';
import 'package:security_center/app_permissions/app_rules_page.dart';
import 'package:security_center/app_permissions/interfaces_page.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/app_permissions/snaps_page.dart';
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/feature_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

enum Routes {
  appPermissions(
    route: '/app_permissions',
    builder: _appPermissionsBuilder,
    title: _appPermissionsTitle,
    icon: _appPermissionsIcon,
  ),
  diskEncryption(
    route: '/disk_encryption',
    builder: _diskEncryptionBuilder,
    title: _diskEncryptionTitle,
    icon: _diskEncryptionIcon,
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

  // App Permissions
  static Widget _appPermissionsBuilder(
    BuildContext context, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap, 'interface': final interface} => AppRulesPage(
            snap: snap,
            interface: SnapdInterface.fromString(interface),
          ),
        {'interface': final interface} => SnapsPage(
            interface: SnapdInterface.fromString(interface),
          ),
        _ => const InterfacesPage(),
      };
  static String _appPermissionsTitle(
    AppLocalizations l10n, [
    Map<String, String> queryParameters = const {},
  ]) =>
      switch (queryParameters) {
        {'snap': final snap} => snap,
        {'interface': final interface} => SnapdInterface.fromString(
            interface,
          ).localizedTitle(l10n),
        _ => l10n.snapPermissionsPageTitle,
      };
  static IconData _appPermissionsIcon(bool selected) =>
      selected ? YaruIcons.key_filled : YaruIcons.key;

  // Disk Encryption
  static Widget _diskEncryptionBuilder(
    BuildContext context, [
    Map<String, String> queryParameters = const {},
  ]) =>
      const DiskEncryptionPage();

  static String _diskEncryptionTitle(
    AppLocalizations l10n, [
    Map<String, String> queryParameters = const {},
  ]) =>
      l10n.diskEncryptionPageTitle;

  static IconData _diskEncryptionIcon(bool selected) =>
      selected ? YaruIcons.drive_harddisk_filled : YaruIcons.drive_harddisk;

  static (String route, Map<String, String> queryParameters) _parseName(
    String name,
  ) {
    final uri = Uri.parse(name);
    return (uri.path, uri.queryParameters);
  }

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final (route, queryParameters) = _parseName(settings.name!);
    return MaterialPageRoute(
      builder: (context) =>
          Routes.fromRoute(route).builder(context, queryParameters),
      settings: settings,
    );
  }

  static String titleOf(AppLocalizations l10n, RouteSettings settings) {
    final (route, queryParameters) = _parseName(settings.name!);
    return Routes.fromRoute(route).title(l10n, queryParameters);
  }

  static YaruMasterTileBuilder get tileBuilder => (context, index, selected,
          availableWidth) =>
      YaruMasterTile(
        leading: Icon(availableRoutes[index].icon?.call(selected)),
        title: Text(availableRoutes[index].title(AppLocalizations.of(context))),
      );
  static IndexedWidgetBuilder get pageBuilder =>
      (context, index) => availableRoutes[index].builder(context);

  static List<Routes> get availableRoutes {
    final routes = <Routes>[Routes.appPermissions];

    // Only include disk encryption if the feature is available
    final featureService = getService<FeatureService>();
    if (featureService.isDiskEncryptionAvailable) {
      routes.add(Routes.diskEncryption);
    }

    return routes;
  }
}
