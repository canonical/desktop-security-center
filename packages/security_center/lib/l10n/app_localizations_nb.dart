// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Sikkeretssenter';

  @override
  String get snapdRuleCategorySessionAllowed => 'Allow until logout';

  @override
  String get snapdRuleCategorySessionDenied => 'Deny until logout';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Alltid nekt';

  @override
  String get snapdRuleCategoryForeverDenied => 'Alltid nekt';

  @override
  String get snapPermissionReadLabel => 'Read';

  @override
  String get snapPermissionWriteLabel => 'Write';

  @override
  String get snapPermissionExecuteLabel => 'Execute';

  @override
  String get snapPermissionsEnableTitle => 'Require apps to ask for system permissions';

  @override
  String get snapPermissionsEnableWarning => 'This is an experimental feature for controlling access to your system’s resources.';

  @override
  String get snapPermissionsEnablingLabel => 'Enabling, it might take a few seconds...';

  @override
  String get snapPermissionsDisablingLabel => 'Disabling, it might take a few seconds...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription => 'You can manage other permissions in Settings › Applications.';

  @override
  String get snapPermissionsPageTitle => 'Programtilganger';

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
    return 'Manage $interface permissions for $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ingen regler enda';

  @override
  String get snapRulesRemoveAll => 'Fjern alle regler';

  @override
  String get homeInterfacePageTitle => 'Hjemmemappe';

  @override
  String get homeInterfacePageDescription => 'Manage permissions to access files in your Home folder.';

  @override
  String get interfacePageTitle => 'Håndter tilganger';

  @override
  String get interfacePageDescription => 'Strictly confined apps will ask you before accessing files and folders. This feature is experimental and subject to changes.';

  @override
  String get interfacePageLinkLearnMore => 'Lær mer';

  @override
  String get interfacePageLinkGiveFeedback => 'Gi tilbakemelding';

  @override
  String get interfacePageLinkReportIssues => 'Report issues';

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
}
