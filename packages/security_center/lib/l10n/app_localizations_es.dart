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
  String get snapdRuleCategoryForeverDenied => 'Rechazar siempre';

  @override
  String get snapPermissionReadLabel => 'Leer';

  @override
  String get snapPermissionWriteLabel => 'Escribir';

  @override
  String get snapPermissionExecuteLabel => 'Ejecutar';

  @override
  String get snapPermissionAccessLabel => 'Acceder';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get interfacePageDescription =>
      'Las aplicaciones estrictamente confinadas le preguntarán antes de acceder a archivos y carpetas. Esta funcionalidad es experimental y está sujeta a cambios.';

  @override
  String get interfacePageLinkLearnMore => 'Más información';

  @override
  String get interfacePageLinkGiveFeedback => 'Dar su opinión';

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
  String get diskEncryptionPageReplaceDialogSave => 'Guardar como archivo';

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
      'La configuración de la encriptación no está disponible';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Ha fallado la comprobación del estado de encriptado de este equipo.';

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
  String get diskEncryptionPageAddPinDialogHeading => 'Agregar PIN';

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
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Aprender más';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Agregar';

  @override
  String get diskEncryptionPageRemovePinButton => 'Retirar PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Retirar frase de acceso...';

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
  String get recoveryKeyExceptionFileSystemTitle =>
      'No se ha guardado la clave de recuperación';

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
  String get recoveryKeyTPMEnabled =>
      'Está habilitada la encriptación con soporte de hardware';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Las claves de encriptación se almacenan en el módulo de plataforma de confianza (TPM) del ordenador.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Más información sobre la encriptación con soporte de hardware';

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
    return 'From your IT admin or from $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Get an Ubuntu Pro token from your administrator or from $proLink';
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
      'Only recommended to assist with FedRAMP, HIPAA and other compliance and hardening requirements.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Guía de seguridad de Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiza el robustecimiento y la auditoría mediante el punto de referencia CIS y los perfiles DISA-STIG, al tiempo que permite efectuar personalizaciones específicas al entorno.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'A US and Canada government cryptographic module certification of compliance with the FIPS 140-2 data protection standard.';

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
      'Installs FIPS 140-2 validated packages and allows for regular security updates.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sin actualizaciones';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installs FIPS 140-2 validated packages. These will not be updated until the next recertification.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentación sobre la conformidad de seguridad';

  @override
  String get ubuntuProESMTitle => 'Mantenimiento de seguridad expandido (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM ofrece 10 años de parches de seguridad para más de 25 000 paquetes de código abierto. Disfrute de una gestión continua de vulnerabilidades para CVE de gravedad crítica, alta y media.';

  @override
  String get ubuntuProESMMainTitle => 'Paquetes principales (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Actualizaciones de seguridad para 2300 paquetes de Ubuntu Main hasta el $year';
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
