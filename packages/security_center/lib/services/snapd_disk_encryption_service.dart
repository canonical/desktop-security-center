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
    final String changeId;
    switch (authMode) {
      case AuthMode.none:
        throw UnimplementedError();
      case AuthMode.pin:
        changeId = await _snapd.changePin(oldPass, newPass);
      case AuthMode.passphrase:
        changeId = await _snapd.changePassphrase(oldPass, newPass);
    }
    final result =
        await _snapd.watchChange(changeId).firstWhere((change) => change.ready);
    if (result.err != null) {
      throw Exception(
        'changePinPassphrase encountered an error: ${result.err!}',
      );
    }
    return;
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
    final result =
        await _snapd.watchChange(changeId).firstWhere((change) => change.ready);
    if (result.err != null) {
      // TODO: this error message
      throw Exception(
        'replaceRecoveryKey encountered an error: ${result.err!}',
      );
    }
    return;
  }

  @override
  Future<EntropyResponse> pinPassphraseEntropyCheck(
    AuthMode authmode,
    String newPass,
  ) async {
    try {
      switch (authmode) {
        case AuthMode.none:
          throw UnimplementedError();
        case AuthMode.pin:
          final response = await _snapd.checkPin(newPass);
          return EntropyResponse.fromSnapdEntropyResponse(response);
        case AuthMode.passphrase:
          final response = await _snapd.checkPassphrase(newPass);
          return EntropyResponse.fromSnapdEntropyResponse(response);
      }
    } on SnapdException catch (e) {
      switch (e.kind) {
        case 'invalid-passphrase':
        case 'invalid-pin':
          if (e.value is Map<String, dynamic>) {
            final valueMap = e.value as Map<String, dynamic>;
            return EntropyResponse(
              success: false,
              entropyBits: valueMap['entropy-bits'] as int? ?? 0,
              minEntropyBits: valueMap['min-entropy-bits'] as int? ?? 0,
              optimalEntropyBits: valueMap['optimal-entropy-bits'] as int? ?? 0,
              failureReasons: (valueMap['failure-reasons'] as List?)
                  ?.map((e) => e.toString())
                  .toList(),
            );
          }
          return EntropyResponse(
            success: false,
            entropyBits: 0,
            minEntropyBits: 0,
            optimalEntropyBits: 0,
            failureReasons: [e.message],
          );
        default:
          _log.error(e);
          rethrow;
      }
    }
  }
}
