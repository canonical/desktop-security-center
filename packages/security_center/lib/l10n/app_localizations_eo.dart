// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Sekureca Centro';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permesi ĝis adiaŭo';

  @override
  String get snapdRuleCategorySessionDenied => 'Malpermesi ĝis adiaŭo';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permesi ĉiam';

  @override
  String get snapdRuleCategoryForeverDenied => 'Malpermesi ĉiam';

  @override
  String get snapPermissionReadLabel => 'Legi';

  @override
  String get snapPermissionWriteLabel => 'Skribi';

  @override
  String get snapPermissionExecuteLabel => 'Ruli';

  @override
  String get snapPermissionsEnableTitle => 'Igi programojn peti por sistemaj permesoj';

  @override
  String get snapPermissionsEnableWarning => 'Jen eksperimenta funkcio por kontroli uzojn de sistemaĵoj.';

  @override
  String get snapPermissionsEnablingLabel => 'Ŝaltante, tio eble daŭros kelkajn sekundojn…';

  @override
  String get snapPermissionsDisablingLabel => 'Malŝaltante, tio eble daŭros kelkajn sekundojn…';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimente';

  @override
  String get snapPermissionsOtherDescription => 'Vi povas administri aliajn permesojn ĉe «Agordoj › Aplikoj».';

  @override
  String get snapPermissionsPageTitle => 'Programaj permesoj';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reguloj',
      one: '1 regulo',
      zero: 'neniu regulo',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Administri permesojn de $snap pri $interface.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Neniu regulo ankoraŭ';

  @override
  String get snapRulesRemoveAll => 'Forigi ĉiujn regulojn';

  @override
  String get homeInterfacePageTitle => 'Hejmdosierujo';

  @override
  String get homeInterfacePageDescription => 'Administri permesojn uzi dosierojn en via hejma dosierujo.';

  @override
  String get interfacePageTitle => 'Administri permesojn';

  @override
  String get interfacePageDescription => 'Strikte enfermitaj programoj petos vin antaŭ ol uzi dosierojn kaj dosierujojn. Tiu funkcio estas eksperimenta kaj eble modifota.';

  @override
  String get interfacePageLinkLearnMore => 'Lerni plu';

  @override
  String get interfacePageLinkGiveFeedback => 'Recenzi';

  @override
  String get interfacePageLinkReportIssues => 'Raporti problemojn';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n programoj',
      one: '1 programo',
      zero: 'neniu programo',
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
