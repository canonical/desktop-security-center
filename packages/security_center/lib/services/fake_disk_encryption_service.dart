import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:security_center/services/disk_encryption_service.dart';
import 'package:snapd/snapd.dart';

class FakeDiskEncryptionService implements DiskEncryptionService {
  FakeDiskEncryptionService({
    required this.systemVolumes,
    required this.checkError,
    Map<String, String>? initialRecoveryKeys,
    this.storageEncryptionStatus = SnapdStorageEncryptionStatus.active,
  }) : _recoveryKeys = initialRecoveryKeys ?? {};

  /// Load initial system volumes from a JSON file.
  factory FakeDiskEncryptionService.fromFile(
    String path, {
    bool checkError = false,
    SnapdStorageEncryptionStatus storageEncryptionStatus =
        SnapdStorageEncryptionStatus.active,
  }) {
    final raw = File(path).readAsStringSync();
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final systemVolumes = SnapdSystemVolumesResponse.fromJson(json);

    return FakeDiskEncryptionService(
      systemVolumes: systemVolumes,
      initialRecoveryKeys: {'default-recovery': '1234'},
      checkError: checkError,
      storageEncryptionStatus: storageEncryptionStatus,
    );
  }

  /// Mocked system volumes response.
  SnapdSystemVolumesResponse systemVolumes;
  final Map<String, String> _recoveryKeys;
  final bool checkError;
  SnapdStorageEncryptionStatus storageEncryptionStatus;
  String _auth = '12345';

  /// Generates a fake recovery key and key ID.
  @override
  Future<SnapdGenerateRecoveryKeyResponse> generateRecoveryKey() async {
    await Future.delayed(const Duration(seconds: 2));
    final rand = Random();
    final lastSegment = rand.nextInt(100000).toString().padLeft(5, '0');
    final recoveryKey =
        '55055-39320-64491-48436-47667-15525-36879-$lastSegment';
    final keyId = DateTime.now().millisecondsSinceEpoch.toString();

    _recoveryKeys[keyId] = recoveryKey;
    return SnapdGenerateRecoveryKeyResponse(
      recoveryKey: recoveryKey,
      keyId: keyId,
    );
  }

  /// Adds an existing recovery key (by keyId) to the first available slot.
  @override
  Future<void> replaceRecoveryKey(String keyId) async {
    if (!_recoveryKeys.containsKey(keyId)) {
      throw StateError('Unknown recovery key ID: $keyId');
    }
    _recoveryKeys['default-recovery'] = _recoveryKeys[keyId]!;
  }

  /// Returns system volumes.
  @override
  Future<SnapdSystemVolumesResponse> enumerateKeySlots() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ); // Uncomment to simulate a delay
    return systemVolumes;
  }

  /// Throws if the given recovery key isn't valid.
  @override
  Future<void> checkRecoveryKey(String recoveryKey) async {
    // await Future.delayed(const Duration(seconds: 2)); // Uncomment to simulate a delay
    if (checkError) {
      throw Exception('Mocked error');
    }

    // Keyslot with name needs to exist && recovery key must exist with same name
    if ((systemVolumes.byContainerRole.values.any(
          (volume) => volume.keyslots.keys.any((k) => k == 'default-recovery'),
        )) &&
        (_recoveryKeys.containsKey('default-recovery') &&
            _recoveryKeys['default-recovery'] == recoveryKey)) {
      return;
    }
    throw Exception('Recovery key does not work');
  }

  @override
  Future<void> changePinPassphrase(
    AuthMode auth,
    String oldAuth,
    String newAuth,
  ) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (oldAuth != _auth) {
      throw Exception('Auths dont match');
    }
    _auth = newAuth;
  }

  @override
  Future<EntropyResponse> pinPassphraseEntropyCheck(
    AuthMode authmode,
    String newPass,
  ) async {
    final snapdResponse = SnapdEntropyResponse(
      entropyBits: newPass.length,
      minEntropyBits: 4,
      optimalEntropyBits: 6,
    );
    return EntropyResponse.fromSnapdEntropyResponse(snapdResponse);
  }

  @override
  Future<void> replacePlatformKey({
    required AuthMode authMode,
    String? passphrase,
    String? pin,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    // Validate that the required auth credential is provided
    switch (authMode) {
      case AuthMode.passphrase:
        if (passphrase == null || passphrase.isEmpty) {
          throw Exception('Passphrase required for passphrase auth mode');
        }
        _auth = passphrase;
      case AuthMode.pin:
        if (pin == null || pin.isEmpty) {
          throw Exception('PIN required for pin auth mode');
        }
        _auth = pin;
      case AuthMode.none:
        _auth = '';
    }

    // Update the authMode in all platform key slots in systemVolumes
    final updatedVolumes = <String, SnapdSystemVolume>{};
    for (final entry in systemVolumes.byContainerRole.entries) {
      final containerRole = entry.key;
      final volume = entry.value;

      final updatedKeyslots = <String, SnapdSystemVolumeKeySlot>{};
      for (final keyEntry in volume.keyslots.entries) {
        final keyName = keyEntry.key;
        final keyslot = keyEntry.value;

        // Only update platform keys
        if (keyslot.type == SnapdSystemVolumeKeySlotType.platform) {
          updatedKeyslots[keyName] = SnapdSystemVolumeKeySlot(
            type: keyslot.type,
            roles: keyslot.roles,
            platformName: keyslot.platformName,
            authMode: _authModeToSnapd(authMode),
          );
        } else {
          updatedKeyslots[keyName] = keyslot;
        }
      }

      updatedVolumes[containerRole] = SnapdSystemVolume(
        volumeName: volume.volumeName,
        name: volume.name,
        encrypted: volume.encrypted,
        keyslots: updatedKeyslots,
      );
    }

    systemVolumes = SnapdSystemVolumesResponse(
      byContainerRole: updatedVolumes,
    );
  }

  SnapdSystemVolumeAuthMode _authModeToSnapd(AuthMode authMode) {
    switch (authMode) {
      case AuthMode.none:
        return SnapdSystemVolumeAuthMode.none;
      case AuthMode.pin:
        return SnapdSystemVolumeAuthMode.pin;
      case AuthMode.passphrase:
        return SnapdSystemVolumeAuthMode.passphrase;
    }
  }

  @override
  Future<SnapdStorageEncryptedResponse> getStorageEncrypted() async {
    // For now, just return the current status
    // TODO: Add progress/estimatedTime fields when available in snapd.dart
    return SnapdStorageEncryptedResponse(status: storageEncryptionStatus);
  }

  @override
  Future<void> deleteKeyslots() {
    // TODO: implement deleteKeyslots
    throw UnimplementedError();
  }

  @override
  Future<String> reEncryptDisk() async {
    final changeId = 're-encrypt-${DateTime.now().millisecondsSinceEpoch}';
    return changeId;
  }

  @override
  Future<void> reprovisionDisk() {
    // TODO: implement reprovisionDisk
    throw UnimplementedError();
  }
}
