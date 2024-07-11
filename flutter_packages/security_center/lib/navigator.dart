import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/routes.dart';

final appNavigatorProvider = Provider((_) => GlobalKey<NavigatorState>());
final routeSettingsProvider = StateProvider<RouteSettings?>((_) => null);

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver(this.ref);

  final WidgetRef ref;

  @override
  void didPop(Route<void> route, Route<void>? previousRoute) {
    _updateRouteSettingsProvider(previousRoute);
  }

  @override
  void didPush(Route<void> route, Route<void>? previousRoute) {
    _updateRouteSettingsProvider(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRouteSettingsProvider(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _updateRouteSettingsProvider(newRoute);
  }

  void _updateRouteSettingsProvider(Route<void>? route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(routeSettingsProvider.notifier).state = route?.settings;
    });
  }
}

extension AppNavigatorState on NavigatorState {
  Future<void> pushSnapPermissions({
    SnapdInterface? interface,
    String? snap,
  }) {
    final route = Uri(
      path: Routes.appPermissions.route,
      queryParameters: {
        if (interface != null) 'interface': interface.name,
        if (snap != null) 'snap': snap,
      },
    ).toString();
    return pushNamed(route);
  }
}
