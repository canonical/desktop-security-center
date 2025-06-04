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
  String get snapdRuleCategorySessionAllowed => 'Zezwalaj do momentu wylogowania';

  @override
  String get snapdRuleCategorySessionDenied => 'Odmawiaj do momentu wylogowania';

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
  String get snapPermissionsEnableTitle => 'Wymagaj, aby programy prosiły o uprawnienia systemowe';

  @override
  String get snapPermissionsEnableWarning => 'Jest to funkcja eksperymentalna, która ma na celu kontrolowanie dostępu do zasobów systemu.';

  @override
  String get snapPermissionsEnablingLabel => 'Włączanie, może to potrwać kilka sekund...';

  @override
  String get snapPermissionsDisablingLabel => 'Wyłączanie, może to potrwać kilka sekund...';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperymentalne';

  @override
  String get snapPermissionsOtherDescription => 'Możesz zarządzać pozostałymi uprawnieniami w Ustawienia › Programy.';

  @override
  String get snapPermissionsPageTitle => 'Uprawnienia programów';

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
  String get snapRulesRemoveAll => 'Usuń wszystkie reguły';

  @override
  String get homeInterfacePageTitle => 'Katalog domowy';

  @override
  String get homeInterfacePageDescription => 'Zarządzaj uprawnieniami dostępu do plików w katalogu domowym.';

  @override
  String get interfacePageTitle => 'Zarządzaj uprawnieniami';

  @override
  String get interfacePageDescription => 'Ściśle ograniczone programy będą pytać przed uzyskaniem dostępu do plików i katalogów. Ta funkcja jest eksperymentalna i może ulec zmianie.';

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
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey => 'You should always store the recovery key for your encrypted disk somewhere safe to avoid losing access to all your data.';

  @override
  String get diskEncryptionPageCheckKey => 'Check recovery key...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'Check Recovery Key';

  @override
  String get diskEncryptionPageCheck => 'Check';

  @override
  String get diskEncryptionPageValidKey => 'Valid key';

  @override
  String get diskEncryptionPageInvalidKey => 'Invalid key';

  @override
  String get diskEncryptionPageEnterKey => 'Enter your recovery key';

  @override
  String get diskEncryptionPageKeyWorks => 'Recovery key works';

  @override
  String get diskEncryptionPageKeyWorksBody => 'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Recovery key does not work';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => 'Check the key or replace it with a new one.';
}
