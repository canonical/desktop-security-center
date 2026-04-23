// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'Segurtasun zentroa';

  @override
  String get snapdRuleCategorySessionAllowed => 'Baimendu saioa amaitu arte';

  @override
  String get snapdRuleCategorySessionDenied => 'Ukatu saioa amaitu arte';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Baimendu beti';

  @override
  String get snapdRuleCategoryForeverDenied => 'Ukatu beti';

  @override
  String get snapPermissionReadLabel => 'Irakurri';

  @override
  String get snapPermissionWriteLabel => 'Idatzi';

  @override
  String get snapPermissionExecuteLabel => 'Exekutatu';

  @override
  String get snapPermissionAccessLabel => 'Atzitzea';

  @override
  String get snapPermissionsEnableTitle =>
      'Behartu aplikazioak sistemako baimenak eskatzera';

  @override
  String get snapPermissionsEnableWarning =>
      'Hau eginbide esperimentala da, sistemako baliabideetara sarbidea kontrolatzeko.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Gaitzen, honek segundo batzuk beharko ditu...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Ezgaitzen, honek segundo batzuk beharko ditu...';

  @override
  String get snapPermissionsExperimentalLabel => 'Esperimentala';

  @override
  String get snapPermissionsOtherDescription =>
      'Beste baimenak hemendik kudea ditzakezu: Ezarpenak > Aplikazioak.';

  @override
  String get snapPermissionsPageTitle => 'Aplikazioaren baimenak';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n arau',
      one: 'arau 1',
      zero: 'araurik ez',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Kudeatu $interface baimenak $snap aplikazioarentzat.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Araurik ez oraingoz';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Oraingoz aplikazio batek ere ez du sarbidea eskatu';

  @override
  String get snapRulesRemoveAll => 'Kendu arau guztiak';

  @override
  String get snapRulesResetAllPermissions => 'Berrezarri baimen guztiak';

  @override
  String get homeInterfacePageTitle => 'Karpeta nagusia';

  @override
  String get homeInterfacePageDescription =>
      'Kudeatu karpeta nagusiko fitxategiak atzitzeko baimenak.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Baimendu aplikazioei kamerak atzitzea.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofonoa';

  @override
  String get microphoneInterfacePageDescription =>
      'Baimendu aplikazioei mikrofonoa atzitzea.';

  @override
  String get interfacePageTitle => 'Kudeatu baimenak';

  @override
  String get interfacePageDescription =>
      'Zorrozki konfinatutako aplikazioek baimena eskatuko dizute fitxategi eta karpetak atzitu baino lehen. Eginbide hau esperimentala da, eta baliteke aldatzea.';

  @override
  String get interfacePageLinkLearnMore => 'Informazio gehiago';

  @override
  String get interfacePageLinkGiveFeedback => 'Eman iritzia';

  @override
  String get interfacePageLinkReportIssues => 'Eman arazoen berri';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikazio',
      one: 'aplikazio 1',
      zero: 'aplikaziorik ez',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Diskoaren zifratzea';

  @override
  String get diskEncryptionPageRecoveryKey => 'Berreskuratze gakoa';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Berreskuratze gakoak zure datuetara sarbidea berreskuratzeko aukera ematen dizu diskoa abioan desblokeatzeak huts egiten badu. Gorde leku seguruan.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Berreskuratze gakoak zure datuetara sarbidea berreskuratzeko aukera ematen dizu diskoa abioan desblokeatzeak huts egiten badu. Gorde leku seguruan. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Informazio gehiago hardware bidezko zifratzeari buruz';

  @override
  String get diskEncryptionPageCheckKey => 'Egiaztatu berreskuratze gakoa...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Egiaztatu berreskuratze gakoa';

  @override
  String get diskEncryptionPageCheck => 'Egiaztatu';

  @override
  String get diskEncryptionPageValidKey => 'Baliozko gakoa';

  @override
  String get diskEncryptionPageInvalidKey => 'Gako baliogabea';

  @override
  String get diskEncryptionPageEnterKey => 'Sartu berreskuratze gakoa';

  @override
  String get diskEncryptionPageKeyWorks =>
      'Berreskuratze gakoak funtzionatzen du';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ez ahaztu leku seguruan gordetzeaz.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Berreskuratze gakoak ez du funtzionatzen';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Egiaztatu gakoa edo ordezkatu berri batekin.';

  @override
  String get diskEncryptionPageError => 'Errorea';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Ordezkatu berreskuratze gakoa...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Ordezkatu berreskuratze gakoa';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Gorde berreskuratze gako berria leku seguruan. Ordezkatzen duzun unetik aurrera ezingo duzu gako zaharra berriro erabili.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Erakutsi QR kodea';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Gorde fitxategian';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Berreskuratze gakoa leku seguruan gorde dut';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Ordezkatu';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Baztertu';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Berreskuratze gakoa ordezkatu da';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Gogoratu leku seguruan gordetzeaz.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Berreskuratze gakoa ordezkatzeak huts egin du';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Arazoren bat egon da berreskuratze gakoa ordezkatzean, gako zaharrak baliozko izaten jarraituko du.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu mahaigaina - Zifratzearen berreskuratze gakoa';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Eskaneatu QR kodea berreskuratze gakoa kopiatzeko eta gorde leku seguruan, esaterako pasahitz kudeatzaile batean. Argazki bat ere egin diezaiokezu geroago erabiltzeko.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Arbelera kopiatu da';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopiatu';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Zifratze ezarpenak ez daude erabilgarri';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Huts egin du ordenagailuko zifratze egoera eskuratzeak.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Ordenagailuaren TPM konfigurazioa ez dago onartutako egoera batean.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Zure snapd bertsioak ez du sostengurik';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Egiaztatu Segurtasun zentroa eta snapd egunean daudela.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Segurtasun zentroa ezin da snapd interfazera konektatu';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Hau konpontzeko, exekutatu komando hau terminalean:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Gehitu PINa...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Gehitu pasaesaldia...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Gehitu pasaesaldia';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Gehitu PINa';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'PINa sartu beharko duzu ordenagailua abiarazten den bakoitzean. PINa eta erabiltzaile-pasahitza ez dira gauza bera.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'PINa ahazten baduzu, diskora sarbidea berreskuratzeko aukera izango duzu berreskuratze gakoa erabiliz.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Pasaesaldia sartu beharko duzu ordenagailua abiarazten den bakoitzean. Pasaesaldia eta erabiltzailea-pasahitza ez dira gauza bera.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Pasaesaldia ahazten baduzu, diskora sarbidea berreskuratzeko aukera izango duzu berreskuratze gakoa erabiliz.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Segurtasun gehigarria';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Pasaesaldi edo PIN bat ezar dezakezu segurtasun gehiagorako. Ordenagailua abiarazten den bakoitzean sartu beharko duzu.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Informazio gehiago';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Gehitu';

  @override
  String get diskEncryptionPageRemovePinButton => 'Kendu PINa...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Kendu pasaesaldia...';

  @override
  String get diskEncryptionPageAddingPin =>
      'PINa gehitzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Pasaesaldia gehitzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PINa kentzen, honek segundo batzuk beharko ditu...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Pasaesaldia kentzen, honek segundo batzuk beharko ditu...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Berreskuratze gakoaren fitxategia ez da gorde';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Berreskuratze gakoaren fitxategia ezin izan da gorde aldi baterako kokalekuan';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Errore ezezaguna';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Huts egin du berreskuratze gakoa fitxategian gordetzeak';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Ez duzu baimenik fitxategiaren kokalekuan idazteko.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Ez duzu karpeta horretan idazteko baimenik. Saiatu beste kokaleku batean edo erabili bestelako metodo bat.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Saiatu beste kokaleku batekin, esaterako unitate aldagarri bat, edo erabili bestelako metodo bat.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Gorde berreskuratze gakoaren fitxategia';

  @override
  String get recoveryKeyFilePickerFilter => 'Testu-fitxategiak';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware bidezko zifratzea gaituta dago';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Zifratze gakoak ordenagailuaren Konfiantzazko Plataforma Moduluan (TPM) gordetzen dira.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Informazio gehiago hardware bidezko zifratzeari buruz';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Zifratzearen pasaesaldia gaituta dago';

  @override
  String get recoveryKeyPassphraseHeader => 'Aldatu pasaesaldia';

  @override
  String get recoveryKeyPassphraseBody =>
      'Pasaesaldia sartu beharko duzu ordenagailua abiarazten den bakoitzean.';

  @override
  String get recoveryKeyPassphraseButton => 'Aldatu pasaesaldia...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Uneko pasaesaldia';

  @override
  String get recoveryKeyPassphraseNew => 'Pasaesaldi berria';

  @override
  String get recoveryKeyPassphraseConfirm => 'Berretsi pasaesaldia';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Okerreko pasaesaldia, saiatu berriz';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Gutxienez 4 karaktere izan behar ditu';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Pasaesaldiak ez datoz bat, saiatu berriz';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Aldatu pasaesaldia';

  @override
  String get recoveryKeyPinEnabled => 'Zifratzearen PINa gaituta dago';

  @override
  String get recoveryKeyPinHeader => 'Zifratzearen PINa';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Zifratzearen pasaesaldia';

  @override
  String get recoveryKeyPinBody =>
      'PINa sartu beharko duzu ordenagailua abiarazten den bakoitzean.';

  @override
  String get recoveryKeyPinButton => 'Aldatu PINa...';

  @override
  String get recoveryKeyPinCurrent => 'Uneko PINa';

  @override
  String get recoveryKeyPinNew => 'PIN berria';

  @override
  String get recoveryKeyPinConfirm => 'Berretsi PINa';

  @override
  String get recoveryKeyPinCurrentError => 'Okerreko PINa, saiatu berriz';

  @override
  String get recoveryKeyPinConfirmError => 'PINak ez datoz bat, saiatu berriz';

  @override
  String get recoveryKeyPinDialogHeader => 'Aldatu PINa';

  @override
  String get recoveryKeyPassphraseShow => 'Erakutsi';

  @override
  String get recoveryKeyPassphraseHide => 'Ezkutatu';

  @override
  String get recoveryKeyPassphraseChange => 'Aldatu';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PINa eguneratu da';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PINa behar bezala eguneratu da.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Pasaesaldia eguneratu da';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Pasaesaldia behar bezala eguneratu da.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Pasaesaldi ahula, egizu luzeagoa edo konplexuagoa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Baleko pasaesaldia, egizu luzeagoa edo konplexuagoa segurtasuna areagotzeko';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Pasaesaldi sendoa';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN ahula, egizu luzeagoa edo asmatzeko zailagoa';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Baleko PINa, egizu luzeagoa edo asmatzeko zailagoa segurtasuna areagotzeko';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Luzera egokiko PINa';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Zerbaitek huts egin du';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro ez dago erabilgarri Ubunturen bertsio honentzat';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro-k LTS bertsio bat behar du';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro-k ez du sostengurik snapd bertsio honetan';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Eguneratu snapd Ubuntu Pro kudeatzeko';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro gaituta dago';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Enpresa mailako segurtasuna eta betetzea zure ordenagailurako. Doakoa betiko erabilera pertsonalerako. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Informazio gehiago Ubuntu Pro-ri buruz';

  @override
  String get ubuntuProEnablePro => 'Gaitu Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Gaitu Ubuntu One kontuarekin';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Doako kontu bat sortu ahalko duzu';

  @override
  String get ubuntuProMagicPrompt =>
      'Hasi saioa zure Ubuntu One kontuarekin, edo sortu bat dohainik.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Jarraitu nabigatzailean';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Saioa $attachLink helbidean ere has dezakezu, eta bertan sartu $attachCode kodea';
  }

  @override
  String get ubuntuProMagicError =>
      'Ezin izan da Ubuntu Pro gaitu, saiatu berriz';

  @override
  String get ubuntuProEnableToken => 'Gaitu token batekin';

  @override
  String get ubuntuProEnableTokenError => 'Ezin izan da Ubuntu Pro gaitu';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'IT administratzailegandik edo hemendik: $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Eskuratu Ubuntu Pro token bat zure administratzaileagandik edo hemendik: $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Tokena';

  @override
  String get ubuntuProDisablePro => 'Ezgaitu Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Ezgaitu';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro ezgaitzen baduzu, makina hau harpidetzatik askatuko du. Jarraitu nahi duzu?';

  @override
  String get ubuntuProEnable => 'Gaitu';

  @override
  String get ubuntuProCancel => 'Utzi';

  @override
  String get ubuntuProFeatureEnableError =>
      'Ezin izan da eginbidea gaitu, saiatu berriz.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Ezin izan da eginbidea ezgaitu, saiatu berriz.';

  @override
  String get ubuntuProCompliance => 'Betetzea eta sendotzea';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'FedRAM, HIPAA eta bestelako betetze eta sendotze eskakizunekin laguntzeko soilik gomendatua.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubunturen Segurtasun Gida (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Sendotzea eta ikuskapena automatizatzen du CIS ebaluazioarekin eta DISA-STIG profilekin, inguruneari lotutako pertsonalizazioak onartuz.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'AEB eta Kanadako gobernuen modulu kriptografikoentzako betetze-ziurtapena, FIPS 140-2 datuen babeserako estandarrarekin.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Gaitu FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS gaitzea ezin da desegin, eta Livepatch betiko ezgaituko da.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Hautatu gogokoen duzun FIPS aukera';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS eguneratzeekin';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'FIPS 140-2k balioztatutako paketeak instalatzen ditu, eta aldian aldiko segurtasun-eguneratzeak ahalbidetzen ditu.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS eguneratze gabe';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'FIPS 140-2k balioztatutako paketeak instalatzen ditu. Hauek ez dira eguneratuko hurrengo berziurtapenera arte.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Segurtasun-betetzearen dokumentazioa';

  @override
  String get ubuntuProESMTitle => 'Segurtasunerako mantentze hedatua (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESMk 10 urterako segurtasun-adabakiak eskaintzen ditu 25.000 kode irekiko pakete baino gehiagorentzat. Lortu zaurgarritasunen kudeaketa etengabea, maila kritiko, goren eta ertaineko CVE-entzat.';

  @override
  String get ubuntuProESMMainTitle => 'Pakete nagusiak (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Segurtasun-eguneratzeak 2.300 Ubuntuko pakete nagusirentzat $year urtera arte';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe paketeak (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Segurtasun-eguneratze gehigarriak 23.000 Ubuntu Universe pakete baino gehiagorentzat $year urtera arte';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Gaitu Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Aplikatu kernelaren segurtasun-eguneratzeak sistema martxan dagoela';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Erakutsi Livepatch egoera goiko barran';
}
