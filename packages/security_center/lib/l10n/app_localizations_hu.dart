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
  String get permissionRulePopupMenuSemanticLabel => 'Jogosultságok frissítése';

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
      'Jogosultságkérés megkövetelése az elzárt környezetben futó alkalmazásoktól';

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
  String get diskEncryptionPageRepairHeader => 'Disk encryption needs repair';

  @override
  String get diskEncryptionPageRepairBody =>
      'Automatic repair failed during decryption. Repair the disk now to start the computer without a recovery key.';

  @override
  String get diskEncryptionPageRepairButton => 'Start repair...';

  @override
  String get diskEncryptionPageRepairing => 'Repairing...';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Repair encryption';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Hardware-backed encryption could not be repaired';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Disk encryption no longer needs repair.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Any PIN and passphrase will be removed';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'You can add them again after repair.';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'Save the new recovery key somewhere safe. Once repairing completes, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Old recovery keys will stop working';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'You may want to let your IT administrator know you are re-encrypting the disk in case they are storing any recovery keys.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Repair';

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
      'Hardware-backed encryption is enabled but needs repair';

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
  String get passphraseTypePassphraseTileTitle =>
      'Require a passphrase on startup';

  @override
  String get passphraseTypePinTileTitle => 'Require a PIN on startup';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Hardware-backed encryption requires additional security in this computer.';

  @override
  String get tpmActionPageTitleActionable =>
      'There is an issue with hardware-backed encryption';

  @override
  String get tpmActionDetailsLabel => 'Technical details';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Solution $n: $text';
  }

  @override
  String tpmActionSingleSolutionLabel(String text) {
    return 'Solution: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Try the solutions below or contact IT support.';

  @override
  String get tpmActionErrorSupportSingleLabel =>
      'Try the solution below or contact IT support.';

  @override
  String get tpmActionErrorKindInternal => 'Internal error.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Power off is required.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Restart is required.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Unexpected action.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Missing argument.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Invalid argument.';

  @override
  String get tpmActionErrorKindActionFailed => 'Action failed.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'The current environment is a virtual machine.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'This computer is using older firmware (legacy BIOS) that is not compatible with this encryption method.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'This computer does not have the required security hardware (TPM 2.0) for this encryption method.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'This computer\'s TPM is disabled.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'This computer\'s TPM is already in use by another system or application.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'This computer\'s TPM is currently locked.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'This computer\'s TPM does not have enough storage available.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'This computer is not compatible with hardware-backed encryption.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'This computer is missing a required security feature (DMA protection).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'This computer is missing a required security feature (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'There is an issue with this computer\'s security configuration.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'There is software running at startup that might prevent a secure connection with the computer\'s TPM.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Absolute Persistence Module is enabled in this computer.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Secure boot is disabled in this computer or is not set in deployed mode.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Some of the certificates verifying software in this computer are outdated or use weak protection.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'This computer is using a manual allowlist to verify software at startup.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Add-on drivers are present.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'This computer is missing a required security feature (hardware root of trust).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'There is an issue with this computer\'s TPM.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionFixActionReboot => 'Restart';

  @override
  String get tpmActionFixActionShutdown => 'Power off';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Restart to firmware settings';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Restart and press the settings key repeatedly during startup (commonly F2, F10 or Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Enable DMA protection manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Enable secure boot manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Enable IOMMU manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Enable PCR banks manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Enable TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Disable Absolute Persistence Module manually';

  @override
  String get tpmActionFixActionContactOem => 'Contact OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Contact OS vendor';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware => 'Enable TPM on restart';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Enable and clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpmViaFirmware => 'Clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpm => 'Clear TPM';

  @override
  String get tpmActionFixActionProceed => 'Ignore';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Restart the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Restarting the computer may fix the issue.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Power off the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'You can do this in your computer\'s firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'You might be able to do this in your computer\'s firmware settings. Check the documentation of the CPU vendor for guidance.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Check secure boot mode is set to \"deployed\".';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'This feature might be referred to as \"Virtualization Technology\", \"VT-d\" or \"AMD-Vi\".';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Ignoring this issue might result in a less secure installation.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Ignore and continue';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Clearing the TPM erases all encryption keys';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'You will lose access to all data in encrypted drives for which you do not have recovery keys. It will also break other features that depend on the TPM, such as authentication and certificates.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'I understand the risk';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'You might be asked to confirm this action on restart.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Then you will need to start the repair again.';

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
