import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/disk_encryption_service.dart';

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
    RecoveryKeyExceptionFileSystem() => l10n.recoveryKeyExceptionFileSystemBody,
    RecoveryKeyExceptionUnknown() =>
      (this as RecoveryKeyExceptionUnknown).rawError,
  };
}

final _unreachable = Exception('unreachable l10n string');

extension AuthModeL10n on AuthMode {
  String localizedHeader(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseDialogHeader,
    AuthMode.pin => l10n.recoveryKeyPINDialogHeader,
    AuthMode.none => throw _unreachable,
  };

  String localizedCurrentHint(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseCurrent,
    AuthMode.pin => l10n.recoveryKeyPINCurrent,
    AuthMode.none => throw _unreachable,
  };

  String localizedNewHint(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseNew,
    AuthMode.pin => l10n.recoveryKeyPINNew,
    AuthMode.none => throw _unreachable,
  };

  String localizedConfirmHint(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseConfirm,
    AuthMode.pin => l10n.recoveryKeyPassphraseConfirm,
    AuthMode.none => throw _unreachable,
  };

  String localizedCurrentError(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseCurrentError,
    AuthMode.pin => l10n.recoveryKeyPINCurrentError,
    AuthMode.none => throw _unreachable,
  };

  String localizedNewError(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseNewError,
    AuthMode.pin => l10n.recoveryKeyPINNewError,
    AuthMode.none => throw _unreachable,
  };

  String localizedConfirmError(AppLocalizations l10n) => switch (this) {
    AuthMode.passphrase => l10n.recoveryKeyPassphraseConfirmError,
    AuthMode.pin => l10n.recoveryKeyPINConfirmError,
    AuthMode.none => throw _unreachable,
  };
}
