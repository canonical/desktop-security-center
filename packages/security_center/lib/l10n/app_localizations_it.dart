// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Centro Sicurezza';

  @override
  String get snapdRuleCategorySessionAllowed => 'Consenti fino al logout';

  @override
  String get snapdRuleCategorySessionDenied => 'Nega fino al logout';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Consenti sempre';

  @override
  String get snapdRuleCategoryForeverDenied => 'Nega sempre';

  @override
  String get snapPermissionReadLabel => 'Lettura';

  @override
  String get snapPermissionWriteLabel => 'Scrittura';

  @override
  String get snapPermissionExecuteLabel => 'Eseguibile';

  @override
  String get snapPermissionsEnableTitle => 'Impone alle app di richiedere i permessi di sistema';

  @override
  String get snapPermissionsEnableWarning => 'Questa è una funzionalità sperimentale per controllare l\'accesso alle tue risorse di sistema.';

  @override
  String get snapPermissionsEnablingLabel => 'L\'attivazione potrebbe richiedere alcuni secondi...';

  @override
  String get snapPermissionsDisablingLabel => 'La disabilitazione potrebbe richiedere alcuni secondi...';

  @override
  String get snapPermissionsExperimentalLabel => 'Sperimentale';

  @override
  String get snapPermissionsOtherDescription => 'Puoi gestire gli altri permessi in Impostazioni › Applicazioni.';

  @override
  String get snapPermissionsPageTitle => 'Permessi delle app';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rules',
      one: '1 rule',
      zero: 'no rules',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestisci i permessi di $interface per $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ancora nessuna regola';

  @override
  String get snapRulesRemoveAll => 'Rimuovi tutte le regole';

  @override
  String get homeInterfacePageTitle => 'Cartella Home';

  @override
  String get homeInterfacePageDescription => 'Gestisci i permessi per accedere ai file della tua cartella Home.';

  @override
  String get interfacePageTitle => 'Gestione permessi';

  @override
  String get interfacePageDescription => 'Le applicazioni strettamente confinate chiederanno all\'utente di accedere a file e cartelle. Questa funzione è sperimentale e soggetta a modifiche.';

  @override
  String get interfacePageLinkLearnMore => 'Per saperne di più';

  @override
  String get interfacePageLinkGiveFeedback => 'Dai un feedback';

  @override
  String get interfacePageLinkReportIssues => 'Segnala errori';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'no apps',
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
  String get diskEncryptionPageKeyDoesntWork => 'Recovery key does not work';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => 'Check the key or replace it with a new one.';

  @override
  String get diskEncryptionPageError => 'Error';
}
