// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'უსაფრთხოების ცენტრი';

  @override
  String get snapdRuleCategorySessionAllowed => 'დაშვება გასვლამდე';

  @override
  String get snapdRuleCategorySessionDenied => 'აკრძალვა გასვლამდე';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ყოველთვის დაშვება';

  @override
  String get snapdRuleCategoryForeverDenied => 'ყოველთვის აკრძალვა';

  @override
  String get snapPermissionReadLabel => 'წაკითხვა';

  @override
  String get snapPermissionWriteLabel => 'ჩაწერა';

  @override
  String get snapPermissionExecuteLabel => 'გაშვება';

  @override
  String get snapPermissionsEnableTitle => 'აპებისთვის სისტემური უფლებების მოთხოვნის აუცილებლობა';

  @override
  String get snapPermissionsEnableWarning => 'ეს ექსპერიმენტული ფუნქციაა თქვენი სისტემის რესურსებთან წვდომის მართვისთვის.';

  @override
  String get snapPermissionsEnablingLabel => 'მიმდინარეობს ჩართვა. ამას რამდენიმე წამი დასჭირდება...';

  @override
  String get snapPermissionsDisablingLabel => 'მიმდინარეობს გათიშვა. ამას რამდენიმე წამი დასჭირდება...';

  @override
  String get snapPermissionsExperimentalLabel => 'ექსპერიმენტული';

  @override
  String get snapPermissionsOtherDescription => 'სხვა წვდომების მართვა შეგუძლიათ მენიუში მორგება > აპლიკაციები.';

  @override
  String get snapPermissionsPageTitle => 'აპის წვდომები';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n წესი',
      one: '1 წესი',
      zero: 'წესების გარეშე',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-ის წვდომების მართვა $snap-სთვის.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ჯერ წესები არაა';

  @override
  String get snapRulesRemoveAll => 'ყველა წესის წაშლა';

  @override
  String get homeInterfacePageTitle => 'საწყისის საქაღალდე';

  @override
  String get homeInterfacePageDescription => 'მართეთ წვდომები თქენს საწყის საქაღალდეში ფაილებთან წვდომისთვის.';

  @override
  String get interfacePageTitle => 'წვდომების მართვა';

  @override
  String get interfacePageDescription => 'მკაცრად შეზღუდული აპები თქვენს დადასტურებას მოითხოვენ ფაილებთან და საქაღალდეებთან წვდომამდე. ეს ფუნქცია ექსპერიმენტულია და მუდმივად იცვლება.';

  @override
  String get interfacePageLinkLearnMore => 'გაიგეთ მეტი';

  @override
  String get interfacePageLinkGiveFeedback => 'უკუკავშირი';

  @override
  String get interfacePageLinkReportIssues => 'პრობლემების ანგარიში';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n აპი',
      one: '1 აპი',
      zero: 'აპების გარეშე',
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
  String get recoveryKeyPassphraseHide => 'Hide';

  @override
  String get recoveryKeyPassphraseChange => 'Change';

  @override
  String get recoveryKeyPassphrasePINSuccessHeader => 'PIN updated';

  @override
  String get recoveryKeyPassphrasePINSuccessBody => 'You PIN was successfully updated.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => 'Passphrase updated';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody => 'You passphrase was successfully updated.';
}
