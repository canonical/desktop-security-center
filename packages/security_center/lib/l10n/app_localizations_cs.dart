// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Centrum zabezpečení';

  @override
  String get snapdRuleCategorySessionAllowed => 'Povolit do odhlášení';

  @override
  String get snapdRuleCategorySessionDenied => 'Zamítnout do odhlášení';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Vždy povolit';

  @override
  String get snapdRuleCategoryForeverDenied => 'Vždy zamítnout';

  @override
  String get snapPermissionReadLabel => 'Čtení';

  @override
  String get snapPermissionWriteLabel => 'Zápis';

  @override
  String get snapPermissionExecuteLabel => 'Spouštění';

  @override
  String get snapPermissionsEnableTitle => 'Vyžadovat, aby aplikace žádaly o systémová oprávnění';

  @override
  String get snapPermissionsEnableWarning => 'Toto je experimentální funkce pro řízení přístupu ke zdrojům vašeho systému.';

  @override
  String get snapPermissionsEnablingLabel => 'Aktivuje se, může to trvat několik sekund…';

  @override
  String get snapPermissionsDisablingLabel => 'Deaktivuje se, může to trvat několik sekund…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentální';

  @override
  String get snapPermissionsOtherDescription => 'Další oprávnění můžete spravovat v Nastavení › Aplikace.';

  @override
  String get snapPermissionsPageTitle => 'Oprávnění aplikací';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n pravidel',
      one: '1 pravidlo',
      zero: 'žádná pravidla',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Spravujte oprávnění $interface pro $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Zatím žádná pravidla';

  @override
  String get snapRulesRemoveAll => 'Odstranit všechna pravidla';

  @override
  String get homeInterfacePageTitle => 'Domovská složka';

  @override
  String get homeInterfacePageDescription => 'Spravujte oprávnění pro přístup k souborům ve vaší domovské složce.';

  @override
  String get interfacePageTitle => 'Spravovat oprávnění';

  @override
  String get interfacePageDescription => 'Přísně omezené aplikace se vás před přístupem k souborům a složkám zeptají. Tato funkce je experimentální a podléhá změnám.';

  @override
  String get interfacePageLinkLearnMore => 'Dozvědět se více';

  @override
  String get interfacePageLinkGiveFeedback => 'Poskytnout zpětnou vazbu';

  @override
  String get interfacePageLinkReportIssues => 'Nahlásit problémy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikací',
      one: '1 aplikace',
      zero: 'žádné aplikace',
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

  @override
  String get diskEncryptionPageError => 'Error';
}
