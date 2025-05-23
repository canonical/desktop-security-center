// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Säkerhetscenter';

  @override
  String get snapdRuleCategorySessionAllowed => 'Tillåt tills utloggning';

  @override
  String get snapdRuleCategorySessionDenied => 'Neka tills utloggning';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Tillåt alltid';

  @override
  String get snapdRuleCategoryForeverDenied => 'Neka alltid';

  @override
  String get snapPermissionReadLabel => 'Läs';

  @override
  String get snapPermissionWriteLabel => 'Skriv';

  @override
  String get snapPermissionExecuteLabel => 'Exekvera';

  @override
  String get snapPermissionsEnableTitle => 'Kräv program att be om systembehörigheter';

  @override
  String get snapPermissionsEnableWarning => 'Det här är en experimentell funktion för att kontrollera åtkomst till ditt systems resurser.';

  @override
  String get snapPermissionsEnablingLabel => 'Aktiverar, det kan ta några sekunder...';

  @override
  String get snapPermissionsDisablingLabel => 'Inaktiverar, det kan ta några sekunder...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentell';

  @override
  String get snapPermissionsOtherDescription => 'Du kan hantera andra behörigheter i Inställningar › Program.';

  @override
  String get snapPermissionsPageTitle => 'Program behörigheter';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regler',
      one: '1 regel',
      zero: 'inga regler',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Hantera $interface behörigheter för $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Inga regler ännu';

  @override
  String get snapRulesRemoveAll => 'Ta bort alla regler';

  @override
  String get homeInterfacePageTitle => 'Hemkatalog';

  @override
  String get homeInterfacePageDescription => 'Hantera behörigheter för att komma åt filer i din hemkatalog.';

  @override
  String get interfacePageTitle => 'Hantera behörigheter';

  @override
  String get interfacePageDescription => 'Strikt begränsade program kommer att fråga dig innan du kommer åt filer och mappar. Den här funktionen är experimentell och kan ändras.';

  @override
  String get interfacePageLinkLearnMore => 'Läs mer';

  @override
  String get interfacePageLinkGiveFeedback => 'Ge feedback';

  @override
  String get interfacePageLinkReportIssues => 'Rapportera problem';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n flera program',
      one: '1 program',
      zero: 'inga program',
    );
    return '$_temp0';
  }
}
