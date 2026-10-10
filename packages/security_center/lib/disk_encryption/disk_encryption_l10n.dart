import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:snapd/snapd.dart';

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
  String? localizedCommand(AppLocalizations l10n) => switch (this) {
        SnapdStateExceptionUnsupportedSnapdVersion() => null,
        SnapdStateExceptionUnconnectedSnapInterface() =>
          l10n.diskEncryptionPageErrorUnconnectedSnapInterfaceCommand,
      };
}

extension TpmFdeOperationExceptionMessage on TpmFdeOperationException {
  String causeByMessage() => switch (this) {
        TpmFdeOperationSnapdAuthException(:final cause) => cause.message,
        TpmFdeOperationSnapdException(:final cause) => cause.message,
        TpmFdeOperationUnknownException(:final cause) => cause.toString(),
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

extension SnapdAvailabilityCheckErrorKindL10n
    on SnapdAvailabilityCheckErrorKind {
  String localizedDescription(AppLocalizations l10n) => switch (this) {
        SnapdAvailabilityCheckErrorKind.internalError =>
          l10n.tpmActionErrorKindInternal,
        SnapdAvailabilityCheckErrorKind.shutdownRequired =>
          l10n.tpmActionErrorKindShutdownRequired,
        SnapdAvailabilityCheckErrorKind.rebootRequired =>
          l10n.tpmActionErrorKindRebootRequired,
        SnapdAvailabilityCheckErrorKind.unexpectedAction =>
          l10n.tpmActionErrorKindUnexpectedAction,
        SnapdAvailabilityCheckErrorKind.missingArgument =>
          l10n.tpmActionErrorKindMissingArgument,
        SnapdAvailabilityCheckErrorKind.invalidArgument =>
          l10n.tpmActionErrorKindInvalidArgument,
        SnapdAvailabilityCheckErrorKind.actionFailed =>
          l10n.tpmActionErrorKindActionFailed,
        SnapdAvailabilityCheckErrorKind.runningInVm =>
          l10n.tpmActionErrorKindRunningInVm,
        SnapdAvailabilityCheckErrorKind.systemNotEfi =>
          l10n.tpmActionErrorKindSystemNotEfi,
        SnapdAvailabilityCheckErrorKind.efiVariableAccess =>
          l10n.tpmActionErrorKindEfiVariableAccess,
        SnapdAvailabilityCheckErrorKind.noSuitableTpm2Device =>
          l10n.tpmActionErrorKindNoSuitableTpm2Device,
        SnapdAvailabilityCheckErrorKind.tpmDeviceFailure =>
          l10n.tpmActionErrorKindGenericTpm,
        SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled =>
          l10n.tpmActionErrorKindTpmDeviceDisabled,
        SnapdAvailabilityCheckErrorKind.tpmHierarchiesOwned =>
          l10n.tpmActionErrorKindTpmHierarchiesOwned,
        SnapdAvailabilityCheckErrorKind.tpmDeviceLockoutLockedOut =>
          l10n.tpmActionErrorKindTpmDeviceLockoutLockedOut,
        SnapdAvailabilityCheckErrorKind.insufficientTpmStorage =>
          l10n.tpmActionErrorKindInsufficientTpmStorage,
        SnapdAvailabilityCheckErrorKind.noSuitablePcrBank =>
          l10n.tpmActionErrorKindGenericFirmware,
        SnapdAvailabilityCheckErrorKind.measuredBoot =>
          l10n.tpmActionErrorKindGenericTpm,
        SnapdAvailabilityCheckErrorKind.tpmCommandFailed =>
          l10n.tpmActionErrorKindGenericTpm,
        SnapdAvailabilityCheckErrorKind.invalidTpmResponse =>
          l10n.tpmActionErrorKindGenericTpm,
        SnapdAvailabilityCheckErrorKind.tpmCommunication =>
          l10n.tpmActionErrorKindGenericTpm,
        SnapdAvailabilityCheckErrorKind.unsupportedPlatform =>
          l10n.tpmActionErrorKindUnsupportedPlatform,
        SnapdAvailabilityCheckErrorKind.insufficientDmaProtection =>
          l10n.tpmActionErrorKindInsufficientDmaProtection,
        SnapdAvailabilityCheckErrorKind.noKernelIommu =>
          l10n.tpmActionErrorKindNoKernelIommu,
        SnapdAvailabilityCheckErrorKind.hostSecurity =>
          l10n.tpmActionErrorKindHostSecurity,
        SnapdAvailabilityCheckErrorKind.tpmPcrUnusable =>
          l10n.tpmActionErrorKindGenericFirmware,
        SnapdAvailabilityCheckErrorKind.addonDriversPresent =>
          l10n.tpmActionErrorKindAddonDriversPresent,
        SnapdAvailabilityCheckErrorKind.sysPrepApplicationsPresent =>
          l10n.tpmActionErrorKindSysPrepApplicationsPresent,
        SnapdAvailabilityCheckErrorKind.absolutePresent =>
          l10n.tpmActionErrorKindAbsolutePresent,
        SnapdAvailabilityCheckErrorKind.invalidSecureBootMode =>
          l10n.tpmActionErrorKindInvalidSecureBootMode,
        SnapdAvailabilityCheckErrorKind.weakSecureBootAlgorithmsDetected =>
          l10n.tpmActionErrorKindWeakSecureBootAlgorithmDetected,
        SnapdAvailabilityCheckErrorKind.preOsSecureBootAuthByEnrolledDigests =>
          l10n.tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests,
        SnapdAvailabilityCheckErrorKind.noHardwareRootOfTrust =>
          l10n.tpmActionErrorKindNoHardwareRootOfTrust,
      };
}

extension SnapdFixActionL10n on SnapdFixAction {
  String localizedTitle(
    AppLocalizations l10n,
    SnapdAvailabilityCheckErrorKind kind,
  ) =>
      switch (this) {
        SnapdFixAction.reboot => l10n.tpmActionFixActionReboot,
        SnapdFixAction.shutdown => l10n.tpmActionFixActionShutdown,
        SnapdFixAction.rebootToFwSettings => switch (kind) {
            SnapdAvailabilityCheckErrorKind.insufficientDmaProtection => l10n
                .tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection,
            SnapdAvailabilityCheckErrorKind.insufficientTpmStorage =>
              l10n.tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage,
            SnapdAvailabilityCheckErrorKind.invalidSecureBootMode =>
              l10n.tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode,
            SnapdAvailabilityCheckErrorKind.noKernelIommu =>
              l10n.tpmActionFixActionRebootToFwSettingsNoKernelIommu,
            SnapdAvailabilityCheckErrorKind.noSuitablePcrBank =>
              l10n.tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank,
            SnapdAvailabilityCheckErrorKind.tpmDeviceDisabled =>
              l10n.tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled,
            SnapdAvailabilityCheckErrorKind.tpmDeviceLockoutLockedOut => l10n
                .tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut,
            SnapdAvailabilityCheckErrorKind.tpmHierarchiesOwned =>
              l10n.tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned,
            SnapdAvailabilityCheckErrorKind.absolutePresent =>
              l10n.tpmActionFixActionRebootToFwSettingsAbsolutePresent,
            _ => l10n.tpmActionFixActionRebootToFwSettings,
          },
        SnapdFixAction.contactOem => l10n.tpmActionFixActionContactOem,
        SnapdFixAction.contactOsVendor =>
          l10n.tpmActionFixActionContactOsVendor,
        SnapdFixAction.enableTpmViaFirmware =>
          l10n.tpmActionFixActionEnableTpmViaFirmware,
        SnapdFixAction.enableAndClearTpmViaFirmware =>
          l10n.tpmActionFixActionEnableAndClearTpmViaFirmware,
        SnapdFixAction.clearTpmViaFirmware =>
          l10n.tpmActionFixActionClearTpmViaFirmware,
        SnapdFixAction.clearTpmSimple => l10n.tpmActionFixActionClearTpm,
        SnapdFixAction.clearTpm => l10n.tpmActionFixActionClearTpm,
        SnapdFixAction.proceed => l10n.tpmActionFixActionProceed,
      };

  String? localizedDescription(
    AppLocalizations l10n,
    SnapdAvailabilityCheckErrorKind kind,
  ) =>
      switch (this) {
        SnapdFixAction.reboot =>
          kind == SnapdAvailabilityCheckErrorKind.tpmDeviceFailure
              ? l10n.tpmActionFixActionRebootTpmDeviceFailureDescription
              : l10n.tpmActionFixActionRebootDescription,
        SnapdFixAction.shutdown => l10n.tpmActionFixActionShutdownDescription,
        SnapdFixAction.rebootToFwSettings => switch (kind) {
            SnapdAvailabilityCheckErrorKind.noSuitablePcrBank ||
            SnapdAvailabilityCheckErrorKind.noKernelIommu =>
              l10n.tpmActionFixActionRebootToFwSettingsWithDocsDescription,
            _ => l10n.tpmActionFixActionRebootToFwSettingsDescription,
          },
        SnapdFixAction.proceed => l10n.tpmActionFixActionProceedDescription,
        _ => null,
      };

  String? localizedFirmwareHint(
    AppLocalizations l10n,
    SnapdAvailabilityCheckErrorKind kind,
  ) =>
      switch (this) {
        SnapdFixAction.rebootToFwSettings => switch (kind) {
            SnapdAvailabilityCheckErrorKind.invalidSecureBootMode => l10n
                .tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint,
            SnapdAvailabilityCheckErrorKind.noKernelIommu =>
              l10n.tpmActionFixActionRebootToFwSettingsNoKernelIommuHint,
            _ => null,
          },
        _ => null,
      };

  String? localizedCaveat(AppLocalizations l10n) => switch (this) {
        SnapdFixAction.reboot ||
        SnapdFixAction.shutdown ||
        SnapdFixAction.rebootToFwSettings =>
          l10n.tpmActionFixActionCaveatRetry,
        SnapdFixAction.enableTpmViaFirmware ||
        SnapdFixAction.enableAndClearTpmViaFirmware ||
        SnapdFixAction.clearTpmViaFirmware =>
          l10n.tpmActionFixActionCaveatConfirm,
        _ => null,
      };
}
