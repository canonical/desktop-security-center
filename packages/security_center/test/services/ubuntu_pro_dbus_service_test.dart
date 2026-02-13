import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';

import '../utils/ubuntu_pro_utils.dart';
import 'ubuntu_pro_dbus_service_test.mocks.dart';

@GenerateMocks([DBusClient])
void main() {
  group('attach/detach', () {
    final testCases = <({
      String name,
      bool attached,
      String osRelease,
      Future<void> Function(UbuntuProManagerService) callback,
      bool wantThrows,
      bool wantNewData,
      bool wantAttached,
      bool wantAvailable,
    })>[
      (
        name: 'Pro attach (invalid token)',
        attached: false,
        osRelease: osReleaseLTS,
        callback: (service) => service.attach(invalidToken),
        wantThrows: true,
        wantNewData: false,
        wantAttached: false,
        wantAvailable: true,
      ),
      (
        name: 'Pro attach',
        attached: false,
        osRelease: osReleaseLTS,
        callback: (service) => service.attach(validToken),
        wantThrows: false,
        wantNewData: true,
        wantAttached: true,
        wantAvailable: true,
      ),
      (
        name: 'Pro detach',
        attached: true,
        osRelease: osReleaseLTS,
        callback: (service) => service.detach(),
        wantThrows: false,
        wantNewData: true,
        wantAttached: false,
        wantAvailable: true,
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final mockFs = mockOSRelease(osRelease: testCase.osRelease);
        final objectManager = mockProManagerObject(
          attached: testCase.attached,
        );
        final dbusClient = MockDBusClient();

        final service = UbuntuProManagerService(
          client: dbusClient,
          objectManager: objectManager,
          fs: mockFs,
        );
        addTearDown(service.dispose);
        await service.init();

        expect(service.data.attached, testCase.attached);
        expect(service.data.available, testCase.wantAvailable);

        if (testCase.wantNewData) {
          unawaited(
            expectLater(
              service.stream,
              emits(
                predicate<UbuntuProManagerData>(
                  (data) => data.attached == testCase.wantAttached,
                ),
              ),
            ),
          );
        }

        if (testCase.wantThrows) {
          await expectLater(
            () => testCase.callback(service),
            throwsA(isA<DBusMethodResponseException>()),
          );
        } else {
          await testCase.callback(service);
        }

        expect(service.data.attached, testCase.wantAttached);
        expect(service.data.available, testCase.wantAvailable);
      });
    }
  });

  group('feature enable/disable', () {
    final testCases = <({
      String name,
      bool attached,
      bool? enabled,
      UbuntuProFeatureType type,
      Future<void> Function(UbuntuProFeatureService) callback,
      bool? wantEnabled,
      bool wantNewData,
    })>[
      for (final type in UbuntuProFeatureType.values) ...[
        (
          name: 'Feature enable (not attached)',
          attached: false,
          enabled: null,
          type: type,
          callback: (service) => service.enableFeature(type),
          wantEnabled: null,
          wantNewData: false,
        ),
        (
          name: 'Feature enable',
          attached: true,
          enabled: false,
          type: type,
          callback: (service) => service.enableFeature(type),
          wantEnabled: true,
          wantNewData: true,
        ),
        (
          name: 'Featured disable',
          attached: true,
          enabled: true,
          type: type,
          callback: (service) => service.disableFeature(type),
          wantEnabled: false,
          wantNewData: true,
        ),
      ],
    ];

    for (final testCase in testCases) {
      test('${testCase.name} (${testCase.type.name})', () async {
        final objectManager = FakeFeatureManagerObject(
          type: testCase.type,
          attached: testCase.attached,
          enabled: testCase.enabled ?? false,
        );
        final dbusClient = MockDBusClient();

        final service = UbuntuProFeatureService(
          client: dbusClient,
          objectManager: objectManager,
          objectFactory: (path) => mockFeatureObject(
            type: testCase.type,
            attached: testCase.attached,
          ),
        );
        addTearDown(service.dispose);
        await service.init();

        expect(
          service.getFeature(testCase.type),
          testCase.attached ? isNotNull : isNull,
        );
        expect(service.getFeature(testCase.type)?.enabled, testCase.enabled);

        if (testCase.wantNewData) {
          unawaited(
            expectLater(
              service.stream,
              emits(
                predicate<UbuntuProFeatureType>(
                  (data) => data == testCase.type,
                ),
              ),
            ),
          );
        }

        await testCase.callback(service);
        expect(
          service.getFeature(testCase.type)?.enabled,
          testCase.wantEnabled,
        );
      });
    }
  });

  group('feature added/removed', () {
    final testCases = <({
      String name,
      UbuntuProFeatureType type,
      bool attached,
      bool? wantEnabled,
    })>[
      for (final type in UbuntuProFeatureType.values) ...[
        (
          name: 'Feature added',
          type: type,
          attached: false,
          wantEnabled: true,
        ),
        (
          name: 'Feature removed',
          type: type,
          attached: true,
          wantEnabled: null,
        ),
      ],
    ];

    for (final testCase in testCases) {
      test('${testCase.name} (${testCase.type.name})', () async {
        final objectManager = FakeFeatureManagerObject(
          type: testCase.type,
          attached: testCase.attached,
          enabled: true,
        );
        final dbusClient = MockDBusClient();

        final service = UbuntuProFeatureService(
          client: dbusClient,
          objectManager: objectManager,
          objectFactory: (path) => mockFeatureObject(
            type: testCase.type,
            attached: testCase.attached,
          ),
        );
        addTearDown(service.dispose);
        await service.init();

        expect(
          service.getFeature(testCase.type),
          testCase.attached ? isNotNull : isNull,
        );

        final streamCalled = expectLater(
          service.stream,
          emits(
            predicate<UbuntuProFeatureType>(
              (data) => data == testCase.type,
            ),
          ),
        );

        if (testCase.attached) {
          objectManager.emitInterfaceRemoved();
        } else {
          objectManager.emitInterfaceAdded();
        }
        await streamCalled;

        expect(
          service.getFeature(testCase.type)?.enabled,
          testCase.wantEnabled,
        );
      });
    }
  });
}
