// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'מרכז אבטחה';

  @override
  String get snapdRuleCategorySessionAllowed => 'לאפשר עד היציאה מהחשבון';

  @override
  String get snapdRuleCategorySessionDenied => 'לדחות עד היציאה מהחשבון';

  @override
  String get snapdRuleCategoryForeverAllowed => 'לאפשר תמיד';

  @override
  String get snapdRuleCategoryForeverDenied => 'לדחות תמיד';

  @override
  String get snapPermissionReadLabel => 'קריאה';

  @override
  String get snapPermissionWriteLabel => 'כתיבה';

  @override
  String get snapPermissionExecuteLabel => 'הפעלה';

  @override
  String get snapPermissionsEnableTitle => 'לדרוש מהיישומים לבקש הרשאות מערכת';

  @override
  String get snapPermissionsEnableWarning => 'זאת יכולת ניסיונית לשליטה בגישה למשאבי המערכת שלך.';

  @override
  String get snapPermissionsEnablingLabel => 'האפשרות מופעלת, זה עלול לקחת כמה שניות…';

  @override
  String get snapPermissionsDisablingLabel => 'האפשרות נכבית, זה עלול לקחת כמה שניות…';

  @override
  String get snapPermissionsExperimentalLabel => 'ניסיוני';

  @override
  String get snapPermissionsOtherDescription => 'אפשר לנהל הגדרות אחרות דרך הגדרות › יישומים.';

  @override
  String get snapPermissionsPageTitle => 'הרשאות יישום';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n כללים',
      one: 'כלל אחד',
      zero: 'אין כללים',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'ניהול ההרשאות של $interface עבור $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'אין כללים עדיין';

  @override
  String get snapRulesRemoveAll => 'להסיר את כל הכללים';

  @override
  String get homeInterfacePageTitle => 'תיקיית הבית';

  @override
  String get homeInterfacePageDescription => 'ניהול הרשאות לגישה לקבצים בתיקיית הבית שלך.';

  @override
  String get interfacePageTitle => 'ניהול הרשאות';

  @override
  String get interfacePageDescription => 'יישומים מוגבלים באופן הדוק יבקשו ממך הרשאה בטרם גישה לקבצים ולתיקיות. היכולת הזאת ניסיונית ועלולה להשתנות.';

  @override
  String get interfacePageLinkLearnMore => 'מידע נוסף';

  @override
  String get interfacePageLinkGiveFeedback => 'שליחת משוב';

  @override
  String get interfacePageLinkReportIssues => 'דיווח על תקלות';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n יישומים',
      one: 'יישום אחד',
      zero: 'אין יישומים',
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
  String get diskEncryptionPageReplaceDialogSuccessHeader => 'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => 'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody => 'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';

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
}
