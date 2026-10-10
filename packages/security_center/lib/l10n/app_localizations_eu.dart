// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'Segurtasun zentroa';

  @override
  String get snapdRuleCategorySessionAllowed => 'Baimendu saioa amaitu arte';

  @override
  String get snapdRuleCategorySessionDenied => 'Ukatu saioa amaitu arte';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Baimendu beti';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Eguneratu baimenak';

  @override
  String get snapdRuleCategoryForeverDenied => 'Ukatu beti';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Baimendu aldi baterako';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Ukatu aldi baterako';

  @override
  String get snapdRuleCategoryAskAlways => 'Galdetu beti';

  @override
  String get snapPermissionReadLabel => 'Irakurri';

  @override
  String get snapPermissionWriteLabel => 'Idatzi';

  @override
  String get snapPermissionExecuteLabel => 'Exekutatu';

  @override
  String get snapPermissionAccessLabel => 'Atzitzea';

  @override
  String get snapPermissionsEnableTitle =>
      'Behartu isolatutako aplikazioak baimenak eskatzera';

  @override
  String get snapPermissionsEnableWarning =>
      'Hau eginbide esperimentala da, sistemako baliabideetara sarbidea kontrolatzeko.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Gaitzen, honek segundo batzuk beharko ditu...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Ezgaitzen, honek segundo batzuk beharko ditu...';

  @override
  String get snapPermissionsExperimentalLabel => 'Esperimentala';

  @override
  String get snapPermissionsOtherDescription =>
      'Beste baimenak hemendik kudea ditzakezu: Ezarpenak > Aplikazioak.';

  @override
  String get snapPermissionsPageTitle => 'Aplikazioen baimenak';

  @override
  String get snapPermissionsErrorTitle => 'Arazoren bat egon da';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n arau',
      one: 'arau 1',
      zero: 'araurik ez',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Kudeatu $interface baimenak $snap aplikazioarentzat.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Araurik ez oraingoz';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Oraingoz aplikazio batek ere ez du sarbidea eskatu';

  @override
  String get snapRulesRemoveAll => 'Kendu arau guztiak';

  @override
  String get snapRulesResetAllPermissions => 'Berrezarri baimen guztiak';

  @override
  String get homeInterfacePageTitle => 'Karpeta nagusia';

  @override
  String get homeInterfacePageDescription =>
      'Kudeatu karpeta nagusiko fitxategiak atzitzeko baimenak.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Baimendu aplikazioei kamerak atzitzea.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofonoa';

  @override
  String get microphoneInterfacePageDescription =>
      'Baimendu aplikazioei mikrofonoa atzitzea.';

  @override
  String get interfacePageTitle => 'Kudeatu baimenak';

  @override
  String get interfacePageLinkLearnMore => 'Informazio gehiago';

  @override
  String get interfacePageLinkReportIssues => 'Eman arazoen berri';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikazio',
      one: 'aplikazio 1',
      zero: 'aplikaziorik ez',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Diskoaren zifratzea';

  @override
  String get diskEncryptionPageRecoveryKey => 'Berreskuratze gakoa';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Berreskuratze gakoak zure datuetara sarbidea berreskuratzeko aukera ematen dizu diskoa abioan desblokeatzeak huts egiten badu. Gorde leku seguruan.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Berreskuratze gakoak zure datuetara sarbidea berreskuratzeko aukera ematen dizu diskoa abioan desblokeatzeak huts egiten badu. Gorde leku seguruan. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Informazio gehiago hardware bidezko zifratzeari buruz';

  @override
  String get diskEncryptionPageCheckKey => 'Egiaztatu berreskuratze gakoa...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Egiaztatu berreskuratze gakoa';

  @override
  String get diskEncryptionPageCheck => 'Egiaztatu';

  @override
  String get diskEncryptionPageValidKey => 'Baliozko gakoa';

  @override
  String get diskEncryptionPageInvalidKey => 'Gako baliogabea';

  @override
  String get diskEncryptionPageEnterKey => 'Sartu berreskuratze gakoa';

  @override
  String get diskEncryptionPageKeyWorks =>
      'Berreskuratze gakoak funtzionatzen du';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ez ahaztu leku seguruan gordetzeaz.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Berreskuratze gakoak ez du funtzionatzen';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Egiaztatu gakoa edo ordezkatu berri batekin.';

  @override
  String get diskEncryptionPageError => 'Errorea';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Ordezkatu berreskuratze gakoa...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Ordezkatu berreskuratze gakoa';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Gorde berreskuratze gako berria leku seguruan. Ordezkatzen duzun unetik aurrera ezingo duzu gako zaharra berriro erabili.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Erakutsi QR kodea';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Gorde fitxategian';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Berreskuratze gakoa leku seguruan gorde dut';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Ordezkatu';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Baztertu';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Berreskuratze gakoa ordezkatu da';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Gogoratu leku seguruan gordetzeaz.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Berreskuratze gakoa ordezkatzeak huts egin du';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Arazoren bat egon da berreskuratze gakoa ordezkatzean, gako zaharrak baliozko izaten jarraituko du.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu mahaigaina - Zifratzearen berreskuratze gakoa';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Eskaneatu QR kodea berreskuratze gakoa kopiatzeko eta gorde leku seguruan, esaterako pasahitz kudeatzaile batean. Argazki bat ere egin diezaiokezu geroago erabiltzeko.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Arbelera kopiatu da';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopiatu';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Zifratze ezarpenak ez daude erabilgarri';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Huts egin du ordenagailuko zifratze egoera eskuratzeak.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Ordenagailuaren TPM konfigurazioa ez dago onartutako egoera batean.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Zure snapd bertsioak ez du sostengurik';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Egiaztatu Segurtasun zentroa eta snapd egunean daudela.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Segurtasun zentroa ezin da snapd interfazera konektatu';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Hau konpontzeko, exekutatu komando hau terminalean:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Gehitu PINa...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Gehitu pasaesaldia...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Gehitu pasaesaldia';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Gehitu PINa';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'PINa sartu beharko duzu ordenagailua abiarazten den bakoitzean. PINa eta erabiltzaile-pasahitza ez dira gauza bera.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'PINa ahazten baduzu, diskora sarbidea berreskuratzeko aukera izango duzu berreskuratze gakoa erabiliz.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Pasaesaldia sartu beharko duzu ordenagailua abiarazten den bakoitzean. Pasaesaldia eta erabiltzailea-pasahitza ez dira gauza bera.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Pasaesaldia ahazten baduzu, diskora sarbidea berreskuratzeko aukera izango duzu berreskuratze gakoa erabiliz.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Segurtasun gehigarria';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Pasaesaldi edo PIN bat ezar dezakezu segurtasun gehiagorako. Ordenagailua abiarazten den bakoitzean sartu beharko duzu.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Informazio gehiago';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Gehitu';

  @override
  String get diskEncryptionPageRemovePinButton => 'Kendu PINa...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Kendu pasaesaldia...';

  @override
  String get diskEncryptionPageAddingPin =>
      'PINa gehitzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Pasaesaldia gehitzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PINa kentzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Pasaesaldia kentzen, honek segundo batzuk beharko ditu...';

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
      'Berreskuratze gakoaren fitxategia ez da gorde';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Berreskuratze gakoaren fitxategia ezin izan da gorde aldi baterako kokalekuan';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Errore ezezaguna';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Huts egin du berreskuratze gakoa fitxategian gordetzeak';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Ez duzu baimenik fitxategiaren kokalekuan idazteko.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Ez duzu karpeta horretan idazteko baimenik. Saiatu beste kokaleku batean edo erabili bestelako metodo bat.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Saiatu beste kokaleku batekin, esaterako unitate aldagarri bat, edo erabili bestelako metodo bat.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Gorde berreskuratze gakoaren fitxategia';

  @override
  String get recoveryKeyFilePickerFilter => 'Testu-fitxategiak';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware bidezko zifratzea gaituta dago';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Zifratze gakoak ordenagailuaren Konfiantzazko Plataforma Moduluan (TPM) gordetzen dira.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Informazio gehiago hardware bidezko zifratzeari buruz';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Zifratzearen pasaesaldia gaituta dago';

  @override
  String get recoveryKeyPassphraseHeader => 'Aldatu pasaesaldia';

  @override
  String get recoveryKeyPassphraseBody =>
      'Pasaesaldia sartu beharko duzu ordenagailua abiarazten den bakoitzean.';

  @override
  String get recoveryKeyPassphraseButton => 'Aldatu pasaesaldia...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Uneko pasaesaldia';

  @override
  String get recoveryKeyPassphraseNew => 'Pasaesaldi berria';

  @override
  String get recoveryKeyPassphraseConfirm => 'Berretsi pasaesaldia';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Okerreko pasaesaldia, saiatu berriz';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Gutxienez 4 karaktere izan behar ditu';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Pasaesaldiak ez datoz bat, saiatu berriz';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Aldatu pasaesaldia';

  @override
  String get recoveryKeyPinEnabled => 'Zifratzearen PINa gaituta dago';

  @override
  String get recoveryKeyPinHeader => 'Zifratzearen PINa';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Zifratzearen pasaesaldia';

  @override
  String get recoveryKeyPinBody =>
      'PINa sartu beharko duzu ordenagailua abiarazten den bakoitzean.';

  @override
  String get recoveryKeyPinButton => 'Aldatu PINa...';

  @override
  String get recoveryKeyPinCurrent => 'Uneko PINa';

  @override
  String get recoveryKeyPinNew => 'PIN berria';

  @override
  String get recoveryKeyPinConfirm => 'Berretsi PINa';

  @override
  String get recoveryKeyPinCurrentError => 'Okerreko PINa, saiatu berriz';

  @override
  String get recoveryKeyPinConfirmError => 'PINak ez datoz bat, saiatu berriz';

  @override
  String get recoveryKeyPinDialogHeader => 'Aldatu PINa';

  @override
  String get recoveryKeyPassphraseShow => 'Erakutsi';

  @override
  String get recoveryKeyPassphraseHide => 'Ezkutatu';

  @override
  String get recoveryKeyPassphraseChange => 'Aldatu';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PINa eguneratu da';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PINa behar bezala eguneratu da.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Pasaesaldia eguneratu da';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Pasaesaldia behar bezala eguneratu da.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Pasaesaldi ahula, egizu luzeagoa edo konplexuagoa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Baleko pasaesaldia, egizu luzeagoa edo konplexuagoa segurtasuna areagotzeko';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Pasaesaldi sendoa';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN ahula, egizu luzeagoa edo asmatzeko zailagoa';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Baleko PINa, egizu luzeagoa edo asmatzeko zailagoa segurtasuna areagotzeko';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Luzera egokiko PINa';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Zerbaitek huts egin du';

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
      'Ubuntu Pro ez dago erabilgarri Ubunturen bertsio honentzat';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro-k LTS bertsio bat behar du';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro-k ez du sostengurik snapd bertsio honetan';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Eguneratu snapd Ubuntu Pro kudeatzeko';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro gaituta dago';

  @override
  String get ubuntuProLoadingLabel => 'Honek segundo batzuk beharko ditu...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Enpresa mailako segurtasuna eta betetzea zure ordenagailurako. Doakoa betiko erabilera pertsonalerako. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Informazio gehiago Ubuntu Pro-ri buruz';

  @override
  String get ubuntuProEnablePro => 'Gaitu Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Gaitu Ubuntu One kontuarekin';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Doako kontu bat sortu ahalko duzu';

  @override
  String get ubuntuProMagicPrompt =>
      'Hasi saioa zure Ubuntu One kontuarekin, edo sortu bat dohainik.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Jarraitu nabigatzailean';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Saioa $attachLink helbidean ere has dezakezu, eta bertan sartu $attachCode kodea';
  }

  @override
  String get ubuntuProMagicError =>
      'Ezin izan da Ubuntu Pro gaitu, saiatu berriz';

  @override
  String get ubuntuProEnableToken => 'Gaitu token batekin';

  @override
  String get ubuntuProEnableTokenError => 'Ezin izan da Ubuntu Pro gaitu';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'IT administratzailegandik edo hemendik: $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Eskuratu Ubuntu Pro token bat zure administratzaileagandik edo hemendik: $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Tokena';

  @override
  String get ubuntuProDisablePro => 'Ezgaitu Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Ezgaitu';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro ezgaitzen baduzu, ordenagailu hau harpidetzatik askatuko du. Jarraitu nahi duzu?';

  @override
  String get ubuntuProDisableError =>
      'Ezin izan da Ubuntu Pro ezgaitu, saiatu berriz';

  @override
  String get ubuntuProEnable => 'Gaitu';

  @override
  String get ubuntuProCancel => 'Utzi';

  @override
  String get ubuntuProFeatureEnableError =>
      'Ezin izan da eginbidea gaitu, saiatu berriz.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Ezin izan da eginbidea ezgaitu, saiatu berriz.';

  @override
  String get ubuntuProCompliance => 'Betetzea eta sendotzea';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'FedRAM, HIPAA eta bestelako betetze eta sendotze eskakizunekin laguntzeko soilik gomendatua.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubunturen Segurtasun Gida (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Sendotzea eta ikuskapena automatizatzen du CIS ebaluazioarekin eta DISA-STIG profilekin, inguruneari lotutako pertsonalizazioak onartuz.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'AEB eta Kanadako gobernuen modulu kriptografikoentzako betetze-ziurtapena, FIPS 140-2 datuen babeserako estandarrarekin.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Gaitu FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS gaitzea ezin da desegin, eta Livepatch betiko ezgaituko da.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Hautatu gogokoen duzun FIPS aukera';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS eguneratzeekin';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'FIPS 140-2k balioztatutako paketeak instalatzen ditu, eta aldian aldiko segurtasun-eguneratzeak ahalbidetzen ditu.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS eguneratze gabe';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'FIPS 140-2k balioztatutako paketeak instalatzen ditu. Hauek ez dira eguneratuko hurrengo berziurtapenera arte.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Segurtasun-betetzearen dokumentazioa';

  @override
  String get ubuntuProESMTitle => 'Segurtasunerako mantentze hedatua (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESMk 10 urterako segurtasun-adabakiak eskaintzen ditu Ubunturen artxibo osoarentzat. Lortu zaurgarritasunen kudeaketa etengabea, maila kritiko edo goreneko eta zenbait maila ertaineko CVE-entzat.';

  @override
  String get ubuntuProESMMainTitle => 'Pakete nagusiak (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Segurtasun-eguneratzeak Ubuntuko pakete nagusientzat $year urtera arte';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe paketeak (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Segurtasun-eguneratze gehigarriak Ubuntu Universe paketeentzat $year urtera arte';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Gaitu Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplikatu kernelaren segurtasun-eguneratzeak sistema martxan dagoela';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Erakutsi Livepatch egoera goiko barran';
}
