// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Säkerhetscenter';

  @override
  String get snapdRuleCategorySessionAllowed => 'Tillåt tills utloggning';

  @override
  String get snapdRuleCategorySessionDenied => 'Neka tills utloggning';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Tillåt alltid';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Uppdatera rättigheter';

  @override
  String get snapdRuleCategoryForeverDenied => 'Neka alltid';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Tillåt tillfälligt';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Neka tillfälligt';

  @override
  String get snapdRuleCategoryAskAlways => 'Fråga alltid';

  @override
  String get snapPermissionReadLabel => 'Läs';

  @override
  String get snapPermissionWriteLabel => 'Skriv';

  @override
  String get snapPermissionExecuteLabel => 'Exekvera';

  @override
  String get snapPermissionAccessLabel => 'Åtkomst';

  @override
  String get snapPermissionsEnableTitle =>
      'Kräv program i sandlådor att be om rättigheter';

  @override
  String get snapPermissionsEnableWarning =>
      'Det här är en experimentell funktion för att kontrollera åtkomst till ditt systems resurser.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Aktiverar, detta kan ta några sekunder...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Inaktiverar, detta kan ta några sekunder...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentell';

  @override
  String get snapPermissionsOtherDescription =>
      'Du kan hantera andra behörigheter i Inställningar › Program.';

  @override
  String get snapPermissionsPageTitle => 'Programbehörigheter';

  @override
  String get snapPermissionsErrorTitle => 'Något blev fel';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regler',
      one: '1 regel',
      zero: 'inga regler',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Hantera $interface-behörigheter för $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Inga regler ännu';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Inga appar har begärt åtkomst än';

  @override
  String get snapRulesRemoveAll => 'Ta bort alla regler';

  @override
  String get snapRulesResetAllPermissions => 'Återställ alla rättigheter';

  @override
  String get homeInterfacePageTitle => 'Hemkatalog';

  @override
  String get homeInterfacePageDescription =>
      'Hantera behörigheter för att komma åt filer i din hemkatalog.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Tillåt appar att komma åt dina kameror.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Tillåt appar att komma åt din mikrofon.';

  @override
  String get interfacePageTitle => 'Hantera behörigheter';

  @override
  String get interfacePageLinkLearnMore => 'Läs mer';

  @override
  String get interfacePageLinkReportIssues => 'Rapportera problem';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n flera program',
      one: '1 program',
      zero: 'inga program',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Diskkryptering';

  @override
  String get diskEncryptionPageRecoveryKey => 'Återställningsnyckel';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Återställningsnyckeln låter dig återfå åtkomst till dina data om disken inte låses upp under uppstart. Spara den på ett säkert ställe.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Återställningsnyckeln låter dig återfå åtkomst till din data om disken inte låses upp under uppstart. Spara den på ett säkert ställe. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Läs mer om hårdvarubaserad kryptering';

  @override
  String get diskEncryptionPageCheckKey =>
      'Kontrollera återställningsnyckel...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Kontrollera återställningsnyckel';

  @override
  String get diskEncryptionPageCheck => 'Kontrollera';

  @override
  String get diskEncryptionPageValidKey => 'Giltig nyckel';

  @override
  String get diskEncryptionPageInvalidKey => 'Ogiltig nyckel';

  @override
  String get diskEncryptionPageEnterKey => 'Ange din återställningsnyckel';

  @override
  String get diskEncryptionPageKeyWorks => 'Återställningsnyckeln fungerar';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Kom ihåg att förvara den någonstans säkert.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Återställningsnyckeln fungerar inte';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Kontrollera nyckeln eller ersätt den mot en ny.';

  @override
  String get diskEncryptionPageError => 'Fel';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Ersätt återställningsnyckel...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Ersätt återställningsnyckel';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Spara den nya återställningsnyckeln på ett säkert ställe. När du har ersatt den kommer du inte längre att kunna använda den gamla nyckeln.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Visa QR-kod';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Spara till fil';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Jag har sparat min återställningsnyckel någonstans säkert';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Ersätt';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Kasta bort';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Återställningsnyckeln ersatt';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Kom ihåg att förvara den någonstans säkert.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Ersättning av återställningsnyckel misslyckades';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Något gick fel när din återställningsnyckel skulle ersättas. Din gamla nyckel kommer att förbli giltig.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu skrivbord - Krypteringsåterställningsnyckel';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Skanna QR-koden för att kopiera återställningsnyckeln och spara den på ett säkert ställe, till exempel i en lösenordshanterare. Du kan också ta ett foto för senare användning.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Kopierad till urklipp';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopiera';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Krypteringsinställningar är inte tillgängliga';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Misslyckades att hämta krypteringsstatus för denna dator.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Datorns TPM-konfiguration är inte i ett tillstånd som stöds.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Din snapd-version stöds inte';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Kontrollera att säkerhetscentret och snapd är uppdaterade.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Säkerhetscentret kan inte ansluta till snapd-gränssnitt';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'För att åtgärda detta, kör följande kommando i terminalen:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Lägg till PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Lägg till lösenfras...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Lägg till lösenfras';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Lägg till PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Du kommer att behöva ange ditt PIN varje gång datorn startas. PIN-koden är inte samma sak som ditt användarlösenord.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Om du glömmer ditt PIN kan du få tillbaka åtkomst till disken genom att använda återställningsnyckeln.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Du kommer att behöva ange din lösenfras varje gång din dator startas. Lösenfrasen är inte samma sak som ditt användarlösenord.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Om du glömmer din lösenfras kan du få tillbaka åtkomst till disken genom att använda återställningsnyckeln.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Ytterligare säkerhet';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Du kan ange en lösenfras eller ett PIN för ytterligare säkerhet. Du kommer att behöva ange dem varje gång din dator startas.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Läs mer';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Lägg till';

  @override
  String get diskEncryptionPageRemovePinButton => 'Ta bort PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Ta bort lösenfras...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Lägger till PIN, detta kan ta ett par sekunder...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Lägger till lösenfras, detta kan ta ett par sekunder...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Tar bort PIN, detta kan ta ett par sekunder...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Tar bort lösenfras, detta kan ta ett par sekunder...';

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
      'Återställningsnyckelfilen sparades inte';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Återställningsnyckelfilen kan inte sparas på en temporär plats';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Okänt fel';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Misslyckades med att spara din återställningsnyckel till fil';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Du har inte behörighet att skriva till den filplatsen.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Du har inte behörighet att skriva till den mappen. Försök med en annan plats eller använd en annan metod.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Försök med en annan plats, till exempel en flyttbar enhet, eller använd en annan metod.';

  @override
  String get recoveryKeyFilePickerTitle => 'Spara återställningsnyckelfil';

  @override
  String get recoveryKeyFilePickerFilter => 'Textfiler';

  @override
  String get recoveryKeyTPMEnabled => 'Hårdvarustödd kryptering är aktiverad';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Krypteringsnycklarna lagras i din dators Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Lär dig mer om hårdvarustödd kryptering';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Krypteringslösenfras är aktiverad';

  @override
  String get recoveryKeyPassphraseHeader => 'Ändra lösenfras';

  @override
  String get recoveryKeyPassphraseBody =>
      'Du måste ange din lösenfras varje gång din dator startas.';

  @override
  String get recoveryKeyPassphraseButton => 'Ändra lösenfras...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Nuvarande lösenfras';

  @override
  String get recoveryKeyPassphraseNew => 'Ny lösenfras';

  @override
  String get recoveryKeyPassphraseConfirm => 'Bekräfta lösenfras';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Felaktig lösenfras, försök igen';

  @override
  String get recoveryKeyPassphraseNewError => 'Måste vara minst 4 tecken lång';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Lösenfraser matchar inte, försök igen';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Ändra lösenfras';

  @override
  String get recoveryKeyPinEnabled => 'Krypterings-PIN är aktiverad';

  @override
  String get recoveryKeyPinHeader => 'Krypterings-PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Lösenfras för kryptering';

  @override
  String get recoveryKeyPinBody =>
      'Du måste ange din PIN-kod varje gång din dator startas.';

  @override
  String get recoveryKeyPinButton => 'Ändra PIN-kod...';

  @override
  String get recoveryKeyPinCurrent => 'Nuvarande PIN-kod';

  @override
  String get recoveryKeyPinNew => 'Ny PIN-kod';

  @override
  String get recoveryKeyPinConfirm => 'Bekräfta PIN-kod';

  @override
  String get recoveryKeyPinCurrentError => 'Felaktig PIN-kod, försök igen';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-koderna matchar inte, försök igen';

  @override
  String get recoveryKeyPinDialogHeader => 'Ändra PIN-kod';

  @override
  String get recoveryKeyPassphraseShow => 'Visa';

  @override
  String get recoveryKeyPassphraseHide => 'Dölj';

  @override
  String get recoveryKeyPassphraseChange => 'Ändra';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-kod uppdaterad';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => 'Din PIN-kod uppdaterades.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Lösenfras uppdaterad';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Din lösenfras uppdaterades.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Svag lösenfras, gör den längre eller mer komplex';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Helt ok lösenfras, gör den längre eller mer komplex för bättre säkerhet';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Stark lösenfras';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Svag PIN-kod, gör den längre eller mindre förutsägbar';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Helt ok PIN-kod, gör den längre eller mindre förutsägbar för bättre säkerhet';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-koden är tillräckligt lång';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Något gick fel';

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
      'Ubuntu Pro är inte tillgängligt för den här versionen av Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro kräver en LTS-utgåva';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro stöds inte av den här versionen av snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Uppdatera snapd för att hantera Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro är aktiverat';

  @override
  String get ubuntuProLoadingLabel => 'Detta kan ta en liten stund...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Säkerhet och efterlevnad i företagsklass för din dator. Alltid gratis för privat bruk. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Läs mer om Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Aktivera Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Aktivera med Ubuntu One-konto';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Du kommer att kunna skapa ett kostnadsfritt konto';

  @override
  String get ubuntuProMagicPrompt =>
      'Logga in med ditt Ubuntu One-konto, eller skapa ett kostnadsfritt konto.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Fortsätt i webbläsare';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Du kan också logga in på $attachLink och ange koden $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Kunde inte aktivera Ubuntu Pro, försök igen';

  @override
  String get ubuntuProEnableToken => 'Aktivera med en token';

  @override
  String get ubuntuProEnableTokenError => 'Kunde inte aktivera Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Från din IT-administratör eller från $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Skaffa en Ubuntu Pro-token från din administratör eller från $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Inaktivera Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Inaktivera';

  @override
  String get ubuntuProDisablePrompt =>
      'Att inaktivera Ubuntu Pro kommer att koppla bort din prenumeration från den här datorn. Vill du fortsätta?';

  @override
  String get ubuntuProDisableError =>
      'Kunde inte inaktivera Ubuntu Pro, försök igen';

  @override
  String get ubuntuProEnable => 'Aktivera';

  @override
  String get ubuntuProCancel => 'Avbryt';

  @override
  String get ubuntuProFeatureEnableError =>
      'Kunde inte aktivera funktionen, försök igen.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Kunde inte inaktivera funktionen, försök igen.';

  @override
  String get ubuntuProCompliance => 'Efterlevnad och härdning';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Endast rekommenderat som hjälp för FedRAMP, HIPAA och andra krav på efterlevnad och härdning.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Säkerhetsguide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatiserar härdning och granskning med CIS-benchmark och DISA-STIG-profiler samtidigt som det möjliggör miljöanpassade anpassningar.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'En kryptografisk modulcertifiering från USA:s och Kanadas regeringar som visar efterlevnad med dataskyddsstandarden FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Aktivera FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Aktivering av FIPS kan inte återställas och Livepatch kommer att inaktiveras permanent.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Välj ditt föredragna FIPS-alternativ';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS med uppdateringar';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installerar FIPS 140-2-validerade paket, och tillåter regelbundna säkerhetsuppdateringar.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS utan uppdateringar';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installerar FIPS 140-2-validerade paket. Dessa kommer inte att uppdateras förrän vid nästa omcertifiering.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentation om säkerhetsefterlevnad';

  @override
  String get ubuntuProESMTitle => 'Expanderat säkerhetsunderhåll (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM ger 10 år av säkerhetsfixar för Ubuntus hela arkiv. Få kontinuerlig sårbarhetshantering för kritiska, höga och utvalda mellanhöga CVE:er.';

  @override
  String get ubuntuProESMMainTitle => 'Main-paket (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Säkerhetsuppdateringar för Ubuntu Main-paket fram till $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe-paket (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Ytterligare säkerhetsuppdateringar för Ubuntu Universe-paket fram till $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch för kärnan';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Aktivera Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Tillämpa säkerhetsuppdateringar för kärnan medan systemet körs';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Visa Livepatch-status i övre fältet';
}
