// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Beveiligingscentrum';

  @override
  String get snapdRuleCategorySessionAllowed => 'Toestaan tot afmelding';

  @override
  String get snapdRuleCategorySessionDenied => 'Weigeren tot afmelding';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Altijd toestaan';

  @override
  String get snapdRuleCategoryForeverDenied => 'Altijd weigeren';

  @override
  String get snapPermissionReadLabel => 'Lezen';

  @override
  String get snapPermissionWriteLabel => 'Schrijven';

  @override
  String get snapPermissionExecuteLabel => 'Uitvoeren';

  @override
  String get snapPermissionsEnableTitle => 'Apps moeten om systeemmachtigingen vragen';

  @override
  String get snapPermissionsEnableWarning => 'Dit is een experimentele functie voor het toegangsbeheer tot de systeembronnen.';

  @override
  String get snapPermissionsEnablingLabel => 'Inschakelen, een ogenblik geduld…';

  @override
  String get snapPermissionsDisablingLabel => 'Uitschakelen, een ogenblik geduld…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimenteel';

  @override
  String get snapPermissionsOtherDescription => 'Je kunt andere machtigingen beheren in Instellingen › Toepassingen.';

  @override
  String get snapPermissionsPageTitle => 'App-machtigingen';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regels',
      one: '1 regel',
      zero: 'geen regel',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-machtigingen beheren voor $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Nog geen regels';

  @override
  String get snapRulesRemoveAll => 'Alle regels verwijderen';

  @override
  String get homeInterfacePageTitle => 'Thuismap';

  @override
  String get homeInterfacePageDescription => 'Machtigingen beheren voor toegang tot bestanden in je thuismap.';

  @override
  String get interfacePageTitle => 'Machtigingen beheren';

  @override
  String get interfacePageDescription => 'Strikt beperkte apps zullen toestemming vragen voordat ze toegang krijgen tot bestanden en mappen. Deze functie is experimenteel en onderhevig aan wijzigingen.';

  @override
  String get interfacePageLinkLearnMore => 'Meer informatie';

  @override
  String get interfacePageLinkGiveFeedback => 'Reacties geven';

  @override
  String get interfacePageLinkReportIssues => 'Problemen melden';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'geen apps',
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
