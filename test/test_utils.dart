import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.mocks.dart';

part 'test_utils.freezed.dart';

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

@GenerateMocks([SnapdService])
SnapdService registerMockSnapdService({
  List<NoticesEvent> noticesEvents = const [],
  List<SnapdRule> rules = const [],
  bool promptingEnabled = true,
  String changeId = '',
  List<SnapdChange> changes = const [],
}) {
  final client = MockSnapdService();

  when(
    client.getNotices(
      types: anyNamed('types'),
      after: anyNamed('after'),
      timeout: anyNamed('timeout'),
    ),
  ).thenAnswer(
    (_) async {
      if (noticesEvents.isEmpty) {
        return [];
      } else {
        final event = noticesEvents.removeAt(0);
        return switch (event) {
          NoticesEventSuccess(notices: final notices) => notices,
          NoticesEventError(error: final error) => throw error,
        };
      }
    },
  );

  when(client.systemInfo()).thenAnswer(
    (_) async => SnapdSystemInfoResponse(
      refresh: SnapdSystemRefreshInfo(next: DateTime(1970)),
      features: {
        'apparmor-prompting': {'enabled': promptingEnabled},
      },
    ),
  );

  when(client.getRules()).thenAnswer((_) async => rules);

  when(client.enablePrompting()).thenAnswer((_) async => changeId);
  when(client.disablePrompting()).thenAnswer((_) async => changeId);

  when(client.watchChange(changeId))
      .thenAnswer((_) => Stream.fromIterable(changes));

  registerServiceInstance<SnapdService>(client);
  addTearDown(unregisterService<SnapdService>);
  return client;
}

@freezed
sealed class NoticesEvent with _$NoticesEvent {
  factory NoticesEvent.success(List<SnapdNotice> notices) = NoticesEventSuccess;
  factory NoticesEvent.error(Object error) = NoticesEventError;
}
