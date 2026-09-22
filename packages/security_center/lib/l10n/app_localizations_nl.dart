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
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Altijd weigeren';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

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
  String get snapPermissionsErrorTitle => 'Er ging iets fout';

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
  String get microphoneInterfacePageTitle => 'Microfoon';

  @override
  String get microphoneInterfacePageDescription =>
      'Applicaties toegang geven tot de microfoon.';

  @override
  String get interfacePageTitle => 'Machtigingen beheren';

  @override
  String get interfacePageLinkLearnMore => 'Meer informatie';

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
      'Met de herstelcode kunt u weer toegang krijgen tot uw gegevens als de schijf niet kan worden ontgrendeld tijdens het opstarten. Bewaar deze op een veilige plek.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'De herstelcode stelt je in staat om weer toegang te krijgen tot je gegevens als de schijf tijdens het opstarten niet ontgrendeld kan worden. Bewaar het op een veilige plaats. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Meer informatie over hardwarematige versleutelingen';

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
  String get diskEncryptionPageAddPinButton => 'Voeg PIN toe...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Voeg wachtwoord toe...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Voeg wachtwoord toe';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Voeg PIN toe';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'De PIN is nodig elke keer de computer wordt heropgestart. De PIN kan verschillen van het gebruikerswachtwoord.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Als de PIN vergeten wordt, kan de schijf nogsteeds ontgrendeld worden met de herstelcode.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Dit wachtwoord is nodig elke keer de computer wordt heropgestart. Dit wachtwoord kan verschillen van het gebruikerswachtwoord.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Bij verlies van dit wachtwoord kan de schijf ontgrendeld worden met de herstelcode.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Extra beveiliging';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Een PIN of wachtwoord kan worden ingesteld voor extra beveiliging. Deze moet worden ingevoerd telkens de computer wordt heropgestart.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Meer info';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Toevoegen';

  @override
  String get diskEncryptionPageRemovePinButton => 'Verwijder PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Verwijder wachtwoord...';

  @override
  String get diskEncryptionPageAddingPin =>
      'PIN aan het toevoegen, dit kan even duren...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Wachtwoord aan het toevoegen, dit kan even duren...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PIN aan het verwijderen, dit kan even duren...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Wachtwoord aan het verwijderen, dit kan even duren...';

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
      'Het wachtwoord moet ingevoerd worden telkens de computer wordt heropgestart.';

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
      'U moet uw pincode invoeren tijdens het opstarten om de schijf te ontgrendelen.';

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
      'Ubuntu Pro is niet beschikbaar voor deze Ubuntu-versie';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro werkt alleen met LTS-versies';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro wordt niet ondersteund door de huidige snapd-versie';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Update snapd om Ubuntu Pro te beheren';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro is ingeschakeld';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Beveiliging en compliance van enterpriseniveau voor uw computer. Altijd gratis voor persoonlijk gebruik. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Meer info over Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Ubuntu Pro inschakelen';

  @override
  String get ubuntuProEnableMagic => 'Inschakelen met Ubuntu One-account';

  @override
  String get ubuntuProEnableMagicSubtitle => 'Accounts aanmaken is gratis';

  @override
  String get ubuntuProMagicPrompt =>
      'Log in met een Ubuntu One-account, of maak er gratis een aan.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Verdergaan in browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Of log in op $attachLink en vul de code $attachCode in';
  }

  @override
  String get ubuntuProMagicError =>
      'Er ging iets fout bij het inschakelen van Ubuntu Pro, probeer het opnieuw';

  @override
  String get ubuntuProEnableToken => 'Inschakelen met behulp van een token';

  @override
  String get ubuntuProEnableTokenError =>
      'Er ging iets fout bij het inschakelen van Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Van uw IT-administrator of van $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Krijg een Ubuntu Pro-token van uw administrator of van $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Ubuntu Pro Uitzetten';

  @override
  String get ubuntuProDisable => 'Uitschakelen';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro uitschakelen verbreekt de verbinding tussen uw abonnement en dit apparaat. Wilt u verdergaan?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Inschakelen';

  @override
  String get ubuntuProCancel => 'Annuleren';

  @override
  String get ubuntuProFeatureEnableError =>
      'Kon de functie niet inschakelen, probeer het opnieuw.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Kon de functie niet uitschakelen, probeer het opnieuw.';

  @override
  String get ubuntuProCompliance => 'Compliance en verharding';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Enkel aanbevolen om te assisteren bij FedRAMP, HIPAA en andere compliance- en verhardingseisen.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Beveiligingshandboek (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiseert verharding en controles met het CIS benchmark en DISA-STIG profielen terwijl het omgevingsspecifieke aanpassingen mogelijk houdt.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Een cryptografische modulecertificaat of compliance met de FIPS 140-2 gegevensbeschermingsstandaard uitgegeven door de Amerikaanse en Canadese overheden.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'FIPS Inschakelen';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS inschakelen kan niet worden teruggedraaid en Livepatch wordt permanent uitgeschakeld.';

  @override
  String get ubuntuProComplianceFIPSPrompt => 'Kies je voorkeurs-FIPS-optie';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS met updates';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installeert FIPS 140-2 gevalideerde pakketten en staat normale beveiligingsupdates toe.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS zonder updates';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installeert FIPS 140-2 gevalideerde pakketten. Deze worden niet geüpdatet tot de volgende certificatie.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Beveiligingscompliance documentatie';

  @override
  String get ubuntuProESMTitle => 'Uitgebreid Beveiligingsonderhoud (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM biedt 10 jaar lang beveiligingspatches voor het gehele Ubuntu-archief. Krijg continu kwetsbaarheidsbeheer voor kritieke, hoge en geselecteerde middelgrote CVE\'s.';

  @override
  String get ubuntuProESMMainTitle => 'Hoofdpakketten (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Beveiligingsupdates voor Ubuntu hoofdpakketten tot $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe-pakketten (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Extra beveiligingsupdates voor Ubuntu Universe-pakketten tot $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Livepatch Inschakelen';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Pas kernelbeveiligingsupdates toe terwijl het systeem opstaat';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Toon Livepatch-status in de balk bovenaan';
}
