import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/disk_encryption_service.dart';

extension RecoveryKeyExceptionL10n on RecoveryKeyException {
  String localizedTitle(AppLocalizations l10n) => switch (this) {
        RecoveryKeyExceptionDisallowedPath() =>
          l10n.recoveryKeyExceptionDisallowedPathTitle,
        RecoveryKeyExceptionFileSystem() =>
          l10n.recoveryKeyExceptionFileSystemTitle,
        RecoveryKeyExceptionFilePermission() =>
          l10n.recoveryKeyExceptionFilePermissionTitle,
        RecoveryKeyExceptionUnknown() => l10n.recoveryKeyExceptionUnknownTitle,
      };
  String localizedBody(AppLocalizations l10n) => switch (this) {
        RecoveryKeyExceptionDisallowedPath() =>
          l10n.recoveryKeyExceptionDisallowedPathBody,
        RecoveryKeyExceptionFileSystem() =>
          l10n.recoveryKeyExceptionFileSystemBody,
        RecoveryKeyExceptionFilePermission() =>
          l10n.recoveryKeyExceptionFilePermissionBody,
        RecoveryKeyExceptionUnknown() =>
          (this as RecoveryKeyExceptionUnknown).rawError,
      };
}

extension SnapdStateExceptionL10n on SnapdStateException {
  String localizedHeader(AppLocalizations l10n) => switch (this) {
        SnapdStateExceptionUnsupportedSnapdVersion() =>
          l10n.diskEncryptionPageErrorUnsupportedSnapdHeader,
        SnapdStateExceptionUnconnectedSnapInterface() =>
          l10n.diskEncryptionPageErrorUnconnectedSnapInterfaceHeader,
      };
  String localizedBody(AppLocalizations l10n) => switch (this) {
        SnapdStateExceptionUnsupportedSnapdVersion() =>
          l10n.diskEncryptionPageErrorUnsupportedSnapdBody,
        SnapdStateExceptionUnconnectedSnapInterface() =>
          l10n.diskEncryptionPageErrorUnconnectedSnapInterfaceBody,
      };
}

extension TpmStateExceptionL10n on TpmStateException {
  String localizedHeader(AppLocalizations l10n) => switch (this) {
        TpmStateExceptionFailed() =>
          l10n.diskEncryptionPageErrorFailedToRetrieveStatusHeader,
        TpmStateExceptionUnsupportedState() =>
          l10n.diskEncryptionPageErrorFailedToRetrieveStatusHeader,
      };
  String localizedBody(AppLocalizations l10n) => switch (this) {
        TpmStateExceptionFailed() =>
          l10n.diskEncryptionPageErrorFailedToRetrieveStatusBody,
        TpmStateExceptionUnsupportedState() =>
          l10n.diskEncryptionPageErrorUnsupportedStateBody,
      };
}

final _unreachable = Exception('unreachable l10n string');

extension AuthModeL10n on AuthMode {
  String localizedHeader(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseDialogHeader,
        AuthMode.pin => l10n.recoveryKeyPinDialogHeader,
        AuthMode.none => throw _unreachable,
      };

  String localizedCurrentHint(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseCurrent,
        AuthMode.pin => l10n.recoveryKeyPinCurrent,
        AuthMode.none => throw _unreachable,
      };

  String localizedNewHint(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseNew,
        AuthMode.pin => l10n.recoveryKeyPinNew,
        AuthMode.none => throw _unreachable,
      };

  String localizedConfirmHint(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseConfirm,
        AuthMode.pin => l10n.recoveryKeyPinConfirm,
        AuthMode.none => throw _unreachable,
      };

  String localizedCurrentError(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseCurrentError,
        AuthMode.pin => l10n.recoveryKeyPinCurrentError,
        AuthMode.none => throw _unreachable,
      };

  String localizedConfirmError(AppLocalizations l10n) => switch (this) {
        AuthMode.passphrase => l10n.recoveryKeyPassphraseConfirmError,
        AuthMode.pin => l10n.recoveryKeyPinConfirmError,
        AuthMode.none => throw _unreachable,
      };
}

extension SemanticEntropyL10n on SemanticEntropy {
  String localizedHint(AppLocalizations l10n, AuthMode authMode) =>
      switch (this) {
        SemanticEntropy.belowMin => switch (authMode) {
            AuthMode.pin => l10n.recoveryKeyPinEntropyBelowMin,
            AuthMode.passphrase => l10n.recoveryKeyPassphraseEntropyBelowMin,
            AuthMode.none => throw _unreachable,
          },
        SemanticEntropy.belowOptimal => switch (authMode) {
            AuthMode.pin => l10n.recoveryKeyPinEntropyBelowOptimal,
            AuthMode.passphrase =>
              l10n.recoveryKeyPassphraseEntropyBelowOptimal,
            AuthMode.none => throw _unreachable,
          },
        SemanticEntropy.optimal => switch (authMode) {
            AuthMode.pin => l10n.recoveryKeyPinEntropyOptimal,
            AuthMode.passphrase => l10n.recoveryKeyPassphraseEntropyOptimal,
            AuthMode.none => throw _unreachable,
          },
      };
}
