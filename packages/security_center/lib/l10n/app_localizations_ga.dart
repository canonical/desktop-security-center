// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'Ionad Slándála';

  @override
  String get snapdRuleCategorySessionAllowed => 'Ceadaigh go dtí go logáil amach';

  @override
  String get snapdRuleCategorySessionDenied => 'Diúltaigh go dtí logáil amach';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Ceadaigh i gcónaí';

  @override
  String get snapdRuleCategoryForeverDenied => 'Diúltaigh i gcónaí';

  @override
  String get snapPermissionReadLabel => 'Léigh';

  @override
  String get snapPermissionWriteLabel => 'Scríobh';

  @override
  String get snapPermissionExecuteLabel => 'Rith';

  @override
  String get snapPermissionsEnableTitle => 'Éilíonn aipeanna ceadanna córais a iarraidh';

  @override
  String get snapPermissionsEnableWarning => 'Is gné thurgnamhach é seo chun rochtain ar acmhainní do chórais a rialú.';

  @override
  String get snapPermissionsEnablingLabel => 'Á chumasú, seans go dtógfaidh sé cúpla soicind...';

  @override
  String get snapPermissionsDisablingLabel => 'Á dhíchumasú, seans go dtógfaidh sé cúpla soicind...';

  @override
  String get snapPermissionsExperimentalLabel => 'Turgnamhach';

  @override
  String get snapPermissionsOtherDescription => 'Is féidir leat ceadanna eile a bhainistiú i Socruithe › Feidhmchláir.';

  @override
  String get snapPermissionsPageTitle => 'Ceadanna Aip';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rialacha',
      one: '1 riail',
      zero: 'gan rialacha',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Bainistigh ceadanna $interface le haghaidh $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Níl aon rialacha fós';

  @override
  String get snapRulesRemoveAll => 'Bain na rialacha go léir';

  @override
  String get homeInterfacePageTitle => 'Fillteán baile';

  @override
  String get homeInterfacePageDescription => 'Bainistigh ceadanna chun comhaid a rochtain i d\'fhillteán Baile.';

  @override
  String get interfacePageTitle => 'Bainistigh ceadanna';

  @override
  String get interfacePageDescription => 'Iarrfaidh aipeanna atá teoranta go docht ort roimh rochtain a fháil ar chomhaid agus ar fhillteáin. Tá an ghné seo turgnamhach agus faoi réir athruithe.';

  @override
  String get interfacePageLinkLearnMore => 'Foghlaim níos mó';

  @override
  String get interfacePageLinkGiveFeedback => 'Tabhair aiseolas';

  @override
  String get interfacePageLinkReportIssues => 'Saincheisteanna a thuairisciú';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aipeanna',
      one: '1 aip',
      zero: 'gan aipeanna',
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
