// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Occitan (`oc`).
class AppLocalizationsOc extends AppLocalizations {
  AppLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get appTitle => 'Centre de seguretat';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Autorizar fins la desconnexion';

  @override
  String get snapdRuleCategorySessionDenied => 'Refusar fins la desconnexion';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Totjorn autorizar';

  @override
  String get permissionRulePopupMenuSemanticLabel =>
      'Actualizar las autorizacions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Totjorn refusar';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Autorizar temporàriament';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Refusar temporàriament';

  @override
  String get snapdRuleCategoryAskAlways => 'Totjorn demandar';

  @override
  String get snapPermissionReadLabel => 'Lectura';

  @override
  String get snapPermissionWriteLabel => 'Escritura';

  @override
  String get snapPermissionExecuteLabel => 'Execucion';

  @override
  String get snapPermissionAccessLabel => 'Accès';

  @override
  String get snapPermissionsEnableTitle =>
      'Exigir que las aplicacions isoladas demanden d’autorizacions';

  @override
  String get snapPermissionsEnableWarning =>
      'Es una foncionalitat experimentala per contrarotlar l’accès a las ressorsas de vòstre ordenador.';

  @override
  String get snapPermissionsEnablingLabel => 'Activacion, aquò pòt trigar...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Desactivacion, aquò pòt trigar...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Podètz gerir d’autras autorizacions dins Paramètres › Aplicacions.';

  @override
  String get snapPermissionsPageTitle => 'Autorizacions de l’aplicacion';

  @override
  String get snapPermissionsErrorTitle => 'Quicòm a fracassat';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n règlas',
      one: '1 règla',
      zero: 'cap de règlas',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gerir las autorizacions $interface per $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Cap de règlas pel moment';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Cap d’aplicacion demandèt pas encara l’accès';

  @override
  String get snapRulesRemoveAll => 'Levar totas las règlas';

  @override
  String get snapRulesResetAllPermissions =>
      'Reïnicializar totas las autorizacions';

  @override
  String get homeInterfacePageTitle => 'Repertòri personal';

  @override
  String get homeInterfacePageDescription =>
      'Gerir las autorizacions d’accès als fichièrs dins vòstre repertòri personal.';

  @override
  String get cameraInterfacePageTitle => 'Camèra';

  @override
  String get cameraInterfacePageDescription =>
      'Autorizar l’accès a las camèras.';

  @override
  String get microphoneInterfacePageTitle => 'Microfòn';

  @override
  String get microphoneInterfacePageDescription =>
      'Permetre a las aplicacions d’accedir al microfòn.';

  @override
  String get interfacePageTitle => 'Gerir las autorizacions';

  @override
  String get interfacePageLinkLearnMore => 'Ne saber mai';

  @override
  String get interfacePageLinkReportIssues => 'Senhalar de problèmas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicacions',
      one: '1 aplicacion',
      zero: 'cap d’aplicacions',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Chiframent de disc';

  @override
  String get diskEncryptionPageRecoveryKey => 'Clau de recuperacion';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La clau de recuperacion vos permet de retrobar l’accès a vòstras donadas se lo disc capita pas a se desverrolhar a l’aviada. Gardatz-la en luòc segur.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La clau de recuperacion vos permet de retrobar l’accès a vòstras donadas se lo disc capita pas a se desverrolhar a l’aviada. Gardatz-la en luòc segur. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Ne saber mai tocan lo chiframent material';

  @override
  String get diskEncryptionPageCheckKey =>
      'Verificacion de la clau de recuperacion...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Verificar la clau de recuperacion';

  @override
  String get diskEncryptionPageCheck => 'Verificar';

  @override
  String get diskEncryptionPageValidKey => 'Clau valida';

  @override
  String get diskEncryptionPageInvalidKey => 'Clau invalida';

  @override
  String get diskEncryptionPageEnterKey => 'Picatz la clau de recuperacion';

  @override
  String get diskEncryptionPageKeyWorks => 'La clau de recuperacion fonciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Remembratz-vos de la gardar en luòc segur.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'La clau de recuperacion fonciona pas';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Verificar o remplaçar una clau amb una nòva.';

  @override
  String get diskEncryptionPageError => 'Error';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Remplaçar la clau de recuperacion...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Remplaçar la clau de recuperacion';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Gardatz la nòva clau de recuperacion en luòc segur. Un còp que la remplaçatz, poiriatz pas mai l’utilizar l’anciana clau.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostrar lo còdi QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Salvar dins un fichièr';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ai salvagarda la clau de recuperacion en luòc segur';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Remplaçar';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Ignorar';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Clau de recuperacion remplaçada';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Remembratz-vos de la gardar en luòc segur.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Fracàs del remplaçament de la clau de recuperacion';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Quicòm a trucat en remplaçant la clau de recuperacion, l’anciana clau demorarà valida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Clau de recuperacion de chiframent';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Numerizatz lo còdi QR per copiar la clau de recuperacion e la salvar en luòc segur, coma dins un gestionari de senhals. Podètz prendre una fòto per utilizacion futura.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copiat al quichapapièrs';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copiar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Paramètres de chiframent non disponibles';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Fracàs de la recuperacion de l’estat de chiframent d’aqueste ordenador.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La configuracion TPM de vòstre ordenador es pas presa en carga.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'La version de snapd es pas presa en carga';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Verificatz que lo Centre de seguretat e snapd son a jorn.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Lo Centre de seguretat se pòt pas connectar a l’interfàcia snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Per resòlver aquò, executatz aquesta comanda dins lo termina :';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Apondre PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Apondre frasa secrèta...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Apondre frasa secrèta';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Apondre PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Deuretz picar lo còdi PIN cada còp que l’ordenador s’avia. Aqueste còdi PIN es diferent del senhal utilizaire.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'S\'oblidetz lo còdi PIN, podètz recuperar l’accès al disc en utilizant la clau de recuperacion.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Deuretz picar la frasa secrèta cada còp que l’ordenador s’avia. Aquesta frasa secrèta es diferenta del senhal utilizaire.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'S’oblidetz vòstra frasa secrèta, podètz recuperar l’accès al disc en utilizant la clau de recuperacion.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Seguretat suplementària';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Podètz definir una frasa secrèta o un PIN per mai de seguretat. O deuretz picar cada còp que l’ordenador amòda.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Ne saber mai';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Apondre';

  @override
  String get diskEncryptionPageRemovePinButton => 'Suprimir PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Suprimir frasa secrèta...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Apondon del PIN, aquò pòt tardar unas segondas...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Apondon de la frasa secrèta, aquò pòt tardar unas segondas...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Retirament del PIN, aquò pòt tardar unas segondas...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Retirament de la frasa secrèta, aquò pòt tardar unas segondas...';

  @override
  String get diskEncryptionPageRepairHeader => 'Disk encryption needs repair';

  @override
  String get diskEncryptionPageRepairBody =>
      'Automatic repair failed during decryption. Repair the disk now to start the computer without a recovery key.';

  @override
  String get diskEncryptionPageRepairButton => 'Start repair...';

  @override
  String get diskEncryptionPageRepairing => 'Repairing...';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Repair encryption';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Hardware-backed encryption could not be repaired';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Disk encryption no longer needs repair.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Any PIN and passphrase will be removed';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'You can add them again after repair.';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'Save the new recovery key somewhere safe. Once repairing completes, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Old recovery keys will stop working';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'You may want to let your IT administrator know you are re-encrypting the disk in case they are storing any recovery keys.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Repair';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Fichièr de clau de recuperacion non salvagardat';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Lo fichièr de clau de recuperacion se pòt pas enregistrar dins un emplaçament temporari';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Error desconeguda';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Fracàs de l’enregistrament de la clau de recuperacion dins lo fichièr';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Avètz pas l’autorizacion d’escriure dins aqueste emplaçament de fichièr.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Avètz pas l’autorizacion d’escriure dins aqueste dossièr. Ensajatz un luòc diferent o un autre metòde.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Ensajatz un emplaçament diferent, coma un lector amovible o un utilizatz un autre metòde.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Salvar lo fichièr de clau de recuperacion';

  @override
  String get recoveryKeyFilePickerFilter => 'Fichièr tèxt';

  @override
  String get recoveryKeyTPMEnabled => 'Lo chiframent material es activat';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Las claus de chiframent son gardadas dins lo modul TPM (Trusted Platform Moduleà de l’ordenador.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Ne saber mai sul chiframent material';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'La frasa secrèta de chiframent es activada';

  @override
  String get recoveryKeyPassphraseHeader => 'Cambiar la frasa secrèta';

  @override
  String get recoveryKeyPassphraseBody =>
      'Devètz picar la frasa secrèta cada còp que l\'ordenador amòda.';

  @override
  String get recoveryKeyPassphraseButton => 'Cambiar la frasa secrèta...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Frasa secrèta actuala';

  @override
  String get recoveryKeyPassphraseNew => 'Frasa secrèta novèla';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirmar la frasa secrèta';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Frasa secrèta incorrècta, tronatz ensajar';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Deu comportar almens 4 caractèrs';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Las frasas secrètas correspodon pas, tornatz ensajar';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Cambiar la frasa secrèta';

  @override
  String get recoveryKeyPinEnabled => 'Lo PIN de chiframent es activat';

  @override
  String get recoveryKeyPinHeader => 'PIN de chiframent';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Frasa secrèta de chiframent';

  @override
  String get recoveryKeyPinBody =>
      'Devètz picar lo PIN cada còp que l\'ordenador amòda.';

  @override
  String get recoveryKeyPinButton => 'Cambiar lo PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN actual';

  @override
  String get recoveryKeyPinNew => 'PIN novèl';

  @override
  String get recoveryKeyPinConfirm => 'Confirmar lo PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorrècte, tornatz ensajar';

  @override
  String get recoveryKeyPinConfirmError =>
      'Los PIN correspondon pas, tornatz ensajar';

  @override
  String get recoveryKeyPinDialogHeader => 'Cambiar lo PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Mostrar';

  @override
  String get recoveryKeyPassphraseHide => 'Amagar';

  @override
  String get recoveryKeyPassphraseChange => 'Cambiar';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN actualizat';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Vòstre PIN es estat corrèctament actualizat.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Frasa secrèta actualizada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'La frasa secrèta es estada corrèctament actualizada.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Frasa secrèta febla, alongatz-la o mai complèxa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Frasa secrèta sufisenta, fasètz-la venir mai longa o complèxa per una melhora seguretat';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Frasa secrèta fòrta';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN feble, fasètz-lo mai long o mens previsible';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN sufisent, fasètz-lo venir mai long o mens previsible per una melhora seguretat';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Lo PIN es sufisentament long';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Quicòm a trucat';

  @override
  String get passphraseTypePassphraseTileTitle =>
      'Require a passphrase on startup';

  @override
  String get passphraseTypePinTileTitle => 'Require a PIN on startup';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Hardware-backed encryption requires additional security in this computer.';

  @override
  String get tpmActionPageTitleActionable =>
      'There is an issue with hardware-backed encryption';

  @override
  String get tpmActionDetailsLabel => 'Technical details';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Solution $n: $text';
  }

  @override
  String tpmActionSingleSolutionLabel(String text) {
    return 'Solution: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Try the solutions below or contact IT support.';

  @override
  String get tpmActionErrorSupportSingleLabel =>
      'Try the solution below or contact IT support.';

  @override
  String get tpmActionErrorKindInternal => 'Internal error.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Power off is required.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Restart is required.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Unexpected action.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Missing argument.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Invalid argument.';

  @override
  String get tpmActionErrorKindActionFailed => 'Action failed.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'The current environment is a virtual machine.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'This computer is using older firmware (legacy BIOS) that is not compatible with this encryption method.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'This computer does not have the required security hardware (TPM 2.0) for this encryption method.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'This computer\'s TPM is disabled.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'This computer\'s TPM is already in use by another system or application.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'This computer\'s TPM is currently locked.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'This computer\'s TPM does not have enough storage available.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'This computer is not compatible with hardware-backed encryption.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'This computer is missing a required security feature (DMA protection).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'This computer is missing a required security feature (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'There is an issue with this computer\'s security configuration.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'There is software running at startup that might prevent a secure connection with the computer\'s TPM.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Absolute Persistence Module is enabled in this computer.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Secure boot is disabled in this computer or is not set in deployed mode.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Some of the certificates verifying software in this computer are outdated or use weak protection.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'This computer is using a manual allowlist to verify software at startup.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Add-on drivers are present.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'This computer is missing a required security feature (hardware root of trust).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'There is an issue with this computer\'s TPM.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionFixActionReboot => 'Restart';

  @override
  String get tpmActionFixActionShutdown => 'Power off';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Restart to firmware settings';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Restart and press the settings key repeatedly during startup (commonly F2, F10 or Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Enable DMA protection manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Enable secure boot manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Enable IOMMU manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Enable PCR banks manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Enable TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Disable Absolute Persistence Module manually';

  @override
  String get tpmActionFixActionContactOem => 'Contact OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Contact OS vendor';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware => 'Enable TPM on restart';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Enable and clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpmViaFirmware => 'Clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpm => 'Clear TPM';

  @override
  String get tpmActionFixActionProceed => 'Ignore';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Restart the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Restarting the computer may fix the issue.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Power off the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'You can do this in your computer\'s firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'You might be able to do this in your computer\'s firmware settings. Check the documentation of the CPU vendor for guidance.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Check secure boot mode is set to \"deployed\".';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'This feature might be referred to as \"Virtualization Technology\", \"VT-d\" or \"AMD-Vi\".';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Ignoring this issue might result in a less secure installation.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Ignore and continue';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Clearing the TPM erases all encryption keys';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'You will lose access to all data in encrypted drives for which you do not have recovery keys. It will also break other features that depend on the TPM, such as authentication and certificates.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'I understand the risk';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'You might be asked to confirm this action on restart.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Then you will need to start the repair again.';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro es pas disponible per aquesta version d’Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requerís una version LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro es pas pres en carga per aquesta version de snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Actualizar snapd per gerir Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro es activat';

  @override
  String get ubuntuProLoadingLabel => 'Aquò pòt tardar unas segondas...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Seguretat e conformitat de qualitat professionala per vòstre ordenador. Totjorn gratuit per un usatge personal. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Descobrissètz Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Activar Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Activar amb un compte Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Poiretz crear un compte gratuitament';

  @override
  String get ubuntuProMagicPrompt =>
      'Connectatz-vos amb un compte Ubuntu One o creatz-ne gratuitament.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Contunhar dins lo navegador';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Vos podètz tanben connectar a $attachLink e dintrar lo còdi $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Activacion d\'Ubuntu Pro impossibla, tornatz ensajar';

  @override
  String get ubuntuProEnableToken => 'Activar amb un geton';

  @override
  String get ubuntuProEnableTokenError => 'Activacion d\'Ubuntu Pro impossibla';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Alprèp de l\'administrator informatic o a partir de $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Obtenètz un geton alprèp de l\'administrator o dempuèi $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Geton';

  @override
  String get ubuntuProDisablePro => 'Desactivar Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Desactivar';

  @override
  String get ubuntuProDisablePrompt =>
      'Desactivar Ubuntu Pro destacarà vòstre abonament d\'aqueste ordenador. Volètz contunhar ?';

  @override
  String get ubuntuProDisableError =>
      'Desactivacion d’Ubuntu Pro impossibla, tornatz ensajar';

  @override
  String get ubuntuProEnable => 'Activar';

  @override
  String get ubuntuProCancel => 'Anullar';

  @override
  String get ubuntuProFeatureEnableError =>
      'Impossible d\'activar la foncionalitat, tornatz ensajar.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Impossible de desactivar la foncionalitat, tornatz ensajar.';

  @override
  String get ubuntuProCompliance => 'Conformitat e endureciment';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Recomandat sonque per ajudar amb FedRAMP, HIPAA e d\'autras exigéncias de conformitat e de securizacion.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Guida de seguretat Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiza lo refortiment e l\'audit amb los perfils de referéncia CIS e DISA-STIG tot permetent d\'adaptacions especificas a l\'environament.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Una certificacion de modul criptografic dels govèrns dels EUA e delbCanadà per la conformitat amb la nòrma de proteccion de donadas FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Activar FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'L\'activacion de FIPS se pòt pas anullar e Livepatch serà desactivat de fòrma permanenta.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Causissètz vòstra opcion FIPS preferida';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS amb mesas a jorn';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installa de paquets validats FIPS 140-2 e permet de mesas a jorn de seguretat regularas.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sens mesas a jorn';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installa los paquets validats FIPS 140-2. Aqueles seràn pas meses a jorn fins a la recertificacion venenta.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentacion de conformitat a la seguretat';

  @override
  String get ubuntuProESMTitle => 'Mantenença de seguretat espandida (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'L\'ESM provesís 10 ans de correctius de seguretat per tot l\'archiu Ubuntu. Beneficiatz d\'una gestion de vulnerabilitat continua per las CVE criticas, nautas e mejanas seleccionada.';

  @override
  String get ubuntuProESMMainTitle => 'Principals paquetatges (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Mesas a jorn de seguretat pels paquets Ubuntu Main fins a $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquetatges universala (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Mesas a jorn de seguretat suplementàrias pels paquets Ubuntu Universe fins a l\'an $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch pel nuclèu';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activar Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplicar las mesas a jorn de seguretat del nuclèu mentre que lo sistèma fonciona';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Afichar l\'estatut de Livepatch dins la barra superiora';
}
