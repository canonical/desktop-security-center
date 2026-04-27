// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appTitle => 'Centro de seguranza';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permitir ata pechar sesión';

  @override
  String get snapdRuleCategorySessionDenied => 'Negar ate pechar sesión';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permitir sempre';

  @override
  String get snapdRuleCategoryForeverDenied => 'Negar sempre';

  @override
  String get snapPermissionReadLabel => 'Ler';

  @override
  String get snapPermissionWriteLabel => 'Escribir';

  @override
  String get snapPermissionExecuteLabel => 'Executar';

  @override
  String get snapPermissionAccessLabel => 'Acceso';

  @override
  String get snapPermissionsEnableTitle =>
      'Requirir ás aplicacións que pidan permisos do sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Isto é unha característica experimental para controlar o acceso aos recursos do teu sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Habilitando, isto pode tardar uns segundos...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Inhabilitando, isto pode tardar uns segundos...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Podes administrar outros permisos en Preferencias › Aplicacións.';

  @override
  String get snapPermissionsPageTitle => 'Permisos da aplicación';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regras',
      one: '1 regra',
      zero: 'sen regras',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Xestionar os permisos de $interface para $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ainda non hai regras';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Ningunha aplicación pediu acceso aínda';

  @override
  String get snapRulesRemoveAll => 'Eliminar todas as regras';

  @override
  String get snapRulesResetAllPermissions => 'Restablecer todos os permisos';

  @override
  String get homeInterfacePageTitle => 'Cartafol persoal';

  @override
  String get homeInterfacePageDescription =>
      'Xestiona os permisos para acceder aos ficheiros do Cartafol persoal.';

  @override
  String get cameraInterfacePageTitle => 'Cámara';

  @override
  String get cameraInterfacePageDescription =>
      'Permitir ás aplicacións acceder ás túas cámaras.';

  @override
  String get microphoneInterfacePageTitle => 'Micrófono';

  @override
  String get microphoneInterfacePageDescription =>
      'Permite que as aplicacións accedan ao teu micrófono.';

  @override
  String get interfacePageTitle => 'Xestionar permisos';

  @override
  String get interfacePageDescription =>
      'As aplicacións limitadas estrictamente preguntaranche antes de acceder a ficheiros e cartafoles. Esta función é experimental e está suxeita a cambios.';

  @override
  String get interfacePageLinkLearnMore => 'Saber máis';

  @override
  String get interfacePageLinkGiveFeedback => 'Dá retroalimentación';

  @override
  String get interfacePageLinkReportIssues => 'Informar de problemas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicacións',
      one: '1 aplicación',
      zero: 'sen aplicacións',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Cifrado de disco';

  @override
  String get diskEncryptionPageRecoveryKey => 'Chave de recuperación';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'A chave de recuperación permíteche recuperar o acceso aos teus datos se o disco non se desbloquea durante o inicio. Gardáa nun lugar seguro.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'A chave de recuperación permíteche recuperar o acceso aos teus datos se o disco non se desbloquea durante o inicio. Gardáa nun lugar seguro. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Saber máis do cifrado con respaldo de hardware';

  @override
  String get diskEncryptionPageCheckKey =>
      'Comprobar a chave de recuperación...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Comprobar a chave de recuperación';

  @override
  String get diskEncryptionPageCheck => 'Comprobar';

  @override
  String get diskEncryptionPageValidKey => 'Chave válida';

  @override
  String get diskEncryptionPageInvalidKey => 'Chave non válida';

  @override
  String get diskEncryptionPageEnterKey => 'Introduza a chave de recuperación';

  @override
  String get diskEncryptionPageKeyWorks => 'A chave de recuperación funciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Lembra mantela nun lugar seguro.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'A chave de recuperación non funciona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Comproba a chave ou sustitúaa por unha nova.';

  @override
  String get diskEncryptionPageError => 'Erro';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Sustituir a chave de recuperación...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Substituir a chave de recuperación';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Garde a nova chave de recuperación nun lugar seguro. Unha vez reemplazada, xa non poderá usar a chave vella.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostrar código QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Gardar nun ficheiro';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Gardei a miña chave de recuperación nun lugar seguro';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Substituír';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Descartar';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Chave de recuperación substituída';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Lembra gardala nun lugar seguro.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Faiou a substitución da chave de recuperación';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Algo foi mal substituíndo a chave de recuperación, a túa chave antiga seguirá sendo válida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Escritorio de Ubuntu - Chave de recuperación de cifrado';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Escanee o código QR para copiar a chave de recuperación e gardala nun lugar seguro, como un xestor de contrasinais. Tamén podes tomar unha foto para usala máis tarde.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copiado no portapapeis';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copiar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'A configuración do cifrado non está dispoñíbel';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Faiou a comprobación do estado do cifrado deste ordenador.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'A configuración do TPM do seu ordenador non está nun estado compatible.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'A súa versión de snapd non ten soporte';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Comprobe que o Centro de seguranza e snapd están actualizados.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'O centro de seguranza non pode conectarse á interface de snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Para arranxar isto, execute este comando no terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Engadir PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Engadir frase de paso...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Engadir frase de paso';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Engadir PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Terás que introducir o teu PIN cada vez que se inicie o ordenador. Este PIN é diferente da contrasinal do usuario.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Se esqueces o teu PIN, podes recuperar o acceso ao disco usando a chave de recuperación.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Terás que introducir a frase de paso cada vez que se inicie o ordenador. Esta frase de paso é diferente do teu contrasinal de usuario.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Se esqueces a túa frase de paso, podes recuperar o acceso ao disco usando a chave de recuperación.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Seguranza adicional';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Podes definir unha frase de paso ou un PIN para maior seguridade. Terás que introducilo cada vez que se inicie o ordenador.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Saber máis';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Engadir';

  @override
  String get diskEncryptionPageRemovePinButton => 'Retirar PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Retirar frase de paso...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Engadindo PIN, esto pode tomar uns segundos...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Engadindo frase de paso, esto pode tomar uns segundos...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Retirando PIN, esto pode tomar uns segundos...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Retirando frase de paso, esto pode tomar uns segundos...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Non se gardou o ficheiro da chave de recuperación';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Non se pode gardar o ficheiro da chave de recuperación nunha localización temporal';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Erro descoñecido';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Erro no gardado da chave de recuperación a un ficheiro';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Non tes permiso para escribir nesa localización do ficheiro.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Non tes permiso para escribir nese cartafol. Proba cunha localización diferente ou usa outro método.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Proba cunha localización diferente, como unha unidade extraíble, ou usa outro método.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Gardar ficheiro de chave de recuperación';

  @override
  String get recoveryKeyFilePickerFilter => 'Ficheiros de texto';

  @override
  String get recoveryKeyTPMEnabled =>
      'O cifrado con respaldo de hardware está activado';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'As chaves de cifrado almacénanse no módulo de plataforma fiable (TPM) do teu ordenador.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Saber máis do cifrado con respaldo de hardware';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'A frase de paso cifrada está activada';

  @override
  String get recoveryKeyPassphraseHeader => 'Cambiar a frase de paso';

  @override
  String get recoveryKeyPassphraseBody =>
      'Necesita introducir a frase de paso cada vez que arranque o ordenador.';

  @override
  String get recoveryKeyPassphraseButton => 'Cambiar a frase de paso...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Frase de paso actual';

  @override
  String get recoveryKeyPassphraseNew => 'Nova frase de paso';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirmar frase de paso';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Frase de paso incorrecta, téntao de novo';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Debe ter un mínimo de 4 caracteres';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'As frases de paso non coinciden, téntao de novo';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Cambiar frase de paso';

  @override
  String get recoveryKeyPinEnabled => 'O PIN de cifrado está activado';

  @override
  String get recoveryKeyPinHeader => 'PIN de cifrado';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Frase de paso de cifrado';

  @override
  String get recoveryKeyPinBody =>
      'Necesitas introducir o teu PIN cada vez que se inicie o ordenador.';

  @override
  String get recoveryKeyPinButton => 'Cambiar PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN actual';

  @override
  String get recoveryKeyPinNew => 'Novo PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirmar o PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorrecto, téntao de novo';

  @override
  String get recoveryKeyPinConfirmError =>
      'Os PINs non coinciden, téntao de novo';

  @override
  String get recoveryKeyPinDialogHeader => 'Cambiar PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Amosar';

  @override
  String get recoveryKeyPassphraseHide => 'Agochar';

  @override
  String get recoveryKeyPassphraseChange => 'Cambiar';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN actualizado';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'O teu PIN actualizouse correctamente.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Frase de paso actualizada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'A túa frase de paso actualizouse con éxito.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Frase de paso feble, faina máis longa ou máis complexa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Frase de paso xusta, faina máis longa ou máis complexa para unha mellor seguranza';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Frase de paso forte';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN feble, faino máis longo ou menos previsíbel';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN xusto, faino máis longo ou menos previsíbel para unha mellor seguranza';

  @override
  String get recoveryKeyPinEntropyOptimal => 'O PIN é o suficientemente longo';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Algo fallou';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro non está dispoñíbel para esta versión de Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro require unha versión LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro non é compatíbel con esta versión de snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Actualiza snapd para xestionar Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro está activado';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Seguranza e cumprimento de normas empresariais para o teu ordenador. Sempre gratuíto para uso persoal. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Saber máis sobre Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Activar Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Activar con unha conta Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Poderás crear unha conta de balde';

  @override
  String get ubuntuProMagicPrompt =>
      'Inicia sesión coa túa conta de Ubuntu One ou crea unha de balde.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continúa no navegador';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Tamén podes iniciar sesión en $attachLink e introducir o código $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Non se puido activar Ubuntu Pro. Téntao de novo';

  @override
  String get ubuntuProEnableToken => 'Activar cun token';

  @override
  String get ubuntuProEnableTokenError => 'Non se pode activar Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Do teu administrador informático ou de $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Obtén un token de Ubuntu Pro do teu administrador ou de $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Desactivar Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Desactivar';

  @override
  String get ubuntuProDisablePrompt =>
      'Desactivar Ubuntu Pro desvinculará a túa subscrición desta máquina. Queres continuar?';

  @override
  String get ubuntuProEnable => 'Activar';

  @override
  String get ubuntuProCancel => 'Cancelar';

  @override
  String get ubuntuProFeatureEnableError =>
      'Non se puido activar a funcionalidade. Téntao de novo.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Non se puido desactivar a funcionalidade. Téntao de novo.';

  @override
  String get ubuntuProCompliance => 'Conformidade e endurecemento';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Só recomendado para axudar con FedRAMP, HIPAA e outros requisitos de cumprimento e endurecemento.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Guía de seguranza de Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiza o endurecemento e a auditoría con perfís de referencia CIS e DISA-STIG, ao tempo que permite personalizacións específicas do ambiente.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Unha certificación de módulo criptográfico dos gobernos dos Estados Unidos e do Canadá que garante o cumprimento do estándar de protección de datos FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Activar FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'A activación de FIPS non se pode reverter e Livepatch desactivarase permanentemente.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Escolla a súa opción FIPS preferida';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS con actualizacións';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Instala paquetes validados segundo FIPS 140-2 e permite actualizacións de seguranza regulares.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sen actualizacións';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Instala paquetes validados segundo FIPS 140-2. Estes non se actualizarán ata a próxima recertificación.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentación de conformidade da seguranza';

  @override
  String get ubuntuProESMTitle => 'Mantemento de seguranza extendido (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM ofrece 10 anos de parches de seguranza para máis de 25.000 paquetes de código aberto. Obtén unha xestión continua de vulnerabilidades para CVE críticos, altos e medios.';

  @override
  String get ubuntuProESMMainTitle => 'Paquetes principais (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Actualizacións de seguranza para 2.300 paquetes principais de Ubuntu ata $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquetes Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Actualizacións adicionais de seguranza para máis de 23.000 paquetes Ubuntu Universe ata $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activar Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplicar as actualizacións de seguranza do kernel mentres o sistema se executa';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Mostrar o estado de Livepatch na barra superior';
}
