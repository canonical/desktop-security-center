// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Centro de seguridad';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permitir hasta cerrar sesión';

  @override
  String get snapdRuleCategorySessionDenied => 'Denegar hasta cerrar sesión';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permitir siempre';

  @override
  String get snapdRuleCategoryForeverDenied => 'Rechazar siempre';

  @override
  String get snapPermissionReadLabel => 'Leer';

  @override
  String get snapPermissionWriteLabel => 'Escribir';

  @override
  String get snapPermissionExecuteLabel => 'Ejecutar';

  @override
  String get snapPermissionsEnableTitle => 'Exigir a las aplicaciones que pidan permisos al sistema';

  @override
  String get snapPermissionsEnableWarning => 'Esta es una función experimental para controlar el acceso a los recursos de tu sistema.';

  @override
  String get snapPermissionsEnablingLabel => 'Habilitándolo, puede tardar unos segundos...';

  @override
  String get snapPermissionsDisablingLabel => 'Desactivándolo, puede tardar unos segundos…';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription => 'Puedes administrar otros permisos en Configuración › Aplicaciones.';

  @override
  String get snapPermissionsPageTitle => 'Permisos de la aplicación';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reglas',
      one: '1 regla',
      zero: 'sin reglas',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Administrar los permisos de $interface para $snap .';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Aún no hay reglas';

  @override
  String get snapRulesRemoveAll => 'Eliminar todas las reglas';

  @override
  String get homeInterfacePageTitle => 'Carpeta de usuario';

  @override
  String get homeInterfacePageDescription => 'Administrar los permisos para acceder a los archivos en la carpeta del usuario.';

  @override
  String get interfacePageTitle => 'Administrar permisos';

  @override
  String get interfacePageDescription => 'Las aplicaciones estrictamente limitadas te preguntarán antes de acceder a archivos y carpetas. Esta característica es experimental y está sujeta a cambios.';

  @override
  String get interfacePageLinkLearnMore => 'Aprender más';

  @override
  String get interfacePageLinkGiveFeedback => 'Dar tu opinión';

  @override
  String get interfacePageLinkReportIssues => 'Informar de problemas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicaciones',
      one: '1 aplicación',
      zero: 'sin aplicaciones',
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
