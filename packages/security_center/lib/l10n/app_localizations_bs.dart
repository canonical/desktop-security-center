// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get appTitle => 'Centar za sigurnost';

  @override
  String get snapdRuleCategorySessionAllowed => 'Dozvoli do odjave';

  @override
  String get snapdRuleCategorySessionDenied => 'Zabrani do odjave';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Dozvoli uvijek';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Uvijek odbij';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'Čitaj';

  @override
  String get snapPermissionWriteLabel => 'Piši';

  @override
  String get snapPermissionExecuteLabel => 'Izvrši';

  @override
  String get snapPermissionAccessLabel => 'Pristup';

  @override
  String get snapPermissionsEnableTitle =>
      'Zahtijevaj aplikacije da traže sistemske dozvole';

  @override
  String get snapPermissionsEnableWarning =>
      'Ovo je eksperimentalna funkcija za kontrolu pristupa resursima vašeg sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Omogućavam, ovo može potrajati nekoliko sekundi...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Onemogućujem, ovo može potrajati nekoliko sekundi...';

  @override
  String get snapPermissionsExperimentalLabel => 'Probno';

  @override
  String get snapPermissionsOtherDescription =>
      'Ostalim dozvolama možete upravljati u Postavke › Aplikacije.';

  @override
  String get snapPermissionsPageTitle => 'Dozvole aplikacije';

  @override
  String get snapPermissionsErrorTitle => 'Nešto je pošlo po zlu';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rules',
      one: '1 rule',
      zero: 'no rules',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Upravljajte $interface dozvolama za $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Još nema pravila';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Nijedna aplikacija još nije zatražila pristup';

  @override
  String get snapRulesRemoveAll => 'Ukloni sva pravila';

  @override
  String get snapRulesResetAllPermissions => 'Poništi sva dopuštenja';

  @override
  String get homeInterfacePageTitle => 'Početna mapa';

  @override
  String get homeInterfacePageDescription =>
      'Upravljajte dozvolama za pristup datotekama u vašoj početnoj mapi.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Dozvolite aplikacijama pristup vašim kamerama.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Dozvolite aplikacijama pristup vašem mikrofonu.';

  @override
  String get interfacePageTitle => 'Upravljaj dozvolama';

  @override
  String get interfacePageLinkLearnMore => 'Saznajte više';

  @override
  String get interfacePageLinkReportIssues => 'Prijavi probleme';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'no apps',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Šifriranje diska';

  @override
  String get diskEncryptionPageRecoveryKey => 'Ključ za oporavak';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Ključ za oporavak vam omogućava da ponovo pristupite svojim podacima ako se disk ne otključa tokom pokretanja. Sačuvajte ga na sigurnom mjestu.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Ključ za oporavak vam omogućava da ponovo pristupite svojim podacima ako se disk ne otključa tokom pokretanja. Sačuvajte ga na sigurnom mjestu. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Saznajte više o šifriranju podržanom hardverom';

  @override
  String get diskEncryptionPageCheckKey => 'Provjerite ključ za oporavak...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Provjerite ključ za oporavak';

  @override
  String get diskEncryptionPageCheck => 'Provjeri';

  @override
  String get diskEncryptionPageValidKey => 'Važeći ključ';

  @override
  String get diskEncryptionPageInvalidKey => 'Nevažeći ključ';

  @override
  String get diskEncryptionPageEnterKey => 'Unesite svoj ključ za oporavak';

  @override
  String get diskEncryptionPageKeyWorks => 'Ključ za oporavak radi';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Zapamtite da ga čuvate na sigurnom mjestu.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Ključ za oporavak ne radi';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Provjerite ključ ili ga zamijenite novim.';

  @override
  String get diskEncryptionPageError => 'Greška';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Zamijenite ključ za oporavak...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Zamijenite ključ za oporavak';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Sačuvajte novi ključ za oporavak na sigurnom mjestu. Nakon što ga zamijenite, više nećete moći koristiti stari ključ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Prikaži QR kod';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Sačuvaj u datoteku';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Sačuvao/la sam svoj ključ za oporavak na sigurnom mjestu';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Zamijeni';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Odbaci';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Ključ za oporavak zamijenjen';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Zapamtite da ga čuvate na sigurnom mjestu.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Zamjena ključa za oporavak nije uspjela';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Došlo je do greške prilikom postavljanja vašeg ključa za oporavak, vaš stari ključ će ostati važeći.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Ključ za oporavak enkripcije';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Skenirajte QR kod da biste kopirali ključ za oporavak i sačuvali ga na sigurnom mjestu, kao što je upravitelj lozinki. Također možete snimiti fotografiju za kasniju upotrebu.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Kopirano u međuspremnik';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopiraj';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Postavke šifriranja nisu dostupne';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Nije uspjelo preuzeti status šifriranja ovog računara.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'TPM konfiguracija vašeg računara nije u podržanom stanju.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Vaša verzija SnapD-a nije podržana';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Provjerite jesu li Centar za sigurnost i Snapd ažurirani.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Centar za sigurnost ne može se povezati sa Snapd interfejsom';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Da biste ovo popravili, pokrenite ovu naredbu u terminalu:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Dodaj PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Dodaj frazu lozinke...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Dodaj frazu lozinke';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Dodaj PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Morat ćete unijeti svoj PIN svaki put kada se računar pokrene. Ovaj PIN se razlikuje od vaše korisničke lozinke.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Ako zaboravite PIN, možete ponovo dobiti pristup disku pomoću ključa za oporavak.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Morat ćete unijeti svoju lozinku svaki put kada se računar pokrene. Ova lozinka se razlikuje od vaše korisničke lozinke.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Ako zaboravite lozinku, možete ponovo dobiti pristup disku pomoću ključa za oporavak.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Dodatna sigurnost';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Možete postaviti lozinku ili PIN za dodatnu sigurnost. Morat ćete ga unijeti svaki put kada se računar pokrene.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Saznaj više';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Dodaj';

  @override
  String get diskEncryptionPageRemovePinButton => 'Ukloni PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Ukloni frazu lozinke...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Dodavanje PIN-a, ovo može potrajati nekoliko sekundi...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Dodavanje fraze lozinke, ovo može potrajati nekoliko sekundi...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Uklanjanje PIN-a, ovo može potrajati nekoliko sekundi...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Uklanjanje fraze lozinke, ovo može potrajati nekoliko sekundi...';

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
      'Datoteka ključa za oporavak nije sačuvana';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Datoteka ključa za oporavak ne može se spremiti na privremenu lokaciju';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Nepoznata greška';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nije uspjelo spremanje ključa za oporavak u datoteku';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nemate dozvolu za pisanje na tu lokaciju datoteke.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nemate dozvolu za pisanje u tu mapu. Pokušajte s drugom lokacijom ili koristite drugu metodu.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Pokušajte s drugom lokacijom, kao što je prenosivi disk, ili koristite drugu metodu.';

  @override
  String get recoveryKeyFilePickerTitle => 'Save recovery key file';

  @override
  String get recoveryKeyFilePickerFilter => 'Text files';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware-backed encryption is enabled';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled => 'Encryption passphrase is enabled';

  @override
  String get recoveryKeyPassphraseHeader => 'Change passphrase';

  @override
  String get recoveryKeyPassphraseBody =>
      'You need to enter your passphrase every time your computer starts.';

  @override
  String get recoveryKeyPassphraseButton => 'Change passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Current passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'New passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirm passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Incorrect passphrase, try again';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Must be at least 4 characters long';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Passphrases do not match, try again';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Change passphrase';

  @override
  String get recoveryKeyPinEnabled => 'Encryption PIN is enabled';

  @override
  String get recoveryKeyPinHeader => 'Encryption PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Encryption passphrase';

  @override
  String get recoveryKeyPinBody =>
      'You need to enter your PIN every time your computer starts.';

  @override
  String get recoveryKeyPinButton => 'Change PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Current PIN';

  @override
  String get recoveryKeyPinNew => 'New PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirm PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Incorrect PIN, try again';

  @override
  String get recoveryKeyPinConfirmError => 'PINs do not match, try again';

  @override
  String get recoveryKeyPinDialogHeader => 'Change PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Show';

  @override
  String get recoveryKeyPassphraseHide => 'Hide';

  @override
  String get recoveryKeyPassphraseChange => 'Change';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN updated';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'You PIN was successfully updated.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Passphrase updated';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'You passphrase was successfully updated.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Weak passphrase, make it longer or more complex';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Fair passphrase, make it longer or more complex for better security';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Strong passphrase';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Weak PIN, make it longer or less predictable';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Fair PIN, make it longer or less predictable for better security';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN is long enough';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Something went wrong';

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
      'Ubuntu Pro is not available for this Ubuntu version';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requires an LTS release';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro is not supported by this snapd version';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Update snapd to manage Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro is enabled';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Enterprise-grade security and compliance for your computer. Always free for personal use. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Learn about Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Enable Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Enable with Ubuntu One account';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'You will be able to create an account for free';

  @override
  String get ubuntuProMagicPrompt =>
      'Log in with your Ubuntu One account, or create one for free.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continue in browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'You can also log in at $attachLink and enter the code $attachCode';
  }

  @override
  String get ubuntuProMagicError => 'Unable to enable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnableToken => 'Enable with a token';

  @override
  String get ubuntuProEnableTokenError => 'Unable to enable Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'From your IT admin or from $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Get an Ubuntu Pro token from your administrator or from $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Disable Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Disable';

  @override
  String get ubuntuProDisablePrompt =>
      'Disabling Ubuntu Pro will detach your subscription from this computer. Do you want to proceed?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

  @override
  String get ubuntuProFeatureEnableError =>
      'Could not enable the feature, try again.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Could not disable the feature, try again.';

  @override
  String get ubuntuProCompliance => 'Compliance and hardening';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Only recommended to assist with FedRAMP, HIPAA and other compliance and hardening requirements.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automates hardening and auditing with CIS benchmark and DISA-STIG profiles while allowing for environment-specific customizations.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'A US and Canada government cryptographic module certification of compliance with the FIPS 140-2 data protection standard.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Enable FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Enabling FIPS cannot be reversed and Livepatch will be permanently disabled.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Choose your preferred FIPS option';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS with updates';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installs FIPS 140-2 validated packages and allows for regular security updates.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS without updates';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installs FIPS 140-2 validated packages. These will not be updated until the next recertification.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Security compliance documentation';

  @override
  String get ubuntuProESMTitle => 'Expanded Security Maintenance (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM provides 10 years of security patches for the entire Ubuntu Archive. Get continuous vulnerability management for critical, high and selected medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for Ubuntu Main packages until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for Ubuntu Universe packages until $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Enable Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Apply kernel security updates while the system runs';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Show Livepatch status in the top bar';
}
