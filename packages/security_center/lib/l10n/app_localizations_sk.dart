// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Centrum zabezpečenia';

  @override
  String get snapdRuleCategorySessionAllowed => 'Povolené do ukončenia';

  @override
  String get snapdRuleCategorySessionDenied => 'Odmietnuté do ukončenia';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Vždy povolené';

  @override
  String get snapdRuleCategoryForeverDenied => 'Vždy odmietnuté';

  @override
  String get snapPermissionReadLabel => 'Čítanie';

  @override
  String get snapPermissionWriteLabel => 'Zápis';

  @override
  String get snapPermissionExecuteLabel => 'Spúšťanie';

  @override
  String get snapPermissionsEnableTitle => 'Donútiť aplikácie požiadať o oprávnenia';

  @override
  String get snapPermissionsEnableWarning => 'Táto experimentálna funkcia slúži na kontrolu prístupu k častiam vášho systému.';

  @override
  String get snapPermissionsEnablingLabel => 'Aktivuje sa, môže to trvať niekoľko sekúnd...';

  @override
  String get snapPermissionsDisablingLabel => 'Deaktivuje sa, môže to trvať niekoľko sekúnd...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentálne';

  @override
  String get snapPermissionsOtherDescription => 'Ďalšie oprávnenia môžete spravovať v časti Nastavenia › Aplikácie.';

  @override
  String get snapPermissionsPageTitle => 'Práva aplikácie';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'pravidlá ($n)',
      one: 'pravidlo (1)',
      zero: 'žiadne pravidlá',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Spravujte práva k rozhraniu $interface pre $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Zatiaľ žiadne pravidlá';

  @override
  String get snapRulesRemoveAll => 'Odstrániť všetky pravidlá';

  @override
  String get homeInterfacePageTitle => 'Priečinok domov';

  @override
  String get homeInterfacePageDescription => 'Spravujte práva pre prístup k súborom vo vašom priečinku domov.';

  @override
  String get interfacePageTitle => 'Spravovať oprávnenia';

  @override
  String get interfacePageDescription => 'Aplikácie s prísnymi obmedzeniami budú žiadať o povolenie pred prístupom k súborom a priečinkom. Táto funkcia je experimentálna a môže sa meniť.';

  @override
  String get interfacePageLinkLearnMore => 'Zistiť viac';

  @override
  String get interfacePageLinkGiveFeedback => 'Poskytnúť spätnú väzbu';

  @override
  String get interfacePageLinkReportIssues => 'Nahlásiť problémy';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'aplikácie ($n)',
      one: 'aplikácia (1)',
      zero: 'žiadne aplikácie',
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
