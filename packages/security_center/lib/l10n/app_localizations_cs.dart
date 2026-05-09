// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Centrum zabezpečení';

  @override
  String get snapdRuleCategorySessionAllowed => 'Povolit do odhlášení';

  @override
  String get snapdRuleCategorySessionDenied => 'Zamítnout do odhlášení';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Vždy povolit';

  @override
  String get snapdRuleCategoryForeverDenied => 'Vždy zamítnout';

  @override
  String get snapPermissionReadLabel => 'Čtení';

  @override
  String get snapPermissionWriteLabel => 'Zápis';

  @override
  String get snapPermissionExecuteLabel => 'Spouštění';

  @override
  String get snapPermissionAccessLabel => 'Přístup';

  @override
  String get snapPermissionsEnableTitle =>
      'Vyžadovat, aby aplikace žádaly o oprávnění pro přístupy v systému';

  @override
  String get snapPermissionsEnableWarning =>
      'Toto je experimentální funkce pro řízení přístupu k prostředkům vašeho systému.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Aktivuje se – může to trvat několik sekund…';

  @override
  String get snapPermissionsDisablingLabel =>
      'Deaktivuje se – může to trvat několik sekund…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentální';

  @override
  String get snapPermissionsOtherDescription =>
      'Další oprávnění můžete spravovat v Nastavení › Aplikace.';

  @override
  String get snapPermissionsPageTitle => 'Oprávnění aplikací';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n pravidel',
      one: '1 pravidlo',
      zero: 'žádná pravidla',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Spravujte oprávnění $interface pro $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Zatím žádná pravidla';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Žádné aplikace zatím nežádaly o přístup';

  @override
  String get snapRulesRemoveAll => 'Odstranit všechna pravidla';

  @override
  String get snapRulesResetAllPermissions =>
      'Vráti veškerá oprávnění na výchozí hodnoty';

  @override
  String get homeInterfacePageTitle => 'Domovská složka';

  @override
  String get homeInterfacePageDescription =>
      'Spravujte oprávnění pro přístup k souborům ve své domovské složce.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Umožnit aplikacím přistupovat k vašim kamerám.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Umožnit aplikacím přistupovat k vašemu mikrofonu.';

  @override
  String get interfacePageTitle => 'Spravovat oprávnění';

  @override
  String get interfacePageDescription =>
      'Přísně omezené aplikace se vás před přístupem k souborům a složkám zeptají. Tato funkce je experimentální a podléhá změnám.';

  @override
  String get interfacePageLinkLearnMore => 'Dozvědět se více';

  @override
  String get interfacePageLinkGiveFeedback => 'Poskytnout zpětnou vazbu';

  @override
  String get interfacePageLinkReportIssues => 'Nahlásit problémy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikací',
      one: '1 aplikace',
      zero: 'žádné aplikace',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Šifrování disku';

  @override
  String get diskEncryptionPageRecoveryKey => 'Záchranný klíč';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Obnovovací klíč vám umožní získat zpět přístup k vašim datům v případě, že se nebude dařit je rozšifrovat před spouštěním systému. Uložte si ho někam bezpečně (mimo počítač).';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Obnovovací klíč vám umožní získat zpět přístup ke svým datům v případě, že se disk nepodaří odemknout při startu systému. Uložte si ho na bezpečné místo. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Zjistěte více o šifrování jištěné hardwarem';

  @override
  String get diskEncryptionPageCheckKey => 'Zkontrolovat záchranný klíč…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Zkontrolovat záchranný klíč';

  @override
  String get diskEncryptionPageCheck => 'Zkontrolovat';

  @override
  String get diskEncryptionPageValidKey => 'Platný klíč';

  @override
  String get diskEncryptionPageInvalidKey => 'Neplatný klíč';

  @override
  String get diskEncryptionPageEnterKey => 'Zadejte svůj záchranný klíč';

  @override
  String get diskEncryptionPageKeyWorks => 'Záchranný klíč funguje';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Pamatujte na to, uchovávat ho někde bezpečně (mimo počítač).';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Záchranný klíč nefunguje';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Zkontrolovat klíč nebo ho nahradit novým.';

  @override
  String get diskEncryptionPageError => 'Chyba';

  @override
  String get diskEncryptionPageReplaceButton => 'Nahradit záchranný klíč…';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Nahradit záchranný klíč';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Uložte si nový záchranný klíč někde bezpečně (mimo počítač). Původní klíč je od tohoto okamžiku už k ničemu.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Zobrazit QR kód';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Uložit do souboru';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Uložil/a jsem si svůj záchranný klíč někam bezpečně (mimo počítač)';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Nahradit';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Zahodit';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Záchranný klíč nahrazen';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Pamatujte na to uchovávat ho někde bezpečně (mimo počítač).';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Nahrazení záchranného klíče se nezdařilo';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Při nahrazování vašeho záchranného klíče se něco pokazilo – původní klíč proto zůstává v platnosti.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop – záchranný klíč k šifrování';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Naskenujte QR kód a zkopírujte si tak záchranný klíč někam bezpečně, například do správce hesel (mimo počítač). Je také možné si ho alespoň vyfotit.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Zkopírováno do schránky';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Zkopírovat';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Nastavení šifrování není k dispozici';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Nepodařilo se získat stav šifrování tohoto počítače.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Nastavení TPM počítače se nenachází v podporovaném stavu.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Vámi používaná verze snapd není podporována';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Zkontrolovat, že Centrum zabezpečení a snapd jsou aktuální.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Centru zabezpečení se nepodařilo připojit k rozhraní snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Opravíte to spuštěním tohoto příkazu v terminálu:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Přidat kód PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Přidat heslo....';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Přidat heslo';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Přidat kód PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Kód PIN budete muset zadávat vždy při zapínaní počítače. Tento PIN je odlišný od uživatelského hesla.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Pokud zapomenete svůj kód PIN, budete ho moci obnovit díky obnovovacímu klíči.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Budete muset zadávat vaše heslo při každém zapínaní počítače. Toto heslo je odlišné od uživatelského hesla.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Pokud zapomenete své heslo, budete moci obnovit přístup k disku díky obnovovacímu klíči.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Pokročilé zabezpečení';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Můžete nastavit PIN kód nebo heslo pro pokročilé zabezpečení. Budete ho muset zadávat při každém zapínaní vašeho zařízení.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Zjistit více';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Přidat';

  @override
  String get diskEncryptionPageRemovePinButton => 'Odstranit PIN kód...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Odstranit heslo...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Nastavuje se nový PIN kód, může to trvat pár sekund...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Nastavuje se nové heslo k disku, toto může pár sekund trvat...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Odebírám PIN kód, toto může pár sekund trvat...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Odebírám heslo, toto může pár sekund trvat...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Soubor se záchranným klíčem neuložen';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Soubor se záchranným klíčem nebylo možné uložit do dočasného umístění';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Neznámá chyba';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nepodařilo se uložit váš záchranný klíč do souboru';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nemáte oprávnění zapisovat do tohoto umístění souboru.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nemáte oprávnění zapisovat do této složky. Zkuste jiné umístění nebo použijte jinou metodu.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Zkuste jiné umístění, jako například vyjímatelný disk, nebo použijte jinou metodu.';

  @override
  String get recoveryKeyFilePickerTitle => 'Uložit soubor se záchranným klíčem';

  @override
  String get recoveryKeyFilePickerFilter => 'Textové soubory';

  @override
  String get recoveryKeyTPMEnabled =>
      'Šifrování obsluhované pomocí hardware je zapnuté';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Šifrovací klíče jsou uchovávány v modulu důvěryhodné platformy (TPM) počítače.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Zjistit víc o šifrování obsluhovaném hardwarem';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Šifrovací heslová fráze je zapnutá';

  @override
  String get recoveryKeyPassphraseHeader => 'Změnit heslovou frázi';

  @override
  String get recoveryKeyPassphraseBody =>
      'Svou heslovou frázi budete zadávat při každém spouštění systému (kvůli odemykání disku).';

  @override
  String get recoveryKeyPassphraseButton => 'Změnit heslovou frázi…';

  @override
  String get recoveryKeyPassphraseCurrent => 'Stávající heslová fráze';

  @override
  String get recoveryKeyPassphraseNew => 'Nová heslová fráze';

  @override
  String get recoveryKeyPassphraseConfirm => 'Potvrzení zadání heslové fráze';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Nesprávná heslová fráze – zkuste to znovu';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Je třeba, aby bylo dlouhé alespoň 4 znaky';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Zadání heslové fráze se neshodují – zkuste to znovu';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Změnit heslovou frázi';

  @override
  String get recoveryKeyPinEnabled => 'PIN k šifrování je zapnutý';

  @override
  String get recoveryKeyPinHeader => 'PIN k šifrování';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Šifrovací heslová fráze';

  @override
  String get recoveryKeyPinBody =>
      'Svůj PIN budete zadávat při každém spouštění systému (kvůli odemykání disku).';

  @override
  String get recoveryKeyPinButton => 'Změnit PIN…';

  @override
  String get recoveryKeyPinCurrent => 'Stávající PIN';

  @override
  String get recoveryKeyPinNew => 'Nový PIN';

  @override
  String get recoveryKeyPinConfirm => 'Potvrzení zadání PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Nesprávný PIN – zkuste to znovu';

  @override
  String get recoveryKeyPinConfirmError =>
      'Zadání PIN kódů se neshodují – zkuste to znovu';

  @override
  String get recoveryKeyPinDialogHeader => 'Změnit PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Zobrazit';

  @override
  String get recoveryKeyPassphraseHide => 'Skrýt';

  @override
  String get recoveryKeyPassphraseChange => 'Změnit';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN zaktualizován';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Váš PIN byl úspěšně zaktualizován.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Heslová fráze zaktualizována';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Vaše heslová fráze byla úspěšně zaktualizována.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Snadno prolomitelná heslová fráze – použijte delší a/nebo komplexnější';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Ucházející heslová fráze – zlepšete zabezpečení jejím prodloužením a/nebo přidáním komplexity';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Odolná heslová fráze';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Snadno prolomitelný PIN – přidejte mu na délce a/nebo ho změňte tak, aby bylo těžší ho uhodnout';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Ucházející PIN – prodlužte jeho délku a/nebo ho změňte tak, aby bylo těžší ho uhodnout';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN je dostatečně dlouhý';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Něco se pokazilo';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro není dostupné pro tuto verzi Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro vyžaduje LTS vydání';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro není podporováno touto verzí snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Pro správu Ubuntu Pro aktualizujte snapd';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro je povoleno';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Zabezpečení a shoda na podnikové úrovni pro váš počítač. Vždy zdarma pro osobní použití. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Zjistěte více o Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Povolit Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Povolit s účtem Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Účet si budete moci vytvořit zdarma';

  @override
  String get ubuntuProMagicPrompt =>
      'Přihlaste se pomocí svého účtu Ubuntu One nebo si jej zdarma vytvořte.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Pokračovat v prohlížeči';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Můžete se také přihlásit na $attachLink a zadat kód $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Nelze povolit Ubuntu Pro, zkuste to prosím znovu';

  @override
  String get ubuntuProEnableToken => 'Povolit pomocí tokenu';

  @override
  String get ubuntuProEnableTokenError => 'Nelze povolit Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Od vašeho IT administrátora nebo z $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Získejte token Ubuntu Pro od svého administrátora nebo z $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Zakázat Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Zakázat';

  @override
  String get ubuntuProDisablePrompt =>
      'Zakázáním Ubuntu Pro se vaše předplatné odpojí od tohoto počítače. Chcete pokračovat?';

  @override
  String get ubuntuProDisableError =>
      'Could not disable Ubuntu Pro. Please try again.';

  @override
  String get ubuntuProEnable => 'Povolit';

  @override
  String get ubuntuProCancel => 'Zrušit';

  @override
  String get ubuntuProFeatureEnableError =>
      'Funkci se nepodařilo aktivovat, zkuste to prosím znovu.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Funkci se nepodařilo zakázat, zkuste to prosím znovu.';

  @override
  String get ubuntuProCompliance => 'Zabezpečení a shoda';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Doporučeno pouze pro pomoc s FedRAMP, HIPAA a dalšími požadavky na zabezpečení a shodu.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Průvodce zabezpečením Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatizuje zabezpečení a audit pomocí benchmarků CIS a profilů DISA-STIG a zároveň umožňuje přizpůsobení specifickým prostředím.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Certifikace kryptografického modulu vlády USA a Kanady o shodě se standardem ochrany dat FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Povolit FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Povolení FIPS nelze vrátit zpět a Livepatch bude trvale zakázán.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Vyberte si preferovanou možnost FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS s aktualizacemi';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Nainstaluje balíčky ověřené dle standardu FIPS 140-2 a umožňuje pravidelné aktualizace zabezpečení.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS bez aktualizací';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Nainstaluje balíčky ověřené dle standardu FIPS 140-2. Tyto balíčky nebudou aktualizovány až do další recertifikace.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentace o bezpečnostní shodě';

  @override
  String get ubuntuProESMTitle => 'Rozšířená údržba zabezpečení (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM poskytuje bezpečnostní záplaty na 10 let pro více než 25 000 balíčků s otevřeným zdrojovým kódem. Získejte nepřetržitou správu zranitelností pro kritické, vysoce rizikové a střední CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Balíčky Main (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Aktualizace zabezpečení pro 2 300 hlavních balíčků Ubuntu Main do $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Balíčky Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Další bezpečnostní aktualizace pro více než 23 000 balíčků Ubuntu Universe do $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Povolit Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplikovat aktualizace zabezpečení jádra za chodu systému';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Zobrazit stav Livepatch v horní liště';
}
