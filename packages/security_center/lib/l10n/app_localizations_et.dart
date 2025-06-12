// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Andmeturbekeskus';

  @override
  String get snapdRuleCategorySessionAllowed => 'Luba kuni väljalogimiseni';

  @override
  String get snapdRuleCategorySessionDenied => 'Keela kuni väljalogimiseni';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Luba alati';

  @override
  String get snapdRuleCategoryForeverDenied => 'Keela alati';

  @override
  String get snapPermissionReadLabel => 'Lugemine';

  @override
  String get snapPermissionWriteLabel => 'Kirjutamine';

  @override
  String get snapPermissionExecuteLabel => 'Käivitamine';

  @override
  String get snapPermissionsEnableTitle => 'Eelda, et rakendused küsivad operatsioonisüsteemilt õigusi';

  @override
  String get snapPermissionsEnableWarning => 'See on katseline funktsionaalsus, mis võimaldab kontrollida ligipääsu süsteemiressurssidele.';

  @override
  String get snapPermissionsEnablingLabel => 'Lülitame sisse, selleks kulub mõni sekund...';

  @override
  String get snapPermissionsDisablingLabel => 'Lülitame välja, selleks kulub mõni sekund...';

  @override
  String get snapPermissionsExperimentalLabel => 'Katseline';

  @override
  String get snapPermissionsOtherDescription => 'Muid õigusi saad hallata valikust „Sätted › Rakendused“.';

  @override
  String get snapPermissionsPageTitle => 'Rakenduste õigused';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reeglit',
      one: '1 reegel',
      zero: 'reeglid on määratlemata',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Halda „$snap“ paketi õigusi „$interface“ liidese kasutamisel.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Reeglid on veel määratlemata';

  @override
  String get snapRulesRemoveAll => 'Eemalda kõik reeglid';

  @override
  String get homeInterfacePageTitle => 'Kodukaust';

  @override
  String get homeInterfacePageDescription => 'Halda failide ligipääsuõigusi kodukaustas.';

  @override
  String get interfacePageTitle => 'Halda õigusi';

  @override
  String get interfacePageDescription => 'Kui rakendus töötab rangelt seadistatud eraldatud konteineris, siis ta peab sult enne failide ja kaustade avamist luba küsima. See funktsionaalsus on veel katsejärgus ning selles võib tekkida muudatusi.';

  @override
  String get interfacePageLinkLearnMore => 'Loe lisaks';

  @override
  String get interfacePageLinkGiveFeedback => 'Jaga tagasisidet';

  @override
  String get interfacePageLinkReportIssues => 'Teata veast või problemist';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rakendust',
      one: '1 rakendus',
      zero: 'ühtegi rakendust pole seadistatud',
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
