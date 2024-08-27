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
      constraints: const SnapdConstraints(),
      outcome: SnapdRequestOutcome.allow,
      lifespan: SnapdRequestLifespan.forever,
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
      List<NoticesEvent> noticeEvents,
      List<AppPermissionsServiceStatus> expectedStatuses
    })>[
      (
        name: 'successful rule update',
        noticeEvents: [
          NoticesEvent.success([testNotice]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled(testRules),
        ],
      ),
      (
        name: 'empty notices don\'t change status',
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
        noticeEvents: [
          NoticesEvent.success([testNotice]),
          NoticesEvent.error(SnapdException(message: 'error')),
          NoticesEvent.success([testNotice]),
        ],
        expectedStatuses: [
          AppPermissionsServiceStatus.enabled(testRules),
        ],
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final service = SnapdAppPermissionsService(
          registerMockSnapdService(
            noticesEvents: testCase.noticeEvents,
            rules: testRules,
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
      (
        name: 'enable',
        enabled: true,
        callback: (service) => service.enable(),
        authCancelled: false,
        expectedStatuses: [
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
        service.status.listen(
          (status) =>
              expect(status, equals(testCase.expectedStatuses.removeAt(0))),
        );

        await testCase.callback(service);
      });
    }
  });
}
