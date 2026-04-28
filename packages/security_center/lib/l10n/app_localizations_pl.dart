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
  String get snapdRuleCategoryForeverDenied => 'Odmawiaj zawsze';

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
      'Wymagaj, aby programy prosiły o uprawnienia systemowe';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get interfacePageDescription =>
      'Ściśle ograniczone programy będą pytać przed uzyskaniem dostępu do plików i katalogów. Ta funkcja jest eksperymentalna i może ulec zmianie.';

  @override
  String get interfacePageLinkLearnMore => 'Dowiedz się więcej';

  @override
  String get interfacePageLinkGiveFeedback => 'Przekaż opinię';

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
      'ESM zapewnia 10 lat poprawek zabezpieczeń dla ponad 25 000 pakietów typu open source. Uzyskaj ciągłe zarządzanie lukami bezpieczeństwa dla krytycznych, wysokich i średnich CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Pakiety główne (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Aktualizacje zabezpieczeń dla ponad 2300 pakietów Main systemu Ubuntu do $year roku';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Pakiety Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Dodatkowe aktualizacje zabezpieczeń dla ponad 23 000 pakietów Universe systemu Ubuntu do $year roku';
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
