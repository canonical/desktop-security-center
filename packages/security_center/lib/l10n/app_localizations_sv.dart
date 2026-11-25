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
      'Du kan ange en lösenfras eller ett PIN för ytterligare säkerhet. Du kommer att behöva ange dem varje gång som datorn startas.';

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
  String get diskEncryptionPageRepairHeader =>
      'Diskkrypteringen behöver repareras';

  @override
  String get diskEncryptionPageRepairBody =>
      'Atomatisk reparation misslyckades under avkryptering. Reparera disken nu för att starta datorn utan en återställningsnyckel.';

  @override
  String get diskEncryptionPageRepairButton => 'Starta reparation...';

  @override
  String get diskEncryptionPageRepairing => 'Reparerar...';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Reparera kryptering';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Hårdvarubaserad kryptering kunde inte repareras';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Diskkrypteringen behöver inte längre repareras.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Eventuella PIN-koder och lösenfraser kommer att tas bort';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'Du kan lägga till dem igen efter reparationen.';

  @override
  String get diskEncryptionPageRepairDialogCheckKeyBody =>
      'Att rensa TPM:en kommer att radera alla krypteringsnycklar. Kontrollera att din återställningsnyckel fungerar innan du fortsätter, eftersom du kan behöva den för att starta datorn.';

  @override
  String get diskEncryptionPageRepairDialogKeyDoesntWorkBody =>
      'Kontrollera nyckeln och försök igen.';

  @override
  String get diskEncryptionPageRepairDialogKeyHeader =>
      'Ny återställningsnyckel';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'Reparation ersätter din återställningsnyckel. Spara den nya återställnignsnyckeln på en säker plats. När reparationen är slutförd kommer du inte längre att kunna använda den gamla nyckeln.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Gamla återställningsnycklar kommer att sluta fungera';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'Du kanske bör informera din IT-administratör att du återkrypterar disken utifall att de lagrar återställningsnycklar.';

  @override
  String get diskEncryptionPageRepairDialogKeyNotUsed =>
      'Din nuvarande återställnignsnyckel fungerar fortfarande. Den nya nyckeln användes inte, så du kan kasta den.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Reparera';

  @override
  String get diskEncryptionPageRepairDialogNotNow => 'Inte nu';

  @override
  String get diskEncryptionPageRepairDialogRestartBody =>
      'Starta om datorn för att slutföra föregående åtgärder. Starta sedan reparationen igen.';

  @override
  String get diskEncryptionPageRepairDialogRestartNow => 'Starta om nu';

  @override
  String get diskEncryptionPageRepairDialogRestartFailed =>
      'Kunde inte starta om datorn. Starta om den från systemmenyn i stället.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffBody =>
      'Stäng av datorn för att slutföra föregående åtgärder. Starta sedan reparationen igen.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffNow => 'Stäng av nu';

  @override
  String get diskEncryptionPageRepairDialogPowerOffFailed =>
      'Kunde inte stänga av datorn. Stäng av den från systemmenyn i stället.';

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
      'Hårdvarubaserad kryptering är aktiverad men behöver repareras';

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
  String get recoveryKeyPassphrase => 'Lösenfras';

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
  String get recoveryKeyPin => 'PIN';

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
  String get passphraseTypePassphraseTileTitle => 'Kräv lösenfras vid uppstart';

  @override
  String get passphraseTypePinTileTitle => 'Kräv PIN-kod vid uppstart';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Hårdvarubaserad kryptering kräver ytterligare säkerhet i den här datorn.';

  @override
  String get tpmActionPageTitleActionable =>
      'Det finns ett problem med hårdvarubaserad kryptering';

  @override
  String get tpmActionDetailsLabel => 'Tekniska detaljer';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Lösning $n: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Testa lösningarna nedanför eller kontakta IT-support.';

  @override
  String get tpmActionErrorSupportLabelSingle =>
      'Testa lösningen nedanför eller kontakta IT-support.';

  @override
  String get tpmActionErrorKindInternal => 'Internt fel.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Avstängning krävs.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Omstart krävs.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Oväntad åtgärd.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Saknar argument.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Ogiltigt argument.';

  @override
  String get tpmActionErrorKindActionFailed => 'Åtgärd misslyckades.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'Den aktuella miljön är en virtuell maskin.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'Den här datorn använder äldre fast programvara (gammalt BIOS) som inte är kompatibel med den här krypteringsmetoden.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'Det finns ett problem med den här datorns fasta programvara.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'Den här datorn har inte den nödvändiga säkerhetshårdvaran (TPM 2.0) som behövs för den här krypteringsmetoden.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'Den här datorns TPM är avaktiverad.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'Den här datorns TPM används redan av ett annat system eller program.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'Den här datorns TPM är låst just nu.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'Den här datorns TPM har inte tillräckligt mycket ledigt lagringsutrymme.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'Den här datorn är inte kompatibel med hårdvarubaserad kryptering.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'Den här datorn saknar en nödvändig säkerhetsfunktion (DMA-skydd).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'Den här datorn saknar en nödvändig säkerhetsfunktion (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'Det finns ett problem med den här datorns säkerhetskonfiguration.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'Det finns programvara som körs vid uppstart som kan blockera en säker anslutning till datorns TPM.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Absolute Persistence Module är aktiverad i den här datorn.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Secure boot är avaktiverad i den här datorn, eller är inte satt till deployed mode.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Vissa av certifikaten för att verifiera programvara i den här datorn har löpt ut eller använder svagt skydd.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'Den här datorn använder en manuell vitlista för att verifiera programvara vid uppstart.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Tilläggsdrivrutiner finns.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'Den här datorn saknar en nödvändig säklerhetsfunktion (root of trust i hårdvara).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'Det finns ett problem med den här datorns TPM.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'Det finns ett problem med den här datorns fasta programvara.';

  @override
  String get tpmActionFixActionReboot => 'Starta om';

  @override
  String get tpmActionFixActionShutdown => 'Stäng av';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Starta om till inställningar för fast programvara';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Starta om och tryck på inställningstangenten upprepade gånger under uppstarten (ofta F2, F10 eller Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsAutomatic =>
      'The computer will restart and open its firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Aktivera DMA-skydd manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Rensa TPM manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Aktivera secure boot manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Aktivera IOMMU manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Aktivera PCR-bankar manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Aktivera TPM manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Rensa TPM manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Rensa TPM manuellt';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Avaktivera Absolute Persistence Module manuellt';

  @override
  String get tpmActionFixActionContactOem => 'Kontakta OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Kontakta OS-leverantören';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware =>
      'Aktivera TPM vid omstart';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Aktivera och rensa TPM vid omstart';

  @override
  String get tpmActionFixActionClearTpmViaFirmware => 'Rensa TPM vid omstart';

  @override
  String get tpmActionFixActionClearTpm => 'Rensa TPM';

  @override
  String get tpmActionFixActionProceed => 'Ignorera';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Starta om datorn för att slutföra föregående åtgärder.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Att starta om datorn kan lösa problemet.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Stäng av datorn för att slutföra föregående åtgärder.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'Du kan göra det här i din dators inställningar för fast programvara.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'Du kanske kan göra det här i din dators inställningar för fast programvara. Kontrollera dokumentationen från processorleverantören för vägledning.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Kontrollera att secure boot-läge är satt till ”deployed”.';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'Den här funktionen kan kallas ”Virtualization Technology”, ”VT-d” eller ”AMD-Vi”.';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Att ignorera problemet kan göra den här datorn mindre säker.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Ignorera och fortsätt';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Att rensa TPM:en kommer att radera alla krypteringsnycklar';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'Du kommer att förlora åtkomst till all data på krypterade enheter om du saknar återställningsnycklar. Det kommer också att störa andra funktioner som beror på TPM:en, som autentisering och certifikat.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'Jag förstår risken';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'Du kan bli ombedd att bekräfta åtgärden vid omstart.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Du kommer sedan att behöva starta reparationen på nytt.';

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
