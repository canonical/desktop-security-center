// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Центр безопасности';

  @override
  String get snapdRuleCategorySessionAllowed => 'Разрешить до выхода из системы';

  @override
  String get snapdRuleCategorySessionDenied => 'Запретить до выхода из системы';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Разрешать всегда';

  @override
  String get snapdRuleCategoryForeverDenied => 'Никогда не разрешать';

  @override
  String get snapPermissionReadLabel => 'Чтение';

  @override
  String get snapPermissionWriteLabel => 'Запись';

  @override
  String get snapPermissionExecuteLabel => 'Выполнение';

  @override
  String get snapPermissionsEnableTitle => 'Требовать с приложений запрос системных разрешений';

  @override
  String get snapPermissionsEnableWarning => 'Это экспериментальная функция для контроля доступа к ресурсам системы.';

  @override
  String get snapPermissionsEnablingLabel => 'Включение может занять несколько секунд...';

  @override
  String get snapPermissionsDisablingLabel => 'Отключение может занять несколько секунд...';

  @override
  String get snapPermissionsExperimentalLabel => 'Экспериментально';

  @override
  String get snapPermissionsOtherDescription => 'Управлять другими разрешениями можно в Настройках › Приложения.';

  @override
  String get snapPermissionsPageTitle => 'Разрешения приложений';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n правил',
      two: '2 правила',
      one: '1 правило',
      zero: 'нет правил',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Управление разрешениями к $interface для $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Правил ещё нет';

  @override
  String get snapRulesRemoveAll => 'Удалить все правила';

  @override
  String get homeInterfacePageTitle => 'Домашняя папка';

  @override
  String get homeInterfacePageDescription => 'Управление разрешениями для доступа к файлам в Домашней папке.';

  @override
  String get interfacePageTitle => 'Управление разрешениями';

  @override
  String get interfacePageDescription => 'Строго ограниченные приложения будут спрашивать Вас, прежде чем получить доступ к файлам и папкам. Эта функция является экспериментальной и может быть изменена.';

  @override
  String get interfacePageLinkLearnMore => 'Узнать больше';

  @override
  String get interfacePageLinkGiveFeedback => 'Отправить отзыв';

  @override
  String get interfacePageLinkReportIssues => 'Сообщить о проблеме';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n приложений',
      two: '2 приложения',
      one: '1 приложение',
      zero: 'нет приложений',
    );
    return '$_temp0';
  }
}
