import 'package:freezed_annotation/freezed_annotation.dart';

part 'disk_encryption_service.freezed.dart';
part 'disk_encryption_service.g.dart';

/// A Class to model the recovery key details returned.
@freezed
class RecoveryKeyDetails with _$RecoveryKeyDetails {
  const factory RecoveryKeyDetails({
    required String recoveryKey,
    required String keyId,
  }) = _RecoveryKeyDetails;

  factory RecoveryKeyDetails.fromJson(Map<String, dynamic> json) =>
      _$RecoveryKeyDetailsFromJson(json);
}

/// Type of key slot.
@JsonEnum(fieldRename: FieldRename.kebab)
enum KeySlotType { recovery, platform }

/// The authentication mode required to unlock a platform key slot.
@JsonEnum(fieldRename: FieldRename.kebab)
enum AuthMode { none, pin, passphrase }

/// A class to model the key slot on a LUKS container.
@freezed
class KeySlot with _$KeySlot {
  const factory KeySlot({
    /// The key slot name, used to identify the key slot.
    required String name,
    required KeySlotType type,
    String? role, // only for platform keys
    String? platformName, // only for platform keys
    AuthMode? authMode, // only for platform keys
  }) = _KeySlot;

  factory KeySlot.fromJson(Map<String, dynamic> json) =>
      _$KeySlotFromJson(json);
}

/// A class to model the system data container returned by snapd.
@freezed
class SystemDataContainer with _$SystemDataContainer {
  const factory SystemDataContainer({
    /// Name from gadget
    required String volumeName,

    /// Name of the partition from the gadget
    required String name,

    /// Bool indicating if the partition is encrypted
    required bool encrypted,

    /// List of key slots
    required List<KeySlot> keySlots,

    // TODO: any more fields that might be added by snapd.
  }) = _SystemDataContainer;

  factory SystemDataContainer.fromJson(Map<String, dynamic> json) =>
      _$SystemDataContainerFromJson(json);
}

/// A service for managing recovery keys.
abstract class DiskEncryptionService {
  /// Generates and returns a new recovery key.
  Future<RecoveryKeyDetails> generateRecoveryKey();

  /// Adds a recovery key to an available key slot.
  Future<void> addRecoveryKey(String keyId);

  /// Lists all key slot and their statuses.
  Future<List<SystemDataContainer>> enumerateKeySlots();

  /// Deletes the contenets of a specified key slot.
  Future<void> deleteKeySlot(String keyName);

  /// Checks if a recovery key is still valid for use.
  Future<bool> checkRecoveryKey(String recoveryKey);
}
