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
  String get diskEncryptionPageStoreYourKey => 'You should always store the recovery key for your encrypted disk somewhere safe to avoid losing access to all your data.';

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
  String get diskEncryptionPageKeyDoesntWork => 'Recovery key invalid';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => 'Please check your key and try again.';
}
