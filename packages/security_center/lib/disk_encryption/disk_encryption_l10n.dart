import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';

extension RecoveryKeyExceptionL10n on RecoveryKeyException {
  String localizedTitle(AppLocalizations l10n) => switch (this) {
        RecoveryKeyExceptionDisallowedPath() =>
          l10n.recoveryKeyExceptionDisallowedPathTitle,
        RecoveryKeyExceptionFileSystem() =>
          l10n.recoveryKeyExceptionFileSystemTitle,
        RecoveryKeyExceptionUnknown() => l10n.recoveryKeyExceptionUnknownTitle,
      };
  String localizedBody(AppLocalizations l10n) => switch (this) {
        RecoveryKeyExceptionDisallowedPath() =>
          l10n.recoveryKeyExceptionDisallowedPathBody,
        RecoveryKeyExceptionFileSystem() =>
          l10n.recoveryKeyExceptionFileSystemBody,
        RecoveryKeyExceptionUnknown() =>
          (this as RecoveryKeyExceptionUnknown).rawError,
      };
}
