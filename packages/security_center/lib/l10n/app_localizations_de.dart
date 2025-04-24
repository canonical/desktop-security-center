// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Sicherheitszentrum';

  @override
  String get snapdRuleCategorySessionAllowed => 'Bis zur Abmeldung zulassen';

  @override
  String get snapdRuleCategorySessionDenied => 'Bis zur Abmeldung verweigern';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Immer zulassen';

  @override
  String get snapdRuleCategoryForeverDenied => 'Immer verweigern';

  @override
  String get snapPermissionReadLabel => 'Lesen';

  @override
  String get snapPermissionWriteLabel => 'Schreiben';

  @override
  String get snapPermissionExecuteLabel => 'Ausführen';

  @override
  String get snapPermissionsEnableTitle => 'Apps müssen nach Systemberechtigungen fragen';

  @override
  String get snapPermissionsEnableWarning => 'Dies ist eine experimentelle Funktion zur Kontrolle des Zugriffs auf die Ressourcen Ihres Systems.';

  @override
  String get snapPermissionsEnablingLabel => 'Das Aktivieren kann ein paar Sekunden dauern ...';

  @override
  String get snapPermissionsDisablingLabel => 'Das Deaktivieren kann ein paar Sekunden dauern ...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentell';

  @override
  String get snapPermissionsOtherDescription => 'Sie können andere Berechtigungen unter Einstellungen › Anwendungen verwalten.';

  @override
  String get snapPermissionsPageTitle => 'App-Berechtigungen';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Regeln',
      one: '1 Regel',
      zero: 'keine Regeln',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-Berechtigungen für $snap verwalten.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Noch keine Regeln';

  @override
  String get snapRulesRemoveAll => 'Alle Regeln entfernen';

  @override
  String get homeInterfacePageTitle => 'Benutzerordner';

  @override
  String get homeInterfacePageDescription => 'Berechtigungen für den Zugriff auf Dateien in Ihrem Benutzerordner verwalten.';

  @override
  String get interfacePageTitle => 'Berechtigungen verwalten';

  @override
  String get interfacePageDescription => 'Streng begrenzte Apps werden Sie fragen, bevor sie auf Dateien und Ordner zugreifen. Diese Funktion ist experimentell und kann sich noch ändern.';

  @override
  String get interfacePageLinkLearnMore => 'Mehr erfahren';

  @override
  String get interfacePageLinkGiveFeedback => 'Rückmeldung geben';

  @override
  String get interfacePageLinkReportIssues => 'Probleme melden';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Apps',
      one: '1 App',
      zero: 'keine Apps',
    );
    return '$_temp0';
  }
}
