// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Occitan (`oc`).
class AppLocalizationsOc extends AppLocalizations {
  AppLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get appTitle => 'Centre de seguretat';

  @override
  String get snapdRuleCategorySessionAllowed => 'Autorizar fins la desconnexion';

  @override
  String get snapdRuleCategorySessionDenied => 'Refusar fins la desconnexion';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Totjorn autorizar';

  @override
  String get snapdRuleCategoryForeverDenied => 'Totjorn refusar';

  @override
  String get snapPermissionReadLabel => 'Lectura';

  @override
  String get snapPermissionWriteLabel => 'Escritura';

  @override
  String get snapPermissionExecuteLabel => 'Executar';

  @override
  String get snapPermissionsEnableTitle => 'Exigir que las aplicacions demanden d’autorizacions al sistèma';

  @override
  String get snapPermissionsEnableWarning => 'Es una foncionalitat experimentala per contrarotlar l’accès a las ressorsas de vòstre ordenador.';

  @override
  String get snapPermissionsEnablingLabel => 'Activacion, aquò pòt trigar...';

  @override
  String get snapPermissionsDisablingLabel => 'Desactivacion, aquò pòt trigar...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription => 'Podètz gerir d’autras autorizacions dins Paramètres › Aplicacions.';

  @override
  String get snapPermissionsPageTitle => 'Permissions de l’aplicacion';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n règlas',
      one: '1 règla',
      zero: 'cap de règlas',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestion de las autorizacions $interface per $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Cap de règlas pel moment';

  @override
  String get snapRulesRemoveAll => 'Levar totas las règlas';

  @override
  String get homeInterfacePageTitle => 'Repertòri personal';

  @override
  String get homeInterfacePageDescription => 'Gerir las autorizacions d’accès als fichièrs dins vòstre repertòri personal.';

  @override
  String get interfacePageTitle => 'Gerir las permissions';

  @override
  String get interfacePageDescription => 'Las aplicacions estrictament limitadas vos demandaràn abans d’accedir als archius e dossièrs. Aquesta foncionalitat es experimentala e portada a modificacion.';

  @override
  String get interfacePageLinkLearnMore => 'Ne saber mai';

  @override
  String get interfacePageLinkGiveFeedback => 'Far un retorn';

  @override
  String get interfacePageLinkReportIssues => 'Senhalar de problèmas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicacions',
      one: '1 aplicacion',
      zero: 'cap d’aplicacions',
    );
    return '$_temp0';
  }
}
