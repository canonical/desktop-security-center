// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Centre de sécurité';

  @override
  String get snapdRuleCategorySessionAllowed => 'Autoriser jusqu’à fermeture de session';

  @override
  String get snapdRuleCategorySessionDenied => 'Refuser jusqu’à fermeture de session';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Autoriser toujours';

  @override
  String get snapdRuleCategoryForeverDenied => 'Refuser toujours';

  @override
  String get snapPermissionReadLabel => 'Lire';

  @override
  String get snapPermissionWriteLabel => 'Écrire';

  @override
  String get snapPermissionExecuteLabel => 'Exécuter';

  @override
  String get snapPermissionsEnableTitle => 'Exiger que les apps demandent des autorisations système';

  @override
  String get snapPermissionsEnableWarning => 'Il s’agit d’une fonctionnalité expérimentale pour contrôler l’accès aux ressources de votre système.';

  @override
  String get snapPermissionsEnablingLabel => 'Activation, cela peut prendre quelques secondes...';

  @override
  String get snapPermissionsDisablingLabel => 'Désactivation, cela peut prendre quelques secondes...';

  @override
  String get snapPermissionsExperimentalLabel => 'Expérimental';

  @override
  String get snapPermissionsOtherDescription => 'Vous pouvez gérer d’autres autorisations dans Paramètres › Applications.';

  @override
  String get snapPermissionsPageTitle => 'Permissions d\'app';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n règles',
      one: '1 règle',
      zero: 'aucune règle',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gérer autorisations $interface pour $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Pas encore de règles';

  @override
  String get snapRulesRemoveAll => 'Supprimer toutes les règles';

  @override
  String get homeInterfacePageTitle => 'Dossier d’accueil';

  @override
  String get homeInterfacePageDescription => 'Gérer les autorisations d’accès aux fichiers dans votre dossier personnel.';

  @override
  String get interfacePageTitle => 'Gérer permissions';

  @override
  String get interfacePageDescription => 'Les applications limitées strictement vous demanderont avant d’accéder aux fichiers et dossiers. Cette fonctionnalité est expérimentale et sujète à modifications.';

  @override
  String get interfacePageLinkLearnMore => 'En savoir plus';

  @override
  String get interfacePageLinkGiveFeedback => 'Donnez votre avis';

  @override
  String get interfacePageLinkReportIssues => 'Signaler un problème';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'aucune app',
    );
    return '$_temp0';
  }
}
