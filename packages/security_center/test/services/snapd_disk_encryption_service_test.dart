import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/snapd_disk_encryption_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';

import '../test_utils.dart';

void main() {
  test('snapd.dart throws ArgumentError for unknown storage status', () {
    expect(
      () => SnapdStorageEncryptedResponse.fromJson({'status': 'future-status'}),
      throwsA(isA<ArgumentError>()),
    );
  });

  test('returns failed status when snapd returns an unknown status', () async {
    final snapd = _FakeSnapdService(
      storageEncryptionStatus: 'future-status',
    );
    addTearDown(snapd.close);
    final service = SnapdDiskEncryptionService(snapd);

    final response = await service.getStorageEncrypted();

    expect(response.status, SnapdStorageEncryptionStatus.failed);
  });

  group('reprovision', () {
    for (final testCase in [
      (name: 'completes when the change succeeds', err: null, want: completes),
      (
        name: 'throws when the change fails',
        err: 'missing recovery key',
        want: throwsException,
      ),
    ]) {
      test(testCase.name, () async {
        final snapd = registerMockSnapdService(
          changeId: 'reprovision',
          changes: [
            const SnapdChange(id: 'reprovision'),
            SnapdChange(id: 'reprovision', ready: true, err: testCase.err),
          ],
        );
        var authorizedCount = 0;

        await expectLater(
          SnapdDiskEncryptionService(snapd)
              .reprovision(onAuthorized: () => authorizedCount++),
          testCase.want,
        );
        expect(authorizedCount, 1);
        verify(snapd.reprovision()).called(1);
        verify(snapd.watchChange('reprovision')).called(1);
      });
    }

    test('does not start a change when authorization is cancelled', () async {
      final snapd = registerMockSnapdService(
        changeId: 'reprovision',
        authCancelled: true,
      );
      var authorized = false;

      await expectLater(
        SnapdDiskEncryptionService(snapd)
            .reprovision(onAuthorized: () => authorized = true),
        throwsA(
          isA<SnapdException>()
              .having((error) => error.kind, 'kind', 'auth-cancelled'),
        ),
      );

      expect(authorized, isFalse);
      verifyNever(snapd.watchChange('reprovision'));
    });
  });
}

class _FakeSnapdService extends SnapdService {
  _FakeSnapdService({required this.storageEncryptionStatus});

  final String storageEncryptionStatus;

  @override
  Future<SnapdStorageEncryptedResponse> getStorageEncrypted() async {
    return SnapdStorageEncryptedResponse.fromJson({
      'status': storageEncryptionStatus,
    });
  }
}
