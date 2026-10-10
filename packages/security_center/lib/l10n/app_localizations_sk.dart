// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Centrum zabezpečenia';

  @override
  String get snapdRuleCategorySessionAllowed => 'Povolené do odhlásenia';

  @override
  String get snapdRuleCategorySessionDenied => 'Zamietnuť do odhlásenia';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Vždy povoliť';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Aktualizovať povolenia';

  @override
  String get snapdRuleCategoryForeverDenied => 'Vždy zamietnuť';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Povoliť dočasne';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Dočasne zamietnuť';

  @override
  String get snapdRuleCategoryAskAlways => 'Vždy sa pýtať';

  @override
  String get snapPermissionReadLabel => 'Čítanie';

  @override
  String get snapPermissionWriteLabel => 'Zapisovanie';

  @override
  String get snapPermissionExecuteLabel => 'Spúšťanie';

  @override
  String get snapPermissionAccessLabel => 'Pristupovanie';

  @override
  String get snapPermissionsEnableTitle =>
      'Vyžadovať, aby izolované aplikácie žiadali o povolenia';

  @override
  String get snapPermissionsEnableWarning =>
      'Toto je experimentálna funkcia na riadenie prístupu k zdrojom vášho systému.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Aktivuje sa, môže to trvať niekoľko sekúnd...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Deaktivuje sa, môže to trvať niekoľko sekúnd...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentálne';

  @override
  String get snapPermissionsOtherDescription =>
      'Ďalšie povolenia môžete spravovať v časti Nastavenia › Aplikácie.';

  @override
  String get snapPermissionsPageTitle => 'Povolenia aplikácií';

  @override
  String get snapPermissionsErrorTitle => 'Niečo sa pokazilo';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n pravidiel',
      few: '$n pravidlá',
      one: '1 pravidlo',
      zero: 'žiadne pravidlá',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Spravujte povolenia $interface pre $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Zatiaľ žiadne pravidlá';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Zatiaľ o prístup nežiadali žiadne aplikácie';

  @override
  String get snapRulesRemoveAll => 'Odstrániť všetky pravidlá';

  @override
  String get snapRulesResetAllPermissions => 'Obnoviť všetky povolenia';

  @override
  String get homeInterfacePageTitle => 'Domovský priečinok';

  @override
  String get homeInterfacePageDescription =>
      'Spravujte povolenia na prístup k súborom vo vašom domovskom priečinku.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Povoľte aplikáciám prístup k vašim kamerám.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofón';

  @override
  String get microphoneInterfacePageDescription =>
      'Povoľte aplikáciám prístup k vášmu mikrofónu.';

  @override
  String get interfacePageTitle => 'Spravovať povolenia';

  @override
  String get interfacePageLinkLearnMore => 'Zistiť viac';

  @override
  String get interfacePageLinkReportIssues => 'Nahlásiť problémy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikácií',
      few: '$n aplikácie',
      one: '1 aplikácia',
      zero: 'žiadne aplikácie',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Šifrovanie disku';

  @override
  String get diskEncryptionPageRecoveryKey => 'Obnovovací kľúč';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Obnovovací kľúč vám umožní získať späť prístup k vašim údajom, ak sa disk počas spúšťania nepodarí odomknúť. Uložte ho na bezpečné miesto.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Obnovovací kľúč vám umožní získať späť prístup k vašim údajom, ak sa disk počas spúšťania nepodarí odomknúť. Uložte ho na bezpečné miesto. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Zistiť viac o hardvérovom šifrovaní';

  @override
  String get diskEncryptionPageCheckKey => 'Skontrolovať obnovovací kľúč...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Skontrolovať obnovovací kľúč';

  @override
  String get diskEncryptionPageCheck => 'Skontrolovať';

  @override
  String get diskEncryptionPageValidKey => 'Platný kľúč';

  @override
  String get diskEncryptionPageInvalidKey => 'Neplatný kľúč';

  @override
  String get diskEncryptionPageEnterKey => 'Zadajte svoj obnovovací kľúč';

  @override
  String get diskEncryptionPageKeyWorks => 'Obnovovací kľúč funguje';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Nezabudnite si ho uschovať na bezpečnom mieste.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Obnovovací kľúč nefunguje';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Skontrolujte kľúč alebo ho vymeňte za nový.';

  @override
  String get diskEncryptionPageError => 'Chyba';

  @override
  String get diskEncryptionPageReplaceButton => 'Nahradiť obnovovací kľúč...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Nahradiť obnovovací kľúč';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Uložte nový obnovovací kľúč na bezpečné miesto. Po jeho nahradení už nebudete môcť používať starý kľúč.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Zobraziť QR kód';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Uložiť do súboru';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Uložil som svoj obnovovací kľúč na bezpečné miesto';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Nahradiť';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Zahodiť';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Obnovovací kľúč bol nahradený';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Nezabudnite si ho uschovať na bezpečnom mieste.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Výmena obnovovacieho kľúča zlyhala';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Pri nahrádzaní vášho obnovovacieho kľúča sa vyskytla chyba, váš starý kľúč zostane platný.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Obnovovací kľúč šifrovania';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Naskenujte QR kód a skopírujte obnovovací kľúč, potom ho uložte na bezpečné miesto, napríklad do správcu hesiel. Na neskoršie použitie si môžete urobiť aj fotografiu.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Skopírované do schránky';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopírovať';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Nastavenia šifrovania nie sú k dispozícii';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Nepodarilo sa získať stav šifrovania tohto počítača.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Konfigurácia TPM vášho počítača nie je v podporovanom stave.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Vaša verzia snapd nie je podporovaná';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Skontrolujte, či sú Centrum zabezpečenia a snapd aktualizované.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Centrum zabezpečenia sa nemôže pripojiť k rozhraniu snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Ak to chcete opraviť, spustite v termináli tento príkaz:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Pridať PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Pridať prístupovú frázu...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Pridať prístupovú frázu';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Pridať PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Pri každom spustení počítača budete musieť zadať svoj kód PIN. Tento kód PIN je iný ako vaše heslo používateľa.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Ak zabudnete svoj kód PIN, môžete získať späť prístup k disku pomocou obnovovacieho kľúča.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Pri každom spustení počítača budete musieť zadať svoju prístupovú frázu. Táto prístupová fráza je iná ako vaše heslo používateľa.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Ak zabudnete svoju prístupovú frázu, môžete získať späť prístup k disku pomocou obnovovacieho kľúča.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Dodatočné zabezpečenie';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Pre dodatočné zabezpečenie môžete nastaviť prístupovú frázu alebo kód PIN. Budete ho musieť zadať pri každom spustení počítača.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Zistiť viac';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Pridať';

  @override
  String get diskEncryptionPageRemovePinButton => 'Odstrániť PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Odstrániť prístupovú frázu...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Pridáva sa PIN, môže to trvať niekoľko sekúnd...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Pridáva sa prístupová fráza, môže to trvať niekoľko sekúnd...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Odstraňuje sa PIN, môže to trvať niekoľko sekúnd...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Odstraňuje sa prístupová fráza, môže to trvať niekoľko sekúnd...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Súbor obnovovacieho kľúča nebol uložený';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Súbor obnovovacieho kľúča nie je možné uložiť do dočasného umiestnenia';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Neznáma chyba';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nepodarilo sa uložiť váš obnovovací kľúč do súboru';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nemáte povolenie na zápis do tohto umiestnenia súboru.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nemáte povolenie na zápis do tohto priečinka. Skúste iné umiestnenie alebo použite inú metódu.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Skúste iné umiestnenie, napríklad vymeniteľnú jednotku, alebo použite inú metódu.';

  @override
  String get recoveryKeyFilePickerTitle => 'Uložiť súbor obnovovacieho kľúča';

  @override
  String get recoveryKeyFilePickerFilter => 'Textové súbory';

  @override
  String get recoveryKeyTPMEnabled => 'Hardvérové šifrovanie je povolené';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Šifrovacie kľúče sú uložené v module Trusted Platform Module (TPM) vášho počítača.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Zistiť viac o šifrovaní s hardvérovou podporou';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Šifrovacia prístupová fráza je povolená';

  @override
  String get recoveryKeyPassphraseHeader => 'Zmeniť prístupovú frázu';

  @override
  String get recoveryKeyPassphraseBody =>
      'Pri každom spustení počítača musíte zadať svoju prístupovú frázu.';

  @override
  String get recoveryKeyPassphraseButton => 'Zmeniť prístupovú frázu...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Aktuálna prístupová fráza';

  @override
  String get recoveryKeyPassphraseNew => 'Nová prístupová fráza';

  @override
  String get recoveryKeyPassphraseConfirm => 'Potvrdiť prístupovú frázu';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Nesprávna prístupová fráza, skúste to znova';

  @override
  String get recoveryKeyPassphraseNewError => 'Musí mať aspoň 4 znaky';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Prístupové frázy sa nezhodujú, skúste to znova';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Zmeniť prístupovú frázu';

  @override
  String get recoveryKeyPinEnabled => 'Šifrovací PIN je zapnutý';

  @override
  String get recoveryKeyPinHeader => 'Šifrovací PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Šifrovacia prístupová fráza';

  @override
  String get recoveryKeyPinBody =>
      'Pri každom spustení počítača musíte zadať svoj PIN.';

  @override
  String get recoveryKeyPinButton => 'Zmeniť PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Aktuálny PIN';

  @override
  String get recoveryKeyPinNew => 'Nový PIN';

  @override
  String get recoveryKeyPinConfirm => 'Potvrdiť PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Nesprávny PIN, skúste to znova';

  @override
  String get recoveryKeyPinConfirmError => 'PINy sa nezhodujú, skúste to znova';

  @override
  String get recoveryKeyPinDialogHeader => 'Zmeniť PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Zobraziť';

  @override
  String get recoveryKeyPassphraseHide => 'Skryť';

  @override
  String get recoveryKeyPassphraseChange => 'Zmeniť';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN aktualizovaný';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Váš PIN bol úspešne aktualizovaný.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Prístupová fráza aktualizovaná';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Vaša prístupová fráza bola úspešne aktualizovaná.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Slabá prístupová fráza, predĺžte ju alebo ju urobte zložitejšou';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Prijateľná prístupová fráza, pre lepšie zabezpečenie ju predĺžte alebo urobte zložitejšou';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Silná prístupová fráza';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Slabý PIN, predĺžte ho alebo ho urobte menej predvídateľným';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Prijateľný PIN, pre lepšie zabezpečenie ho predĺžte alebo urobte menej predvídateľným';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN je dostatočne dlhý';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Niečo sa pokazilo';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro nie je pre túto verziu Ubuntu k dispozícii';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro vyžaduje vydanie LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Táto verzia snapd nepodporuje Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Aktualizujte snapd na správu Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro je povolené';

  @override
  String get ubuntuProLoadingLabel => 'Môže to trvať niekoľko sekúnd...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Bezpečnosť a dodržiavanie predpisov na podnikovej úrovni pre váš počítač. Vždy zadarmo pre osobné použitie. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Zistiť viac o Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Povoliť Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Povoliť pomocou účtu Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Budete si môcť bezplatne vytvoriť účet';

  @override
  String get ubuntuProMagicPrompt =>
      'Prihláste sa pomocou svojho účtu Ubuntu One alebo si ho vytvorte zadarmo.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Pokračovať v prehliadači';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Môžete sa tiež prihlásiť na adrese $attachLink a zadať kód $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Nepodarilo sa povoliť Ubuntu Pro, skúste to znova';

  @override
  String get ubuntuProEnableToken => 'Povoliť pomocou tokenu';

  @override
  String get ubuntuProEnableTokenError => 'Nepodarilo sa povoliť Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Od vášho správcu IT alebo z $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Získajte token Ubuntu Pro od svojho správcu alebo z $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Zakázať Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Zakázať';

  @override
  String get ubuntuProDisablePrompt =>
      'Zakázanie Ubuntu Pro odpojí vaše predplatné od tohto počítača. Chcete pokračovať?';

  @override
  String get ubuntuProDisableError =>
      'Nepodarilo sa zakázať Ubuntu Pro, skúste to znova';

  @override
  String get ubuntuProEnable => 'Povoliť';

  @override
  String get ubuntuProCancel => 'Zrušiť';

  @override
  String get ubuntuProFeatureEnableError =>
      'Nepodarilo sa povoliť funkciu, skúste to znova.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Nepodarilo sa zakázať funkciu, skúste to znova.';

  @override
  String get ubuntuProCompliance => 'Dodržiavanie štandardov a hardening';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Odporúča sa iba na podporu požiadaviek FedRAMP, HIPAA a ďalších štandardov a hardeningu.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Sprievodca zabezpečením Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatizuje hardening a audit pomocou profilov CIS Benchmark a DISA‑STIG s možnosťou prispôsobenia pre konkrétne prostredie.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Certifikácia kryptografických modulov podľa štandardu FIPS 140-2 používaná vládami USA a Kanady.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Povoliť FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Povolenie FIPS nie je možné vrátiť späť a funkcia Livepatch bude trvalo zakázaná.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Vyberte preferovanú možnosť FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS s aktualizáciami';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Inštaluje balíky overené podľa FIPS 140-2 a umožňuje pravidelné bezpečnostné aktualizácie.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS bez aktualizácií';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Inštaluje balíky overené podľa FIPS 140-2. Tieto nebudú aktualizované až do ďalšej recertifikácie.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentácia o bezpečnostnom súlade';

  @override
  String get ubuntuProESMTitle => 'Rozšírená údržba zabezpečenia (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM poskytuje 10 rokov bezpečnostných záplat pre celý archív Ubuntu. Získajte nepretržitú správu zraniteľností pre kritické, vysoké a vybrané stredné CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Hlavné balíky (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Bezpečnostné aktualizácie pre hlavné balíky Ubuntu do roku $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Balíky Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Dodatočné bezpečnostné aktualizácie pre balíky Ubuntu Universe do roku $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Povoliť Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplikovať bezpečnostné aktualizácie jadra počas behu systému';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Zobraziť stav Livepatch v hornom paneli';
}
