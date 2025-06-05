// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Центар за безбедност';

  @override
  String get snapdRuleCategorySessionAllowed => 'Дозволи до одјаве';

  @override
  String get snapdRuleCategorySessionDenied => 'Одбиј до одјаве';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Увек дозволи';

  @override
  String get snapdRuleCategoryForeverDenied => 'Увек одбиј';

  @override
  String get snapPermissionReadLabel => 'Читање';

  @override
  String get snapPermissionWriteLabel => 'Писање';

  @override
  String get snapPermissionExecuteLabel => 'Извршавање';

  @override
  String get snapPermissionsEnableTitle => 'Захтевај да апликације траже дозволе за приступ системским ресурсима';

  @override
  String get snapPermissionsEnableWarning => 'Ово је експериментална функција за контролу приступа ресурсима вашег Система.';

  @override
  String get snapPermissionsEnablingLabel => 'Омогућавање, може потрајати неколико секунди...';

  @override
  String get snapPermissionsDisablingLabel => 'Онемогућавање, може потрајати неколико секунди...';

  @override
  String get snapPermissionsExperimentalLabel => 'Експериментално';

  @override
  String get snapPermissionsOtherDescription => 'Можете управљати другим дозволама у Подешавања › Апликације.';

  @override
  String get snapPermissionsPageTitle => 'Дозволе апликација';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n правила',
      one: '1 правило',
      zero: 'нема правила',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Управљај дозволама за $interface за $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Још увек нема правила';

  @override
  String get snapRulesRemoveAll => 'Уклони сва правила';

  @override
  String get homeInterfacePageTitle => 'Почетни фолдер';

  @override
  String get homeInterfacePageDescription => 'Управљај дозволама за приступ фајловима у вашем Почетном фолдеру.';

  @override
  String get interfacePageTitle => 'Управљај дозволама';

  @override
  String get interfacePageDescription => 'Строго ограничене апликације ће вас питати пре приступа фајловима и фолдерима. Ова функција је експериментална и подложна променама.';

  @override
  String get interfacePageLinkLearnMore => 'Сазнајте више';

  @override
  String get interfacePageLinkGiveFeedback => 'Дајте повратне информације';

  @override
  String get interfacePageLinkReportIssues => 'Пријавите проблеме';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n апликација',
      one: '1 апликација',
      zero: 'нема апликација',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey => 'The recovery key lets you regain access to your data if your disk fails to unlock during startup. Save it somewhere safe.';

  @override
  String get diskEncryptionPageLearnMore => 'Learn more about recovery keys';

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
