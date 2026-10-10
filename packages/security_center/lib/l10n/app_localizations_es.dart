// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Centro de seguridad';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permitir hasta cerrar sesión';

  @override
  String get snapdRuleCategorySessionDenied => 'Denegar hasta cerrar sesión';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permitir siempre';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Denegar siempre';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'Lectura';

  @override
  String get snapPermissionWriteLabel => 'Escritura';

  @override
  String get snapPermissionExecuteLabel => 'Ejecución';

  @override
  String get snapPermissionAccessLabel => 'Acceso';

  @override
  String get snapPermissionsEnableTitle =>
      'Exigir a las aplicaciones que pidan permisos al sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Esta es una función experimental para controlar el acceso a los recursos del sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Activando, esto puede tardar unos pocos segundos...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Desactivando, esto puede tomar unos pocos segundos…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Puede gestionar otros permisos en Configuración ▸ Aplicaciones.';

  @override
  String get snapPermissionsPageTitle => 'Permisos de la aplicación';

  @override
  String get snapPermissionsErrorTitle => 'Ocurrió un problema';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reglas',
      one: '1 regla',
      zero: 'sin reglas',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestionar permisos de $interface para $snap .';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Aún no hay reglas';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Ninguna aplicación ha solicitado acceso aún';

  @override
  String get snapRulesRemoveAll => 'Eliminar todas las reglas';

  @override
  String get snapRulesResetAllPermissions => 'Restablecer todos los permisos';

  @override
  String get homeInterfacePageTitle => 'Carpeta de usuario';

  @override
  String get homeInterfacePageDescription =>
      'Administrar los permisos para acceder a los archivos en la carpeta del usuario.';

  @override
  String get cameraInterfacePageTitle => 'Cámara';

  @override
  String get cameraInterfacePageDescription =>
      'Permita a las aplicaciones acceder a sus cámaras.';

  @override
  String get microphoneInterfacePageTitle => 'Micrófono';

  @override
  String get microphoneInterfacePageDescription =>
      'Permita a las aplicaciones acceder a su micrófono.';

  @override
  String get interfacePageTitle => 'Gestionar permisos';

  @override
  String get interfacePageLinkLearnMore => 'Conocer más';

  @override
  String get interfacePageLinkReportIssues => 'Informar de problemas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicaciones',
      one: '1 aplicación',
      zero: 'sin aplicaciones',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Cifrado de disco';

  @override
  String get diskEncryptionPageRecoveryKey => 'Clave de recuperación';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La clave de recuperación le permite recuperar el acceso a sus datos si el disco no se desbloquea durante el arranque. Guárdela en un lugar seguro.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La clave de recuperación le permite recuperar el acceso a sus datos si el disco no se desbloquea durante el arranque. Guárdela en un lugar seguro.$learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Aprenda más sobre cifrado por hardware';

  @override
  String get diskEncryptionPageCheckKey =>
      'Comprobar la clave de recuperación...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Comprobar clave de recuperación';

  @override
  String get diskEncryptionPageCheck => 'Comprobar';

  @override
  String get diskEncryptionPageValidKey => 'Clave válida';

  @override
  String get diskEncryptionPageInvalidKey => 'Clave no válida';

  @override
  String get diskEncryptionPageEnterKey =>
      'Introduzca la clave de recuperación';

  @override
  String get diskEncryptionPageKeyWorks => 'La clave de recuperación funciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Recuerde mantenerla en un lugar seguro.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'La clave de recuperación no funciona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Compruebe la clave o sustitúyala por una nueva.';

  @override
  String get diskEncryptionPageError => 'Error';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Reemplazar clave de recuperación...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Reemplazar clave de recuperación';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Guarde la nueva clave de recuperación en un lugar seguro. Una vez reemplazada, ya no podrá usar la clave vieja.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostrar el código QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Guardar en un archivo';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'He guardado mi clave de recuperación en un lugar seguro';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Reemplazar';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Descartar';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Se ha reemplazado la clave de recuperación';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Recuerde guardarla en un lugar seguro.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Ha fallado el reemplazo de clave de seguridad';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Ha habido un error al reemplazar su clave de recuperación. Su vieja clave seguirá siendo válida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Escritorio de Ubuntu - Clave de recuperación de cifrado';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Escanee el código QR para copiar la clave de recuperación y guardarla en un lugar seguro, como un gestor de contraseñas. También puede tomar una foto para usarlo más tarde.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Se copió en el portapapeles';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copiar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'La configuración del cifrado no está disponible';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'No se pudo recuperar el estado de cifrado de este equipo.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La configuración TPM de su equipo no está en un estado soportado.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Su versión de snapd no tiene soporte';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Compruebe que el Centro de seguridad y snapd están actualizados.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'El centro de seguridad no pudo conectarse a la interfaz de snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Para solucionar esto, ejecute este comando en la terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Agregar PIN…';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Agregar frase de paso...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Agregar frase de paso';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Añadir PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Necesitará introducir su PIN cada vez que inicie su equipo. Este PIN es diferente de su contraseña de usuario.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Si olvida su PIN, puede obtener acceso al disco utilizando la clave de recuperación.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Necesitará introducir su frase de acceso cada vez que su equipo arranque. Esta frase de paso es diferente desde su contraseña de usuario.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Si olvida su frase de paso, puede obtener acceso al disco utilizando la llave de recuperación.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Seguridad adicional';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Puede fijar una frase de paso o un PIN para seguridad adicional. Necesitarás introducirlo cada vez que inicie su equipo.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Conocer más';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Añadir';

  @override
  String get diskEncryptionPageRemovePinButton => 'Quitar PIN…';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Quitar frase de acceso…';

  @override
  String get diskEncryptionPageAddingPin =>
      'Añadir PIN, esto puede tomar unos pocos segundos...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Añadir frase de paso, esta puede tomar unos pocos segundos...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Retirar PIN, esto puede tomar unos pocos segundos...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Retirar frase de paso, esto puede tomar unos pocos segundos...';

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
      'No se guardó el archivo de la clave de recuperación';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'El archivo de clave de recuperación no se puede guardar en una ubicación temporal';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Error desconocido';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Hubo un error al guardar su clave de recuperación a un archivo';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'No tiene permisos de escritura en esa ruta de archivos.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'No tiene permisos de escritura en esa carpeta. Inténtelo en otra ruta o use otro método.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Pruebe una ubicación diferente, como una unidad extraíble, o use otro método.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Guardar archivo de clave de recuperación';

  @override
  String get recoveryKeyFilePickerFilter => 'Archivos de texto';

  @override
  String get recoveryKeyTPMEnabled => 'El cifrado mecamático está activado';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Las claves de cifrado se almacenan en el módulo de plataforma seguro (TPM) del equipo.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Más información sobre el cifrado mecamático';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'La contraseña de encriptación está activada';

  @override
  String get recoveryKeyPassphraseHeader => 'Cambiar la contraseña';

  @override
  String get recoveryKeyPassphraseBody =>
      'Necesita introducir su frase de paso cada vez que su equipo arranque.';

  @override
  String get recoveryKeyPassphraseButton => 'Cambiar la contraseña...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Contraseña actual';

  @override
  String get recoveryKeyPassphraseNew => 'Contraseña nueva';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirme la contraseña';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Contraseña incorrecta, inténtelo de nuevo';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Debe tener un mínimo de 4 caracteres';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Las contraseñas no coinciden, inténtelo de nuevo';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Cambiar frase contraseña';

  @override
  String get recoveryKeyPinEnabled => 'Se ha activado el PIN de encriptación';

  @override
  String get recoveryKeyPinHeader => 'PIN de encriptación';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Contraseña de encriptación';

  @override
  String get recoveryKeyPinBody =>
      'Necesita introducir su PIN cada vez que su equipo inicie.';

  @override
  String get recoveryKeyPinButton => 'Cambiar PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN actual';

  @override
  String get recoveryKeyPinNew => 'PIN nuevo';

  @override
  String get recoveryKeyPinConfirm => 'Confirme el PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorrecto, inténtelo de nuevo';

  @override
  String get recoveryKeyPinConfirmError =>
      'Los PIN no coinciden, inténtelo de nuevo';

  @override
  String get recoveryKeyPinDialogHeader => 'Cambar el PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Mostrar';

  @override
  String get recoveryKeyPassphraseHide => 'Ocultar';

  @override
  String get recoveryKeyPassphraseChange => 'Cambiar';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN actualizado';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Su PIN se ha actualizado correctamente.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Contraseña actualizada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'La contraseña ha sido actualizada correctamente.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Contraseña débil, hágala más larga o más compleja';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Contraseña suficiente, hágala más larga o más compleja para mayor seguridad';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Contraseña fuerte';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN débil, hágalo más largo o menos predecible';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN suficiente, hágalo más largo o menos predecible para mayor seguridad';

  @override
  String get recoveryKeyPinEntropyOptimal =>
      'La longitud del PIN es suficiente';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Ha habido algún error';

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
      'Ubuntu Pro no está disponible en esta versión de Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requiere una versión LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Esta versión de snapd no admite Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Actualice snapd para gestionar Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro está activado';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Seguridad y conformidad normativa de nivel empresarial para su equipo. Siempre gratis para uso personal. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Conozca Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Activar Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Activar con cuenta de Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Podrá crearse una cuenta gratuitamente';

  @override
  String get ubuntuProMagicPrompt =>
      'Acceda a su cuenta de Ubuntu One o cree una gratis.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continuar en el navegador';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'También puede acceder en $attachLink e introducir el código $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'No se pudo activar Ubuntu Pro; inténtelo de nuevo';

  @override
  String get ubuntuProEnableToken => 'Activar mediante ficha';

  @override
  String get ubuntuProEnableTokenError => 'No se pudo activar Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Desde su administrador de TI o desde $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Obtenga un token de Ubuntu Pro desde su administrador o desde $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Ficha';

  @override
  String get ubuntuProDisablePro => 'Desactivar Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Desactivar';

  @override
  String get ubuntuProDisablePrompt =>
      'Si desactiva Ubuntu Pro, su suscripción dejará de estar asociada a este equipo. ¿Quiere continuar?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Activar';

  @override
  String get ubuntuProCancel => 'Cancelar';

  @override
  String get ubuntuProFeatureEnableError =>
      'No se pudo activar la funcionalidad; inténtelo de nuevo.';

  @override
  String get ubuntuProFeatureDisableError =>
      'No se pudo desactivar la funcionalidad; inténtelo de nuevo.';

  @override
  String get ubuntuProCompliance => 'Conformidad y robustecimiento';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Solo se recomienda para asistir con requisitos de FedRAMP, HIPAA y otros estándares de cumplimiento y seguridad.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Guía de seguridad de Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiza el robustecimiento y la auditoría mediante el punto de referencia CIS y los perfiles DISA-STIG, al tiempo que permite efectuar personalizaciones específicas al entorno.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Certificación de módulos criptográficos de los gobiernos de EE. UU. y Canadá sobre el cumplimiento del estándar de protección de datos FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Activar FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'No es posible revertir la activación de FIPS y Livepatch se desactivará permanentemente.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Elija su opción preferida de FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS con actualizaciones';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Instala paquetes validados ante FIPS 140-2 y permite actualizaciones de seguridad periódicas.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sin actualizaciones';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Instala paquetes validados ante FIPS 140-2. No se actualizarán hasta la próxima recertificación.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentación sobre la conformidad de seguridad';

  @override
  String get ubuntuProESMTitle => 'Mantenimiento de seguridad expandido (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM ofrece 10 años de parches de seguridad para todo el archivo de Ubuntu. Aproveche la gestión continua de vulnerabilidades para CVE críticas, de alto riesgo y algunas de riesgo medio seleccionadas.';

  @override
  String get ubuntuProESMMainTitle => 'Paquetes principales (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Actualizaciones de seguridad para los paquetes de Ubuntu Main hasta $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquetes del universo (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Actualizaciones de seguridad adicionales para más de 23 000 paquetes de Ubuntu Universe hasta el $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch para el núcleo';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activar Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplicar actualizaciones de seguridad al núcleo mientras se ejecuta el sistema';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Mostrar estado de Livepatch en la barra superior';
}
