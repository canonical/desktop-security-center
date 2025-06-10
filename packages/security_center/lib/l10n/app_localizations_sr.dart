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
  String get recoveryKeyPassphraseShow => 'Show';

  @override
  String get recoveryKeyPassphraseChange => 'Change';
}
