import 'dart:async';
import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/services/feature_service.dart';
import 'package:security_center/widgets/file_picker_dialog.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';

part 'disk_encryption_providers.freezed.dart';
part 'disk_encryption_providers.g.dart';

final _log = Logger('disk_encryption_providers');

enum SemanticEntropy {
  belowMin,
  belowOptimal,
  optimal;
}

extension EntropyResponseSemantic on EntropyResponse {
  SemanticEntropy get semanticEntropy {
    if (minEntropyBits > optimalEntropyBits) {
      _log.info(
        'received entropy response with minEntropyBits > optimalEntropyBits: $this',
      );
    }
    if (entropyBits < minEntropyBits) {
      return SemanticEntropy.belowMin;
    } else if (entropyBits < optimalEntropyBits) {
      return SemanticEntropy.belowOptimal;
    }
    return SemanticEntropy.optimal;
  }
}

extension SnapdStorageEncryptedResponseRepair on SnapdStorageEncryptedResponse {
  // Wait while snapd can't tell the status, or may still auto-repair
  bool get needsRepair =>
      status != SnapdStorageEncryptionStatus.indeterminate &&
      recommendations
          .contains(SnapdRecommendedRemedialAction.requireReprovision) &&
      autoRepairResult != SnapdAutoRepairResult.notInitialized;
}

extension SnapdFixActionRepair on SnapdFixAction {
  /// Whether the user does this action instead of snapd, as in secboot's
  /// IsExternalAction.
  bool get isExternal => switch (this) {
        SnapdFixAction.reboot ||
        SnapdFixAction.shutdown ||
        SnapdFixAction.rebootToFwSettings ||
        SnapdFixAction.contactOem ||
        SnapdFixAction.contactOsVendor =>
          true,
        SnapdFixAction.enableTpmViaFirmware ||
        SnapdFixAction.enableAndClearTpmViaFirmware ||
        SnapdFixAction.clearTpmViaFirmware ||
        SnapdFixAction.clearTpmSimple ||
        SnapdFixAction.clearTpm ||
        SnapdFixAction.proceed =>
          false,
      };
}

@freezed
sealed class RecoveryKeyException
    with _$RecoveryKeyException
    implements Exception {
  factory RecoveryKeyException.disallowedPath() =
      RecoveryKeyExceptionDisallowedPath;
  factory RecoveryKeyException.fileSystem() = RecoveryKeyExceptionFileSystem;
  factory RecoveryKeyException.filePermission() =
      RecoveryKeyExceptionFilePermission;
  factory RecoveryKeyException.unknown({required String rawError}) =
      RecoveryKeyExceptionUnknown;

  factory RecoveryKeyException.from(Object? e) => switch (e) {
        final FileSystemException _ => RecoveryKeyException.fileSystem(),
        final RecoveryKeyException e => e,
        final e => RecoveryKeyException.unknown(rawError: e.toString()),
      };
}

@freezed
sealed class SnapdStateException
    with _$SnapdStateException
    implements Exception {
  factory SnapdStateException.unsupportedSnapdVersion() =
      SnapdStateExceptionUnsupportedSnapdVersion;
  factory SnapdStateException.unconnectedSnapInterface() =
      SnapdStateExceptionUnconnectedSnapInterface;
}

// Refer to https://github.com/canonical/snapd/blob/master/client/errors.go#L34-L200
// for a full catalogue of snapd error kinds. The enum contains a subset of errors that
// may be returned by snapd during TPM FDE operations that require polkit authentication
enum SnapdAuthErrorKind {
  authCancelled('auth-cancelled'),
  authLoginRequired('login-required');

  const SnapdAuthErrorKind(this.snapdKind);

  final String snapdKind;

  static SnapdAuthErrorKind? fromKind(String? kind) => switch (kind) {
        'auth-cancelled' => SnapdAuthErrorKind.authCancelled,
        'login-required' => SnapdAuthErrorKind.authLoginRequired,
        _ => null,
      };
}

enum TpmFdeOperation {
  addPin,
  addPassphrase,
  changePin,
  changePassphrase,
  removePin,
  removePassphrase,
  repair;

  factory TpmFdeOperation.adding(AuthMode mode) => switch (mode) {
        AuthMode.pin => TpmFdeOperation.addPin,
        AuthMode.passphrase => TpmFdeOperation.addPassphrase,
        AuthMode.none => throw ArgumentError.value(mode),
      };

  factory TpmFdeOperation.changing(AuthMode mode) => switch (mode) {
        AuthMode.pin => TpmFdeOperation.changePin,
        AuthMode.passphrase => TpmFdeOperation.changePassphrase,
        AuthMode.none => throw ArgumentError.value(mode),
      };

  factory TpmFdeOperation.removing(AuthMode mode) => switch (mode) {
        AuthMode.pin => TpmFdeOperation.removePin,
        AuthMode.passphrase => TpmFdeOperation.removePassphrase,
        AuthMode.none => throw ArgumentError.value(mode),
      };
}

@freezed
sealed class TpmFdeOperationException
    with _$TpmFdeOperationException
    implements Exception {
  const factory TpmFdeOperationException.snapdAuth({
    required SnapdAuthErrorKind kind,
    required TpmFdeOperation operation,
    required SnapdException cause,
  }) = TpmFdeOperationSnapdAuthException;

  const factory TpmFdeOperationException.snapd({
    required SnapdException cause,
    required TpmFdeOperation operation,
  }) = TpmFdeOperationSnapdException;

  const factory TpmFdeOperationException.unknown({
    required Exception cause,
    required TpmFdeOperation operation,
  }) = TpmFdeOperationUnknownException;

  factory TpmFdeOperationException.from(
    Exception exception,
    TpmFdeOperation operation,
  ) {
    if (exception is SnapdException) {
      final kind = SnapdAuthErrorKind.fromKind(exception.kind);
      if (kind == null) {
        return TpmFdeOperationException.snapd(
          cause: exception,
          operation: operation,
        );
      }
      return TpmFdeOperationException.snapdAuth(
        kind: kind,
        operation: operation,
        cause: exception,
      );
    }

    return TpmFdeOperationException.unknown(
      cause: exception,
      operation: operation,
    );
  }
}

@freezed
sealed class TpmStateException with _$TpmStateException implements Exception {
  factory TpmStateException.failed() = TpmStateExceptionFailed;
  factory TpmStateException.unsupportedState() =
      TpmStateExceptionUnsupportedState;
}

class RepairNotAvailableException implements Exception {}

/// Dialog state for managing the flow to update an existing pin or passphrase.
@freezed
sealed class ChangeAuthDialogState with _$ChangeAuthDialogState {
  factory ChangeAuthDialogState.input() = ChangeAuthDialogStateInput;
  factory ChangeAuthDialogState.loading() = ChangeAuthDialogStateLoading;
  factory ChangeAuthDialogState.success() = ChangeAuthDialogStateSuccess;
  factory ChangeAuthDialogState.error(Exception e, bool fatal) =
      ChangeAuthDialogStateError;
}

/// Dialog state for managing the flow to swap between pin and passphrase.
@freezed
sealed class ChangeAuthModeDialogState with _$ChangeAuthModeDialogState {
  factory ChangeAuthModeDialogState.input() = ChangeAuthModeDialogStateInput;
  factory ChangeAuthModeDialogState.loading() =
      ChangeAuthModeDialogStateLoading;
  factory ChangeAuthModeDialogState.success() =
      ChangeAuthModeDialogStateSuccess;
  factory ChangeAuthModeDialogState.error(Exception e, bool fatal) =
      ChangeAuthModeDialogStateError;
}

/// State for TPM authentication mode, including pending operations to change current platform key.
@freezed
class TpmAuthState with _$TpmAuthState {
  const factory TpmAuthState({
    required AuthMode currentAuthMode,
    @Default(false) bool needsRepair,
    TpmFdeOperation? pendingOperation,
    TpmFdeOperationException? operationError,
  }) = _TpmAuthState;

  const TpmAuthState._();

  bool get isLoading => pendingOperation != null;
}

/// Dialog state for managing the replace recovery key flow.
@freezed
sealed class ReplaceRecoveryKeyDialogState
    with _$ReplaceRecoveryKeyDialogState {
  factory ReplaceRecoveryKeyDialogState.generating() =
      ReplaceRecoveryKeyDialogStateGenerating;
  factory ReplaceRecoveryKeyDialogState.input(bool acknowledged) =
      ReplaceRecoveryKeyDialogStateInput;
  factory ReplaceRecoveryKeyDialogState.loading() =
      ReplaceRecoveryKeyDialogStateLoading;
  factory ReplaceRecoveryKeyDialogState.success() =
      ReplaceRecoveryKeyDialogStateSuccess;
  factory ReplaceRecoveryKeyDialogState.error(Exception e) =
      ReplaceRecoveryKeyDialogStateError;
  factory ReplaceRecoveryKeyDialogState.authCancelled() =
      ReplaceRecoveryKeyDialogStateAuthCancelled;
}

/// Dialog state for managing the recovery key check flow.
@freezed
sealed class CheckRecoveryKeyDialogState with _$CheckRecoveryKeyDialogState {
  factory CheckRecoveryKeyDialogState.empty() =
      CheckRecoveryKeyDialogStateEmpty;
  factory CheckRecoveryKeyDialogState.input(String keyToCheck) =
      CheckRecoveryKeyDialogStateInput;
  factory CheckRecoveryKeyDialogState.result(bool valid) =
      CheckRecoveryKeyDialogStateResult;
  factory CheckRecoveryKeyDialogState.loading() =
      CheckRecoveryKeyDialogStateLoading;
  factory CheckRecoveryKeyDialogState.error(Exception e) =
      CheckRecoveryKeyDialogStateError;
}

/// Dialog state for managing the repair flow.
@freezed
sealed class RepairDialogState with _$RepairDialogState {
  factory RepairDialogState.checking() = RepairDialogStateChecking;
  factory RepairDialogState.issue(SnapdAvailabilityCheckError issue) =
      RepairDialogStateIssue;
  factory RepairDialogState.applyingFix(SnapdFixAction action) =
      RepairDialogStateApplyingFix;
  factory RepairDialogState.unavailable(SnapdAvailabilityCheckError issue) =
      RepairDialogStateUnavailable;
  factory RepairDialogState.setPinOrPassphrase() =
      RepairDialogStateSetPinOrPassphrase;
  factory RepairDialogState.pinOrPassphraseWillBeRemoved() =
      RepairDialogStatePinOrPassphraseWillBeRemoved;
  factory RepairDialogState.generatingKey() = RepairDialogStateGeneratingKey;
  // Holds the response, since its toString() hides the key
  factory RepairDialogState.saveKey(
    SnapdGenerateReprovisionRecoveryKeyResponse key,
    bool acknowledged,
  ) = RepairDialogStateSaveKey;
  factory RepairDialogState.startingRepair() = RepairDialogStateStartingRepair;
  factory RepairDialogState.error(Exception e) = RepairDialogStateError;
  factory RepairDialogState.authCancelled() = RepairDialogStateAuthCancelled;
}

/// Dialog model for managing the flow to update an existing pin or passphrase.
@freezed
class ChangeAuthDialogModelData with _$ChangeAuthDialogModelData {
  factory ChangeAuthDialogModelData({
    required ChangeAuthDialogState dialogState,
    required AuthMode authMode,
    EntropyResponse? entropy,
    @Default('') String oldPass,
    @Default('') String newPass,
    @Default('') String confirmPass,
    @Default(false) bool showPassphrase,
  }) = _ChangeAuthDialogModelData;
}

/// Dialog model for managing the flow to swap between pin and passphrase.
@freezed
class ChangeAuthModeDialogModelData with _$ChangeAuthModeDialogModelData {
  factory ChangeAuthModeDialogModelData({
    required ChangeAuthModeDialogState dialogState,
    required AuthMode newAuthMode,
    EntropyResponse? entropy,
    @Default('') String newPass,
    @Default('') String confirmPass,
    @Default(false) bool showPassphrase,
  }) = _ChangeAuthModeDialogModelData;
}

@riverpod
class ChangeAuthDialogModel extends _$ChangeAuthDialogModel {
  late final _service = getService<DiskEncryptionService>();
  Timer? _newPassTimer;
  Timer? _confirmTimer;
  static const debounceDuration = Duration(milliseconds: 500);

  @override
  ChangeAuthDialogModelData build(AuthMode authMode) {
    ref.onDispose(() {
      _newPassTimer?.cancel();
      _confirmTimer?.cancel();
    });
    return ChangeAuthDialogModelData(
      dialogState: ChangeAuthDialogState.input(),
      authMode: authMode,
    );
  }

  Future<void> changePinPassphrase() async {
    assert(state.dialogState is ChangeAuthDialogStateInput);
    state = state.copyWith(dialogState: ChangeAuthDialogState.loading());
    try {
      await _service.changePinPassphrase(
        state.authMode,
        state.oldPass,
        state.newPass,
      );
      state = state.copyWith(
        dialogState: ChangeAuthDialogState.success(),
        showPassphrase: false,
      );
      ref.read(tpmAuthenticationModelProvider.notifier).dismissOperationError();
    } on Exception catch (e) {
      final exception = TpmFdeOperationException.from(
        e,
        TpmFdeOperation.changing(state.authMode),
      );
      switch (exception) {
        case TpmFdeOperationSnapdAuthException(
            kind: SnapdAuthErrorKind.authCancelled,
          ):
          state = state.copyWith(dialogState: ChangeAuthDialogState.input());
        case _:
          state = state.copyWith(
            dialogState: ChangeAuthDialogState.error(
              exception,
              false,
            ),
          );
      }
    }
  }

  void toggleShowPassphrase() {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    state = state.copyWith(showPassphrase: !state.showPassphrase);
  }

  Future<void> setConfirmPass(
    String value, {
    bool debounce = false,
  }) async {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    _confirmTimer?.cancel();
    _confirmTimer =
        Timer(debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
            () async {
      state = state.copyWith(
        confirmPass: value,
        dialogState: ChangeAuthDialogStateInput(),
      );
    });
  }

  Future<void> setNewPass(
    String value, {
    bool debounce = false,
  }) async {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    _newPassTimer?.cancel();
    _newPassTimer =
        Timer(debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
            () async {
      state = state.copyWith(
        newPass: value,
        dialogState: ChangeAuthDialogStateInput(),
      );
      if (value.isEmpty) {
        _log.debug('new passphrase is empty');
        state = state.copyWith(entropy: null);
        return;
      }
      try {
        final response = await _service.pinPassphraseEntropyCheck(
          state.authMode,
          value,
        );
        state = state.copyWith(
          entropy: response,
        );
      } on Exception catch (e) {
        state = state.copyWith(
          entropy: null,
          dialogState: ChangeAuthDialogStateError(e, true),
        );
        _log.error(e);
      }
    });
  }

  set oldPass(String value) {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    state = state.copyWith(
      oldPass: value,
      dialogState: ChangeAuthDialogStateInput(),
    );
  }

  bool get isValid {
    if (state.oldPass.isEmpty ||
        state.newPass.isEmpty ||
        state.confirmPass.isEmpty) {
      return false;
    }

    if (state.newPass != state.confirmPass) {
      return false;
    }

    if (state.entropy == null || !state.entropy!.success) {
      return false;
    }

    return true;
  }

  bool get passphraseConfirmed {
    if (state.confirmPass.isNotEmpty && state.newPass != state.confirmPass) {
      return false;
    }
    return true;
  }
}

@Riverpod(keepAlive: true)
class TpmAuthenticationModel extends _$TpmAuthenticationModel {
  late final _service = getService<DiskEncryptionService>();
  late final _featureService = getService<FeatureService>();

  @visibleForTesting
  static Duration maxRetryDuration = const Duration(minutes: 2);
  @visibleForTesting
  static Duration initialRetryDelay = const Duration(seconds: 2);

  @override
  Future<TpmAuthState> build() async {
    return _fetchState();
  }

  Future<TpmAuthState> _fetchState() async {
    try {
      // Check TPM-backed FDE status with exponential backoff retry
      // for indeterminate state (see LP#2147606)
      final stopwatch = Stopwatch()..start();
      var delay = initialRetryDelay;
      var storageStatus = await _request(_service.getStorageEncrypted());
      while (
          storageStatus.status == SnapdStorageEncryptionStatus.indeterminate &&
              stopwatch.elapsed < maxRetryDuration) {
        _log.info(
          'Storage encryption state is indeterminate, '
          'retrying in ${delay.inSeconds}s '
          '(elapsed: ${stopwatch.elapsed.inSeconds}s)...',
        );
        final remaining = maxRetryDuration - stopwatch.elapsed;
        await Future.delayed(delay < remaining ? delay : remaining);
        delay *= 2;
        storageStatus = await _request(_service.getStorageEncrypted());
      }

      switch (storageStatus.status) {
        case SnapdStorageEncryptionStatus.inactive:
          _log.error(
            'Storage encryption is not active: ${storageStatus.status}',
          );
          throw TpmStateExceptionFailed();
        case SnapdStorageEncryptionStatus.failed:
          _log.error(
            'Storage encryption state returned failure: ${storageStatus.status}',
          );
          throw TpmStateExceptionFailed();
        case SnapdStorageEncryptionStatus.indeterminate:
          _log.warning(
            'Storage encryption remained indeterminate after '
            '${stopwatch.elapsed.inSeconds}s',
          );
          throw TpmStateExceptionFailed();
        case SnapdStorageEncryptionStatus.active:
        case SnapdStorageEncryptionStatus.degraded:
        case SnapdStorageEncryptionStatus.recovery:
          break;
      }

      // Get auth mode from keyslots
      final volumesResponse = await _service.enumerateKeySlots();

      final systemDataVolume = volumesResponse.byContainerRole['system-data'];
      if (systemDataVolume == null) {
        _log.error('No system-data volume found');
        throw TpmStateExceptionUnsupportedState();
      }

      final defaultKeySlot = systemDataVolume.keyslots['default'];

      if (defaultKeySlot == null) {
        _log.error('defaultKeySlot not found');
        throw TpmStateExceptionUnsupportedState();
      }

      final authMode = defaultKeySlot.authMode;

      final currentAuthMode = switch (authMode) {
        SnapdSystemVolumeAuthMode.pin => AuthMode.pin,
        SnapdSystemVolumeAuthMode.passphrase => AuthMode.passphrase,
        SnapdSystemVolumeAuthMode.none || null => AuthMode.none,
      };

      return TpmAuthState(
        currentAuthMode: currentAuthMode,
        needsRepair:
            storageStatus.needsRepair && _featureService.supportsReprovision,
      );
    } on SnapdException catch (e) {
      _log.error('Failed to determine TPM authentication mode: $e');
      if (e.statusCode == 404) {
        throw SnapdStateExceptionUnsupportedSnapdVersion();
      }
      if (e.statusCode == 403) {
        throw SnapdStateExceptionUnconnectedSnapInterface();
      }
      throw TpmStateExceptionFailed();
    }
  }

  Future<void> changeAuthMode(
    AuthMode newMode, {
    String? passphrase,
    void Function()? onAuthorized,
  }) async {
    assert(state.hasValue, 'State must be loaded before changing auth mode');

    final currentMode = state.value!.currentAuthMode;
    final operation = newMode == AuthMode.none
        ? TpmFdeOperation.removing(currentMode)
        : TpmFdeOperation.adding(newMode);

    state = AsyncData(
      state.value!.copyWith(
        pendingOperation: operation,
        operationError: null,
      ),
    );

    try {
      await _service.replacePlatformKey(
        authMode: newMode,
        passphrase: newMode == AuthMode.passphrase ? passphrase : null,
        pin: newMode == AuthMode.pin ? passphrase : null,
        onAuthorized: onAuthorized,
      );

      state = AsyncData(await _fetchState());
    } on Exception catch (e) {
      final exception = TpmFdeOperationException.from(e, operation);
      state = AsyncData(
        state.value!.copyWith(
          pendingOperation: null,
          operationError: exception,
        ),
      );
    }
  }

  Future<void> removeAuthMode({void Function()? onAuthorized}) async {
    await changeAuthMode(AuthMode.none, onAuthorized: onAuthorized);

    switch (state.valueOrNull?.operationError) {
      case TpmFdeOperationSnapdAuthException(
          kind: SnapdAuthErrorKind.authCancelled
        ):
        dismissOperationError();
      case _:
        break;
    }
  }

  Future<void> repair({
    AuthMode? newMode,
    String? passphrase,
    void Function()? onAuthorized,
  }) async {
    assert(state.hasValue, 'State must be loaded before repairing');

    state = AsyncData(
      state.value!.copyWith(
        pendingOperation: TpmFdeOperation.repair,
        operationError: null,
      ),
    );

    try {
      await _service.reprovision(onAuthorized: onAuthorized);
      state = AsyncData(await _fetchState());
      // The new keys have no PIN or passphrase, so enrol the chosen one
      if (newMode != null && newMode != AuthMode.none) {
        await changeAuthMode(newMode, passphrase: passphrase);
      }
    } on Exception catch (e) {
      final exception =
          TpmFdeOperationException.from(e, TpmFdeOperation.repair);
      state = AsyncData(
        state.value!.copyWith(
          pendingOperation: null,
          operationError: exception,
        ),
      );
    }
  }

  void dismissOperationError() {
    if (state.hasValue) {
      state = AsyncData(
        state.value!.copyWith(operationError: null),
      );
    }
  }
}

typedef FilePicker = Future<Uri?> Function({
  required BuildContext context,
  required String title,
  String? defaultFileName,
  List<XdgFileChooserFilter> filters,
});
final filePickerProvider = Provider<FilePicker>((ref) => showSaveFileDialog);

final fileSystemProvider = Provider<FileSystem>((_) => LocalFileSystem());

typedef ProcessRunner = Future<ProcessResult> Function(
  String executable,
  List<String> arguments,
);
final processRunnerProvider = Provider<ProcessRunner>((_) => Process.run);

@freezed
class ReplaceRecoveryKeyDialogModelData
    with _$ReplaceRecoveryKeyDialogModelData {
  factory ReplaceRecoveryKeyDialogModelData({
    required ReplaceRecoveryKeyDialogState dialogState,
    RecoveryKeyException? error,
  }) = _ReplaceRecoveryKeyDialogModelData;
}

@riverpod
class ReplaceRecoveryKeyDialogModel extends _$ReplaceRecoveryKeyDialogModel {
  late final _service = getService<DiskEncryptionService>();
  late final FileSystem _fs = ref.read(fileSystemProvider);

  @override
  ReplaceRecoveryKeyDialogModelData build() {
    // listen for the key to land
    ref.listen<AsyncValue<SnapdGenerateRecoveryKeyResponse>>(
      generatedRecoveryKeyModelProvider,
      (prev, next) {
        if (prev is AsyncLoading && next is AsyncData) {
          state = state.copyWith(
            dialogState: ReplaceRecoveryKeyDialogStateInput(false),
          );
        } else if (prev is AsyncLoading && next is AsyncError) {
          if (next.error is SnapdException &&
              (next.error as SnapdException).kind == 'auth-cancelled') {
            state = state.copyWith(
              dialogState: ReplaceRecoveryKeyDialogState.authCancelled(),
            );
          } else {
            state = state.copyWith(
              dialogState: ReplaceRecoveryKeyDialogState.error(
                Exception(next.error.toString()),
              ),
            );
          }
        }
      },
    );
    return ReplaceRecoveryKeyDialogModelData(
      dialogState: ReplaceRecoveryKeyDialogState.generating(),
    );
  }

  Future<void> replaceRecoveryKey(String key) async {
    assert(state.dialogState is ReplaceRecoveryKeyDialogStateInput);
    assert(
      (state.dialogState as ReplaceRecoveryKeyDialogStateInput).acknowledged,
    );

    state = state.copyWith(
      dialogState: ReplaceRecoveryKeyDialogState.loading(),
    );
    try {
      await _service.replaceRecoveryKey(key);
      state = state.copyWith(
        dialogState: ReplaceRecoveryKeyDialogState.success(),
        error: null,
      );
    } on Exception catch (e) {
      state = state.copyWith(
        dialogState: ReplaceRecoveryKeyDialogState.error(e),
      );
    }
  }

  void acknowledge(bool acknowledged) {
    assert(state.dialogState is ReplaceRecoveryKeyDialogStateInput);
    state = state.copyWith(
      dialogState: ReplaceRecoveryKeyDialogStateInput(acknowledged),
    );
  }

  Future<void> writeRecoveryKey(Uri uri, String recoveryKey) async {
    assert(
      state.dialogState is ReplaceRecoveryKeyDialogStateInput ||
          state.dialogState is ReplaceRecoveryKeyDialogStateSuccess,
    );
    await _fs.file(uri.path).writeAsString(recoveryKey);
  }

  void setError(RecoveryKeyException? error) {
    state = state.copyWith(error: error);
  }
}

// Keep generate key seperate to manage its simpilier state in isolation
@riverpod
class GeneratedRecoveryKeyModel extends _$GeneratedRecoveryKeyModel {
  final _service = getService<DiskEncryptionService>();

  @override
  Future<SnapdGenerateRecoveryKeyResponse> build() async {
    return _service.generateRecoveryKey();
  }
}

@riverpod
class CheckRecoveryKeyDialogModel extends _$CheckRecoveryKeyDialogModel {
  late final _service = getService<DiskEncryptionService>();
  final validKey = false;

  @override
  CheckRecoveryKeyDialogState build() => CheckRecoveryKeyDialogState.empty();

  Future<void> checkRecoveryKey() async {
    // Ensure the state is in input mode before checking the key.
    assert(state is CheckRecoveryKeyDialogStateInput);
    final keyToCheck = (state as CheckRecoveryKeyDialogStateInput).keyToCheck;

    // Validate the key is not empty.
    if (keyToCheck.isEmpty) {
      state = CheckRecoveryKeyDialogState.error(
        Exception('Recovery key cannot be empty'),
      );
      return;
    }

    // Set the state to loading while checking the key.
    state = CheckRecoveryKeyDialogState.loading();
    try {
      await _service.checkRecoveryKey(keyToCheck);
      state = CheckRecoveryKeyDialogState.result(true);
    } on SnapdException catch (e) {
      if (e.kind == 'auth-cancelled') {
        state = CheckRecoveryKeyDialogState.input(keyToCheck);
      } else {
        state = CheckRecoveryKeyDialogState.result(false);
      }
    } on Exception catch (e) {
      state = CheckRecoveryKeyDialogState.error(e);
    }
  }

  void setKeyToCheck(String key) {
    if (key.isEmpty) {
      state = CheckRecoveryKeyDialogState.empty();
    } else {
      state = CheckRecoveryKeyDialogState.input(key);
    }
  }
}

@riverpod
class ChangeAuthModeDialogModel extends _$ChangeAuthModeDialogModel {
  late final _service = getService<DiskEncryptionService>();
  Timer? _newPassTimer;
  Timer? _confirmTimer;
  static const debounceDuration = Duration(milliseconds: 500);

  @override
  ChangeAuthModeDialogModelData build(AuthMode newAuthMode) {
    assert(
      newAuthMode != AuthMode.none,
      'ChangeAuthModeDialogModel does not handle removal (AuthMode.none)',
    );
    ref.keepAlive();
    ref.onDispose(() {
      _newPassTimer?.cancel();
      _confirmTimer?.cancel();
    });
    return ChangeAuthModeDialogModelData(
      dialogState: ChangeAuthModeDialogState.input(),
      newAuthMode: newAuthMode,
    );
  }

  Future<void> replaceAuthMode({
    void Function()? onAuthorized,
  }) async {
    assert(state.dialogState is ChangeAuthModeDialogStateInput);
    try {
      state = state.copyWith(dialogState: ChangeAuthModeDialogState.loading());
      await ref.read(tpmAuthenticationModelProvider.notifier).changeAuthMode(
            state.newAuthMode,
            passphrase: state.newPass,
            onAuthorized: onAuthorized,
          );
      final tpmState = ref.read(tpmAuthenticationModelProvider).valueOrNull;
      switch (tpmState?.operationError) {
        case null:
          state = state.copyWith(
            dialogState: ChangeAuthModeDialogState.success(),
            showPassphrase: false,
          );
          break;

        case TpmFdeOperationSnapdAuthException(
            kind: SnapdAuthErrorKind.authCancelled
          ):
          state =
              state.copyWith(dialogState: ChangeAuthModeDialogState.input());
          ref
              .read(tpmAuthenticationModelProvider.notifier)
              .dismissOperationError();
          break;

        case final exception:
          state = state.copyWith(
            dialogState: ChangeAuthModeDialogState.error(
              exception,
              false,
            ),
          );
          break;
      }
    } on Exception catch (e) {
      state = state.copyWith(
        dialogState: ChangeAuthModeDialogState.error(e, false),
      );
    }
  }

  void toggleShowPassphrase() {
    if (state.dialogState is! ChangeAuthModeDialogStateInput) return;
    state = state.copyWith(showPassphrase: !state.showPassphrase);
  }

  Future<void> setConfirmPass(
    String value, {
    bool debounce = false,
  }) async {
    if (state.dialogState is! ChangeAuthModeDialogStateInput) return;
    _confirmTimer?.cancel();
    _confirmTimer =
        Timer(debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
            () async {
      state = state.copyWith(
        confirmPass: value,
        dialogState: ChangeAuthModeDialogStateInput(),
      );
    });
  }

  Future<void> setNewPass(
    String value, {
    bool debounce = false,
  }) async {
    if (state.dialogState is! ChangeAuthModeDialogStateInput) return;
    _newPassTimer?.cancel();
    _newPassTimer =
        Timer(debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
            () async {
      state = state.copyWith(
        newPass: value,
        dialogState: ChangeAuthModeDialogStateInput(),
      );
      if (value.isEmpty) {
        _log.debug('new passphrase is empty');
        state = state.copyWith(entropy: null);
        return;
      }
      try {
        final response = await _service.pinPassphraseEntropyCheck(
          state.newAuthMode,
          value,
        );
        state = state.copyWith(
          entropy: response,
        );
      } on Exception catch (e) {
        state = state.copyWith(
          entropy: null,
          dialogState: ChangeAuthModeDialogStateError(e, true),
        );
        _log.error(e);
      }
    });
  }

  bool get isValid {
    if (state.newPass.isEmpty || state.confirmPass.isEmpty) {
      return false;
    }

    if (state.newPass != state.confirmPass) {
      return false;
    }

    if (state.entropy == null || !state.entropy!.success) {
      return false;
    }

    return true;
  }

  bool get passphraseConfirmed {
    if (state.confirmPass.isNotEmpty && state.newPass != state.confirmPass) {
      return false;
    }
    return true;
  }
}

@freezed
class RepairDialogModelData with _$RepairDialogModelData {
  factory RepairDialogModelData({
    required RepairDialogState dialogState,
    RecoveryKeyException? error,
  }) = _RepairDialogModelData;
}

@riverpod
class RepairDialogModel extends _$RepairDialogModel {
  late final _service = getService<DiskEncryptionService>();
  late final FileSystem _fs = ref.read(fileSystemProvider);

  // Changes on close and retry, so an older flow stops calling snapd
  var _flow = 0;
  ({AuthMode mode, String passphrase})? _newAuth;

  @override
  RepairDialogModelData build() {
    ref.onDispose(() => _flow++);
    _newAuth = null;
    unawaited(_check());
    return RepairDialogModelData(dialogState: RepairDialogState.checking());
  }

  Future<void> _check() async {
    final flow = _flow;
    try {
      await _checkRepairAvailable();
      if (flow != _flow) return;
      final check = await _request(_service.getSystems());
      if (flow != _flow) return;
      await _continueAfterCheck(check);
    } on Exception catch (e) {
      if (flow != _flow) return;
      state = state.copyWith(
        dialogState: _isAuthCancelled(e)
            ? RepairDialogState.authCancelled()
            : RepairDialogState.error(e),
      );
    }
  }

  Future<void> _checkRepairAvailable() async {
    final storage = await _request(_service.getStorageEncrypted());
    if (!storage.needsRepair) throw RepairNotAvailableException();
  }

  Future<void> _continueAfterCheck(SnapdSystemsResponse check) async {
    final encryption = check.storageEncryption;
    // Show one issue at a time, top priority first. snapd may also send only
    // a reason
    final issue = encryption.availabilityCheckErrors.firstOrNull ??
        (encryption.support == SnapdStorageEncryptionSupport.available
            ? null
            : SnapdAvailabilityCheckError(
                kind: SnapdAvailabilityCheckErrorKind.internalError,
                message: encryption.unavailableReason ?? '',
              ));
    if (issue != null) {
      // Contacting the OEM or OS vendor isn't a fix the user can make here
      final canFix = issue.actions.any(
        (action) =>
            action != SnapdFixAction.contactOem &&
            action != SnapdFixAction.contactOsVendor,
      );
      state = state.copyWith(
        dialogState: canFix
            ? RepairDialogState.issue(issue)
            : RepairDialogState.unavailable(issue),
      );
      return;
    }

    // volumes-auth means the new keys need a PIN or passphrase
    if (encryption.requirements
        .contains(SnapdStorageEncryptionRequirement.volumesAuth)) {
      state =
          state.copyWith(dialogState: RepairDialogState.setPinOrPassphrase());
      return;
    }
    final authMode =
        ref.read(tpmAuthenticationModelProvider).value!.currentAuthMode;
    if (authMode != AuthMode.none) {
      state = state.copyWith(
        dialogState: RepairDialogState.pinOrPassphraseWillBeRemoved(),
      );
      return;
    }
    // Nothing to go back to, so a cancelled prompt closes the dialog
    await _generateKey(cancelledState: RepairDialogState.authCancelled());
  }

  Future<void> applyFix(SnapdFixAction action) async {
    assert(state.dialogState is RepairDialogStateIssue);
    final current = state.dialogState as RepairDialogStateIssue;
    assert(
      current.issue.actions.contains(action) && !action.isExternal,
      'Only a fix that snapd runs for the current issue can be applied',
    );
    final flow = _flow;

    state = state.copyWith(dialogState: RepairDialogState.applyingFix(action));
    try {
      // Without error-kinds, proceed also accepts issues the user hasn't seen
      final args = action == SnapdFixAction.proceed
          ? {
              'error-kinds': [current.issue.kind.name.toKebabCase()],
            }
          : null;
      final check =
          await _request(_service.fixEncryptionSupport(action, args: args));
      if (flow != _flow) return;
      await _continueAfterCheck(check);
    } on Exception catch (e) {
      if (flow != _flow) return;
      // The fix didn't run, so the issue is still there
      state = state.copyWith(
        dialogState: _isAuthCancelled(e) ? current : RepairDialogState.error(e),
      );
    }
  }

  Future<void> continueToKey() async {
    assert(state.dialogState is RepairDialogStatePinOrPassphraseWillBeRemoved);
    await _generateKey(cancelledState: state.dialogState);
  }

  Future<void> continueWithPinOrPassphrase(AuthMode authMode) async {
    assert(state.dialogState is RepairDialogStateSetPinOrPassphrase);
    assert(
      ref.read(changeAuthModeDialogModelProvider(authMode).notifier).isValid,
      'The PIN or passphrase must be valid',
    );
    _newAuth = (
      mode: authMode,
      passphrase: ref.read(changeAuthModeDialogModelProvider(authMode)).newPass,
    );
    await _generateKey(cancelledState: state.dialogState);
  }

  Future<void> _generateKey({required RepairDialogState cancelledState}) async {
    final flow = _flow;
    state = state.copyWith(dialogState: RepairDialogState.generatingKey());
    try {
      final key = await _service.generateReprovisionRecoveryKey();
      if (flow != _flow) return;
      state =
          state.copyWith(dialogState: RepairDialogState.saveKey(key, false));
    } on Exception catch (e) {
      if (flow != _flow) return;
      state = state.copyWith(
        dialogState:
            _isAuthCancelled(e) ? cancelledState : RepairDialogState.error(e),
      );
    }
  }

  void acknowledge(bool acknowledged) {
    assert(state.dialogState is RepairDialogStateSaveKey);
    state = state.copyWith(
      dialogState: (state.dialogState as RepairDialogStateSaveKey)
          .copyWith(acknowledged: acknowledged),
    );
  }

  Future<void> writeRecoveryKey(Uri uri, String recoveryKey) async {
    await _fs.file(uri.path).writeAsString(recoveryKey);
  }

  void setError(RecoveryKeyException? error) {
    state = state.copyWith(error: error);
  }

  Future<void> startRepair({void Function()? onAuthorized}) async {
    assert(state.dialogState is RepairDialogStateSaveKey);
    final saveKey = state.dialogState as RepairDialogStateSaveKey;
    assert(saveKey.acknowledged);
    final flow = _flow;

    state = state.copyWith(dialogState: RepairDialogState.startingRepair());
    try {
      // The status can change while the user saves the key
      await _checkRepairAvailable();
    } on Exception catch (e) {
      if (flow != _flow) return;
      state = state.copyWith(dialogState: RepairDialogState.error(e));
      return;
    }
    if (flow != _flow) return;

    // The page model runs the repair, so its progress shows after the dialog
    // closes
    final page = ref.read(tpmAuthenticationModelProvider.notifier);
    await page.repair(
      newMode: _newAuth?.mode,
      passphrase: _newAuth?.passphrase,
      onAuthorized: onAuthorized,
    );
    if (flow != _flow) return;

    final tpmState = ref.read(tpmAuthenticationModelProvider).valueOrNull;
    switch (tpmState?.operationError) {
      case null:
        break;
      case TpmFdeOperationSnapdAuthException(
          kind: SnapdAuthErrorKind.authCancelled,
          operation: TpmFdeOperation.repair,
        ):
        page.dismissOperationError();
        // The repair didn't start, so the user can try again with the same key
        state = state.copyWith(dialogState: saveKey);
      case final exception:
        state = state.copyWith(dialogState: RepairDialogState.error(exception));
    }
  }

  // snapd may have lost the check or used up the key, so start over
  void retry() {
    assert(state.dialogState is RepairDialogStateError);
    ref.invalidateSelf();
  }
}

bool _isAuthCancelled(Exception e) =>
    e is SnapdException && e.kind == 'auth-cancelled';

// snapd.dart throws ArgumentError for values it doesn't know, like those from
// a newer snapd
Future<T> _request<T>(Future<T> request) async {
  try {
    return await request;
  } on ArgumentError catch (e) {
    _log.error('Failed to parse the snapd response: $e');
    throw TpmStateExceptionFailed();
  }
}
