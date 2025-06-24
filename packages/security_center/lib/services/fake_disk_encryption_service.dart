import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/services/disk_encryption_service.dart';

class FakeDiskEncryptionService implements DiskEncryptionService {
  FakeDiskEncryptionService({
    required this.containers,
    required this.checkError,
    Map<String, String>? initialRecoveryKeys,
  }) : _recoveryKeys = initialRecoveryKeys ?? {};

  /// Load initial containers from a JSON file.
  factory FakeDiskEncryptionService.fromFile(
    String path, {
    bool checkError = false,
  }) {
    final raw = File(path).readAsStringSync();
    final jsonList = jsonDecode(raw) as List;
    final containers = <SystemDataContainer>[];
    for (var i = 0; i < jsonList.length; i++) {
      final map = jsonList[i] as Map<String, dynamic>;
      try {
        final container = SystemDataContainer.fromJson(map);
        containers.add(container);
      } catch (e) {
        rethrow;
      }
    }

    return FakeDiskEncryptionService(
      containers: containers,
      initialRecoveryKeys: {'default-recovery': 'abcdef'},
      checkError: checkError,
    );
  }

  /// List of mocked system data containers.
  List<SystemDataContainer> containers;
  final Map<String, String> _recoveryKeys;
  final bool checkError;
  String _auth = '12345';
  final CheckRecoveryKeyDialogState _checkRecoveryKeyDialogState =
      CheckRecoveryKeyDialogState.empty();

  /// Generates a fake recovery key and key ID.
  @override
  Future<RecoveryKeyDetails> generateRecoveryKey() async {
    await Future.delayed(const Duration(seconds: 2));
    final rand = Random();
    final lastSegment = rand.nextInt(100000).toString().padLeft(5, '0');
    final recoveryKey =
        '55055-39320-64491-48436-47667-15525-36879-$lastSegment';
    final keyId = DateTime.now().millisecondsSinceEpoch.toString();

    _recoveryKeys[keyId] = recoveryKey;
    return RecoveryKeyDetails(recoveryKey: recoveryKey, keyId: keyId);
  }

  /// Adds an existing recovery key (by keyId) to the first available slot.
  @override
  Future<void> replaceRecoveryKey(String keyId) async {
    if (!_recoveryKeys.containsKey(keyId)) {
      throw StateError('Unknown recovery key ID: $keyId');
    }

    _recoveryKeys['default-recovery'] = _recoveryKeys[keyId]!;
  }

  /// Returns containers.
  @override
  Future<List<SystemDataContainer>> enumerateKeySlots() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ); // Uncomment to simulate a delay
    return containers;
  }

  /// Throws if the given recovery key isn't valid.
  @override
  Future<bool> checkRecoveryKey(String recoveryKey) async {
    // await Future.delayed(const Duration(seconds: 2)); // Uncomment to simulate a delay
    if (checkError) {
      throw Exception('Mocked error');
    }

    // Keyslot with name needs to exist && recovery key must exist with same name
    if ((containers.any(
          (c) => c.keySlots.any((k) => k.name == 'default-recovery'),
        )) &&
        (_recoveryKeys.containsKey('default-recovery') &&
            _recoveryKeys['default-recovery'] == recoveryKey)) {
      return true;
    }
    return false;
  }

  /// Returns the current state of the Check Recovery Key dialog.
  @override
  CheckRecoveryKeyDialogState get recoveryKeyDialogState =>
      _checkRecoveryKeyDialogState;

  @override
  Future<void> changePINPassphrase(
    AuthMode auth,
    String oldAuth,
    String newAuth,
  ) async {
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
    return EntropyResponse(
      entropyBits: newPass.length,
      minEntropyBits: 4,
      optimalEntropyBits: 6,
      success: newPass.length >= 4,
    );
  }
}
