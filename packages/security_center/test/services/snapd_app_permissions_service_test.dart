import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:security_center/services/snapd_app_permissions_service.dart';
import 'package:snapd/snapd.dart';

import '../test_utils.dart';

void main() {
  final testRules = [
    SnapdRule(
      id: 'ruleId',
      timestamp: DateTime(2024),
      snap: 'firefox',
      interface: 'home',
      constraints: {
        'path-pattern': '/home/bob/Downloads/**',
        'permissions': {
          'read': {
            'outcome': 'allow',
            'lifespan': 'forever',
          },
        },
      },
    ),
  ];
  final testNotice = SnapdNotice(
    id: '1',
    type: SnapdNoticeType.interfacesRequestsRuleUpdate,
    key: '101',
    firstOccured: DateTime(2000),
    lastOccured: DateTime(2001),
    lastRepeated: DateTime(2001),
    occurrences: 1,
    expireAfter: '',
  );
  group('status stream', () {
    final testCases = <({
      String name,
      bool promptingEnabled,
      bool promptingSupported,
      List<NoticesEvent> noticeEvents,
      List<AppPermissionsServiceStatus> expectedStatuses
    })>[
      (
        name: 'successful rule update',
        promptingEnabled: true,
        promptingSupported: true,
        noticeEvents: [
          NoticesEvent.success([testNotice]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled(testRules),
        ],
      ),
      (
        name: 'empty notices don\'t change status',
        promptingEnabled: true,
        promptingSupported: true,
        noticeEvents: [
          NoticesEvent.success([testNotice]),
          NoticesEvent.success([]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled(testRules),
        ],
      ),
      (
        name: 'retry after error',
        promptingEnabled: true,
        promptingSupported: true,
        noticeEvents: [
          NoticesEvent.success([testNotice]),
          NoticesEvent.error(SnapdException(message: 'error')),
          NoticesEvent.success([testNotice]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled(testRules),
        ],
      ),
      (
        name: 'prompting unsupported and disabled',
        promptingEnabled: false,
        promptingSupported: false,
        noticeEvents: [
          NoticesEvent.success([]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.unavailable(),
        ],
      ),
      (
        name: 'prompting supported but disabled',
        promptingEnabled: false,
        promptingSupported: true,
        noticeEvents: [],
        expectedStatuses: [
          AppPermissionsServiceStatus.disabled(),
        ],
      ),
      (
        name: 'prompting enabled but unsupported',
        promptingEnabled: true,
        promptingSupported: false,
        noticeEvents: [],
        expectedStatuses: [
          AppPermissionsServiceStatus.unavailable(),
        ],
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final service = SnapdAppPermissionsService(
          registerMockSnapdService(
            noticesEvents: testCase.noticeEvents,
            rules: testRules,
            promptingEnabled: testCase.promptingEnabled,
            promptingSupported: testCase.promptingSupported,
          ),
        );
        await service.init();
        addTearDown(service.dispose);

        await expectLater(
          service.status,
          emitsInOrder(testCase.expectedStatuses),
        );
      });
    }
  });

  group('toggling prompting feature', () {
    final testCases = <({
      String name,
      bool enabled,
      Future<void> Function(AppPermissionsService) callback,
      bool authCancelled,
      List<AppPermissionsServiceStatus> expectedStatuses
    })>[
      // The mock service doesn't have a mutable state, so it will return the
      // same status after enabling/disabling the feature. This test asserts
      // that the intermediate statuses are emitted correctly and the service
      // emits a status update before and after the feature is toggled.
      (
        name: 'enable',
        enabled: true,
        callback: (service) => service.enable(),
        authCancelled: false,
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled([]),
          AppPermissionsServiceStatus.waitingForAuth(),
          AppPermissionsServiceStatus.enabling(0.0),
          AppPermissionsServiceStatus.enabling(0.5),
          AppPermissionsServiceStatus.enabled([]),
        ],
      ),
      (
        name: 'disable',
        enabled: false,
        callback: (service) => service.disable(),
        authCancelled: false,
        expectedStatuses: [
          AppPermissionsServiceStatus.disabled(),
          AppPermissionsServiceStatus.waitingForAuth(),
          AppPermissionsServiceStatus.disabling(0.0),
          AppPermissionsServiceStatus.disabling(0.5),
          AppPermissionsServiceStatus.disabled(),
        ],
      ),
      (
        name: 'auth cancelled',
        enabled: false,
        callback: (service) => service.enable(),
        authCancelled: true,
        expectedStatuses: [
          AppPermissionsServiceStatus.disabled(),
          AppPermissionsServiceStatus.waitingForAuth(),
          AppPermissionsServiceStatus.disabled(),
        ],
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final service = SnapdAppPermissionsService(
          registerMockSnapdService(
            promptingEnabled: testCase.enabled,
            changeId: 'changeId',
            changes: const [
              SnapdChange(
                id: 'changeId',
                tasks: [
                  SnapdTask(
                    id: 'taskId',
                    progress: SnapdTaskProgress(done: 1, total: 2),
                  ),
                ],
              ),
              SnapdChange(
                id: 'changeId',
                ready: true,
                tasks: [
                  SnapdTask(
                    id: 'taskId',
                    progress: SnapdTaskProgress(done: 2, total: 2),
                  ),
                ],
              ),
            ],
            authCancelled: testCase.authCancelled,
          ),
        );
        await service.init();
        addTearDown(service.dispose);
        service.status.listen(null);
        await expectLater(
          service.status,
          emits(testCase.expectedStatuses.removeAt(0)),
        );
        service.status.listen(
          (status) =>
              expect(status, equals(testCase.expectedStatuses.removeAt(0))),
        );
        await testCase.callback(service);
      });
    }
  });
}
