import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.mocks.dart';

extension WidgetTesterX on WidgetTester {
  BuildContext get context => element(find.byType(Scaffold).first);
  AppLocalizations get l10n => AppLocalizations.of(context);

  Future<void> pumpApp(WidgetBuilder builder) async {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(body: Builder(builder: builder)),
        localizationsDelegates: localizationsDelegates,
      ),
    );
  }
}

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: [
      ...overrides,
    ],
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

@GenerateMocks([AppPermissionsService])
AppPermissionsService registerMockAppPermissionsService({
  List<SnapdRule> rules = const [],
  bool enabled = true,
}) {
  final service = MockAppPermissionsService();
  when(service.status).thenAnswer(
    (_) => Stream.value(
      enabled
          ? AppPermissionsServiceStatus.enabled(rules)
          : AppPermissionsServiceStatus.disabled(),
    ),
  );

  registerMockService<AppPermissionsService>(service);
  addTearDown(unregisterService<AppPermissionsService>);
  return service;
}

LocalSnapData registerMockLocalSnapData({
  List<Snap> snaps = const [],
}) {
  registerServiceInstance<LocalSnapData>(snaps);
  addTearDown(unregisterService<LocalSnapData>);
  return snaps;
}

@GenerateMocks([SnapdClient])
SnapdClient registerMockSnapdClient({
  List<SnapdNotice> notices = const [],
}) {
  final client = MockSnapdClient();
  when(
    client.getNotices(
      types: anyNamed('types'),
      after: anyNamed('after'),
      timeout: anyNamed('timeout'),
    ),
  ).thenAnswer((_) async => notices);

  registerServiceInstance<SnapdClient>(client);
  addTearDown(unregisterService<SnapdClient>);
  return client;
}
