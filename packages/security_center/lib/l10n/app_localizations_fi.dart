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
  String get snapPermissionAccessLabel => 'Pääsyoikeudet';

  @override
  String get snapPermissionsEnableTitle =>
      'Vaadi sovellusten kysyä järjestelmän käyttöoikeuksia';

  @override
  String get snapPermissionsEnableWarning =>
      'Tämä on kokeellinen ominaisuus, jonka avulla on mahdollista hallita pääsyä järjestelmän resursseihin.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Otetaan käyttöön, tämä kestää hetken...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Poistetaan käytöstä, tämä kestää hetken...';

  @override
  String get snapPermissionsExperimentalLabel => 'Kokeellinen';

  @override
  String get snapPermissionsOtherDescription =>
      'Voit hallita muita oikeuksia menemällä Asetukset › Sovellukset.';

  @override
  String get snapPermissionsPageTitle => 'Sovelluksen oikeudet';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
    return 'Hallitse rajapinnan $interface oikeuksia snap-paketille $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ei vielä sääntöjä';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Yksikään sovellus ei ole pyytänyt pääsyoikeuksia';

  @override
  String get snapRulesRemoveAll => 'Poista kaikki säännöt';

  @override
  String get snapRulesResetAllPermissions =>
      'Palauta kaikki oikeudet oletuksiin';

  @override
  String get homeInterfacePageTitle => 'Kotikansio';

  @override
  String get homeInterfacePageDescription =>
      'Hallitse oikeuksia kotikansiossa olevien tiedostojen käytön suhteen.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Salli sovellusten käyttää kameroita.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofoni';

  @override
  String get microphoneInterfacePageDescription =>
      'Salli sovellusten käyttää mikrofonia.';

  @override
  String get interfacePageTitle => 'Hallitse oikeuksia';

  @override
  String get interfacePageDescription =>
      'Tiukasti rajoitetut sovellukset kysyvät lupaa ennen tiedostojen tai kansioiden käsittelyä. Tämä ominaisuus on kokeellinen ja saattaa muuttua.';

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
  String get diskEncryptionPageTitle => 'Levyn salaus';

  @override
  String get diskEncryptionPageRecoveryKey => 'Palautusavain';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Palautusavain mahdollistaa tietoihin pääsyn, jos levyn lukituksen avaus ei onnistu käynnistettäessä. Tallenna se turvalliseen paikkaan.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Palautusavain mahdollistaa tietoihin pääsyn, jos levyn lukituksen avaus ei onnistu käynnistettäessä. Tallenna se turvalliseen paikkaan. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Lue lisää laitevarmennetusta salauksesta';

  @override
  String get diskEncryptionPageCheckKey => 'Tarkista palautusavain...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'Tarkista palautusavain';

  @override
  String get diskEncryptionPageCheck => 'Tarkista';

  @override
  String get diskEncryptionPageValidKey => 'Kelvollinen avain';

  @override
  String get diskEncryptionPageInvalidKey => 'Virheellinen avain';

  @override
  String get diskEncryptionPageEnterKey => 'Syötä palautusavain';

  @override
  String get diskEncryptionPageKeyWorks => 'Palautusavain toimii';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Muista säilyttää se turvallisessa paikassa.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Palautusavain ei toimi';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Tarkista avain tai vaihda se uuteen.';

  @override
  String get diskEncryptionPageError => 'Virhe';

  @override
  String get diskEncryptionPageReplaceButton => 'Vaihda palautusavain...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Vaihda palautusavain';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Tallenna palautusavain turvalliseen paikkaan. Kun se on vaihdettu, vanhaa palautusavainta ei voi enää käyttää.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Näytä QR-koodi';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Tallenna tiedostoon';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Olen tallentanut avain turvalliseen paikkaan';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Vaihda';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Hylkää';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Palautusavain vaihdettu';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Muista säilyttää sitä turvallisessa paikassa.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Palautusavaimen vaihto epäonnistui';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Palautusavainta vaihdettaessa tapahtui virhe, vanha avaimesi on edelleen voimassa.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu-työpöytä - Salauksen palautusavain';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Skannaa QR-koodi kopioidaksesi salausavaimen ja tallentaaksesi sen turvalliseen paikkaan kuten salasanojen hallintasovellukseen. Voit myös ottta siitä kuvan myöhempää käyttöä varten.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Kopioitu leikepöydälle';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopioi';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Salausasetuksia ei ole saatavilla';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Tietokoneen salaustilanteen nouto epäonnistui.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Tietokoneen TPM-asetukset eivät ole tuetussa tilassa.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'snapd-versio ei ole tuettu';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Tarkista että Tietoturvakeskus ja snapd ovat ajan tasalla.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Tietoturvakeskus ei voi yhdistää snapd-liitäntään';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Korjataksesi tämän, suorita seuraava komento päätteessä:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Lisää PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Lisää tunnuslause...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Lisää tunnuslause';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Lisää PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'PIN-koodi tulee syöttää joka kerta tietokonetta käynnistettäessä. PIN-koodi on eri kuin käyttäjän salasana.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Jos unohdat PIN-koodin, voit päästä käsiksi levyn tietoihin käyttämällä palautusavainta.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Tunnuslause tulee syöttää joka kerta tietokonetta käynnistettäessä. Tunnuslause on eri kuin käyttäjän salasana.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Jos unohdat tunnuslauseen, voit päästä käsiksi levyn tietoihin käyttämällä palautusavainta.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Lisäturva';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Voit asettaa tunnuslauseen tai PIN-koodin lisäturvaksi. Se tulee syöttää joka kerta tietokonetta käynnistettäessä.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Lue lisää';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Lisää';

  @override
  String get diskEncryptionPageRemovePinButton => 'Poista PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Poista tunnuslause...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Lisätään PIN, tämä kestää hetken...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Lisätään tunnuslausetta, tämä kestää hetken...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Poistetaan PIN, tämä kestää hetken...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Poistetaan tunnuslause, tämä kestää hetken...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Palautusavainta ei tallennettu';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Palautusavainta ei voi tallentaa väliaikaiseen sijaintiin';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Tuntematon virhe';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Palautusavaimen tallentaminen tiedostoon epäonnistui';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Tähän sijaintiin ei ole oikeutta kirjoittaa.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Tähän kansioon ei ole oikeutta kirjoittaa. Yritä toista sijaintia tai käytä toista tapaa.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Käytä toista sijaintia kuten irrotettavaa asemaa, tai käytä toista tapaa.';

  @override
  String get recoveryKeyFilePickerTitle => 'Tallenna palautusavaimen tiedosto';

  @override
  String get recoveryKeyFilePickerFilter => 'Tekstitiedostot';

  @override
  String get recoveryKeyTPMEnabled => 'Laitteiston tukema salaus on käytössä';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Salausavaimet ovat tallennettu tietokoneen TPM-moduuliin (Trusted Platform Module).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Lue lisää laitteiston tukemasta salauksesta';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Salauksen tunnuslause on käytössä';

  @override
  String get recoveryKeyPassphraseHeader => 'Muuta tunnuslausetta';

  @override
  String get recoveryKeyPassphraseBody =>
      'Tunnuslause tulee syöttää joka kerta tietokonetta käynnistettäessä.';

  @override
  String get recoveryKeyPassphraseButton => 'Vaihda tunnuslause...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Nykyinen tunnuslause';

  @override
  String get recoveryKeyPassphraseNew => 'Uusi tunnuslause';

  @override
  String get recoveryKeyPassphraseConfirm => 'Vahvista tunnuslause';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Virheellinen tunnuslause, yritä uudelleen';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Tulee olla vähintään 4 merkkiä pitkä';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Tunnuslauseet eivät täsmää, yritä uudelleen';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Vaihda tunnuslause';

  @override
  String get recoveryKeyPinEnabled => 'Salauksen PIN-koodi on käytössä';

  @override
  String get recoveryKeyPinHeader => 'Salauksen PIN-koodi';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Salauksen tunnuslause';

  @override
  String get recoveryKeyPinBody =>
      'PIN-koodi tulee syöttää joka kerta tietokonetta käynnistettäessä.';

  @override
  String get recoveryKeyPinButton => 'Vaihda PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Nykyinen PIN';

  @override
  String get recoveryKeyPinNew => 'Uusi PIN';

  @override
  String get recoveryKeyPinConfirm => 'Vahvista PIN';

  @override
  String get recoveryKeyPinCurrentError =>
      'Virheellinen PIN-koodi, yritä uudelleen';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-koodit eivät täsmää, yritä uudelleen';

  @override
  String get recoveryKeyPinDialogHeader => 'Vaihda PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Näytä';

  @override
  String get recoveryKeyPassphraseHide => 'Piilota';

  @override
  String get recoveryKeyPassphraseChange => 'Muuta';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-koodi päivitetty';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PIN-koodi päivitettiin onnistuneesti.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Tunnuslause päivitetty';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Tunnuslause päivitettiin onnistuneesti.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Heikko tunnuslause, muuta pidemmäksi tai tee siitä monimutkaisempi';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Kohtuullinen tunnuslause, muuta pidemmäksi tai tee siitä monimutkaisempi parantaaksesi turvallisuutta';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Vahva tunnuslause';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Heikko PIN-koodi, tee siitä pidempi tai vähemmän ennustettava';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Kohtuullinen PIN-koodi, tee siitä pidempi tai vähemmän ennustettava turvallisuuden lisäämiseksi';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-koodi ei ole riittävän pitkä';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Tapahtui virhe';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro ei ole saatavilla tälle Ubuntu-versiolle';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro vaatii LTS-julkaisun';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro ei ole tuettu tämän snapd-version toimesta';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Päivitä snapd hallitaksesi Ubuntu Pro:ta';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro on käytössä';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Yritystason tietoturvaa ja vaatimustenmukaisuutta tietokoneellesi. Aina ilmainen henkilökohtaiseen käyttöön. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Lue lisää Ubuntu Pro:sta';

  @override
  String get ubuntuProEnablePro => 'Ota Ubuntu Pro käyttöön';

  @override
  String get ubuntuProEnableMagic => 'Ota käyttöön Ubuntu One -tilillä';

  @override
  String get ubuntuProEnableMagicSubtitle => 'Voit luoda tilin veloituksetta';

  @override
  String get ubuntuProMagicPrompt =>
      'Kirjaudu Ubuntu One -tilillä, tai luo tili veloituksetta.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Jatka selaimessa';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Voit myös kirjautua osoitteessa $attachLink ja kirjoittaa koodin $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Ubuntu Pro -käyttöönotto epäonnistui, yritä uudelleen';

  @override
  String get ubuntuProEnableToken => 'Ota käyttöön poletilla';

  @override
  String get ubuntuProEnableTokenError =>
      'Ubuntu Pro -käyttöönotto ei onnistunut';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Järjestelmänvalvojalta tai osoitteesta $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Hanki Ubuntu Pro -poletti ylläpitäjältäsi tai osoitteesta $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Poletti';

  @override
  String get ubuntuProDisablePro => 'Poista Ubuntu Pro käytöstä';

  @override
  String get ubuntuProDisable => 'Poista käytöstä';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntun Pro:n poistaminen käytöstä irrottaa tilauksesi tästä koneesta. Haluatko jatkaa?';

  @override
  String get ubuntuProEnable => 'Ota käyttöön';

  @override
  String get ubuntuProCancel => 'Peru';

  @override
  String get ubuntuProFeatureEnableError =>
      'Ominaisuutta ei voitu ottaa käyttöön, yritä uudelleen.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Ominaisuutta ei voitu poistaa käytöstä, yritä uudelleen.';

  @override
  String get ubuntuProCompliance => 'Vaatimustenmukaisuutta ja koventamista';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Suositeltu käytettäväksi vain FedRAMP-, HIPAA- ja muiden vaatimustenmukaisuus- ja koventamisvaatimusten avustamiseen.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntun tietoturvaohje (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatisoi koventamista ja auditoimista CIS-mittausta ja DISA-STIG-profiileja vasten samalla sallien ympäristökohtaisia mukautuksia.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Yhdysvaltain ja Kanadan valtionhallinnon salakirjoitusmoduulin sertifiointi FIPS 140-2 -datasuojaustandardin vaatimustenmukaisuutta vasten.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Ota FIPS käyttöön';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS:in käyttöönottoa ei voi kumota, ja Livepatch poistetaan pysyvästi käytöstä.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Valitse ensisijainen FIPS-asetus';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS päivityksillä';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Asentaa FIPS 140-2 -validoidut paketit ja sallii tavalliset tietoturvapäivitykset.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS ilman päivityksiä';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Asentaa FIPS 140-2 -validoidut paketit. Näitä ei päivitetä ennen seuraavaa uudelleensertifiointia.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Tietoturvan vaatimustenmukaisuuden dokumentaatio';

  @override
  String get ubuntuProESMTitle => 'Laajennettu tietoturvan ylläpito (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM tarjoaa 10 vuoden tietoturvatuen yli 25 000:lle avoimen lähdekoodin paketille. Saat jatkuvan haavoittuvuushallinnan kriittisille, suurille ja keskitason CVE:ille.';

  @override
  String get ubuntuProESMMainTitle => 'Main-paketit (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Tietoturvapäivitykset 2300:lle Ubuntun Main-paketille vuoteen $year asti';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe-paketit (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Tietoturvan lisäpäivitykset 23 000:lle Ubuntun Universe-paketille vuoteen $year asti';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Ytimen Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Ota Livepatch käyttöön';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Toteuta ytimen tietoturvapäivitykset järjestelmän ollessa käynnissä';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Näytä Livepatchin tila yläpalkissa';
}
