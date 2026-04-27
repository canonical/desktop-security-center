// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Beveiligingscentrum';

  @override
  String get snapdRuleCategorySessionAllowed => 'Toestaan tot afmelding';

  @override
  String get snapdRuleCategorySessionDenied => 'Weigeren tot afmelding';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Altijd toestaan';

  @override
  String get snapdRuleCategoryForeverDenied => 'Altijd weigeren';

  @override
  String get snapPermissionReadLabel => 'Lezen';

  @override
  String get snapPermissionWriteLabel => 'Schrijven';

  @override
  String get snapPermissionExecuteLabel => 'Uitvoeren';

  @override
  String get snapPermissionAccessLabel => 'Toegang';

  @override
  String get snapPermissionsEnableTitle =>
      'Apps moeten om systeemmachtigingen vragen';

  @override
  String get snapPermissionsEnableWarning =>
      'Dit is een experimentele functie voor het toegangsbeheer tot de systeembronnen.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Inschakelen, een ogenblik geduld…';

  @override
  String get snapPermissionsDisablingLabel =>
      'Uitschakelen, een ogenblik geduld…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimenteel';

  @override
  String get snapPermissionsOtherDescription =>
      'Je kunt andere machtigingen beheren in Instellingen › Toepassingen.';

  @override
  String get snapPermissionsPageTitle => 'App-machtigingen';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regels',
      one: '1 regel',
      zero: 'geen regel',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-machtigingen beheren voor $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Nog geen regels';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Nog geen apps die toegang hebben gevraagd';

  @override
  String get snapRulesRemoveAll => 'Alle regels verwijderen';

  @override
  String get snapRulesResetAllPermissions =>
      'Alle machtigingen opnieuw instellen';

  @override
  String get homeInterfacePageTitle => 'Thuismap';

  @override
  String get homeInterfacePageDescription =>
      'Machtigingen beheren voor toegang tot bestanden in uw thuismap.';

  @override
  String get cameraInterfacePageTitle => 'Camera';

  @override
  String get cameraInterfacePageDescription =>
      'Apps toegang geven tot uw camera\'s.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'Machtigingen beheren';

  @override
  String get interfacePageDescription =>
      'Strikt beperkte apps zullen toestemming vragen voordat ze toegang krijgen tot bestanden en mappen. Deze functie is experimenteel en onderhevig aan wijzigingen.';

  @override
  String get interfacePageLinkLearnMore => 'Meer informatie';

  @override
  String get interfacePageLinkGiveFeedback => 'Reacties geven';

  @override
  String get interfacePageLinkReportIssues => 'Problemen melden';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'geen apps',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Schijfversleuteling';

  @override
  String get diskEncryptionPageRecoveryKey => 'Herstelcode';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Met de herstelcode kunt u weer toegang krijgen tot uw gegevens als uw schijf niet kan worden ontgrendeld tijdens het opstarten. Bewaar deze op een veilige plek.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'De herstelcode stelt je in staat om weer toegang te krijgen tot je gegevens als je schijf tijdens het opstarten niet ontgrendeld kan worden. Bewaar het op een veilige plaats. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => 'Met informatie over herstelcodes';

  @override
  String get diskEncryptionPageCheckKey => 'Herstelcode controleren…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Herstelcode controleren';

  @override
  String get diskEncryptionPageCheck => 'Controleren';

  @override
  String get diskEncryptionPageValidKey => 'Geldige code';

  @override
  String get diskEncryptionPageInvalidKey => 'Ongeldige code';

  @override
  String get diskEncryptionPageEnterKey => 'Voert uw herstelcode in';

  @override
  String get diskEncryptionPageKeyWorks => 'Herstelcode functioneert';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Vergeet niet om het op een veilige plek te bewaren.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'De herstelcode werkt niet';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Controleer de code of vervang hem voor een nieuwe.';

  @override
  String get diskEncryptionPageError => 'Fout';

  @override
  String get diskEncryptionPageReplaceButton => 'Herstelcode vervangen…';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Herstelcode vervangen';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Sla de nieuwe herstelcode ergens veilig op. Eenmaal vervangen, kan de oude sleutel niet meer gebruikt worden.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR-code weergeven';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Opslaan naar bestand';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ik heb mijn herstelcode ergens veilig opgeslagen';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Vervangen';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Weggooien';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Herstelcode vervangen';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Vergeet niet om het ergens veilig op te slaan.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Vervanging van herstelcode mislukt';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Er is iets misgegaan met het vervangen van de herstelcode, uw oude code blijft van toepassing.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Herstelcode voor versleuteling';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scan de QR-code om de herstelcode te kopiëren en deze ergens veilig op te slaan, zoals een wachtwoordbeheerder. U kunt ook een foto maken voor later gebruik.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Gekopieerd naar klembord';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopiëren';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Versleutelingsinstellingen niet beschikbaar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Ophalen van de versleutelingsstatus van deze computer is mislukt.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'De TPM-configuratie van uw computer bevindt zich niet in een ondersteunde staat.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Uw snapd-versie wordt niet ondersteund';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Controleer of het Beveiligingscentrum en snapd up-to-date zijn.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Beveiligingscentrum kan geen verbinding maken met de snapd-interface';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Om dit te verhelpen, voer deze opdracht uit in de terminal:';

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
      'Herstelcode niet opgeslagen';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Herstelcodebestand kan niet op een tijdelijke locatie worden opgeslagen';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Onbekende fout';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Herstelcode opslaan in bestand is niet gelukt';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'U heeft geen toestemming om naar die bestandslocatie te schrijven.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'U bent niet gemachtigd om naar die map te schrijven. Probeer een andere locatie of gebruik een andere methode.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Probeer een andere locatie, zoals een verwijderbare schijf of gebruik een andere methode.';

  @override
  String get recoveryKeyFilePickerTitle => 'Herstelcodebestand opslaan';

  @override
  String get recoveryKeyFilePickerFilter => 'Tekstbestanden';

  @override
  String get recoveryKeyTPMEnabled =>
      'Hardware-ondersteunde versleuteling ingeschakeld';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'De versleutelingscodes zijn opgeslagen in de Trusted Platform Module (TPM) van uw computer.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Meer informatie over hardwareondersteunde versleuteling';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Versleuteling met wachtwoordzin is ingeschakeld';

  @override
  String get recoveryKeyPassphraseHeader => 'Wachtwoordzin wijzigen';

  @override
  String get recoveryKeyPassphraseBody =>
      'U moet uw wachtwoord tijdens het opstarten invoeren om de schijf te ontgrendelen. U kunt de wachtwoordzin wijzigen, maar niet uitschakelen.';

  @override
  String get recoveryKeyPassphraseButton => 'Wachtwoordzin wijzigen…';

  @override
  String get recoveryKeyPassphraseCurrent => 'Huidige wachtwoordzin';

  @override
  String get recoveryKeyPassphraseNew => 'Nieuwe wachtwoordzin';

  @override
  String get recoveryKeyPassphraseConfirm => 'Wachtwoordzin bevestigen';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Onjuiste wachtwoordzin, probeer het opnieuw';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Moet minimaal 4 tekens lang zijn';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Wachtwoordzinnen komen niet overeen, probeer het opnieuw';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Wachtwoordzin wijzigen';

  @override
  String get recoveryKeyPinEnabled =>
      'Versleuteling met pincode is ingeschakeld';

  @override
  String get recoveryKeyPinHeader => 'Versleutelingspincode';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Versleutelingswachtwoordzin';

  @override
  String get recoveryKeyPinBody =>
      'U moet uw pincode invoeren tijdens het opstarten om de schijf te ontgrendelen. U kunt de pincode wijzigen, maar niet uitschakelen.';

  @override
  String get recoveryKeyPinButton => 'Pincode wijzigen…';

  @override
  String get recoveryKeyPinCurrent => 'Huidige pincode';

  @override
  String get recoveryKeyPinNew => 'Nieuwe pincode';

  @override
  String get recoveryKeyPinConfirm => 'Pincode bevestigen';

  @override
  String get recoveryKeyPinCurrentError =>
      'Onjuiste pincode, probeer het opnieuw';

  @override
  String get recoveryKeyPinConfirmError =>
      'Pincodes komen niet overeen, probeer het opnieuw';

  @override
  String get recoveryKeyPinDialogHeader => 'Pincode wijzigen';

  @override
  String get recoveryKeyPassphraseShow => 'Weergeven';

  @override
  String get recoveryKeyPassphraseHide => 'Verbergen';

  @override
  String get recoveryKeyPassphraseChange => 'Wijzigen';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'Pincode bijgewerkt';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Uw pincode is met success bijgewerkt.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Wachtwoordzin bijgewerkt';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Uw wachtwoordzin is met success bijgewerkt.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Zwakke wachtwoordzin, maak het langer of complexer';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Redelijke wachtwoordzin, maak het langer of complexer voor een betere beveiliging';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Sterke wachtwoordzin';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Zwakke pincode, maak hem langer of minder voorspelbaar';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Redelijke pincode, maak hem langer of minder voorspelbaar voor een betere beveiliging';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Pincode is lang genoeg';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Er ging iets mis';

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
      'ESM provides 10 years of security patches for 25,000+ open source packages. Get continuous vulnerability management for critical, high, and medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for 2,300 Ubuntu Main package until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for over 23,000 Ubuntu Universe packages until $year';
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
