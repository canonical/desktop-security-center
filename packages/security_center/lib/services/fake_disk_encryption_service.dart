import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:security_center/services/disk_encryption_service.dart';

class FakeDiskEncryptionService implements DiskEncryptionService {
  FakeDiskEncryptionService({
    required this.containers,
    Map<String, String>? initialRecoveryKeys,
  }) : _recoveryKeys = initialRecoveryKeys ?? {};

  /// Load initial containers from a JSON file.
  factory FakeDiskEncryptionService.fromFile(String path) {
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
      initialRecoveryKeys: {'some-key-id': 'abcdef'},
    );
  }

  /// List of mocked system data containers.
  final List<SystemDataContainer> containers;
  final Map<String, String> _recoveryKeys;
  final Random _random = Random();

  /// Generates a fake recovery key and key ID.
  @override
  Future<RecoveryKeyDetails> generateRecoveryKey() async {
    final keyBytes = List<int>.generate(16, (_) => _random.nextInt(256));
    final recoveryKey = base64UrlEncode(keyBytes);
    final keyId = DateTime.now().millisecondsSinceEpoch.toString();

    _recoveryKeys[keyId] = recoveryKey;
    return RecoveryKeyDetails(recoveryKey: recoveryKey, keyId: keyId);
  }

  /// Adds an existing recovery key (by keyId) to the first available slot.
  @override
  Future<void> addRecoveryKey(String keyId) async {
    if (!_recoveryKeys.containsKey(keyId)) {
      throw StateError('Unknown recovery key ID: $keyId');
    }

    // Waiting for clarification on container-roles, for now, just add to all container.
    final slotName = 'recovery-$keyId';
    for (final c in containers) {
      c.keySlots.add(KeySlot(name: slotName, type: KeySlotType.recovery));
    }
  }

  /// Returns containers.
  @override
  Future<List<SystemDataContainer>> enumerateKeySlots() async {
    return containers;
  }

  /// Deletes the contents of the named key slot in all containers.
  @override
  Future<void> deleteKeySlot(String keyName) async {
    for (final c in containers) {
      c.keySlots.removeWhere((ks) => ks.name == keyName);
    }
  }

  /// Throws if the given recovery key isn't valid.
  @override
  Future<bool> checkRecoveryKey(String recoveryKey) async {
    if (!_recoveryKeys.containsValue(recoveryKey)) {
      return false;
    }
    return true;
  }
}
