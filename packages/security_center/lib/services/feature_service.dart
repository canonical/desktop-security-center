import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/foundation.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('feature_service');

/// Service for determining what features are available based on system state
/// and cli flags
class FeatureService {
  FeatureService({
    required this.isDryRun,
    @visibleForTesting FileSystem? fs,
    @visibleForTesting
    ProcessResult Function(
      String executable,
      List<String> arguments,
    )? runProcess,
  })  : _fs = fs ?? LocalFileSystem(),
        _runProcess = runProcess ?? Process.runSync;

  final FileSystem _fs;
  final ProcessResult Function(
    String executable,
    List<String> arguments,
  ) _runProcess;
  final bool isDryRun;
  bool? _isUsingFde;

  bool get isDiskEncryptionAvailable {
    if (isDryRun) {
      return true;
    }
    _isUsingFde ??= _hasStorageEncryptedManaged() || _hasUbuntuDataEnc();
    return _isUsingFde!;
  }

  bool _hasStorageEncryptedManaged() {
    final result = _runProcess('snapctl', ['system-mode']);
    if (result.exitCode != 0) {
      _log.error('Error running snapctl: ${result.stderr}');
      return false;
    }
    return (result.stdout as String).contains('storage-encrypted: managed');
  }

  /// Checks if the system is using FDE by detecting the existence of
  /// /dev/disk/by-label/ubuntu-data-enc
  bool _hasUbuntuDataEnc() {
    try {
      final file = _fs.file('/dev/disk/by-label/ubuntu-data-enc');
      return file.existsSync();
    } on Exception catch (e) {
      _log.error(
        'Error encountered when checking existance of /dev/disk/by-level/ubuntu-data-enc: $e',
      );
      return false;
    }
  }
}
