// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Sikkerhedscenter';

  @override
  String get snapdRuleCategorySessionAllowed => 'Tillad indtil, der logges ud';

  @override
  String get snapdRuleCategorySessionDenied => 'Nægt indtil, der logges ud';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Tillad altid';

  @override
  String get snapdRuleCategoryForeverDenied => 'Nægt altid';

  @override
  String get snapPermissionReadLabel => 'Læse';

  @override
  String get snapPermissionWriteLabel => 'Skrive';

  @override
  String get snapPermissionExecuteLabel => 'Kørsel';

  @override
  String get snapPermissionsEnableTitle => 'Kræv, at programmer spørger om systemrettigheder';

  @override
  String get snapPermissionsEnableWarning => 'Dette er en eksperimentel funktion til at kontrollere adgangen til dit systems ressourcer.';

  @override
  String get snapPermissionsEnablingLabel => 'Det kan tage nogle sekunder at aktivere …';

  @override
  String get snapPermissionsDisablingLabel => 'Det kan tage nogle sekunder at deaktivere …';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimentel';

  @override
  String get snapPermissionsOtherDescription => 'Du kan håndtere andre rettigheder under Indstillinger › Programmer.';

  @override
  String get snapPermissionsPageTitle => 'Programrettigheder';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regler',
      one: '1 regel',
      zero: 'ingen regler',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Håndtér $interface-rettigheder for $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Endnu ingen regler';

  @override
  String get snapRulesRemoveAll => 'Fjern alle regler';

  @override
  String get homeInterfacePageTitle => 'Hjemmemappe';

  @override
  String get homeInterfacePageDescription => 'Håndtér rettigheder for filadgang i din hjemmemappe.';

  @override
  String get interfacePageTitle => 'Håndtér rettigheder';

  @override
  String get interfacePageDescription => 'Strengt isolerede programmer vil spørge dig, før de får adgang til filer og mapper. Denne funktion er eksperimentel og kan ændres.';

  @override
  String get interfacePageLinkLearnMore => 'Læs mere';

  @override
  String get interfacePageLinkGiveFeedback => 'Giv feedback';

  @override
  String get interfacePageLinkReportIssues => 'Rapportér problemer';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n programmer',
      one: '1 program',
      zero: 'ingen programmer',
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
}
