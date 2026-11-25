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
  String get permissionRulePopupMenuSemanticLabel => 'Frissítési jogosultságok';

  @override
  String get snapdRuleCategoryForeverDenied => 'Letiltás mindig';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Engedélyezés átmenetileg';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Letiltás átmenetileg';

  @override
  String get snapdRuleCategoryAskAlways => 'Mindig kérdezzen';

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
      'Megkövetelés az elzárt környezetben futó alkalmazásoktól, hogy jogosultságokat kérjenek';

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
  String get snapPermissionsPageTitle => 'Alkalmazásjogosultságok';

  @override
  String get snapPermissionsErrorTitle => 'Valami probléma történt';

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
  String get interfacePageLinkLearnMore => 'Tudjon meg többet';

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
  String get diskEncryptionPageRepairHeader =>
      'A lemeztitkosítás javítást igényel';

  @override
  String get diskEncryptionPageRepairBody =>
      'Az automatikus javítás nem sikerült a visszafejtés során. Javítsa meg a lemezt most a számítógép helyreállítási kulcs nélküli indításához.';

  @override
  String get diskEncryptionPageRepairButton => 'Javítás elkezdése…';

  @override
  String get diskEncryptionPageRepairing => 'Javítás…';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Titkosítás javítása';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'A hardveresen támogatott titkosítást nem sikerült megjavítani';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'A lemeztitkosítás többé már nem igényel javítást.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Az összes PIN-kód és jelmondat el lesz távolítva';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'Újra hozzáadhatja azokat a javítás után.';

  @override
  String get diskEncryptionPageRepairDialogCheckKeyBody =>
      'A TPM törlése törli az összes titkosítási kulcsot. A folytatás előtt ellenőrizze, hogy a helyreállítási kulcs működik-e, mivel szükség lehet rá a számítógép indításához.';

  @override
  String get diskEncryptionPageRepairDialogKeyDoesntWorkBody =>
      'Ellenőrizze a kulcsot, és próbálja meg újra.';

  @override
  String get diskEncryptionPageRepairDialogKeyHeader =>
      'Új helyreállítási kulcs';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'A javítás lecseréli a helyreállítási kulcsot. Mentse el az új helyreállítási kulcsot egy biztonságos helyre. A javítás befejezése után többé már nem fogja tudni használni a régi kulcsot.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'A régi helyreállítási kulcsok többé nem fognak működni';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'Érdemes lehet közölni az informatikai rendszergazdával, hogy Ön újratitkosítja a lemezt, abban az esetben, ha ő bármilyen helyreállítási kulcsot tárol.';

  @override
  String get diskEncryptionPageRepairDialogKeyNotUsed =>
      'A jelenlegi helyreállítási kulcsa továbbra is működik. Az új kulcs nem lett használva, ezért eldobhatja.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Javítás';

  @override
  String get diskEncryptionPageRepairDialogNotNow => 'Most nem';

  @override
  String get diskEncryptionPageRepairDialogRestartBody =>
      'Indítsa újra a számítógépet az előző műveletek befejezéséhez. Azután indítsa el újra a javítást.';

  @override
  String get diskEncryptionPageRepairDialogRestartNow => 'Újraindítás most';

  @override
  String get diskEncryptionPageRepairDialogRestartFailed =>
      'Nem sikerült újraindítani a számítógépet. Indítsa újra inkább a rendszermenüből.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffBody =>
      'Kapcsolja ki a számítógépet az előző műveletek befejezéséhez. Azután indítsa el újra a javítást.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffNow => 'Kikapcsolás most';

  @override
  String get diskEncryptionPageRepairDialogPowerOffFailed =>
      'Nem sikerült kikapcsolni a számítógépet. Kapcsolja ki inkább a rendszermenüből.';

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
  String get recoveryKeyFilePickerFilter => 'Szöveges fájlok';

  @override
  String get recoveryKeyTPMEnabled =>
      'A hardveresen támogatott titkosítás engedélyezve';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'A hardveresen támogatott titkosítás engedélyezve van, de javítást igén el';

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
  String get recoveryKeyPassphrase => 'Jelmondat';

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
  String get recoveryKeyPin => 'PIN-kód';

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
  String get passphraseTypePassphraseTileTitle =>
      'Jelmondat megkövetelése az indításkor';

  @override
  String get passphraseTypePinTileTitle =>
      'PIN-kód megkövetelése az indításkor';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'A hardveresen támogatott titkosítás további biztonságot igényel ezen a számítógépen.';

  @override
  String get tpmActionPageTitleActionable =>
      'Probléma van a hardveresen támogatott titkosítással';

  @override
  String get tpmActionDetailsLabel => 'Műszaki részletek';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return '$n. megoldás: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Próbálja meg a lenti megoldásokat, vagy vegye fel a kapcsolatot az IT-támogatással.';

  @override
  String get tpmActionErrorSupportLabelSingle =>
      'Próbálja meg a lenti megoldást, vagy vegye fel a kapcsolatot az IT-támogatással.';

  @override
  String get tpmActionErrorKindInternal => 'Belső hiba.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Kikapcsolás szükséges.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Újraindítás szükséges.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Váratlan művelet.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Hiányzó argumentum.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Érvénytelen argumentum.';

  @override
  String get tpmActionErrorKindActionFailed => 'A művelet nem sikerült.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'A jelenlegi környezet egy virtuális gép.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'Ez a számítógép régebbi belső vezérlőprogramot (örökölt BIOS-t) használ, amely nem kompatibilis ezzel a titkosítási módszerrel.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'Probléma van a számítógép belső vezérlőprogramjával.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'Ez a számítógép nem rendelkezik az ehhez a titkosítási módszerhez szükséges biztonsági hardverrel (TPM 2.0).';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'A számítógép TPM-je le van tiltva.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'A számítógép TPM-jét már használja egy másik rendszer vagy alkalmazás.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'A számítógép TPM-je jelenleg zárolva van.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'A számítógép TPM-je nem rendelkezik elegendő elérhető tárhellyel.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'Ez a számítógép nem kompatibilis a hardveresen támogatott titkosítással.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'Ennek a számítógépnek hiányzik egy szükséges biztonsági funkciója (DMA-védelem).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'Ennek a számítógépnek hiányzik egy szükséges biztonsági funkciója (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'Probléma van a számítógép biztonsági beállításaival.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'Van olyan, a rendszer indításakor futó szoftver, amely megakadályozhatja a számítógép TPM-jével való biztonságos kapcsolatot.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Az Absolute Persistence Module engedélyezve van ezen a számítógépen.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'A biztonságos rendszerindítás le van tiltva ezen a számítógépen, vagy nincs beállítva az üzembe állított módban.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'A számítógépen lévő szoftvereket ellenőrző tanúsítványok némelyike elavult vagy gyenge védelmet használ.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'Ez a számítógép kézi engedélyezési listát használ a szoftverek indításkori ellenőrzéséhez.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Kiegészítő illesztőprogramok találhatók.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'Ennek a számítógépnek hiányzik egy szükséges biztonsági funkciója (hardveres bizalmi gyökér).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'Probléma van a számítógép TPM-jével.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'Probléma van a számítógép belső vezérlőprogramjával.';

  @override
  String get tpmActionFixActionReboot => 'Újraindítás';

  @override
  String get tpmActionFixActionShutdown => 'Kikapcsolás';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Újraindítás a belső vezérlőprogram beállításaiba';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Indítsa újra a számítógépet, majd nyomja meg többször a beállítások billentyűjét az indítás során (általában F2, F10 vagy Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsAutomatic =>
      'The computer will restart and open its firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'DMA-védelem kézi engedélyezése';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'TPM kézi törlése';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Biztonságos rendszerindítás kézi engedélyezése';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'IOMMU kézi engedélyezése';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'PCR-bankok kézi engedélyezése';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'TPM kézi engedélyezése';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'TPM kézi törlése';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'TPM kézi törlése';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Absolute Persistence Module kézi letiltása';

  @override
  String get tpmActionFixActionContactOem =>
      'Kapcsolatfelvétel a készülék eredeti gyártójával';

  @override
  String get tpmActionFixActionContactOsVendor =>
      'Kapcsolatfelvétel az operációs rendszer gyártójával';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware =>
      'TPM engedélyezése újraindításkor';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'TPM engedélyezése és törlése újraindításkor';

  @override
  String get tpmActionFixActionClearTpmViaFirmware =>
      'TPM törlése újraindításkor';

  @override
  String get tpmActionFixActionClearTpm => 'TPM törlése';

  @override
  String get tpmActionFixActionProceed => 'Mellőzés';

  @override
  String get tpmActionFixActionRebootDescription =>
      'A számítógép újraindítása az előző műveletek befejezéséhez.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'A számítógép újraindítása megoldhatja a problémát.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'A számítógép kikapcsolása az előző műveletek befejezéséhez.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'Ezt a számítógép belső vezérlőprogramjának beállításaiban teheti meg.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'Lehet, hogy ezt a számítógép belső vezérlőprogramjának beállításaiban tudja megtenni. Olvassa el a CPU gyártójának dokumentációját az útmutatásért.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Ellenőrizze, hogy a biztonságos rendszerindítás módja „üzembe állított” értékre van-e állítva.';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'Erre a funkcióra „Virtualization Technology”, „VT-d” vagy „AMD-Vi” néven is hivatkozhatnak.';

  @override
  String get tpmActionFixActionProceedDescription =>
      'A probléma mellőzése kevésbé biztonságossá teheti ezt a számítógépet.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Mellőzés és folytatás';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'A TPM törlése törli az összes titkosítási kulcsot';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'Elveszíti a hozzáférést az összes adathoz az olyan titkosított meghajtókon, amelyekhez nincsenek helyreállítási kulcsai. Ez elrontja a TPM-től függő egyéb funkciókat is, mint például a hitelesítést és a tanúsítványokat.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'Megértem a kockázatot';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'Lehet, hogy a művelet megerősítését kérik az újraindításkor.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Ezután újra el kell indítania a javítást.';

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
  String get ubuntuProLoadingLabel => 'Ez eltarthat néhány másodpercig…';

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
      'Nem sikerült letiltani az Ubuntu Pro szolgáltatást, próbálja meg újra';

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
      'Az ESM 10 évig biztosít biztonsági javításokat a teljes Ubuntu archívumhoz. Folyamatos sebezhetőségkezelést kap a kritikus, a magas és a kiválasztott közepes CVE-khez.';

  @override
  String get ubuntuProESMMainTitle => 'Főcsomagok (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Biztonsági frissítések az Ubuntu főcsomagokhoz $year-ig';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Univerzumcsomagok (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'További biztonsági frissítések az Ubuntu univerzumcsomagokhoz $year-ig';
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
