import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('snapd_disk_encryption_service');

class SnapdDiskEncryptionService implements DiskEncryptionService {
  SnapdDiskEncryptionService(this._snapd);
  final SnapdService _snapd;

  // TODO: add loading state in UI
  @override
  Future<void> changePinPassphrase(
    AuthMode authMode,
    String oldPass,
    String newPass,
  ) async {
    switch (authMode) {
      case AuthMode.none:
        throw UnimplementedError();
      case AuthMode.pin:
        await _snapd.changePin(oldPass, newPass);
      case AuthMode.passphrase:
        await _snapd.changePassphrase(oldPass, newPass);
    }
  }

  @override
  Future<bool> checkRecoveryKey(String recoveryKey) async {
    try {
      await _snapd.checkRecoveryKey(recoveryKey);
      return true;
    } on SnapdException catch (e) {
      _log.error(e);
      return false;
    }
  }

  @override
  Future<SnapdSystemVolumesResponse> enumerateKeySlots() {
    return _snapd.getSystemVolumes();
  }

  @override
  Future<SnapdGenerateRecoveryKeyResponse> generateRecoveryKey() {
    return _snapd.generateRecoveryKey();
  }

  // TODO: add loading state in UI
  @override
  Future<void> replaceRecoveryKey(String keyId) async {
    final changeId = await _snapd.replaceRecoveryKey(keyId);
    final result = await _snapd
        .watchChange(changeId)
        .firstWhere((change) => change.ready);
    if (result.err != null) {
      // TODO: this error message
      throw Exception(
        'replaceRecoveryKey encountered an error: ${result.err!}',
      );
    }
    return;
  }

  @override
  Future<SnapdEntropyResponse> pinPassphraseEntropyCheck(
    AuthMode authmode,
    String newPass,
  ) async {
    switch (authmode) {
      case AuthMode.none:
        throw UnimplementedError();
      case AuthMode.pin:
        return _snapd.checkPin(newPass);
      case AuthMode.passphrase:
        return _snapd.checkPassphrase(newPass);
    }
  }
}
