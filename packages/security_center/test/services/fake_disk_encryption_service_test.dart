import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/services/fake_disk_encryption_service.dart';
import 'package:snapd/snapd.dart';

void main() {
  group('failed reprovision', () {
    final cases = [
      (
        name: 'keeps the key when the post-install check is missing',
        scenario: FakeRepairScenario.needsRepair,
        runCheck: false,
        error: 'missing post install check context',
        keepsKey: true,
      ),
      (
        name: 'rejects unresolved check errors and uses up the key',
        scenario: FakeRepairScenario.noHardwareRootOfTrust,
        runCheck: true,
        error: 'postinstall check found some issues',
        keepsKey: false,
      ),
    ];

    for (final tc in cases) {
      test(tc.name, () async {
        final service = FakeDiskEncryptionService.fromFile(
          'integration_test/assets/test_containers.json',
          repairScenario: tc.scenario,
        );
        if (tc.runCheck) {
          final details = await service.getSystems();
          final encryption = details.storageEncryption;
          expect(
            encryption.unavailableReason,
            encryption.availabilityCheckErrors.first.message,
          );
        }
        await service.generateReprovisionRecoveryKey();
        var authorizedCount = 0;

        await expectLater(
          service.reprovision(onAuthorized: () => authorizedCount++),
          throwsA(
            isA<Exception>().having(
              (error) => error.toString(),
              'message',
              contains(tc.error),
            ),
          ),
        );
        expect(authorizedCount, 1);
        final status = await service.getStorageEncrypted();
        expect(
          status.recommendations,
          contains(SnapdRecommendedRemedialAction.requireReprovision),
        );

        await service.getSystems();
        if (tc.scenario == FakeRepairScenario.noHardwareRootOfTrust) {
          final details =
              await service.fixEncryptionSupport(SnapdFixAction.proceed);
          expect(details.storageEncryption.unavailableReason, isNull);
          expect(
            details.storageEncryption.requirements,
            contains(SnapdStorageEncryptionRequirement.volumesAuth),
          );
        }
        await expectLater(
          service.reprovision(),
          tc.keepsKey
              ? completes
              : throwsA(
                  isA<Exception>().having(
                    (error) => error.toString(),
                    'message',
                    contains('missing recovery key'),
                  ),
                ),
        );
      });
    }
  });

  test('reprovision replaces the recovery key and removes PIN authentication',
      () async {
    final service = FakeDiskEncryptionService.fromFile(
      'integration_test/assets/test_containers.json',
      repairScenario: FakeRepairScenario.needsRepair,
    );
    final details = await service.getSystems();
    expect(details.storageEncryption.unavailableReason, isNull);
    final key = await service.generateReprovisionRecoveryKey();

    await service.reprovision();

    await expectLater(service.checkRecoveryKey(key.recoveryKey), completes);
    await expectLater(service.checkRecoveryKey('1234'), throwsException);
    final volumes = await service.enumerateKeySlots();
    expect(
      volumes.byContainerRole['system-data']!.keyslots['default']!.authMode,
      SnapdSystemVolumeAuthMode.none,
    );
    final status = await service.getStorageEncrypted();
    expect(status.recommendations, isEmpty);
  });

  test('fixEncryptionSupport rejects a fix before getSystems checks support',
      () async {
    final service = FakeDiskEncryptionService.fromFile(
      'integration_test/assets/test_containers.json',
      repairScenario: FakeRepairScenario.tpmDisabled,
    );

    await expectLater(
      service.fixEncryptionSupport(SnapdFixAction.enableTpmViaFirmware),
      throwsA(isA<SnapdException>()),
    );
  });
}
