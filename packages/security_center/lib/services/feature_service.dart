import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('feature_service');

/// Service for determining what features are available based on system state
/// and cli flags
class FeatureService {
  FeatureService({required this.isDryRun});

  final bool isDryRun;

  bool get isDiskEncryptionAvailable {
    if (isDryRun) {
      return true;
    }
    return _isUsingFDE();
  }

  /// Checks if the system is using FDE by detecting the existence of
  /// /dev/disk/by-label/ubuntu-data-enc
  bool _isUsingFDE() {
    return true;
    // try {
    //   final file = File('/dev/disk/by-label/ubuntu-data-enc');
    //   return file.existsSync();
    // } on Exception catch (e) {
    //   _log.error(
    //     'Error encountered when checking existance of /dev/disk/by-level/ubuntu-data-enc: $e',
    //   );
    //   return false;
    // }
  }
}
