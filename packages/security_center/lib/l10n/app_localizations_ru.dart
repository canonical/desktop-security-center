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

  @override
  String get diskEncryptionPageReplaceButton => 'Replace recovery key...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Replace recovery key';

  @override
  String get diskEncryptionPageReplaceDialogBody => 'Save the new recovery key somewhere safe. Once you replace it, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Show QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Save to file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge => 'I saved my recovery key somewhere safe';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Replace';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Discard';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => 'Recovery key replaced';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => 'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader => 'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody => 'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody => 'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copy';

  @override
  String get recoveryKeyExceptionFileSystemTitle => 'Recovery key file not saved';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle => 'Recovery key file cannot be saved in a temporary location';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Unknown error';

  @override
  String get recoveryKeyExceptionFileSystemBody => 'You do not have permission to write to that folder. Try a different location or use another method.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody => 'Try a different location, such as a removable drive, or use another method.';

  @override
  String get recoveryKeyFilePickerTitle => 'Save recovery key file';

  @override
  String get recoveryKeyFilePickerFilter => 'Text files';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware-backed encryption is enabled';

  @override
  String get recoveryKeyPassphraseEnabled => 'Encryption passphrase is enabled';

  @override
  String get recoveryKeyPassphraseHeader => 'Encryption  passphrase';

  @override
  String get recoveryKeyPassphraseBody => 'You need to enter your passpharse during startup to unlock the disk. You can change the passphrase but not disable it.';

  @override
  String get recoveryKeyPassphraseButton => 'Change passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Current passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'New passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirm passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError => 'Incorrect passphrase, try again';

  @override
  String get recoveryKeyPassphraseNewError => 'Must be at least 4 characters long';

  @override
  String get recoveryKeyPassphraseConfirmError => 'Passphrases do not match, try again';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Change Passphrase';

  @override
  String get recoveryKeyPINEnabled => 'Encryption PIN is enabled';

  @override
  String get recoveryKeyPINHeader => 'Encryption Pin';

  @override
  String get recoveryKeyPINBody => 'You need to enter your PIN during startup to unlock the disk. You can change the PIN but not disable it.';

  @override
  String get recoveryKeyPINButton => 'Change PIN...';

  @override
  String get recoveryKeyPINCurrent => 'Current PIN';

  @override
  String get recoveryKeyPINNew => 'New PIN';

  @override
  String get recoveryKeyPINConfirm => 'Confirm PIN';

  @override
  String get recoveryKeyPINCurrentError => 'Incorrect PIN, try again';

  @override
  String get recoveryKeyPINNewError => 'Must be at least 4 digits long';

  @override
  String get recoveryKeyPINConfirmError => 'PINs do not match, try again';

  @override
  String get recoveryKeyPINDialogHeader => 'Change PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Show';

  @override
  String get recoveryKeyPassphraseChange => 'Change';

  @override
  String get recoveryKeyPassphraseHide => 'Hide';
}
