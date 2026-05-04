// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Biztonsági központ';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Engedélyezés a kijelentkezésig';

  @override
  String get snapdRuleCategorySessionDenied => 'Letiltás a kijelentkezésig';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Engedélyezés mindig';

  @override
  String get snapdRuleCategoryForeverDenied => 'Letiltás mindig';

  @override
  String get snapPermissionReadLabel => 'Olvasás';

  @override
  String get snapPermissionWriteLabel => 'Írás';

  @override
  String get snapPermissionExecuteLabel => 'Végrehajtás';

  @override
  String get snapPermissionAccessLabel => 'Hozzáférés';

  @override
  String get snapPermissionsEnableTitle =>
      'Megkövetelés az alkalmazásoktól, hogy rendszerjogosultságokat kérjenek';

  @override
  String get snapPermissionsEnableWarning =>
      'Ez egy kísérleti funkció a rendszer erőforrásaihoz való hozzáférés szabályozására.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Engedélyezés, ez eltarthat néhány másodpercig…';

  @override
  String get snapPermissionsDisablingLabel =>
      'Letiltás, ez eltarthat néhány másodpercig…';

  @override
  String get snapPermissionsExperimentalLabel => 'Kísérleti';

  @override
  String get snapPermissionsOtherDescription =>
      'Az egyéb jogosultságokat a Beállítások › Alkalmazások lapon kezelheti.';

  @override
  String get snapPermissionsPageTitle => 'Alkalmazás jogosultságai';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n szabály',
      one: '1 szabály',
      zero: 'nincsenek szabályok',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'A(z) $interface jogosultságainak kezelése a(z) $snap snap-csomagnál.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Még nincsenek szabályok';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Még egyetlen alkalmazás sem kért hozzáférést';

  @override
  String get snapRulesRemoveAll => 'Összes szabály eltávolítása';

  @override
  String get snapRulesResetAllPermissions =>
      'Összes jogosultság visszaállítása';

  @override
  String get homeInterfacePageTitle => 'Saját mappa';

  @override
  String get homeInterfacePageDescription =>
      'A saját mappában lévő fájlok hozzáféréséhez való jogosultságok kezelése.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Engedélyezés az alkalmazások számára, hogy hozzáférjenek a kamerákhoz.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Engedélyezés az alkalmazások számára, hogy hozzáférjenek a mikrofonhoz.';

  @override
  String get interfacePageTitle => 'Jogosultságok kezelése';

  @override
  String get interfacePageDescription =>
      'A szigorúan korlátozott alkalmazások megkérdezik Önt, mielőtt hozzáférnének a fájlokhoz és a mappákhoz. Ez a funkció kísérleti és változhat a jövőben.';

  @override
  String get interfacePageLinkLearnMore => 'Tudjon meg többet';

  @override
  String get interfacePageLinkGiveFeedback => 'Visszajelzés küldése';

  @override
  String get interfacePageLinkReportIssues => 'Hiba jelentése';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alkalmazás',
      one: '1 alkalmazás',
      zero: 'nincsenek alkalmazások',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Lemeztitkosítás';

  @override
  String get diskEncryptionPageRecoveryKey => 'Helyreállítási kulcs';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'A helyreállítási kulcs segítségével szerezheti vissza az adatokhoz való hozzáférést, ha a lemezt nem sikerül feloldani az indítás során. Mentse el biztonságos helyre.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'A helyreállítási kulcs segítségével szerezheti vissza az adatokhoz való hozzáférést, ha a lemezt nem sikerül feloldani az indítás során. Mentse el biztonságos helyre. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Tudjon meg többet a hardveresen támogatott titkosításról';

  @override
  String get diskEncryptionPageCheckKey => 'Helyreállítási kulcs ellenőrzése…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Helyreállítási kulcs ellenőrzése';

  @override
  String get diskEncryptionPageCheck => 'Ellenőrzés';

  @override
  String get diskEncryptionPageValidKey => 'Érvényes kulcs';

  @override
  String get diskEncryptionPageInvalidKey => 'Érvénytelen kulcs';

  @override
  String get diskEncryptionPageEnterKey => 'Helyreállítási kulcs megadása';

  @override
  String get diskEncryptionPageKeyWorks => 'A helyreállítási kulcs működik';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ne felejtse el biztonságos helyen tartani.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'A helyreállítási kulcs nem működik';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Ellenőrizze a kulcsot, vagy cserélje ki egy másikra.';

  @override
  String get diskEncryptionPageError => 'Hiba';

  @override
  String get diskEncryptionPageReplaceButton => 'Helyreállítási kulcs cseréje…';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Helyreállítási kulcs cseréje';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Mentse el az új helyreállítási kulcsot egy biztonságos helyre. Miután lecserélte, többé már nem tudja használni a régi kulcsot.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR-kód megjelenítése';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Mentés fájlba';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Elmentettem a helyreállítási kulcsomat egy biztonságos helyre';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Csere';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Elvetés';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'A helyreállítási kulcs lecserélve';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Ne felejtse el biztonságos helyen tartani.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'A helyreállítási kulcs cseréje nem sikerült';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Valami probléma történt a helyreállítási kulcs cseréje során, a régi kulcs továbbra is érvényes marad.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu asztal – titkosítás helyreállítási kulcsa';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Olvassa be a QR-kódot a helyreállítási kulcs másolásához, és mentse el biztonságos helyre, például jelszókezelőbe. Fényképet is készíthet a későbbi használathoz.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Vágólapra másolva';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Másolás';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Titkosítási beállítások nem érhetők el';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Nem sikerült lekérni a számítógép titkosítási állapotát.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'A számítógép TPM-konfigurációja nem támogatott állapotban van.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'A snapd verziója nem támogatott';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Ellenőrizze, hogy a biztonsági központ és a snapd naprakészek-e.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'A biztonsági központ nem tud kapcsolódni a snapd csatolójához';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Ennek javításához futtassa ezt a parancsot a terminálban:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'PIN-kód hozzáadása…';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Jelmondat hozzáadása…';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Jelmondat hozzáadása';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PIN-kód hozzáadása';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Meg kell adnia a PIN-kódot minden alkalommal, amikor a számítógép elindul. Ez a PIN-kód eltér a felhasználói jelszavától.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Ha elfelejti a PIN-kódot, akkor a helyreállítási kulccsal szerezheti vissza a hozzáférést a lemezhez.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Meg kell adnia a jelmondatot minden alkalommal, amikor a számítógép elindul. Ez a jelmondat eltér a felhasználói jelszavától.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Ha elfelejti a jelmondatot, akkor a helyreállítási kulccsal szerezheti vissza a hozzáférést a lemezhez.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'További biztonság';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Beállíthat jelmondatot vagy PIN-kódot a biztonság növelése érdekében. Ezt minden alkalommal meg kell adnia, amikor a számítógép elindul.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Tudjon meg többet';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Hozzáadás';

  @override
  String get diskEncryptionPageRemovePinButton => 'PIN-kód eltávolítása…';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Jelmondat eltávolítása…';

  @override
  String get diskEncryptionPageAddingPin =>
      'PIN-kód hozzáadása, ez eltarthat néhány másodpercig…';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Jelmondat hozzáadása, ez eltarthat néhány másodpercig…';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PIN-kód eltávolítása, ez eltarthat néhány másodpercig…';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Jelmondat eltávolítása, ez eltarthat néhány másodpercig…';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'A helyreállítási kulcs fájlja nincs elmentve';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'A helyreállítási kulcs fájlját nem lehet ideiglenes helyre menteni';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Ismeretlen hiba';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nem sikerült a helyreállítási kulcsot fájlba menteni';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nincs jogosultsága az adott fájlhelyre írni.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nincs jogosultsága az adott mappába való íráshoz. Próbáljon egy másik helyet, vagy használjon más módszert.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Próbáljon egy másik helyet, például egy cserélhető meghajtót, vagy használjon más módszert.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Helyreállítási kulcs fájljának mentése';

  @override
  String get recoveryKeyFilePickerFilter => 'Szövegfájlok';

  @override
  String get recoveryKeyTPMEnabled =>
      'A hardveresen támogatott titkosítás engedélyezve';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'A titkosítási kulcsok a számítógép platformmegbízhatósági moduljában (TPM) vannak tárolva.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Tudjon meg többet a hardveresen támogatott titkosításról';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'A titkosítási jelmondat engedélyezve';

  @override
  String get recoveryKeyPassphraseHeader => 'Jelmondat megváltoztatása';

  @override
  String get recoveryKeyPassphraseBody =>
      'Meg kell adnia a jelmondatot minden alkalommal, amikor a számítógép elindul.';

  @override
  String get recoveryKeyPassphraseButton => 'Jelmondat megváltoztatása…';

  @override
  String get recoveryKeyPassphraseCurrent => 'Jelenlegi jelmondat';

  @override
  String get recoveryKeyPassphraseNew => 'Új jelmondat';

  @override
  String get recoveryKeyPassphraseConfirm => 'Jelmondat megerősítése';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Helytelen jelmondat, próbálja meg újra';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Legalább 4 karakter hosszú kell legyen';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'A jelmondatok nem egyeznek, próbálja meg újra';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Jelmondat megváltoztatása';

  @override
  String get recoveryKeyPinEnabled => 'A titkosítási PIN-kód engedélyezve';

  @override
  String get recoveryKeyPinHeader => 'Titkosítási PIN-kód';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Titkosítási jelmondat';

  @override
  String get recoveryKeyPinBody =>
      'Meg kell adnia a PIN-kódot minden alkalommal, amikor a számítógép elindul.';

  @override
  String get recoveryKeyPinButton => 'PIN-kód megváltoztatása…';

  @override
  String get recoveryKeyPinCurrent => 'Jelenlegi PIN-kód';

  @override
  String get recoveryKeyPinNew => 'Új PIN-kód';

  @override
  String get recoveryKeyPinConfirm => 'PIN-kód megerősítése';

  @override
  String get recoveryKeyPinCurrentError =>
      'Helytelen PIN-kód, próbálja meg újra';

  @override
  String get recoveryKeyPinConfirmError =>
      'A PIN-kódok nem egyeznek, próbálja meg újra';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN-kód megváltoztatása';

  @override
  String get recoveryKeyPassphraseShow => 'Megjelenítés';

  @override
  String get recoveryKeyPassphraseHide => 'Elrejtés';

  @override
  String get recoveryKeyPassphraseChange => 'Megváltoztatás';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'A PIN-kód frissítve';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'A PIN-kódja sikeresen frissítve lett.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'A jelmondat frissítve';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'A jelmondata sikeresen frissítve lett.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Gyenge jelmondat, növelje meg a hosszát vagy tegye bonyolultabbá';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Megfelelő jelmondat, de a nagyobb biztonság érdekében növelje meg a hosszát vagy tegye bonyolultabbá';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Erős jelmondat';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Gyenge PIN-kód, növelje meg a hosszát vagy tegye kevésbé kiszámíthatóvá';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Megfelelő PIN-kód, de a nagyobb biztonság érdekében növelje meg a hosszát vagy tegye kevésbé kiszámíthatóvá';

  @override
  String get recoveryKeyPinEntropyOptimal => 'A PIN-kód elég hosszú';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Valami probléma történt';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Az Ubuntu Pro nem érhető el ehhez az Ubuntu verzióhoz';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Az Ubuntu Pro LTS-kiadást igényel';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ez a snapd verzió nem támogatja az Ubuntu Pro szolgáltatást';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Frissítse a snapd csomagot az Ubuntu Pro kezeléséhez';

  @override
  String get ubuntuProEnabled => 'Az Ubuntu Pro engedélyezve van';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Vállalati szintű biztonság és megfelelőség a számítógépén. Személyes használatra mindig ingyenes. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore =>
      'Tudjon meg többet az Ubuntu Pro szolgáltatásról';

  @override
  String get ubuntuProEnablePro => 'Az Ubuntu Pro engedélyezése';

  @override
  String get ubuntuProEnableMagic => 'Engedélyezés Ubuntu One fiókkal';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Ingyenesen létre tud hozni egy fiókot';

  @override
  String get ubuntuProMagicPrompt =>
      'Jelentkezzen be az Ubuntu One fiókjával, vagy hozzon létre egyet ingyen.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Folytatás a böngészőben';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Bejelentkezhet a(Z) $attachLink használatával is, és megadhatja a(z) $attachCode kódot';
  }

  @override
  String get ubuntuProMagicError =>
      'Nem lehet engedélyezni az Ubuntu Pro szolgáltatást, próbálja meg újra';

  @override
  String get ubuntuProEnableToken => 'Engedélyezés tokennel';

  @override
  String get ubuntuProEnableTokenError =>
      'Nem lehet engedélyezni az Ubuntu Pro szolgáltatást';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Az informatikai rendszergazdájától vagy innen: $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Szerezzen Ubuntu Pro tokent a rendszergazdájától vagy innen: $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Az Ubuntu Pro letiltása';

  @override
  String get ubuntuProDisable => 'Letiltás';

  @override
  String get ubuntuProDisablePrompt =>
      'Az Ubuntu Pro letiltása leválasztja az előfizetését erről a számítógépről. Szeretné folytatni?';

  @override
  String get ubuntuProDisableError =>
      'Could not disable Ubuntu Pro. Please try again.';

  @override
  String get ubuntuProEnable => 'Engedélyezés';

  @override
  String get ubuntuProCancel => 'Mégse';

  @override
  String get ubuntuProFeatureEnableError =>
      'Nem sikerült engedélyezni a funkciót, próbálja meg újra.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Nem sikerült letiltani a funkciót, próbálja meg újra.';

  @override
  String get ubuntuProCompliance => 'Megfelelés és megerősítés';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Csak a FedRAMP, HIPAA és egyéb megfelelőségi és megerősítési követelmények támogatásához ajánlott.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu biztonsági útmutató (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatizálja a megerősítést és az ellenőrzést a CIS-mérőszám és a DISA-STIG-profilokkal, miközben lehetővé teszi a környezetre vonatkozó személyre szabást.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Az Egyesült Államok és Kanada kormánya kriptográfiai moduljának a FIPS 140-2 adatvédelmi szabvánnyal való megfelelőségi tanúsítványa.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'A FIPS engedélyezése';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'A FIPS engedélyezését nem lehet visszavonni, és a Livepatch véglegesen le lesz tiltva.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Az előnyben részesített FIPS-lehetőség kiválasztása';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS, frissítésekkel';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Telepíti a FIPS 140-2 által ellenőrzött csomagokat, és lehetővé teszi a rendszeres biztonsági frissítéseket.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS, frissítések nélkül';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Telepíti a FIPS 140-2 által ellenőrzött csomagokat. Ezek nem lesznek frissítve a következő újratanúsításig.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Biztonsági megfelelőségi dokumentáció';

  @override
  String get ubuntuProESMTitle => 'Kiterjesztett biztonsági karbantartás (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'Az ESM 10 évig biztosít biztonsági javításokat több mint 25 000 nyílt forráskódú csomaghoz. Folyamatos sebezhetőségkezelést kap a kritikus, magas és közepes CVE-khez.';

  @override
  String get ubuntuProESMMainTitle => 'Főcsomagok (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Biztonsági frissítések 2300 Ubuntu főcsomaghoz $year-ig';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Univerzumcsomagok (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'További biztonsági frissítések több mint 23 000 Ubuntu univerzumcsomaghoz $year-ig';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Rendszermag Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'A Livepatch engedélyezése';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'A rendszermag biztonsági frissítéseinek telepítése a rendszer futása közben';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Livepatch-állapot megjelenítése a felső sávon';
}
