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
  String get snapdRuleCategoryForeverDenied => 'Rebutja sempre';

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
  String get interfacePageLinkLearnMore => 'Apreneu més';

  @override
  String get interfacePageLinkGiveFeedback => 'Doneu retroacció';

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
