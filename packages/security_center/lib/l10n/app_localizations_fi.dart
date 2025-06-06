// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Tietoturvakeskus';

  @override
  String get snapdRuleCategorySessionAllowed => 'Salli uloskirjautumiseen asti';

  @override
  String get snapdRuleCategorySessionDenied => 'Estä uloskirjautumiseen asti';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Salli aina';

  @override
  String get snapdRuleCategoryForeverDenied => 'Estä aina';

  @override
  String get snapPermissionReadLabel => 'Lue';

  @override
  String get snapPermissionWriteLabel => 'Kirjoita';

  @override
  String get snapPermissionExecuteLabel => 'Suorita';

  @override
  String get snapPermissionsEnableTitle => 'Vaadi sovellusten kysyä järjestelmän käyttöoikeuksia';

  @override
  String get snapPermissionsEnableWarning => 'Tämä on kokeellinen ominaisuus, jonka avulla on mahdollista hallita pääsyä järjestelmän resursseihin.';

  @override
  String get snapPermissionsEnablingLabel => 'Otetaan käyttöön, tämä saattaa kestää hetken...';

  @override
  String get snapPermissionsDisablingLabel => 'Poistetaa käytöstä, tämä saattaa kestään hetken...';

  @override
  String get snapPermissionsExperimentalLabel => 'Kokeellinen';

  @override
  String get snapPermissionsOtherDescription => 'Voit hallita muita oikeuksia menemällä Asetukset › Sovellukset.';

  @override
  String get snapPermissionsPageTitle => 'Sovelluksen oikeudet';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sääntöä',
      one: '1 sääntö',
      zero: 'ei sääntöjä',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Manage $interface permissions for $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ei vielä sääntöjä';

  @override
  String get snapRulesRemoveAll => 'Poista kaikki säännöt';

  @override
  String get homeInterfacePageTitle => 'Kotikansio';

  @override
  String get homeInterfacePageDescription => 'Hallitse oikeuksia kotikansiossa olevie tiedostojen käytön suhteen.';

  @override
  String get interfacePageTitle => 'Hallitse oikeuksia';

  @override
  String get interfacePageDescription => 'Strictly confined apps will ask you before accessing files and folders. This feature is experimental and subject to changes.';

  @override
  String get interfacePageLinkLearnMore => 'Lue lisää';

  @override
  String get interfacePageLinkGiveFeedback => 'Anna palautetta';

  @override
  String get interfacePageLinkReportIssues => 'Ilmoita ongelmista';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sovellusta',
      one: '1 sovellus',
      zero: 'ei sovelluksia',
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
}
