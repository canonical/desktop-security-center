// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Sekureca Centro';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permesi ĝis adiaŭo';

  @override
  String get snapdRuleCategorySessionDenied => 'Malpermesi ĝis adiaŭo';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permesi ĉiam';

  @override
  String get snapdRuleCategoryForeverDenied => 'Malpermesi ĉiam';

  @override
  String get snapPermissionReadLabel => 'Legi';

  @override
  String get snapPermissionWriteLabel => 'Skribi';

  @override
  String get snapPermissionExecuteLabel => 'Ruli';

  @override
  String get snapPermissionAccessLabel => 'Atingi';

  @override
  String get snapPermissionsEnableTitle =>
      'Igi programojn peti por sistemaj permesoj';

  @override
  String get snapPermissionsEnableWarning =>
      'Jen eksperimenta funkcio por kontroli uzojn de sistemaĵoj.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Ŝaltante, tio eble daŭros kelkajn sekundojn…';

  @override
  String get snapPermissionsDisablingLabel =>
      'Malŝaltante, tio eble daŭros kelkajn sekundojn…';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimente';

  @override
  String get snapPermissionsOtherDescription =>
      'Vi povas administri aliajn permesojn ĉe «Agordoj › Aplikoj».';

  @override
  String get snapPermissionsPageTitle => 'Programaj permesoj';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reguloj',
      one: '1 regulo',
      zero: 'neniu regulo',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Administri permesojn de $snap pri $interface.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Neniu regulo ankoraŭ';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Neniu programo petis atingon ankoraŭ';

  @override
  String get snapRulesRemoveAll => 'Forigi ĉiujn regulojn';

  @override
  String get snapRulesResetAllPermissions => 'Apriorigi ĉiujn permesojn';

  @override
  String get homeInterfacePageTitle => 'Hejmdosierujo';

  @override
  String get homeInterfacePageDescription =>
      'Administri permesojn uzi dosierojn en via hejma dosierujo.';

  @override
  String get cameraInterfacePageTitle => 'Kamerao';

  @override
  String get cameraInterfacePageDescription =>
      'Permesi al programoj atingi viajn kamerojn.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofono';

  @override
  String get microphoneInterfacePageDescription =>
      'Permesi al programoj atingi vian mikrofonon.';

  @override
  String get interfacePageTitle => 'Administri permesojn';

  @override
  String get interfacePageDescription =>
      'Strikte enfermitaj programoj petos vin antaŭ ol uzi dosierojn kaj dosierujojn. Tiu funkcio estas eksperimenta kaj eble modifota.';

  @override
  String get interfacePageLinkLearnMore => 'Lerni plu';

  @override
  String get interfacePageLinkGiveFeedback => 'Recenzi';

  @override
  String get interfacePageLinkReportIssues => 'Raporti problemojn';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n programoj',
      one: '1 programo',
      zero: 'neniu programo',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Diska ĉifrado';

  @override
  String get diskEncryptionPageRecoveryKey => 'Restaŭra ŝlosilo';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La restaŭra ŝlosilo ebligas al vi reakiri viajn datenojn, se vi ne povas malŝlosi la diskon dum starto. Konservu ĝin en sekura loko.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La restaŭra ŝlosilo ebligas reatingi viajn datenojn, se oni malsukcesas malŝlosi la diskon dum starto. Konservu ĝin en sekura loko. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Lerni plu pri aparato-baza ĉifrado';

  @override
  String get diskEncryptionPageCheckKey => 'Kontroli restaŭran ŝlosilon…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Kontroli restaŭran ŝlosilon';

  @override
  String get diskEncryptionPageCheck => 'Kontroli';

  @override
  String get diskEncryptionPageValidKey => 'Valida ŝlosilo';

  @override
  String get diskEncryptionPageInvalidKey => 'Nevalida ŝlosilo';

  @override
  String get diskEncryptionPageEnterKey => 'Tajpu vian restaŭran ŝlosilon';

  @override
  String get diskEncryptionPageKeyWorks => 'Restaŭra ŝlosilo funkcias';

  @override
  String get diskEncryptionPageKeyWorksBody => 'Konservu ĝin en sekura loko.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Restaŭra ŝlosilo ne funkcias';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Kontrolu la ŝlosilon aŭ anstataŭigu ĝin per alia.';

  @override
  String get diskEncryptionPageError => 'Eraro';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Anstataŭigi restaŭran ŝlosilon…';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Anstataŭigi restaŭran ŝlosilon';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Konservu la novan restaŭran ŝlosilon en sekura loko. Post anstataŭigo, vi ne plu povos uzi la malnovan ŝlosilon.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Montri QR-kodon';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Konservi en dosieron';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Mi konservis mian restaŭran ŝlosilon en sekura loko';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Anstataŭigi';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Forĵeti';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Restaŭra ŝlosilo anstataŭiĝis';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Konservu ĝin en sekura loko.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Malsukcesis anstataŭigi restaŭran ŝlosilon';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Io fiaskis dum anstataŭigado de via restaŭra ŝlosilo. Via malnova ŝlosilo restas valida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop – Ĉifra restaŭra ŝlosilo';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Skanu la QR-kodon por kopii la restaŭran ŝlosilon kaj konservu ĝin en sekura loko kiel ekzemple pasvortadministrilo. Vi ankaŭ povas foti ĝin por posta uzado.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Kopiite en tondujon';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopii';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Ĉifraj agordoj ne disponeblas';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Malsukcesis akiri la staton de ĉifrado de ĉi tiu komputilo.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La Fidata Platforma Modulo (TPM) de via komputilo ne estas en subtenata stato.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Via versio de snapd ne estas subtenata';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Kontrolu, ĉu la Sekureca Centro kaj snapd estas ĝisdataj.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Ne povas konekti Sekurecan Centron al la interfaco de snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Por ripari tion, rulu la jenan komandon en la terminalo:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Aldoni PIN…';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Aldoni pasfrazon…';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Aldoni pasfrazon';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Aldoni PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Vi devas tajpi vian PIN ĉiun fojon, kiam via komputilo startas. Ĉi tiu PIN diferencas de via uzanto-pasvorto.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Se vi forgesos vian PIN, vi povos reatingi la diskon per la restaŭra ŝlosilo.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Vi devas tajpi vian pasfrazon ĉiun fojon, kiam via komputilo startas. Ĉi tiu pasfrazo diferencas de via uzanto-pasvorto.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Se vi forgesos vian pasfrazon, vi povos reatingi la diskon per la restaŭra ŝlosilo.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Plia sekureco';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Vi povas starigi pasfrazon aŭ PIN por plia sekureco. Vi devos tajpi ĝin ĉiun fojon, kiam via komputilo startos.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Lerni plu';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Aldoni';

  @override
  String get diskEncryptionPageRemovePinButton => 'Forigi PIN…';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Forigi pasfrazon…';

  @override
  String get diskEncryptionPageAddingPin =>
      'Aldonante PIN, tio eble daŭros kelkajn sekundojn…';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Aldonante pasfrazon, tio eble daŭros kelkajn sekundojn…';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Forigante PIN, tio eble daŭros kelkajn sekundojn…';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Forigante pasfrazon, tio eble daŭros kelkajn sekundojn…';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Dosiero de restaŭra ŝlosilo ne konserviĝis';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Oni ne konservu la dosieron de restaŭra ŝlosilo en provizoran lokon';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Nekonata eraro';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Malsukcesis konservi vian restaŭran ŝlosilon al dosiero';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Vi ne rajtas skribi al tiu dosierloko.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Vi ne rajtas skribi en tiun dosierujon. Provu alian lokon, aŭ uzu alian metodon.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Provu alian lokon, ekzemple poŝmemorilon, aŭ uzu alian metodon.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Konservi dosieron de restaŭra ŝlosilo';

  @override
  String get recoveryKeyFilePickerFilter => 'Tekstaj dosieroj';

  @override
  String get recoveryKeyTPMEnabled => 'Aparato-baza ĉifrado estas ŝaltita';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'La ĉifraj ŝlosiloj konserviĝas en la Fidata Platforma Modulo (TPM) de via komputilo.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Lernu plu pri aparato-baza ĉifrado';

  @override
  String get recoveryKeyPassphraseEnabled => 'Ĉifra pasfrazo estas ŝaltita';

  @override
  String get recoveryKeyPassphraseHeader => 'Ŝanĝi pasfrazon';

  @override
  String get recoveryKeyPassphraseBody =>
      'Vi devas tajpi vian pasfrazon ĉiun fojon, kiam via komputilo startas.';

  @override
  String get recoveryKeyPassphraseButton => 'Ŝanĝi pasfrazon…';

  @override
  String get recoveryKeyPassphraseCurrent => 'Aktuala pasfrazo';

  @override
  String get recoveryKeyPassphraseNew => 'Nova pasfrazo';

  @override
  String get recoveryKeyPassphraseConfirm => 'Konfirmu pasfrazon';

  @override
  String get recoveryKeyPassphraseCurrentError => 'Pasfrazo ne ĝustas; reprovu';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Pasfrazo enhavu almenaŭ 4 skribsignojn';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Pasfrazoj ne kongruas; reprovu';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Ŝanĝi pasfrazon';

  @override
  String get recoveryKeyPinEnabled => 'Ĉifra PIN estas ŝaltita';

  @override
  String get recoveryKeyPinHeader => 'Ĉifra PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Ĉifra pasfrazo';

  @override
  String get recoveryKeyPinBody =>
      'Vi devas tajpi vian PIN ĉiun fojon, kiam via komputilo startas.';

  @override
  String get recoveryKeyPinButton => 'Ŝanĝi PIN…';

  @override
  String get recoveryKeyPinCurrent => 'Aktuala PIN';

  @override
  String get recoveryKeyPinNew => 'Nova PIN';

  @override
  String get recoveryKeyPinConfirm => 'Konfirmi PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN ne estas ĝusta; reprovu';

  @override
  String get recoveryKeyPinConfirmError => 'PIN-oj ne kongruas; reprovu';

  @override
  String get recoveryKeyPinDialogHeader => 'Ŝanĝi PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Malkaŝi';

  @override
  String get recoveryKeyPassphraseHide => 'Kaŝi';

  @override
  String get recoveryKeyPassphraseChange => 'Ŝanĝi';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN ŝanĝiĝis';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Via PIN estis sukcese ŝanĝita.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Pasfrazo ŝanĝiĝis';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Via pasfrazo estis sukcese ŝanĝita.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'La pasfrazo estas tro malforta; plilongigu aŭ kompliku ĝin';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'La pasfrazo estas malforteta; por pli da sekureco, plilongigu aŭ kompliku ĝin';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Forta pasfrazo';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN estas malforta; plilongigu aŭ kompliku ĝin';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN estas malforteta; por pli da sekureco, plilongigu aŭ kompliku ĝin';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN esta sufiĉe longa';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Io fiaskis';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro ne estas disponebla por ĉi tiu versio de Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro postulas daŭre subtenatan version (LTS)';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ĉi tiu versio de snapd ne subtenas Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ĝisdatigu snapd por administri Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro estas ŝaltita';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Entrepreno-nivelaj sekureco kaj konformiĝo por via komputilo. Ĉiam senkosta por persona uzado. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Lernu pli pri Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Ŝalti Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Ŝalti per konto Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle => 'vi povos krei konton senkoste';

  @override
  String get ubuntuProMagicPrompt =>
      'Salutu per via konto Ubuntu One, aŭ kreu konton senkoste.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Daŭri en TTT-legilo';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Vi ankaŭ povas saluti ĉe $attachLink, tajpante la kodon $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Malsukcesis ŝalti Ubuntu Pro, bonvolu reprovi';

  @override
  String get ubuntuProEnableToken => 'Ŝalti per ĵetono';

  @override
  String get ubuntuProEnableTokenError => 'Malsukcesis ŝalti Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'El via teĥnika administranto aŭ el $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Akiru ĵetonon por Ubuntu Pro el via administranto aŭ el $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Ĵetono';

  @override
  String get ubuntuProDisablePro => 'Malŝalti Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Malŝalti';

  @override
  String get ubuntuProDisablePrompt =>
      'Malŝaltante Ubuntu Pro, vi dekroĉos vian abonon de ĉi tiu komputilo. Ĉu daŭrigi?';

  @override
  String get ubuntuProEnable => 'Ŝalti';

  @override
  String get ubuntuProCancel => 'Nuligi';

  @override
  String get ubuntuProFeatureEnableError =>
      'Malsukcesis ŝalti funkcion, bonvolu reprovi.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Malsukcesis malŝalti funkcion, bonvolu reprovi.';

  @override
  String get ubuntuProCompliance => 'Konformiĝo kaj malmoligo';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Nur por helpi plenumi postulojn pri konformiĝo kaj malmoligo laŭ FedRAMP, HIPAA, kaj similaj normoj.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Gvidilo pri Sekureco de Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Aŭtomatigi malmoligon kaj ekzamenadon per testado CIS kaj profiloj DISA-STIG, permesante medio-specifajn adaptojn.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Atestado de konformeco de ĉifraj moduloj al la datenprotekta normo FIPS 140-2 de la Usona kaj Kanada registaroj.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Ŝalti FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Ŝaltado de FIPS ne estas malfarebla; Livepatch estos porĉiame malŝaltita.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Elektu vian preferatan opcion pri FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS kun ĝisdatigoj';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Instali pakojn validajn por FIPS 140-2, kun regulaj ĝisdatigoj pri sekureco.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sen ĝisdatigoj';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Instali pakojn validajn por FIPS 140-2. Tiuj ne estos ĝisdatigitaj ĝis la sekva validecokontrolo.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentaro pri konformiĝo al sekurecaj normoj';

  @override
  String get ubuntuProESMTitle => 'Etendita Sekureca Mastrumado (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM provizas 10 jarojn da sekurigaj ĝisdatigoj por pli ol 25 000 malfermitkodaj pakoj. Ĝuu daŭran mastrumadon kontraŭ vundeblaĵoj de kriza, alta, kaj meza CVE-niveloj.';

  @override
  String get ubuntuProESMMainTitle => 'Ĉefaj pakoj (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Sekurigaj ĝisdatigoj por 2300 ĉefaj pakoj de Ubuntu ĝis $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universaj pakoj (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Pliaj sekurigaj ĝisdatigoj por pli ol 23 000 universaj pakoj de Ubuntu ĝis $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch por kerno';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Ŝalti Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Efektivigi kernajn sekurigajn ĝisdatigojn dum la sistemo ruliĝas';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Montri staton de Livepatch en la supra breto';
}
