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
  String get snapdRuleCategorySessionDenied => 'Odmietnuté do odhlásenia';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Vždy povolené';

  @override
  String get snapdRuleCategoryForeverDenied => 'Vždy odmietnuté';

  @override
  String get snapPermissionReadLabel => 'Čítanie';

  @override
  String get snapPermissionWriteLabel => 'Zápis';

  @override
  String get snapPermissionExecuteLabel => 'Spúšťanie';

  @override
  String get snapPermissionAccessLabel => 'Prístup';

  @override
  String get snapPermissionsEnableTitle => 'Vyžadovať systémové oprávnenia';

  @override
  String get snapPermissionsEnableWarning =>
      'Táto experimentálna funkcia slúži na riadenie prístupu k systémovým zdrojom.';

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
      'Ďalšie oprávnenia môžete spravovať v časti Nastavenia › Aplikácie.';

  @override
  String get snapPermissionsPageTitle => 'Oprávnenia aplikácie';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'pravidlá ($n)',
      one: 'pravidlo (1)',
      zero: 'žiadne pravidlá',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Spravujte oprávnenia k $interface pre $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Zatiaľ nie sú žiadne pravidlá';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Žiadne aplikácie zatiaľ nepožiadali o prístup';

  @override
  String get snapRulesRemoveAll => 'Odstrániť všetky pravidlá';

  @override
  String get snapRulesResetAllPermissions => 'Obnoviť všetky oprávnenia';

  @override
  String get homeInterfacePageTitle => 'Domovský priečinok';

  @override
  String get homeInterfacePageDescription =>
      'Spravujte oprávnenia na prístup k súborom v domovskom priečinku.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Povoliť aplikáciám prístup ku kamerám.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofón';

  @override
  String get microphoneInterfacePageDescription =>
      'Povoliť aplikáciám prístup k mikrofónu.';

  @override
  String get interfacePageTitle => 'Spravovať oprávnenia';

  @override
  String get interfacePageDescription =>
      'Aplikácie s prísnymi obmedzeniami budú žiadať o povolenie pred prístupom k súborom a priečinkom. Táto funkcia je experimentálna a môže sa meniť.';

  @override
  String get interfacePageLinkLearnMore => 'Zistiť viac';

  @override
  String get interfacePageLinkGiveFeedback => 'Poskytnúť spätnú väzbu';

  @override
  String get interfacePageLinkReportIssues => 'Nahlásiť problémy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'aplikácie ($n)',
      one: 'aplikácia (1)',
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
      'Obnovovací kľúč vám umožní znovu získať prístup k vašim údajom, ak sa disk počas spustenia nepodarí odomknúť. Uložte ho na bezpečné miesto.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Obnovovací kľúč vám umožní znovu získať prístup k údajom, ak sa disk nepodarí odomknúť pri spustení. Uložte ho na bezpečné miesto. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Zistiť viac o šifrovaní podporovanom hardvérom';

  @override
  String get diskEncryptionPageCheckKey => 'Skontrolovať obnovovací kľúč...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Kontrola obnovovacieho kľúča';

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
      'Nezabudnite ho uložiť na bezpečné miesto.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Obnovovací kľúč nefunguje';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Skontrolujte kľúč alebo ho nahraďte novým.';

  @override
  String get diskEncryptionPageError => 'Chyba';

  @override
  String get diskEncryptionPageReplaceButton => 'Vymeniť obnovovací kľúč...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Vymeniť obnovovací kľúč';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Uložte nový obnovovací kľúč na bezpečné miesto. Po jeho výmene už nebudete môcť používať starý kľúč.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Zobraziť QR kód';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Uložiť do súboru';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Uložil(a) som svoj obnovovací kľúč na bezpečné miesto';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Nahradiť';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Zahodiť';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Obnovovací kľúč bol vymenený';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Nezabudnite ho uložiť na bezpečné miesto.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Nepodarilo sa vymeniť obnovovací kľúč';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Pri výmene obnovovacieho kľúča nastala chyba, váš starý kľúč zostáva platný.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop – obnovovací kľúč pre šifrovanie';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Naskenujte QR kód na skopírovanie obnovovacieho kľúča a uložte ho na bezpečné miesto, napríklad do správcu hesiel. Môžete si tiež vytvoriť fotku obrazovky na neskoršie použitie.';

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
      'Aby ste to opravili, spustite tento príkaz v termináli:';

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
      'PIN budete musieť zadať pri každom spustení počítača. Tento PIN sa líši od vášho používateľského hesla.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Ak zabudnete svoj PIN, môžete znovu získať prístup k disku pomocou obnovovacieho kľúča.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Prístupovú frázu budete musieť zadať pri každom spustení počítača. Táto prístupová fráza sa líši od vášho používateľského hesla.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Ak zabudnete svoju prístupovú frázu, môžete znovu získať prístup k disku pomocou obnovovacieho kľúča.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Dodatočné zabezpečenie';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Pre zvýšenie zabezpečenia si môžete nastaviť prístupovú frázu alebo PIN. Budete ju musieť zadať pri každom spustení počítača.';

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
      'Súbor s obnovovacím kľúčom nebol uložený';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Súbor s obnovovacím kľúčom sa nedá uložiť do dočasného priečinka';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Neznáma chyba';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nepodarilo sa uložiť obnovovací kľúč do súboru';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nemáte oprávnenie zapisovať do tohto umiestnenia súboru.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nemáte oprávnenie zapisovať do tohto priečinka. Skúste iné umiestnenie alebo použite inú metódu.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Skúste iné umiestnenie, napríklad vymeniteľnú jednotku, alebo použite inú metódu.';

  @override
  String get recoveryKeyFilePickerTitle => 'Uložiť súbor obnovovacieho kľúča';

  @override
  String get recoveryKeyFilePickerFilter => 'Textové súbory';

  @override
  String get recoveryKeyTPMEnabled =>
      'Hardvérom podporované šifrovanie je zapnuté';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Šifrovacie kľúče sú uložené v Trusted Platform Module (TPM) vášho počítača.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Zistiť viac o šifrovaní podporovanom hardvérom';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Šifrovanie prístupovou frázou je zapnuté';

  @override
  String get recoveryKeyPassphraseHeader => 'Zmena prístupovej frázy';

  @override
  String get recoveryKeyPassphraseBody =>
      'Prístupovú frázu budete musieť zadať pri každom spustení počítača.';

  @override
  String get recoveryKeyPassphraseButton => 'Zmeniť prístupovú frázu...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Aktuálna prístupová fráza';

  @override
  String get recoveryKeyPassphraseNew => 'Nová prístupová fráza';

  @override
  String get recoveryKeyPassphraseConfirm => 'Potvrďte prístupovú frázu';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Nesprávna prístupová fráza, skúste to znova';

  @override
  String get recoveryKeyPassphraseNewError => 'Musí mať najmenej 4 znaky';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Prístupové frázy sa nezhodujú, skúste to znova';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Zmena prístupovej frázy';

  @override
  String get recoveryKeyPinEnabled => 'Šifrovací PIN je zapnutý';

  @override
  String get recoveryKeyPinHeader => 'Šifrovací PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Šifrovacia prístupová fráza';

  @override
  String get recoveryKeyPinBody =>
      'PIN budete musieť zadať pri každom spustení počítača.';

  @override
  String get recoveryKeyPinButton => 'Zmeniť PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Aktuálny PIN';

  @override
  String get recoveryKeyPinNew => 'Nový PIN';

  @override
  String get recoveryKeyPinConfirm => 'Potvrďte PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Nesprávny PIN, skúste to znova';

  @override
  String get recoveryKeyPinConfirmError => 'PINy sa nezhodujú, skúste to znova';

  @override
  String get recoveryKeyPinDialogHeader => 'Zmena PIN';

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
      'Slabá prístupová fráza, vytvorte ju dlhšiu alebo zložitejšiu';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Priemerná prístupová fráza, vytvorte ju dlhšiu alebo zložitejšiu kvôli vyššej bezpečnosti';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Silná prístupová fráza';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Slabý PIN, vytvorte ho dlhší alebo menej predvídateľný';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Priemerný PIN, vytvorte ho dlhší alebo menej predvídateľný pre lepšiu bezpečnosť';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN je dostatočne dlhý';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Niečo sa pokazilo';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro nie je dostupné pre túto verziu Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro vyžaduje LTS vydanie';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro nie je podporované touto verziou snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Aktualizujte snapd, aby bolo možné spravovať Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro je aktivované';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Zabezpečenie podnikovej úrovne a dodržiavanie štandardov pre váš počítač. Vždy zadarmo na osobné použitie. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Zistiť viac o Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Aktivovať Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Aktivovať pomocou účtu Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle => 'Účet si môžete vytvoriť zadarmo';

  @override
  String get ubuntuProMagicPrompt =>
      'Prihláste sa pomocou účtu Ubuntu One alebo si ho zadarmo vytvorte.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Pokračovať v prehliadači';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Môžete sa tiež prihlásiť na $attachLink a zadať kód $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Nepodarilo sa aktivovať Ubuntu Pro, prosím, skúste to znova';

  @override
  String get ubuntuProEnableToken => 'Aktivovať pomocou tokenu';

  @override
  String get ubuntuProEnableTokenError => 'Nepodarilo sa aktivovať Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Od vášho IT administrátora alebo z $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Získajte token Ubuntu Pro od vášho administrátora alebo z $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Deaktivovať Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Deaktivovať';

  @override
  String get ubuntuProDisablePrompt =>
      'Deaktivovaním Ubuntu Pro sa toto zariadenie odpojí od vášho predplatného. Chcete pokračovať?';

  @override
  String get ubuntuProEnable => 'Aktivovať';

  @override
  String get ubuntuProCancel => 'Zrušiť';

  @override
  String get ubuntuProFeatureEnableError =>
      'Funkciu sa nepodarilo aktivovať, prosím, skúste to znova.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Funkciu sa nepodarilo deaktivovať, prosím, skúste to znova.';

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
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140‑2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Certifikácia kryptografických modulov podľa štandardu FIPS 140‑2 používaná vládami USA a Kanady.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Aktivovať FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Aktivácia FIPS je nevratná a Livepatch bude natrvalo deaktivovaný.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Vyberte preferovanú možnosť FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS s aktualizáciami';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Nainštaluje balíky validované podľa FIPS 140‑2 a umožní pravidelné bezpečnostné aktualizácie.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS bez aktualizácií';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Nainštaluje balíky validované podľa FIPS 140‑2, ktoré sa nebudú aktualizovať až do ďalšej recertifikácie.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentácia k bezpečnostným štandardom';

  @override
  String get ubuntuProESMTitle => 'Rozšírená údržba zabezpečenia (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM poskytuje 10 rokov bezpečnostných aktualizácií pre viac než 25 000 open‑source balíkov a priebežnú správu zraniteľností pre kritické, vysoké a stredné CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Hlavné balíky (esm‑infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Bezpečnostné aktualizácie pre 2 300 balíkov z Ubuntu Main do roku $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Balíky Universe (esm‑apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Dodatočné bezpečnostné aktualizácie pre viac než 23 000 balíkov z Ubuntu Universe do roku $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Aktivovať Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplikovať bezpečnostné aktualizácie jadra počas behu systému';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Zobraziť stav Livepatch v hornej lište';
}
