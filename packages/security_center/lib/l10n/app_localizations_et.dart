// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Andmeturbekeskus';

  @override
  String get snapdRuleCategorySessionAllowed => 'Luba kuni väljalogimiseni';

  @override
  String get snapdRuleCategorySessionDenied => 'Keela kuni väljalogimiseni';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Luba alati';

  @override
  String get snapdRuleCategoryForeverDenied => 'Keela alati';

  @override
  String get snapPermissionReadLabel => 'Lugemine';

  @override
  String get snapPermissionWriteLabel => 'Kirjutamine';

  @override
  String get snapPermissionExecuteLabel => 'Käivitamine';

  @override
  String get snapPermissionsEnableTitle => 'Eelda, et rakendused küsivad operatsioonisüsteemilt õigusi';

  @override
  String get snapPermissionsEnableWarning => 'See on katseline funktsionaalsus, mis võimaldab kontrollida ligipääsu süsteemiressurssidele.';

  @override
  String get snapPermissionsEnablingLabel => 'Lülitame sisse, selleks kulub mõni sekund...';

  @override
  String get snapPermissionsDisablingLabel => 'Lülitame välja, selleks kulub mõni sekund...';

  @override
  String get snapPermissionsExperimentalLabel => 'Katseline';

  @override
  String get snapPermissionsOtherDescription => 'Muid õigusi saad hallata valikust „Sätted › Rakendused“.';

  @override
  String get snapPermissionsPageTitle => 'Rakenduste õigused';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reeglit',
      one: '1 reegel',
      zero: 'reeglid on määratlemata',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Halda „$snap“ paketi õigusi „$interface“ liidese kasutamisel.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Reeglid on veel määratlemata';

  @override
  String get snapRulesRemoveAll => 'Eemalda kõik reeglid';

  @override
  String get homeInterfacePageTitle => 'Kodukaust';

  @override
  String get homeInterfacePageDescription => 'Halda failide ligipääsuõigusi kodukaustas.';

  @override
  String get interfacePageTitle => 'Halda õigusi';

  @override
  String get interfacePageDescription => 'Kui rakendus töötab rangelt seadistatud eraldatud konteineris, siis ta peab sult enne failide ja kaustade avamist luba küsima. See funktsionaalsus on veel katsejärgus ning selles võib tekkida muudatusi.';

  @override
  String get interfacePageLinkLearnMore => 'Loe lisaks';

  @override
  String get interfacePageLinkGiveFeedback => 'Jaga tagasisidet';

  @override
  String get interfacePageLinkReportIssues => 'Teata veast või problemist';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rakendust',
      one: '1 rakendus',
      zero: 'ühtegi rakendust pole seadistatud',
    );
    return '$_temp0';
  }
}
