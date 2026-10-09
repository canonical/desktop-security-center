import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:security_center/services/disk_encryption_service.dart';
import 'package:snapd/snapd.dart';

/// Scenarios for `--test-fde-repair`. The issues are copied from secboot.
enum FakeRepairScenario {
  none('none'),
  needsRepair('needs-repair'),
  tpmDisabled('tpm-disabled', [
    SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled,
      message:
          'error with TPM2 device: TPM2 device is present but is currently disabled by the platform firmware',
      actions: [
        SnapdFixAction.enableTpmViaFirmware,
        SnapdFixAction.enableAndClearTpmViaFirmware,
        SnapdFixAction.rebootToFwSettings,
      ],
    ),
  ]),
  firmwareSettings('firmware-settings', [
    SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.invalidSecureBootMode,
      message:
          'error with secure boot policy (PCR7) measurements: secure boot is enabled but not in deployed mode',
      actions: [SnapdFixAction.rebootToFwSettings],
    ),
  ]),
  contactOem('contact-oem', [
    SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.hostSecurity,
      message:
          'error with system security: CPU debugging features are not disabled and locked',
      actions: [SnapdFixAction.contactOem],
    ),
  ]),

  /// `proceed` makes snapd require a PIN or passphrase.
  noHardwareRootOfTrust('no-hardware-root-of-trust', [
    SnapdAvailabilityCheckError(
      kind: SnapdAvailabilityCheckErrorKind.noHardwareRootOfTrust,
      message:
          'error with system security: no hardware root-of-trust properly configured',
      actions: [SnapdFixAction.proceed],
    ),
  ]);

  const FakeRepairScenario(this.flag, [this.issues = const []]);

  final String flag;
  final List<SnapdAvailabilityCheckError> issues;
}

class FakeDiskEncryptionService implements DiskEncryptionService {
  FakeDiskEncryptionService({
    required this.systemVolumes,
    required this.checkError,
    Map<String, String>? initialRecoveryKeys,
    this.storageEncryptionStatus = SnapdStorageEncryptionStatus.active,
    this.indeterminateCallCount = 0,
    this.repairScenario = FakeRepairScenario.none,
  }) : _recoveryKeys = initialRecoveryKeys ?? {};

  /// Load initial system volumes from a JSON file.
  factory FakeDiskEncryptionService.fromFile(
    String path, {
    bool checkError = false,
    SnapdStorageEncryptionStatus storageEncryptionStatus =
        SnapdStorageEncryptionStatus.active,
    int indeterminateCallCount = 0,
    FakeRepairScenario repairScenario = FakeRepairScenario.none,
  }) {
    final raw = File(path).readAsStringSync();
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final systemVolumes = SnapdSystemVolumesResponse.fromJson(json);

    return FakeDiskEncryptionService(
      systemVolumes: systemVolumes,
      initialRecoveryKeys: {'default-recovery': '1234'},
      checkError: checkError,
      storageEncryptionStatus: storageEncryptionStatus,
      indeterminateCallCount: indeterminateCallCount,
      repairScenario: repairScenario,
    );
  }

  /// Mocked system volumes response.
  SnapdSystemVolumesResponse systemVolumes;
  final Map<String, String> _recoveryKeys;
  final bool checkError;
  final SnapdStorageEncryptionStatus storageEncryptionStatus;

  /// Number of times [getStorageEncrypted] will return
  /// [SnapdStorageEncryptionStatus.indeterminate] before returning
  /// [storageEncryptionStatus]. Set to 0 to skip the indeterminate phase.
  final int indeterminateCallCount;
  int _storageEncryptedCalls = 0;

  String _auth = '12345';

  final FakeRepairScenario repairScenario;
  // Stays null until the first check, like snapd's check context
  List<SnapdAvailabilityCheckError>? _issues;
  bool _volumesAuthRequired = false;
  String? _repairKey;
  bool _repaired = false;

  /// Generates a fake recovery key and key ID.
  @override
  Future<SnapdGenerateRecoveryKeyResponse> generateRecoveryKey() async {
    await Future.delayed(const Duration(seconds: 2));
    final recoveryKey = _randomRecoveryKey();
    final keyId = DateTime.now().millisecondsSinceEpoch.toString();

    _recoveryKeys[keyId] = recoveryKey;
    return SnapdGenerateRecoveryKeyResponse(
      recoveryKey: recoveryKey,
      keyId: keyId,
    );
  }

  String _randomRecoveryKey() {
    final lastSegment = Random().nextInt(100000).toString().padLeft(5, '0');
    return '55055-39320-64491-48436-47667-15525-36879-$lastSegment';
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
    void Function()? onAuthorized,
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

    // Call the onAuthorized hook to indicate authorization is complete and the platform key can be replaced
    onAuthorized?.call();

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
    if (_storageEncryptedCalls < indeterminateCallCount) {
      _storageEncryptedCalls++;
      return SnapdStorageEncryptedResponse(
        status: SnapdStorageEncryptionStatus.indeterminate,
      );
    }
    if (repairScenario == FakeRepairScenario.none) {
      return SnapdStorageEncryptedResponse(status: storageEncryptionStatus);
    }
    return SnapdStorageEncryptedResponse(
      // Not `recovery`, so clearing the TPM checks the recovery key first
      status: repairScenario == FakeRepairScenario.tpmDisabled
          ? SnapdStorageEncryptionStatus.degraded
          : SnapdStorageEncryptionStatus.recovery,
      autoRepairResult: SnapdAutoRepairResult.failedKeyslots,
      recommendations: [
        if (!_repaired) SnapdRecommendedRemedialAction.requireReprovision,
      ],
    );
  }

  @override
  Future<SnapdSystemsResponse> getSystems() async {
    _issues = repairScenario.issues;
    _volumesAuthRequired = false;
    return _systemDetails();
  }

  @override
  Future<SnapdSystemsResponse> fixEncryptionSupport(
    SnapdFixAction fixAction, {
    Map<String, dynamic>? args,
  }) async {
    if (_issues == null) {
      throw SnapdException(
        message: 'cannot run check action without prior check',
      );
    }
    switch (fixAction) {
      case SnapdFixAction.enableTpmViaFirmware:
      case SnapdFixAction.enableAndClearTpmViaFirmware:
        _issues = const [
          SnapdAvailabilityCheckError(
            kind: SnapdAvailabilityCheckErrorKind.rebootRequired,
            message: 'a reboot is required to complete the action',
            actions: [SnapdFixAction.reboot],
          ),
        ];
      case SnapdFixAction.proceed:
        _issues = const [];
        _volumesAuthRequired = true;
      default:
        break;
    }
    return _systemDetails();
  }

  SnapdSystemsResponse _systemDetails() => SnapdSystemsResponse(
        storageEncryption: SnapdStorageEncryption(
          support: _issues!.isEmpty
              ? SnapdStorageEncryptionSupport.available
              : SnapdStorageEncryptionSupport.unavailable,
          unavailableReason: _issues!.isEmpty ? null : _issues!.first.message,
          availabilityCheckErrors: _issues!,
          features: const [
            SnapdStorageEncryptionFeature.pinAuth,
            SnapdStorageEncryptionFeature.passphraseAuth,
          ],
          requirements: [
            if (_volumesAuthRequired)
              SnapdStorageEncryptionRequirement.volumesAuth,
          ],
        ),
      );

  @override
  Future<SnapdGenerateReprovisionRecoveryKeyResponse>
      generateReprovisionRecoveryKey() async {
    final key = _randomRecoveryKey();
    _repairKey = key;
    return SnapdGenerateReprovisionRecoveryKeyResponse(recoveryKey: key);
  }

  @override
  Future<void> reprovision({void Function()? onAuthorized}) async {
    // snapd accepts the change first, then fails it
    onAuthorized?.call();
    if (_issues == null) {
      throw Exception('missing post install check context');
    }
    final key = _repairKey;
    _repairKey = null;
    if (key == null) {
      throw Exception('missing recovery key');
    }
    if (_issues!.isNotEmpty) {
      throw Exception('postinstall check found some issues');
    }

    _recoveryKeys['default-recovery'] = key;
    // Reprovisioning removes any PIN or passphrase
    await replacePlatformKey(authMode: AuthMode.none);
    _repaired = true;
  }
}
