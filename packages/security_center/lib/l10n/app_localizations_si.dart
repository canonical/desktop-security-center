// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'ආරක්‍ෂණ මධ්‍යස්ථානය';

  @override
  String get snapdRuleCategorySessionAllowed => 'නික්මෙන තෙක් ඉඩ දෙන්න';

  @override
  String get snapdRuleCategorySessionDenied => 'Deny until logout';

  @override
  String get snapdRuleCategoryForeverAllowed => 'සැමවිට ඉඩ දෙන්න';

  @override
  String get snapdRuleCategoryForeverDenied => 'සැමවිට ප්‍රතික්‍ෂේප';

  @override
  String get snapPermissionReadLabel => 'කියවීම';

  @override
  String get snapPermissionWriteLabel => 'ලිවීම';

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
  String get snapPermissionsExperimentalLabel => 'පරීක්‍ෂාත්මක';

  @override
  String get snapPermissionsOtherDescription => 'You can manage other permissions in Settings › Applications.';

  @override
  String get snapPermissionsPageTitle => 'App Permissions';

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
  String get snapRulesPageEmptyTileLabel => 'No rules yet';

  @override
  String get snapRulesRemoveAll => 'Remove all rules';

  @override
  String get homeInterfacePageTitle => 'Home folder';

  @override
  String get homeInterfacePageDescription => 'Manage permissions to access files in your Home folder.';

  @override
  String get interfacePageTitle => 'Manage permissions';

  @override
  String get interfacePageDescription => 'Strictly confined apps will ask you before accessing files and folders. This feature is experimental and subject to changes.';

  @override
  String get interfacePageLinkLearnMore => 'Learn more';

  @override
  String get interfacePageLinkGiveFeedback => 'Give feedback';

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

  @override
  String get diskEncryption => 'Disk Encryption';
}
