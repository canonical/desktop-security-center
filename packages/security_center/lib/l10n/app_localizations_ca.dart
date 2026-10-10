// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Centre de seguretat';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Permet fins que es tanqui la sessió';

  @override
  String get snapdRuleCategorySessionDenied =>
      'Denega fins que es tanqui la sessió';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permet sempre';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Rebutja sempre';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'Lectura';

  @override
  String get snapPermissionWriteLabel => 'Escriptura';

  @override
  String get snapPermissionExecuteLabel => 'Execució';

  @override
  String get snapPermissionAccessLabel => 'Accés';

  @override
  String get snapPermissionsEnableTitle =>
      'Exigeix a les aplicacions que demanin permisos al sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Aquesta és una funció experimental per controlar l\'accés als recursos del vostre sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'S\'està activant; pot trigar uns segons…';

  @override
  String get snapPermissionsDisablingLabel =>
      'S\'està desactivant; pot trigar uns segons…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Podeu administrar altres permisos a Configuració › Aplicacions.';

  @override
  String get snapPermissionsPageTitle => 'Permisos de l\'aplicació';

  @override
  String get snapPermissionsErrorTitle => 'Ha fallat alguna cosa';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regles',
      one: '1 regla',
      zero: 'sense regles',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestiona els permisos de $interface per a $snap .';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Encara no hi ha regles';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Cap aplicació ha sol·licitat accés encara';

  @override
  String get snapRulesRemoveAll => 'Elimina totes les regles';

  @override
  String get snapRulesResetAllPermissions => 'Reinicialitza tots els permisos';

  @override
  String get homeInterfacePageTitle => 'Carpeta d\'usuari';

  @override
  String get homeInterfacePageDescription =>
      'Administra els permisos per accedir als fitxers a la carpeta d\'usuari.';

  @override
  String get cameraInterfacePageTitle => 'Càmera';

  @override
  String get cameraInterfacePageDescription =>
      'Permet que les apps accedeixin a les teves càmeres.';

  @override
  String get microphoneInterfacePageTitle => 'Micròfon';

  @override
  String get microphoneInterfacePageDescription =>
      'Permet que les aplicacions accedeixin al micròfon.';

  @override
  String get interfacePageTitle => 'Administra els permisos';

  @override
  String get interfacePageLinkLearnMore => 'Més informació';

  @override
  String get interfacePageLinkReportIssues => 'Informeu els problemes';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicacions',
      one: '1 aplicació',
      zero: 'sense aplicacions',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Xifratge del disc';

  @override
  String get diskEncryptionPageRecoveryKey => 'Clau de recuperació';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La clau de recuperació us permet recuperar l\'accés a les vostres dades si el disc no es desbloca durant l\'arrencada. Deseu-la en un lloc segur.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La clau de recuperació us permet recuperar l\'accés a les vostres dades si el disc no es desbloca durant l\'arrencada. Deseu-la en un lloc segur. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Més informació sobre les claus de recuperació';

  @override
  String get diskEncryptionPageCheckKey =>
      'Comproveu la clau de recuperació ...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Comproveu la clau de recuperació';

  @override
  String get diskEncryptionPageCheck => 'Comproveu';

  @override
  String get diskEncryptionPageValidKey => 'Clau vàlida';

  @override
  String get diskEncryptionPageInvalidKey => 'Clau invàlida';

  @override
  String get diskEncryptionPageEnterKey => 'Introduïu la clau de recuperació';

  @override
  String get diskEncryptionPageKeyWorks => 'La clau de recuperació funciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Recordeu mantenir-la en algun lloc segur.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'La clau de recuperació no funciona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Comprova la clau o substitueix-la per una nova.';

  @override
  String get diskEncryptionPageError => 'Error';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Canvia la clau de recuperació ...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Canvia la clau de recuperació';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Deseu la nova clau de recuperació en algun lloc segur. Un cop la substituïu, no podreu pas més utilitzar la clau vella.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostra el codi QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Desa a un fitxer';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'He desat la meva clau de recuperació en algun lloc segur';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Canvia';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Esborra';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'S\'ha canviat la clau de recuperació';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Recurdeu mantenir-la en algun lloc segur.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Ha fallat el canvi de clau de recuperació';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Ha fallat alguna cosa quan es canviava la clau de recuperació, la vostra antiga clau de recuperació es mantindrà vàlida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Escriptori de l\'Ubuntu - Clau de recuperació de l\'encriptació';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Escanegeu el codi QR per copiar la clau de recuperació i desar-la en algun lloc segur, com ara un gestor de contrasenyes. També podeu fer una foto per a un ús futur.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copiat al portaretalls';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copia';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Els paràmetres de xifratge no estan disponibles';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Ha fallat la recuperació de l\'estat de xifratge d\'aquest ordinador.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La configuració TPM del vostre ordinador no està en un estat suportat.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'La versió de snapd no té suport';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Comproveu que el Centre de Seguretat i snapd estan actualitzats.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'El Centre de Seguretat no pot connectar-se a la interfície snpad';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Per solucionar això, executeu aquesta ordre al terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Afegeix un PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Afegeix una contrasenya...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Afegeix una contrasenya';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Afegeix un PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Hauràs d\'introduir el teu PIN cada vegada que comenci el teu ordinador. Aquest PIN és diferent de la contrasenya d\'usuari.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Si oblideu el PIN, podeu recuperar l\'accés al disc utilitzant la clau de recuperació.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Haureu d\'introduir la contrasenya cada vegada que s\'iniciï l\'ordinador. Aquesta contrasenya és diferent de la contrasenya d\'usuari.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Si oblideu la contrasenya, podeu recuperar l\'accés al disc utilitzant la clau de recuperació.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Seguretat addicional';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Podeu establir una contrasenya o un PIN per a seguretat addicional. Haureu d\'introduir-lo cada vegada que comenci l\'ordinador.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Més informació';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Afegeix';

  @override
  String get diskEncryptionPageRemovePinButton => 'Elimina el PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Elimina la contrasenya...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Afegint PIN, això pot trigar uns segons...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'S\'està afegint una contrasenya, això pot trigar uns segons...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'S\'està suprimint el PIN, això pot trigar uns segons...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'S\'està suprimint la contrasenya, això pot trigar uns segons...';

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
      'No s\'ha desat la clau de recuperació';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'El fitxer clau de recuperació no es pot desar en una ubicació temporal';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Error desconegut';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Ha fallat quan es desava la clau de recuperació a un fitxer';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'No teniu permís per escriure a aquesta ubicació del fitxer.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'No teniu permís per escriure a aquesta carpeta. Proveu un lloc diferent o un altre mètode.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Proveu una ubicació diferent, com ara una unitat extraïble o utilitzeu un altre mètode.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Desa el fitxer de clau de recuperació';

  @override
  String get recoveryKeyFilePickerFilter => 'Fitxers de text';

  @override
  String get recoveryKeyTPMEnabled =>
      'Està habilitada l\'encriptació amb suport de maquinari';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Les claus d\'encriptació s\'emmagatzemen al mòdul de plataforma de confiança (TMP) de l\'ordinador.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Més informació sobre l\'encriptació amb suport de maquinari';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'La contrasenya de l\'Encriptació està activada';

  @override
  String get recoveryKeyPassphraseHeader => 'Canvia la contrasenya';

  @override
  String get recoveryKeyPassphraseBody =>
      'Heu d\'introduir la contrasenya duran l\'arrencada per desbloquejar el disc. Podeu canviar la contrasenya però no desactivar-la.';

  @override
  String get recoveryKeyPassphraseButton => 'Canvia la contrasenya...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Contrasenya actual';

  @override
  String get recoveryKeyPassphraseNew => 'Contrasenya nova';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirmeu la contrasenya';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Contrasenya incorrecta, torneu a provar';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Ha de ser com a mínim de 4 caràcters';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Les contrasenyes no concorden, torneu a provar';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Canvia la contrasenya';

  @override
  String get recoveryKeyPinEnabled => 'S\'ha activat el PIN de l\'Encriptació';

  @override
  String get recoveryKeyPinHeader => 'PIN de l\'encriptació';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Contrasenya de l\'Encriptació';

  @override
  String get recoveryKeyPinBody =>
      'Heu d\'introduir el PIN durant l\'arrencada per desbloquejar el disc. Podeu canviar el PIN però no desactivar-lo.';

  @override
  String get recoveryKeyPinButton => 'Canvia el PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN actual';

  @override
  String get recoveryKeyPinNew => 'PIN nou';

  @override
  String get recoveryKeyPinConfirm => 'Confirmeu el PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorrecte, torneu a provar';

  @override
  String get recoveryKeyPinConfirmError =>
      'Els PIN no concorden, torneu a provar';

  @override
  String get recoveryKeyPinDialogHeader => 'Canvia el PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Mostra';

  @override
  String get recoveryKeyPassphraseHide => 'Oculta';

  @override
  String get recoveryKeyPassphraseChange => 'Canvia';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN actualitzat';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'El vostre PIN s\'ha actualitzat correctament.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Contrasenya actualitzada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'La contrasenya s\'ha actualitzat correctament.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Contrasenya feble, feu-la més llarga o més complexa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Contrasenya suficient, feu-la més llarga o més complexa per a una millor seguretat';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Contrasenya forta';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN feble, feu-lo més llarg o menys predictible';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN suficient, feu-lo més fort o menys predictible per a una millor seguretat';

  @override
  String get recoveryKeyPinEntropyOptimal => 'El PIN és suficientment llarg';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Alguna cosa ha fallat';

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
      'Ubuntu Pro no està disponible per a aquesta versió d\'Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requereix un llançament LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro no és compatible amb aquesta versió ajustada';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Actualització ajustada per gestionar l\'Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro està habilitat';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Seguretat de grau empresarial i compliment per al seu ordinador. Sempre lliure per a ús personal. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Més informació sobre Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Habilita l\'Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Habilita amb el compte d\'Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Podràs crear un compte de forma gratuïta';

  @override
  String get ubuntuProMagicPrompt =>
      'Inicieu sessió amb el vostre compte d\'Ubuntu One o creeu-ne un de forma gratuïta.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continua en el navegador';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'També podeu iniciar sessió a $attachLink i introduir el codi $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'No s\'ha pogut habilitar l\'Ubuntu Pro, torneu-ho a provar';

  @override
  String get ubuntuProEnableToken => 'Habilita amb un testimoni';

  @override
  String get ubuntuProEnableTokenError =>
      'No s\'ha pogut habilitar l\'Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Des de l\'administrador de TI o des de $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Obteniu un testimoni d\'Ubuntu Pro del vostre administrador o de $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Testimoni';

  @override
  String get ubuntuProDisablePro => 'Desactiva Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Desactiva';

  @override
  String get ubuntuProDisablePrompt =>
      'Desactivant Ubuntu Pro se separarà la vostra subscripció d\'aquesta màquina. Voleu continuar?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Activa';

  @override
  String get ubuntuProCancel => 'Cancel·la';

  @override
  String get ubuntuProFeatureEnableError =>
      'No s\'ha pogut habilitar la característica. Torneu-ho a provar.';

  @override
  String get ubuntuProFeatureDisableError =>
      'No s\'ha pogut desactivar la funció. Torneu-ho a provar.';

  @override
  String get ubuntuProCompliance => 'Compliment i enduriment';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Només es recomana ajudar amb FedRAMP, HIPAA i altres requisits de compliment i enduriment.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Guia de seguretat de l\'Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatitza l\'enduriment i l\'auditoria amb perfils de referència CIS i DISA-STIG, alhora que permet personalitzar el medi ambient.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Una certificació del mòdul criptogràfic del govern dels EUA i Canadà de compliment de la norma de protecció de dades FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Habilita els FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'No es pot invertir l\'habilitació del FIPS i el Livepatch es desactivarà permanentment.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Trieu la vostra opció FIPS preferida';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS amb actualitzacions';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Instal·la paquets validats FIPS 140-2 i permet actualitzacions de seguretat regulars.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sense actualitzacions';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Instal·la paquets validats FIPS 140-2. Aquestes no s\'actualitzaran fins a la següent recertificació.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentació de compliment de seguretat';

  @override
  String get ubuntuProESMTitle => 'Manteniment de Seguretat Ampliada (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM proporciona 10 anys de pegats de seguretat per a més de 25.000 paquets de codi obert. Obtingueu una gestió contínua de vulnerabilitats per a CVE crítics, alts i mitjans.';

  @override
  String get ubuntuProESMMainTitle => 'Paquets principals (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Actualitzacions de seguretat per als paquets Ubuntu Main fins a $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquets d\'univers (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Actualitzacions de seguretat addicionals per als paquets Ubuntu Universe fins a $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch per al nucli';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activa el Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Apliqueu les actualitzacions de seguretat del nucli mentre el sistema està en funcionament';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Mostra l\'estat del Livepatch a la barra superior';
}
