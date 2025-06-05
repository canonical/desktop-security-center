// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Центр безпеки';

  @override
  String get snapdRuleCategorySessionAllowed => 'Дозволити до виходу з системи';

  @override
  String get snapdRuleCategorySessionDenied => 'Заборонити до виходу з системи';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Завжди дозволяти';

  @override
  String get snapdRuleCategoryForeverDenied => 'Завжди забороняти';

  @override
  String get snapPermissionReadLabel => 'Читання';

  @override
  String get snapPermissionWriteLabel => 'Запис';

  @override
  String get snapPermissionExecuteLabel => 'Виконання';

  @override
  String get snapPermissionsEnableTitle => 'Вимагати від застосунків запитувати про системні дозволи';

  @override
  String get snapPermissionsEnableWarning => 'Це експериментальна можливість контролю доступу до ресурсів системи.';

  @override
  String get snapPermissionsEnablingLabel => 'Увімкнення може тривати кілька секунд...';

  @override
  String get snapPermissionsDisablingLabel => 'Вимкнення може тривати кілька секунд...';

  @override
  String get snapPermissionsExperimentalLabel => 'Експериментально';

  @override
  String get snapPermissionsOtherDescription => 'Ви можете керувати іншими дозволами в Налаштуваннях › Програми.';

  @override
  String get snapPermissionsPageTitle => 'Дозволи застосунків';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n правило',
      many: '$n правил',
      few: '$n правила',
      one: '1 правило',
      zero: 'немає правил',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Керувати дозволами $interface для $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ще немає правил';

  @override
  String get snapRulesRemoveAll => 'Вилучити всі правила';

  @override
  String get homeInterfacePageTitle => 'Домашня тека';

  @override
  String get homeInterfacePageDescription => 'Керувати дозволами на доступ до файлів у теці «Домівка».';

  @override
  String get interfacePageTitle => 'Керувати дозволами';

  @override
  String get interfacePageDescription => 'Суворо обмежені застосунки запитуватимуть вас перед доступом до файлів і тек. Ця функція експериментальна і може бути змінена.';

  @override
  String get interfacePageLinkLearnMore => 'Докладніше';

  @override
  String get interfacePageLinkGiveFeedback => 'Надіслати відгук';

  @override
  String get interfacePageLinkReportIssues => 'Повідомити про проблеми';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n застосунок',
      many: '$n застосунків',
      few: '$n застосунки',
      one: '1 застосунок',
      zero: 'немає застосунків',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey => 'The recovery key lets you regain access to the disk if decryption fails. Save the key somewhere safe to avoid losing access to all your data.';

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
