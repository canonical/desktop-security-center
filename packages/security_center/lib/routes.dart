import 'package:flutter/material.dart';
import 'package:security_center/app_permissions/app_rules_page.dart';
import 'package:security_center/app_permissions/interfaces_page.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/app_permissions/snaps_page.dart';
import 'package:security_center/disk_encryption/disk_encryption_page.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

final _log = Logger('routes');

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

  static YaruMasterTileBuilder get tileBuilder =>
      (context, index, selected, availableWidth) => YaruMasterTile(
            leading: Icon(availableRoutes[index].icon?.call(selected)),
            title: Text(
              availableRoutes[index].title(AppLocalizations.of(context)),
            ),
          );
  static IndexedWidgetBuilder get pageBuilder =>
      (context, index) => availableRoutes[index].builder(context);

  static List<Routes> get availableRoutes => AvailableRoutes.routes;
}

class AvailableRoutes {
  static List<Routes> _routes = [];
  static List<Routes> get routes => _routes;

  static Future<void> init() async {
    final routes = <Routes>[Routes.appPermissions];

    // Only include disk encryption if status is not inactive or failed
    try {
      final diskService = getService<DiskEncryptionService>();
      final status = await diskService.getStorageEncrypted();
      if (status.status != SnapdStorageEncryptionStatus.inactive &&
          status.status != SnapdStorageEncryptionStatus.failed) {
        routes.add(Routes.diskEncryption);
      }
    } on Exception catch (e) {
      // If the API call fails, don't show the disk encryption route
      _log.error(
        'Failed to get storage encryption status, skipping page registration: $e',
      );
    }

    _routes = routes;
  }
}
