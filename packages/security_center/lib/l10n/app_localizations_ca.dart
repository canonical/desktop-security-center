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
  String get snapPermissionAccessLabel => 'Access';

  @override
  String get snapPermissionsEnableTitle =>
      'Exigeix a les aplicacions que demanin permisos al sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Aquesta és una funció experimental per controlar l\'accés als recursos del vostre sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'S\'està habilitant, pot trigar uns segons...';

  @override
  String get snapPermissionsDisablingLabel =>
      'S\'està desactivant, pot trigar uns segons...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Podeu administrar altres permisos a Configuració › Aplicacions.';

  @override
  String get snapPermissionsPageTitle => 'Permisos de l\'aplicació';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
    return 'Administrar els permisos de $interface per a $snap .';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Encara no hi ha regles';

  @override
  String get cameraRulesPageEmptyTileLabel => 'No apps requested access yet';

  @override
  String get snapRulesRemoveAll => 'Elimina totes les regles';

  @override
  String get snapRulesResetAllPermissions => 'Reset all permissions';

  @override
  String get homeInterfacePageTitle => 'Carpeta d\'usuari';

  @override
  String get homeInterfacePageDescription =>
      'Administra els permisos per accedir als fitxers a la carpeta d\'usuari.';

  @override
  String get cameraInterfacePageTitle => 'Camera';

  @override
  String get cameraInterfacePageDescription =>
      'Allow apps to access your cameras.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'Administra els permisos';

  @override
  String get interfacePageDescription =>
      'Les aplicacions confinades estrictament us demanaran abans d\'accedir a fitxers i carpetes. Aquesta característica és experimental i està subjecta a canvis.';

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
  String get diskEncryptionPageTitle => 'Encriptació de disc';

  @override
  String get diskEncryptionPageRecoveryKey => 'Clau de recuperació';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La clau de recuperació et permet recuperar l\'accés a les teves dades si el teu disc no es desbloqueja durant l\'arrencada. Deseu-lo en un lloc segur.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La clau de recuperació et permet recuperar l\'accés a les teves dades si el teu disc no es desbloqueja durant l\'arrencada. Deseu-lo en un lloc segur. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Més informació sobre les claus de recuperació';

  @override
  String get diskEncryptionPageCheckKey =>
      'Comproveu la clau de recuperació ...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Comproveu la recuperació Clau';

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
      'La configuració de l\'Encriptació no està disponible';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Ha fallat la recuperació de l\'estat d\'encriptació d\'aquest ordinador.';

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
  String get diskEncryptionPageAddPinButton => 'Add PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Add passphrase...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Add passphrase';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Add PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'You will need to enter your PIN every time your computer starts. This PIN is different from your user password.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'If you forget your PIN, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'You will need to enter your passphrase every time your computer starts. This passphrase is different from your user password.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'If you forget your passphrase, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Additional security';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'You can set a passphrase or a PIN for additional security. You will need to enter it every time your computer starts.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Learn more';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Add';

  @override
  String get diskEncryptionPageRemovePinButton => 'Remove PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Remove passphrase...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Adding PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Adding passphrase, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Removing PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Removing passphrase, this may take a few seconds...';

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
      'Ubuntu Pro is not available for this Ubuntu version';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requires an LTS release';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro is not supported by this snapd version';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Update snapd to manage Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro is enabled';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Enterprise-grade security and compliance for your computer. Always free for personal use. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Learn about Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Enable Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Enable with Ubuntu One account';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'You will be able to create an account for free';

  @override
  String get ubuntuProMagicPrompt =>
      'Log in with your Ubuntu One account, or create one for free.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continue in browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'You can also log in at $attachLink and enter the code $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Unable to enable Ubuntu Pro, please try again';

  @override
  String get ubuntuProEnableToken => 'Enable with a token';

  @override
  String get ubuntuProEnableTokenError => 'Unable to enable Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'From your IT admin or from $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Get an Ubuntu Pro token from your administrator or from $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Disable Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Disable';

  @override
  String get ubuntuProDisablePrompt =>
      'Disabling Ubuntu Pro will detach your subscription from this machine. Do you want to proceed?';

  @override
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

  @override
  String get ubuntuProFeatureEnableError =>
      'Could not enable the feature, please try again.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Could not disable the feature, please try again.';

  @override
  String get ubuntuProCompliance => 'Compliance and hardening';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Only recommended to assist with FedRAMP, HIPAA and other compliance and hardening requirements.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automates hardening and auditing with CIS benchmark and DISA-STIG profiles while allowing for environment-specific customizations.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'A US and Canada government cryptographic module certification of compliance with the FIPS 140-2 data protection standard.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Enable FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Enabling FIPS cannot be reversed and Livepatch will be permanently disabled.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Choose your preferred FIPS option';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS with updates';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installs FIPS 140-2 validated packages and allows for regular security updates.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS without updates';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installs FIPS 140-2 validated packages. These will not be updated until the next recertification.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Security compliance documentation';

  @override
  String get ubuntuProESMTitle => 'Expanded Security Maintenance (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM provides 10 years of security patches for the entire Ubuntu Archive. Get continuous vulnerability management for critical, high and selected medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for Ubuntu Main packages until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for Ubuntu Universe packages until $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Enable Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Apply kernel security updates while the system runs';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Show Livepatch status in the top bar';
}
