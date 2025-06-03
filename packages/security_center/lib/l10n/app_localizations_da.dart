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
