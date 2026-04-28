// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Andmeturbekeskus';

  @override
  String get snapdRuleCategorySessionAllowed => 'Luba kuni väljalogimiseni';

  @override
  String get snapdRuleCategorySessionDenied => 'Keela kuni väljalogimiseni';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Luba alati';

  @override
  String get snapdRuleCategoryForeverDenied => 'Keela alati';

  @override
  String get snapPermissionReadLabel => 'Lugemine';

  @override
  String get snapPermissionWriteLabel => 'Kirjutamine';

  @override
  String get snapPermissionExecuteLabel => 'Käivitamine';

  @override
  String get snapPermissionAccessLabel => 'Õigused';

  @override
  String get snapPermissionsEnableTitle =>
      'Eelda, et rakendused küsivad operatsioonisüsteemilt õigusi';

  @override
  String get snapPermissionsEnableWarning =>
      'See on katseline funktsionaalsus, mis võimaldab kontrollida ligipääsu süsteemiressurssidele.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Lülitan sisse, selleks võib kuluda mõni sekund...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Lülitan välja, selleks võib kuluda mõni sekund...';

  @override
  String get snapPermissionsExperimentalLabel => 'Katseline';

  @override
  String get snapPermissionsOtherDescription =>
      'Muid õigusi saad hallata valikust „Sätted › Rakendused“.';

  @override
  String get snapPermissionsPageTitle => 'Rakenduste õigused';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reeglit',
      one: '1 reegel',
      zero: 'reeglid on määratlemata',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Halda „$snap“ paketi õigusi „$interface“ liidese kasutamisel.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Reeglid on veel määratlemata';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Ainsamgi rakendus pole veel luba küsinud';

  @override
  String get snapRulesRemoveAll => 'Eemalda kõik reeglid';

  @override
  String get snapRulesResetAllPermissions => 'Nulli kõik õigused';

  @override
  String get homeInterfacePageTitle => 'Kodukaust';

  @override
  String get homeInterfacePageDescription =>
      'Halda failide ligipääsuõigusi kodukaustas.';

  @override
  String get cameraInterfacePageTitle => 'Kaamera';

  @override
  String get cameraInterfacePageDescription =>
      'Luba rakendustel kasutada arvuti/nutiseadme kaameraid.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Luba rakendustel kasutada arvuti/nutiseadme mikrofone.';

  @override
  String get interfacePageTitle => 'Halda õigusi';

  @override
  String get interfacePageDescription =>
      'Kui rakendus töötab rangelt seadistatud eraldatud konteineris, siis ta peab sult enne failide ja kaustade avamist luba küsima. See funktsionaalsus on veel katsejärgus ning selles võib tekkida muudatusi.';

  @override
  String get interfacePageLinkLearnMore => 'Loe lisaks';

  @override
  String get interfacePageLinkGiveFeedback => 'Jaga tagasisidet';

  @override
  String get interfacePageLinkReportIssues => 'Teata veast või problemist';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rakendust',
      one: '1 rakendus',
      zero: 'ühtegi rakendust pole seadistatud',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Andmekandja krüptimine';

  @override
  String get diskEncryptionPageRecoveryKey => 'Taastevõti';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Kui andmekandja dekrüptimine käivitamisel ei õnnestu, siis selle taastevõtmega saad taastada ligipääsu oma andmetele. Hoia taastevõtit turvaliselt kas moodsas digitaalses salasõnalaekas või vana kooli seifis.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Taastevõti võimaldab sul tagada ligipääsu oma andmetele, kui andmekandja lukustuse eemaldamine arvuti käivitamisel ei toimi. Salvesta ta turvaliselt kas digitaalses salasõnalaekas või vana kooli seifis. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Lisateave raudvaralise krüptimise kohta';

  @override
  String get diskEncryptionPageCheckKey => 'Kontrolli taastevõtit...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'Kontrolli taastevõtit';

  @override
  String get diskEncryptionPageCheck => 'Kontrolli';

  @override
  String get diskEncryptionPageValidKey => 'Kehtiv võti';

  @override
  String get diskEncryptionPageInvalidKey => 'Vigane võti';

  @override
  String get diskEncryptionPageEnterKey => 'Palun sisesta oma taastevõti';

  @override
  String get diskEncryptionPageKeyWorks => 'Taastevõti on kasutatav';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Hoia taastevõtit turvaliselt kas moodsas digitaalses salasõnalaekas või vana kooli seifis.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Taastevõti ei ole kasutatav';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Kontrolli võtme õigsust või asenda ta uuega.';

  @override
  String get diskEncryptionPageError => 'Viga';

  @override
  String get diskEncryptionPageReplaceButton => 'Asenda taastevõti...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Asenda taastevõti';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Palun salvesta uus taastevõti turvaliselt kas digitaalses salasõnalaekas või vana kooli seifis. Peale muutmist sa ei saa vana taastevõtit enam kasutada.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Näita QR-koodi';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Salvesta failina';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ma olen oma taastevõtme turvaliselt salvestanud';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Asenda';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Loobu';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Taastevõti on asendatud';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Hoia taastevõtit turvaliselt kas moodsas digitaalses salasõnalaekas või vana kooli seifis.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Taastevõtme asendamine ei õnnestunud';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Taastevõtme asendamisel läks midagi valesti ja sinu vana võti on jätkuvalt kehtiv.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Töölaud - Krüptimise taastevõti';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Taastevõtme kopeerimiseks ja turvaliseks talletamiseks skaneeri seda QR-koodi. Turvaliseks salvestamiseks sobib digitaalne salasõnahaldur. Hilisemaks töötlemiseks võid teda pildistada.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Kopeerisin lõikelauale';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopeeri';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Krüptimise seadistused pole saadaval';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Selle arvuti krüptimise oleku tuvastamine ei õnnestunud.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Sinu arvuti raudavara TPM-i mooduli seadistus on mittetoetatud olekus.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Sinu arvuti snapd versioon pole toetatud';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Palun kontrolli, et Andmeturbekeskus ja snapd oleks uuendatud.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Andmeturbekeskus ei suuda luua ühendust snapd teenuse liidesega';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Vea parandamiseks käivita terminalis järgnev käsk:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Lisa PIN-kood...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Lisa salafraas...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Lisa salafraas';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Lisa PIN-kood';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Andmekandja dekrüptimiseks pead oma arvuti käivitamisel alati sisestama oma PIN-koodi. See PIN-kood on erinev sinu kasutaja salasõnast.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Kui unustad oma PIN-koodi, siis taastevõtme abil saad taastada ligipääsu oma andmekandjale.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Andmekandja dekrüptimiseks pead oma arvuti käivitamisel alati sisestama oma salafraasi. See salafraas on erinev sinu kasutaja salasõnast.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Kui unustad oma salafraasi, siis taastevõtme abil saad taastada ligipääsu oma andmekandjale.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Täiendav turvalisus';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Täiendava turvalisuse huvides võis lisada salafraasi või PIN-koodi. Andmekandja dekrüptimiseks pead oma arvuti käivitamisel selle alati sisestama.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Lisateave';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Lisa';

  @override
  String get diskEncryptionPageRemovePinButton => 'Eemalda PIN-kood...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Eemalda salafraas...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Lisan PIN-koodi, selleks võib kuluda mõni sekund...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Lisan salafraasi, selleks võib kuluda mõni sekund...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Eemaldan PIN-koodi, selleks võib kuluda mõni sekund...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Eemaldan salafraasi, selleks võib kuluda mõni sekund...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Taastevõtme fail pole salvestatud';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Taastevõtit ei saa salvestada ajutisse asukohta';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Tundmatu viga';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Taastevõtme salvestamine faili ei õnnestunud';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Sul pole õigusi sellesse asukohta kirjutamiseks.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Sul puuduvad õigused sellesse kausta kirjutamiseks. Proovi muud asukohta või kasuta muud meetodit.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Proovi kasutada muud asukohta, näiteks eemaldatavat andmekandjat või muud meetodit.';

  @override
  String get recoveryKeyFilePickerTitle => 'Salvesta taastevõti failina';

  @override
  String get recoveryKeyFilePickerFilter => 'Tekstifailid';

  @override
  String get recoveryKeyTPMEnabled => 'Kasutusel on raudvarapõhine krüptimine';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Krüptovõtmed on salvestatud sinu arvuti TPM-is (Trusted Platform Module).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Lisateave riistvarapõhise krüptimise kohta';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Kasutusel on krüptimise salafraas';

  @override
  String get recoveryKeyPassphraseHeader => 'Muuda salafraasi';

  @override
  String get recoveryKeyPassphraseBody =>
      'Andmekandja dekrüptimiseks pead oma arvuti käivitamisel alati sisestama salafraasi.';

  @override
  String get recoveryKeyPassphraseButton => 'Muuda salafraasi...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Senine salafraas';

  @override
  String get recoveryKeyPassphraseNew => 'Uus salafraas';

  @override
  String get recoveryKeyPassphraseConfirm => 'Korda salafraasi';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Vigane salafraas, palun proovi uuesti';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Peab olema vähemalt 4 tähemärki pikk';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Salafraasid ei klapi omavahel, palun proovi uuesti';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Muuda salafraasi';

  @override
  String get recoveryKeyPinEnabled => 'Kasutusel on krüptimise PIN-kood';

  @override
  String get recoveryKeyPinHeader => 'Krüptimise PIN-kood';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Krüptimise salafraas';

  @override
  String get recoveryKeyPinBody =>
      'Andmekandja dekrüptimiseks pead oma arvuti käivitamisel alati sisestama oma PIN-koodi.';

  @override
  String get recoveryKeyPinButton => 'Muuda PIN-koodi...';

  @override
  String get recoveryKeyPinCurrent => 'Senine PIN-kood';

  @override
  String get recoveryKeyPinNew => 'Uus PIN-kood';

  @override
  String get recoveryKeyPinConfirm => 'Korda PIN-koodi';

  @override
  String get recoveryKeyPinCurrentError =>
      'Vigane PIN-kood, palun proovi uuesti';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-koodid ei klapi omavahel, palun proovi uuesti';

  @override
  String get recoveryKeyPinDialogHeader => 'Muuda PIN-koodi';

  @override
  String get recoveryKeyPassphraseShow => 'Näita';

  @override
  String get recoveryKeyPassphraseHide => 'Peida';

  @override
  String get recoveryKeyPassphraseChange => 'Muuda';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-kood on uuendatud';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Sinu PIN-koodi muutmine õnnestus.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Salafraas on uuendatud';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Sinu salafraasi muutmine õnnestus.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Salafraas on kehv, palun muuda ta pikemaks ja keerukamaks';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Salafraas on juba täitsa hea, parema turvalisuse nimel palun muuda ta pikemaks ja keerukamaks';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Salafraas on korralik';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN-kood on kehv, palun muuda ta pikemaks ja vähem ennustatavaks';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN-kood on juba täitsa hea, parema turvalisuse nimel palun muuda ta pikemaks ja vähem ennustatavaks';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-kood on piisavalt pikk';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Midagi läks valesti';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro pole selle Ubuntu versiooni jaoks saadaval';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro eeldab, et kasutusel on LTS-versioon';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro pole selle snapd versiooni puhul toetatud';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ubuntu Pro halldamiseks uuenda snapd teenust';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro on kasutusel';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Suurettevõtte tasemel turvalisus ja vastavus sinu arvutile. Isiklikuks kasutuseks alatiseks tasuta saadaval. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Lisateave Ubuntu Pro kohta';

  @override
  String get ubuntuProEnablePro => 'Võta Ubuntu Pro kasutusele';

  @override
  String get ubuntuProEnableMagic => 'Kasuta Ubuntu One konto alusel';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Sa saad lisada tasuta kasutajakonto';

  @override
  String get ubuntuProMagicPrompt =>
      'Logi sisse oma Ubuntu One kasutajakontoga või lisa tasuta konto ja liitu selle teenusega.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Jätka veebibrauseris';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Sa võid ka siin $attachLink logida sisse ja sisestada $attachCode koodi';
  }

  @override
  String get ubuntuProMagicError =>
      'Ubuntu Pro kasutuselevõtmine ei õnnestu, palun proovi uuesti';

  @override
  String get ubuntuProEnableToken => 'Võta kasutusele tunnusloa abil';

  @override
  String get ubuntuProEnableTokenError =>
      'Võta Ubuntu Pro kasutusele või eemalda kasutuselt';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Kas oma IT-haldurilt või siit $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Küsi Ubuntu Pro tunnusluba (token) oma IT-haldurilt või siit $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Tunnusluba';

  @override
  String get ubuntuProDisablePro => 'Eemalda Ubuntu Pro kasutuselt';

  @override
  String get ubuntuProDisable => 'Eemalda kasutuselt';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro kasutuselt eemaldamisel eemaldatakse sellest masinast ka vastav tellimus. Kas sa soovid jätkata?';

  @override
  String get ubuntuProEnable => 'Lülita sisse';

  @override
  String get ubuntuProCancel => 'Katkesta';

  @override
  String get ubuntuProFeatureEnableError =>
      'Funktsionaalsuse sisselülitamine ei õnnestunud, palun proovi uuesti.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Funktsionaalsuse väljalülitamine ei õnnestunud, palun proovi uuesti.';

  @override
  String get ubuntuProCompliance => 'Vastavusreeglid ja süsteemi tugevdamine';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Soovitatud kasutamiseks FedRAMP-i, HIPAA või muude sarnaste tugevdus- ja vastavusnõuete puhul.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Ubuntu turvajuhend (Ubuntu Security Guide - USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiseerib turvalisuse tugevdamist ja auditeerimist CIS-i võrdlusaluste ja DISA-STIG-profiilide abil, võimaldades samal ajal süsteemi keskkonnapõhiseid kohandusi.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'USA ja Kanada valitsuse poolt väljastatud krüptograafilise mooduli sertifikaat, mis tõendab vastavust andmekaitse standardile FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Võta FIPS kasutusele';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Kui võtad FIPS\'i kasutusele, siis seda ei saa tagasi pöörata ja Livepatch lülitatakse jäädavalt välja.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Vali oma soovitud FIPS-i eelistused';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'Uuendustega FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Paigaldab FIPS 140-2 vastavusega paketid ja võimaldab regulaarselt turvauuendusi teha.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'Ilma uuendusteta FIPS';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Paigaldab FIPS 140-2 vastavusega paketid, aga neid ei uuendata kuni järgmise kordussertifitseerimiseni.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Turvalisuse vastavusnõuete dokumentatsioon';

  @override
  String get ubuntuProESMTitle =>
      'Laiemad turvaparandused (Expanded Security Maintenance - ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM tagab 10 aastat turvaparandusi enam kui 25000-le avatud lähtekoodiga paketile. Saad oma arvutile pidevat haavatavuste haldamist kriitilise, kõrge ja keskmise riskitasemega CVE-de jaoks.';

  @override
  String get ubuntuProESMMainTitle => 'Main\'i paketid (esm-rakendused)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return '2300 Ubuntu Main\'i paketi täiendavad turvauuendused kuni $year. aastani';
  }

  @override
  String get ubuntuProESMUniverseTitle =>
      'Universe\'i paketid (esm-rakendused)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return '23000 Ubuntu Universe\'i paketi täiendavad turvauuendused kuni $year. aastani';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kerneli Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Võta Livepatch kasutusele';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Paigalda süsteemi kerneli turvauuendused töö ajal (i.e. ilma taaskäivitamata)';

  @override
  String get ubuntuProLivepatchShowTitle => 'Näita Livepatchi olekut ülaribal';
}
