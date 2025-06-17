// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பாதுகாப்பு நடுவண்';

  @override
  String get snapdRuleCategorySessionAllowed => 'வெளியேறும் வரை இசைவு';

  @override
  String get snapdRuleCategorySessionDenied => 'வெளியேறும் வரை மறு';

  @override
  String get snapdRuleCategoryForeverAllowed => 'எப்போதும் இசைவு';

  @override
  String get snapdRuleCategoryForeverDenied => 'எப்போதும் மறு';

  @override
  String get snapPermissionReadLabel => 'படி';

  @override
  String get snapPermissionWriteLabel => 'எழுது';

  @override
  String get snapPermissionExecuteLabel => 'இயக்கு';

  @override
  String get snapPermissionsEnableTitle => 'கணினி இசைவுகளைக் கேட்கப் பயன்பாடுகள் தேவை';

  @override
  String get snapPermissionsEnableWarning => 'உங்கள் கணினியின் வளங்களுக்கான அணுகலைக் கட்டுப்படுத்த இது ஒரு சோதனை நற்பண்பாகும்.';

  @override
  String get snapPermissionsEnablingLabel => 'செயல்படுத்த, இது சில நொடிகள் ஆகலாம் ...';

  @override
  String get snapPermissionsDisablingLabel => 'முடக்குதல், இதற்குச் சில நொடிகள் ஆகலாம் ...';

  @override
  String get snapPermissionsExperimentalLabel => 'சோதனை';

  @override
  String get snapPermissionsOtherDescription => 'பிற இசைவுகளை நீங்கள் நிர்வகிக்கலாம் அமைப்புகள்›பயன்பாடுகள்.';

  @override
  String get snapPermissionsPageTitle => 'பயன்பாட்டு இசைவுகள்';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n விதிகள்',
      one: '1 விதி',
      zero: 'விதிகள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snapக்கான $interface இசைவுகளை நிர்வகி.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'இன்னும் விதிகள் இல்லை';

  @override
  String get snapRulesRemoveAll => 'எல்லா விதிகளையும் அகற்று';

  @override
  String get homeInterfacePageTitle => 'வீட்டு கோப்புறை';

  @override
  String get homeInterfacePageDescription => 'உங்கள் வீட்டு கோப்புறையில் கோப்புகளை அணுக இசைவுகளை நிர்வகி.';

  @override
  String get interfacePageTitle => 'இசைவுகளை நிர்வகி';

  @override
  String get interfacePageDescription => 'கோப்புகள் மற்றும் கோப்புறைகளை அணுகுவதற்கு முன் கண்டிப்பாக வரையறுக்கப்பட்ட பயன்பாடுகள் உங்களிடம் கேட்கும். இந்த நற்பொருத்தம் சோதனை மற்றும் மாற்றங்களுக்கு உட்பட்டது.';

  @override
  String get interfacePageLinkLearnMore => 'மேலும் அறிக';

  @override
  String get interfacePageLinkGiveFeedback => 'கருத்து தெரிவி';

  @override
  String get interfacePageLinkReportIssues => 'சிக்கல்களைப் புகாரளி';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n பயன்பாடுகள்',
      one: '1 பயன்பாடு',
      zero: 'பயன்பாடுகள் இல்லை',
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
