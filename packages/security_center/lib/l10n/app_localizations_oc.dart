// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Occitan (`oc`).
class AppLocalizationsOc extends AppLocalizations {
  AppLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get appTitle => 'Centre de seguretat';

  @override
  String get snapdRuleCategorySessionAllowed => 'Autorizar fins la desconnexion';

  @override
  String get snapdRuleCategorySessionDenied => 'Refusar fins la desconnexion';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Totjorn autorizar';

  @override
  String get snapdRuleCategoryForeverDenied => 'Totjorn refusar';

  @override
  String get snapPermissionReadLabel => 'Lectura';

  @override
  String get snapPermissionWriteLabel => 'Escritura';

  @override
  String get snapPermissionExecuteLabel => 'Executar';

  @override
  String get snapPermissionsEnableTitle => 'Exigir que las aplicacions demanden d’autorizacions al sistèma';

  @override
  String get snapPermissionsEnableWarning => 'Es una foncionalitat experimentala per contrarotlar l’accès a las ressorsas de vòstre ordenador.';

  @override
  String get snapPermissionsEnablingLabel => 'Activacion, aquò pòt trigar...';

  @override
  String get snapPermissionsDisablingLabel => 'Desactivacion, aquò pòt trigar...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription => 'Podètz gerir d’autras autorizacions dins Paramètres › Aplicacions.';

  @override
  String get snapPermissionsPageTitle => 'Permissions de l’aplicacion';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n règlas',
      one: '1 règla',
      zero: 'cap de règlas',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestion de las autorizacions $interface per $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Cap de règlas pel moment';

  @override
  String get snapRulesRemoveAll => 'Levar totas las règlas';

  @override
  String get homeInterfacePageTitle => 'Repertòri personal';

  @override
  String get homeInterfacePageDescription => 'Gerir las autorizacions d’accès als fichièrs dins vòstre repertòri personal.';

  @override
  String get interfacePageTitle => 'Gerir las permissions';

  @override
  String get interfacePageDescription => 'Las aplicacions estrictament limitadas vos demandaràn abans d’accedir als archius e dossièrs. Aquesta foncionalitat es experimentala e portada a modificacion.';

  @override
  String get interfacePageLinkLearnMore => 'Ne saber mai';

  @override
  String get interfacePageLinkGiveFeedback => 'Far un retorn';

  @override
  String get interfacePageLinkReportIssues => 'Senhalar de problèmas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicacions',
      one: '1 aplicacion',
      zero: 'cap d’aplicacions',
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
}
