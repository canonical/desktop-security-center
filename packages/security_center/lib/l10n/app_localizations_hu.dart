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
  String get snapdRuleCategorySessionAllowed => 'Engedélyezés a kijelentkezésig';

  @override
  String get snapdRuleCategorySessionDenied => 'Letiltás a kijelentkezésig';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Engedélyezés mindig';

  @override
  String get snapdRuleCategoryForeverDenied => 'Letiltás mindig';

  @override
  String get snapPermissionReadLabel => 'Olvasás';

  @override
  String get snapPermissionWriteLabel => 'Írás';

  @override
  String get snapPermissionExecuteLabel => 'Végrehajtás';

  @override
  String get snapPermissionsEnableTitle => 'Megkövetelés az alkalmazásoktól, hogy rendszerjogosultságokat kérjenek';

  @override
  String get snapPermissionsEnableWarning => 'Ez egy kísérleti funkció a rendszer erőforrásaihoz való hozzáférés szabályozására.';

  @override
  String get snapPermissionsEnablingLabel => 'Engedélyezés, ez eltarthat néhány másodpercig…';

  @override
  String get snapPermissionsDisablingLabel => 'Letiltás, ez eltarthat néhány másodpercig…';

  @override
  String get snapPermissionsExperimentalLabel => 'Kísérleti';

  @override
  String get snapPermissionsOtherDescription => 'Az egyéb jogosultságokat a Beállítások › Alkalmazások lapon kezelheti.';

  @override
  String get snapPermissionsPageTitle => 'Alkalmazás jogosultságai';

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
  String get snapRulesRemoveAll => 'Összes szabály eltávolítása';

  @override
  String get homeInterfacePageTitle => 'Saját mappa';

  @override
  String get homeInterfacePageDescription => 'A saját mappában lévő fájlok hozzáféréséhez való jogosultságok kezelése.';

  @override
  String get interfacePageTitle => 'Jogosultságok kezelése';

  @override
  String get interfacePageDescription => 'A szigorúan korlátozott alkalmazások megkérdezik Önt, mielőtt hozzáférnének a fájlokhoz és a mappákhoz. Ez a funkció kísérleti és változhat a jövőben.';

  @override
  String get interfacePageLinkLearnMore => 'Tudjon meg többet';

  @override
  String get interfacePageLinkGiveFeedback => 'Visszajelzés küldése';

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
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey => 'The recovery key lets you regain access to the disk if decryption fails. Save the key somewhere safe to avoid losing access to all your data.';

  @override
  String get diskEncryptionPageLearnMore => 'Learn more about recovery keys';

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
