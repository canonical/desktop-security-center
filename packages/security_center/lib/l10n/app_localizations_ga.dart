// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'Ionad Slándála';

  @override
  String get snapdRuleCategorySessionAllowed => 'Ceadaigh go dtí go logáil amach';

  @override
  String get snapdRuleCategorySessionDenied => 'Diúltaigh go dtí logáil amach';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Ceadaigh i gcónaí';

  @override
  String get snapdRuleCategoryForeverDenied => 'Diúltaigh i gcónaí';

  @override
  String get snapPermissionReadLabel => 'Léigh';

  @override
  String get snapPermissionWriteLabel => 'Scríobh';

  @override
  String get snapPermissionExecuteLabel => 'Rith';

  @override
  String get snapPermissionsEnableTitle => 'Éilíonn aipeanna ceadanna córais a iarraidh';

  @override
  String get snapPermissionsEnableWarning => 'Is gné thurgnamhach é seo chun rochtain ar acmhainní do chórais a rialú.';

  @override
  String get snapPermissionsEnablingLabel => 'Á chumasú, seans go dtógfaidh sé cúpla soicind...';

  @override
  String get snapPermissionsDisablingLabel => 'Á dhíchumasú, seans go dtógfaidh sé cúpla soicind...';

  @override
  String get snapPermissionsExperimentalLabel => 'Turgnamhach';

  @override
  String get snapPermissionsOtherDescription => 'Is féidir leat ceadanna eile a bhainistiú i Socruithe › Feidhmchláir.';

  @override
  String get snapPermissionsPageTitle => 'Ceadanna Aip';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rialacha',
      one: '1 riail',
      zero: 'gan rialacha',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Bainistigh ceadanna $interface le haghaidh $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Níl aon rialacha fós';

  @override
  String get snapRulesRemoveAll => 'Bain na rialacha go léir';

  @override
  String get homeInterfacePageTitle => 'Fillteán baile';

  @override
  String get homeInterfacePageDescription => 'Bainistigh ceadanna chun comhaid a rochtain i d\'fhillteán Baile.';

  @override
  String get interfacePageTitle => 'Bainistigh ceadanna';

  @override
  String get interfacePageDescription => 'Iarrfaidh aipeanna atá teoranta go docht ort roimh rochtain a fháil ar chomhaid agus ar fhillteáin. Tá an ghné seo turgnamhach agus faoi réir athruithe.';

  @override
  String get interfacePageLinkLearnMore => 'Foghlaim níos mó';

  @override
  String get interfacePageLinkGiveFeedback => 'Tabhair aiseolas';

  @override
  String get interfacePageLinkReportIssues => 'Saincheisteanna a thuairisciú';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aipeanna',
      one: '1 aip',
      zero: 'gan aipeanna',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Encryption';
}
