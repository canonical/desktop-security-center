import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/services/snapd_disk_encryption_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';

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
