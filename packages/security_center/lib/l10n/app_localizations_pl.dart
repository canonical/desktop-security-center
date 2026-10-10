// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Centrum zabezpieczeń';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Zezwalaj do momentu wylogowania';

  @override
  String get snapdRuleCategorySessionDenied =>
      'Odmawiaj do momentu wylogowania';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Zezwalaj zawsze';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Aktualizuj uprawnienia';

  @override
  String get snapdRuleCategoryForeverDenied => 'Odmawiaj zawsze';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Zezwól tymczasowo';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Odmów tymczasowo';

  @override
  String get snapdRuleCategoryAskAlways => 'Zawsze pytaj';

  @override
  String get snapPermissionReadLabel => 'Odczyt';

  @override
  String get snapPermissionWriteLabel => 'Zapis';

  @override
  String get snapPermissionExecuteLabel => 'Wykonywanie';

  @override
  String get snapPermissionAccessLabel => 'Dostęp';

  @override
  String get snapPermissionsEnableTitle =>
      'Wymagaj, aby programy w piaskownicy prosiły o uprawnienia';

  @override
  String get snapPermissionsEnableWarning =>
      'Jest to funkcja eksperymentalna, która ma na celu kontrolowanie dostępu do zasobów systemu.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Włączanie, może to potrwać kilka sekund...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Wyłączanie, może to potrwać kilka sekund...';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperymentalne';

  @override
  String get snapPermissionsOtherDescription =>
      'Możesz zarządzać pozostałymi uprawnieniami w Ustawienia › Programy.';

  @override
  String get snapPermissionsPageTitle => 'Uprawnienia programów';

  @override
  String get snapPermissionsErrorTitle => 'Wystąpił problem';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reguł',
      many: '$n reguł',
      few: '$n reguły',
      one: '1 reguła',
      zero: 'bez reguł',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Zarządzaj uprawnieniami $interface dla $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Brak reguł';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Żaden program nie zażądał jeszcze dostępu';

  @override
  String get snapRulesRemoveAll => 'Usuń wszystkie reguły';

  @override
  String get snapRulesResetAllPermissions => 'Zresetuj wszystkie uprawnienia';

  @override
  String get homeInterfacePageTitle => 'Katalog domowy';

  @override
  String get homeInterfacePageDescription =>
      'Zarządzaj uprawnieniami dostępu do plików w katalogu domowym.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Zezwól programom na dostęp do kamer.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Zezwól programom na dostęp do mikrofonu.';

  @override
  String get interfacePageTitle => 'Zarządzaj uprawnieniami';

  @override
  String get interfacePageLinkLearnMore => 'Dowiedz się więcej';

  @override
  String get interfacePageLinkReportIssues => 'Zgłoś problemy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n programów',
      many: '$n programów',
      few: '$n programy',
      one: '1 program',
      zero: 'bez programów',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Szyfrowanie dysku';

  @override
  String get diskEncryptionPageRecoveryKey => 'Klucz odzyskiwania';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Klucz odzyskiwania pozwala odzyskać dostęp do danych, jeśli dysk nie zostanie odblokowany podczas uruchamiania. Zapisz go w bezpiecznym miejscu.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Klucz odzyskiwania umożliwia odzyskanie dostępu do danych, jeśli dysk nie zostanie odblokowany podczas uruchamiania. Zapisz go w bezpiecznym miejscu. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Dowiedz się więcej o szyfrowaniu sprzętowym';

  @override
  String get diskEncryptionPageCheckKey => 'Sprawdź klucz odzyskiwania...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Sprawdź klucz odzyskiwania';

  @override
  String get diskEncryptionPageCheck => 'Sprawdź';

  @override
  String get diskEncryptionPageValidKey => 'Klucz ważny';

  @override
  String get diskEncryptionPageInvalidKey => 'Klucz nieważny';

  @override
  String get diskEncryptionPageEnterKey => 'Wpisz klucz odzyskiwania';

  @override
  String get diskEncryptionPageKeyWorks => 'Klucz odzyskiwania działa';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Pamiętaj, żeby przechowywać go w bezpiecznym miejscu.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Klucz odzyskiwania nie działa';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Sprawdź klucz lub wymień go na nowy.';

  @override
  String get diskEncryptionPageError => 'Błąd';

  @override
  String get diskEncryptionPageReplaceButton => 'Wymień klucz odzyskiwania...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Wymień klucz odzyskiwania';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Zapisz nowy klucz odzyskiwania w bezpiecznym miejscu. Po jego wymianie nie będzie można używać starego klucza.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Pokaż kod QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Zapisz do pliku';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Mam zapisany klucz odzyskiwania w bezpiecznym miejscu';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Wymień';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Odrzuć';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Klucz odzyskiwania wymieniony';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Pamiętaj, żeby przechowywać go w bezpiecznym miejscu.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Wymiana klucza odzyskiwania się nie powiodła';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Wystąpił błąd podczas wymiany klucza odzyskiwania. Stary klucz pozostanie ważny.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Klucz odzyskiwania szyfrowania';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Zeskanuj kod QR, aby skopiować klucz odzyskiwania i zapisać go w bezpiecznym miejscu, np. w menedżerze haseł. Możesz również zrobić zdjęcie do późniejszego wykorzystania.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Skopiowano do schowka';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Skopiuj';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Ustawienia szyfrowania niedostępne';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Nie udało się pobrać stanu szyfrowania tego komputera.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Konfiguracja modułu TPM na tym komputerze nie jest obsługiwana.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Zainstalowana wersja snapd nie jest obsługiwana';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Sprawdź, czy Centrum zabezpieczeń i snapd są aktualne.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Centrum zabezpieczeń nie może połączyć się z interfejsem snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'W celu naprawy uruchom to polecenie w terminalu:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Dodaj kod PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Dodaj hasło...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Dodaj hasło';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Dodaj kod PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Przy każdym uruchomieniu komputera będzie trzeba podawać kod PIN. Ten kod PIN różni się od hasła użytkownika.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Jeśli zapomnisz kodu PIN, możesz odzyskać dostęp do dysku za pomocą klucza odzyskiwania.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Będzie trzeba wprowadzać hasło przy każdym uruchomieniu komputera. To hasło różni się od hasła użytkownika.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Jeśli zapomnisz hasła, możesz odzyskać dostęp do dysku za pomocą klucza odzyskiwania.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Dodatkowe zabezpieczenia';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Możesz ustawić hasło lub kod PIN dla dodatkowego bezpieczeństwa. Będzie trzeba je wprowadzać przy każdym uruchomieniu komputera.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Dowiedz się więcej';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Dodaj';

  @override
  String get diskEncryptionPageRemovePinButton => 'Usuń kod PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Usuń hasło...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Dodawanie kodu PIN, może to potrwać kilka sekund...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Dodawanie hasła, może to potrwać kilka sekund...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Usuwanie kodu PIN, może to potrwać kilka sekund...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Usuwanie hasła, może to potrwać kilka sekund...';

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
      'Plik klucza odzyskiwania nie został zapisany';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Pliku klucza odzyskiwania nie można zapisać w lokalizacji tymczasowej';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Nieznany błąd';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Nie udało się zapisać klucza odzyskiwania do pliku';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Nie masz uprawnień do zapisu w tej lokalizacji pliku.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Nie masz uprawnień do zapisu w tym folderze. Spróbuj innej lokalizacji lub użyj innej metody.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Spróbuj innej lokalizacji, np. dysku wymiennego, lub użyj innej metody.';

  @override
  String get recoveryKeyFilePickerTitle => 'Zapisz plik klucza odzyskiwania';

  @override
  String get recoveryKeyFilePickerFilter => 'Pliki tekstowe';

  @override
  String get recoveryKeyTPMEnabled => 'Szyfrowanie sprzętowe jest włączone';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Klucze szyfrujące przechowywane są w module Trusted Platform Module (TPM) tego komputera.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Dowiedz się więcej o szyfrowaniu sprzętowym';

  @override
  String get recoveryKeyPassphraseEnabled => 'Hasło szyfrowania jest włączone';

  @override
  String get recoveryKeyPassphraseHeader => 'Zmień hasło';

  @override
  String get recoveryKeyPassphraseBody =>
      'Musisz wprowadzać hasło przy każdym uruchomieniu komputera.';

  @override
  String get recoveryKeyPassphraseButton => 'Zmień hasło...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Bieżące hasło';

  @override
  String get recoveryKeyPassphraseNew => 'Nowe hasło';

  @override
  String get recoveryKeyPassphraseConfirm => 'Potwierdź hasło';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Nieprawidłowe hasło, spróbuj ponownie';

  @override
  String get recoveryKeyPassphraseNewError => 'Musi mieć co najmniej 4 znaki';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Hasła nie pasują, spróbuj ponownie';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Zmień hasło';

  @override
  String get recoveryKeyPinEnabled => 'Kod PIN szyfrowania jest włączony';

  @override
  String get recoveryKeyPinHeader => 'Kod PIN szyfrowania';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Hasło szyfrowania';

  @override
  String get recoveryKeyPinBody =>
      'Musisz wprowadzać kod PIN przy każdym uruchomieniu komputera.';

  @override
  String get recoveryKeyPinButton => 'Zmień kod PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Bieżący kod PIN';

  @override
  String get recoveryKeyPinNew => 'Nowy kod PIN';

  @override
  String get recoveryKeyPinConfirm => 'Potwierdź kod PIN';

  @override
  String get recoveryKeyPinCurrentError =>
      'Nieprawidłowy kod PIN, spróbuj ponownie';

  @override
  String get recoveryKeyPinConfirmError =>
      'Kody PIN nie pasują, spróbuj ponownie';

  @override
  String get recoveryKeyPinDialogHeader => 'Zmień kod PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Pokaż';

  @override
  String get recoveryKeyPassphraseHide => 'Ukryj';

  @override
  String get recoveryKeyPassphraseChange => 'Zmień';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'Kod PIN zaktualizowany';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Twój kod PIN został pomyślnie zaktualizowany.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Hasło zaktualizowane';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Twoje hasło zostało pomyślnie zaktualizowane.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Słabe hasło, wydłuż je lub zwiększ złożoność';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Wystarczające hasło, wydłuż je lub zwiększ złożoność, aby zwiększyć bezpieczeństwo';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Silne hasło';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Słaby kod PIN, wydłuż go lub uczyń mniej przewidywalnym';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Wystarczający kod PIN, uczyń go dłuższym lub mniej przewidywalnym, aby zapewnić większe bezpieczeństwo';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Kod PIN jest wystarczająco długi';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Wystąpił problem';

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
      'Brak dostępności Ubuntu Pro w tej wersji Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro wymaga wydania LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Brak obsługi Ubuntu Pro przez tę wersję snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Zaktualizuj snapd w celu zarządzania Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro włączono';

  @override
  String get ubuntuProLoadingLabel => 'Może to potrwać kilka sekund...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Bezpieczeństwo i zgodność klasy korporacyjnej dla tego komputera. Zawsze za darmo do użytku osobistego. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Dowiedz się więcej o Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Włącz Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Włącz za pomocą konta Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Będzie można założyć konto za darmo';

  @override
  String get ubuntuProMagicPrompt =>
      'Zaloguj się na swoje konto Ubuntu One lub utwórz je bezpłatnie.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Kontynuuj w przeglądarce';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Możesz również zalogować się pod adresem $attachLink i wpisać kod $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Nie można włączyć Ubuntu Pro, spróbuj ponownie';

  @override
  String get ubuntuProEnableToken => 'Włącz za pomocą tokena';

  @override
  String get ubuntuProEnableTokenError => 'Nie można włączyć Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Od administratora IT lub z $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Uzyskaj token Ubuntu Pro od swojego administratora lub z $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Wyłącz Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Wyłącz';

  @override
  String get ubuntuProDisablePrompt =>
      'Wyłączenie Ubuntu Pro spowoduje odłączenie Twojej subskrypcji od tego komputera. Czy chcesz kontynuować?';

  @override
  String get ubuntuProDisableError =>
      'Nie udało się wyłączyć Ubuntu Pro, spróbuj ponownie';

  @override
  String get ubuntuProEnable => 'Włącz';

  @override
  String get ubuntuProCancel => 'Anuluj';

  @override
  String get ubuntuProFeatureEnableError =>
      'Nie można włączyć tej funkcji, spróbuj ponownie.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Nie można wyłączyć tej funkcji, spróbuj ponownie.';

  @override
  String get ubuntuProCompliance => 'Zgodność i hartowanie';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Zalecane tylko do wspomagania FedRAMP, HIPAA i innych wymagań dotyczących zgodności i hartowania.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Przewodnik bezpieczeństwa Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatyzuje hartowanie i audyty za pomocą testów porównawczych CIS i profili DISA-STIG, umożliwiając jednocześnie dostosowywanie do wymagań środowiska.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Certyfikat zgodności modułu kryptograficznego rządów USA i Kanady ze standardem ochrony danych FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Włącz FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Włączenie FIPS nie może zostać cofnięte, a usługa Livepatch zostanie trwale wyłączona.';

  @override
  String get ubuntuProComplianceFIPSPrompt => 'Wybierz preferowaną opcję FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS z aktualizacjami';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Instaluje pakiety zatwierdzone w standardzie FIPS 140-2 i umożliwia regularne aktualizacje zabezpieczeń.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS bez aktualizacji';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Instaluje pakiety zatwierdzone w standardzie FIPS 140-2. Nie będą one aktualizowane do czasu następnej recertyfikacji.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentacja zgodności z wymogami bezpieczeństwa';

  @override
  String get ubuntuProESMTitle => 'Przedłużone utrzymanie bezpieczeństwa (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM zapewnia 10 lat poprawek zabezpieczeń dla całego archiwum Ubuntu. Uzyskaj ciągłe zarządzanie lukami bezpieczeństwa dla krytycznych, wysokich i wybranych średnich CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Pakiety główne (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Aktualizacje zabezpieczeń dla pakietów Main systemu Ubuntu do $year roku';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Pakiety Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Dodatkowe aktualizacje zabezpieczeń dla pakietów Universe systemu Ubuntu do $year roku';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch jądra';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Włącz Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Stosuj aktualizacje zabezpieczeń jądra podczas działania systemu';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Pokazuj status Livepatch na górnym pasku';
}
