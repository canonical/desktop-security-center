import 'dart:async';
import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/widgets/file_picker_dialog.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:xdg_desktop_portal/xdg_desktop_portal.dart';

part 'disk_encryption_providers.freezed.dart';
part 'disk_encryption_providers.g.dart';

final _log = Logger('disk_encryption_providers');

enum SemanticEntropy { belowMin, belowOptimal, optimal }

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

@freezed
sealed class RecoveryKeyException
    with _$RecoveryKeyException
    implements Exception {
  factory RecoveryKeyException.disallowedPath() =
      RecoveryKeyExceptionDisallowedPath;
  factory RecoveryKeyException.fileSystem() = RecoveryKeyExceptionFileSystem;
  factory RecoveryKeyException.unknown({required String rawError}) =
      RecoveryKeyExceptionUnknown;

  factory RecoveryKeyException.from(Object? e) => switch (e) {
        final FileSystemException _ => RecoveryKeyException.fileSystem(),
        final RecoveryKeyException e => e,
        final e => RecoveryKeyException.unknown(rawError: e.toString()),
      };
}

/// Dialog state for managing the change auth flow.
@freezed
sealed class ChangeAuthDialogState with _$ChangeAuthDialogState {
  factory ChangeAuthDialogState.input() = ChangeAuthDialogStateInput;
  factory ChangeAuthDialogState.loading() = ChangeAuthDialogStateLoading;
  factory ChangeAuthDialogState.success() = ChangeAuthDialogStateSuccess;
  factory ChangeAuthDialogState.error(Exception e, bool fatal) =
      ChangeAuthDialogStateError;
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

@riverpod
class ChangeAuthDialogModel extends _$ChangeAuthDialogModel {
  late final _service = getService<DiskEncryptionService>();
  Timer? _newPassTimer;
  Timer? _confirmTimer;
  static const debounceDuration = Duration(milliseconds: 500);

  @override
  ChangeAuthDialogModelData build() {
    ref.onDispose(() {
      _newPassTimer?.cancel();
      _confirmTimer?.cancel();
    });
    return ChangeAuthDialogModelData(
      dialogState: ChangeAuthDialogState.input(),
      authMode: AuthMode.passphrase,
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
    } on Exception catch (e) {
      state =
          state.copyWith(dialogState: ChangeAuthDialogState.error(e, false));
    }
  }

  void toggleShowPassphrase() {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    state = state.copyWith(showPassphrase: !state.showPassphrase);
  }

  set authMode(AuthMode authmode) {
    state = state.copyWith(
      authMode: authmode,
      dialogState: ChangeAuthDialogStateInput(),
    );
  }

  Future<void> setConfirmPass(String value, {bool debounce = false}) async {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    _confirmTimer?.cancel();
    _confirmTimer = Timer(
      debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
      () async {
        state = state.copyWith(
          confirmPass: value,
          dialogState: ChangeAuthDialogStateInput(),
        );
      },
    );
  }

  Future<void> setNewPass(String value, {bool debounce = false}) async {
    if (state.dialogState is! ChangeAuthDialogStateInput) return;
    _newPassTimer?.cancel();
    _newPassTimer = Timer(
      debounce && value.isNotEmpty ? debounceDuration : Duration.zero,
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
            entropy: EntropyResponse.fromSnapdEntropyResponse(response),
          );
        } on Exception catch (e) {
          state = state.copyWith(
            entropy: null,
            dialogState: ChangeAuthDialogState.error(e, true),
          );
          _log.error(e);
        }
      },
    );
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

@riverpod
class TpmAuthenticationModel extends _$TpmAuthenticationModel {
  late final _service = getService<DiskEncryptionService>();

  @override
  Future<AuthMode> build() async {
    // Temporary work around while we wait for snapd to implement enumerateKeySlots()
    try {
      final volumesResponse = await _service.enumerateKeySlots();
      _log.debug(volumesResponse);

      final systemDataVolume = volumesResponse.byContainerRole['system-data'];
      if (systemDataVolume == null) {
        _log.error('No system-data volume found');
        return AuthMode.passphrase;
      }

      final recoveryKeySlot = systemDataVolume.keyslots['default-recovery'];

      if (recoveryKeySlot == null) {
        throw Exception('No default-recovery keyslot found');
      }

      final authMode = recoveryKeySlot.authMode;
      if (authMode != null) {
        switch (authMode) {
          case SnapdSystemVolumeAuthMode.none:
            return AuthMode.none;
          case SnapdSystemVolumeAuthMode.pin:
            return AuthMode.pin;
          case SnapdSystemVolumeAuthMode.passphrase:
            return AuthMode.passphrase;
        }
      }
      return AuthMode.passphrase;
    } on Exception catch (e) {
      _log.error('Failed to determine TPM authentication mode: $e');
      return AuthMode.passphrase;
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
    String executable, List<String> arguments);
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
  late final ProcessRunner _run = ref.read(processRunnerProvider);

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
          state = state.copyWith(
            dialogState: ReplaceRecoveryKeyDialogState.error(
              Exception(next.error.toString()),
            ),
          );
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
      );
    } on Exception catch (e) {
      state = state.copyWith(
        dialogState: ReplaceRecoveryKeyDialogState.error(e),
      );
    }
  }

  void acknowledge() {
    assert(state.dialogState is ReplaceRecoveryKeyDialogStateInput);
    state = state.copyWith(
      dialogState: ReplaceRecoveryKeyDialogStateInput(true),
    );
  }

  Future<String?> _findFileSystem(Uri uri) async {
    final result = await _run('findmnt', [
      '-no',
      'SOURCE',
      '-T',
      p.dirname(uri.path),
    ]);

    if (result.exitCode != 0) {
      return null;
    }
    return (result.stdout as String?)?.trim();
  }

  Future<void> writeRecoveryKey(Uri uri, String recoveryKey) async {
    assert(
      state.dialogState is ReplaceRecoveryKeyDialogStateInput ||
          state.dialogState is ReplaceRecoveryKeyDialogStateSuccess,
    );
    if (uri.pathSegments.first == 'target' ||
        ['/cow', 'tmpfs'].contains(await _findFileSystem(uri))) {
      setError(RecoveryKeyException.disallowedPath());
      return;
    }
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
      final result = await _service.checkRecoveryKey(keyToCheck);
      state = CheckRecoveryKeyDialogState.result(result);
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
