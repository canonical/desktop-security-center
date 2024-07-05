import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_routes.dart';

final appNavigatorProvider = Provider((_) => GlobalKey<NavigatorState>());
final routeSettingsProvider = StateProvider<RouteSettings?>((_) => null);

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver(this.ref);

  final WidgetRef ref;

  @override
  void didPop(Route<void> route, Route<void>? previousRoute) {
    _updateRouteNameProvider(previousRoute);
  }

  @override
  void didPush(Route<void> route, Route<void>? previousRoute) {
    _updateRouteNameProvider(route);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRouteNameProvider(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _updateRouteNameProvider(newRoute);
  }

  void _updateRouteNameProvider(Route<void>? route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(routeSettingsProvider.notifier).state = route?.settings;
    });
  }
}

extension AppNavigatorState on NavigatorState {
  Future<void> pushSnapPermissions({
    String? interface,
    String? snap,
  }) {
    final route = Uri(
      path: AppRoutes.snapPermissions.route,
      queryParameters: {
        if (interface != null) 'interface': interface,
        if (snap != null) 'snap': snap,
      },
    ).toString();
    return pushNamed(route);
  }
}
