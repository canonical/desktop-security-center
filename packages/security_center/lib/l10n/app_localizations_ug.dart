// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AppLocalizationsUg extends AppLocalizations {
  AppLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get appTitle => 'بىخەتەرلىك مەركىزى';

  @override
  String get snapdRuleCategorySessionAllowed => 'تىزىمدىن چىققۇچە يول قويىدۇ';

  @override
  String get snapdRuleCategorySessionDenied => 'تىزىمدىن چىققۇچە رەت قىلىدۇ';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ھەمىشە يول قويىدۇ';

  @override
  String get snapdRuleCategoryForeverDenied => 'ھەمىشە رەت قىلىدۇ';

  @override
  String get snapPermissionReadLabel => 'ئوقۇش';

  @override
  String get snapPermissionWriteLabel => 'يېزىش';

  @override
  String get snapPermissionExecuteLabel => 'ئىجرا قىلىش';

  @override
  String get snapPermissionAccessLabel => 'زىيارەت';

  @override
  String get snapPermissionsEnableTitle =>
      'ئەپ سىستېما ئىجازىتى ئىلتىماس قىلىشى زۆرۈر';

  @override
  String get snapPermissionsEnableWarning =>
      'بۇ سىستېما مەنبەسىنى زىيارەت قىلىشنى تىزگىنلەيدىغان تەجرىبە خاراكتېرلىك ئىقتىدار.';

  @override
  String get snapPermissionsEnablingLabel =>
      'قوزغىتىۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get snapPermissionsDisablingLabel =>
      'چەكلەۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get snapPermissionsExperimentalLabel => 'تەجرىبە';

  @override
  String get snapPermissionsOtherDescription =>
      'باشقا ئىجازەتنى تەڭشەك › ئەپتە باشقۇرالايسىز.';

  @override
  String get snapPermissionsPageTitle => 'ئەپ ئىجازىتى';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n قائىدە',
      one: '1 rule',
      zero: 'قائىدە يوق',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snap نىڭ $interface ئىجازىتىنى باشقۇرىدۇ.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'تېخى قائىدە يوق';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'تېخى ھېچقانداق ئەپ زىيارەت ئىلتىماسى تەلەپ قىلمىدى';

  @override
  String get snapRulesRemoveAll => 'ھەممە قائىدىنى چىقىرىۋەت';

  @override
  String get snapRulesResetAllPermissions => 'ھەممە ئىجازەتنى ئەسلىگە قايتۇر';

  @override
  String get homeInterfacePageTitle => 'باش مۇندەرىجە';

  @override
  String get homeInterfacePageDescription =>
      'باش قىسقۇچىڭىزدىكى ھۆججەتنى زىيارەت قىلىش ئىجازىتىنى باشقۇرىدۇ.';

  @override
  String get cameraInterfacePageTitle => 'كامېرا';

  @override
  String get cameraInterfacePageDescription =>
      'ئەپنىڭ كامېرايىڭىزنى زىيارەت قىلىشىغا يول قويىدۇ.';

  @override
  String get microphoneInterfacePageTitle => 'مىكروفون';

  @override
  String get microphoneInterfacePageDescription =>
      'ئەپنىڭ مىكروفونىڭىزنى زىيارەت قىلىشىغا يول قويىدۇ.';

  @override
  String get interfacePageTitle => 'ئىجازەت باشقۇرۇش';

  @override
  String get interfacePageDescription =>
      'ئىجازىتى چەكلەنگەن ئەپ ھۆججەت ۋە قىسقۇچىڭىزنى زىيارەت قىلىشتىن ئىلگىرى سورايدۇ. بۇ ئىقتىدار تەجرىبە باسقۇچىدا بولۇپ، ئۆزگىرىشى مۇمكىن.';

  @override
  String get interfacePageLinkLearnMore => 'مول بىلىم';

  @override
  String get interfacePageLinkGiveFeedback => 'پىكىر بېرىڭ';

  @override
  String get interfacePageLinkReportIssues => 'مەسىلە مەلۇم قىلىڭ';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ئەپ',
      one: '1 ئەپ',
      zero: 'ئەپ يوق',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'دىسكا شىفىرلاش';

  @override
  String get diskEncryptionPageRecoveryKey => 'ئەسلىگە كەلتۈرۈش ئاچقۇچى';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'ئەگەر قوزغالغاندا دىسكىڭىزنىڭ قۇلۇپىنى ئاچالمىسا ئەسلىگە كەلتۈرۈش ئاچقۇچى سانلىق مەلۇماتلىرىڭىزنى زىيارەت قىلىشىڭىزغا يول قويىدۇ. ئۇنى بىخەتەر بىر جايغا ساقلاڭ.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'ئەگەر قوزغالغاندا دىسكىڭىزنىڭ قۇلۇپىنى ئاچالمىسا ئەسلىگە كەلتۈرۈش ئاچقۇچى سانلىق مەلۇماتلىرىڭىزنى زىيارەت قىلىشىڭىزغا يول قويىدۇ. ئۇنى بىخەتەر بىر جايغا ساقلاڭ. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'قاتتىق دېتال قوللايدىغان شىفىرلاش ھەققىدىكى تەپسىلات';

  @override
  String get diskEncryptionPageCheckKey => 'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى تەكشۈر…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى تەكشۈر';

  @override
  String get diskEncryptionPageCheck => 'تەكشۈر';

  @override
  String get diskEncryptionPageValidKey => 'ئىناۋەتلىك ئاچقۇچ';

  @override
  String get diskEncryptionPageInvalidKey => 'ئىناۋەتسىز ئاچقۇچ';

  @override
  String get diskEncryptionPageEnterKey =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىڭىزنى كىرگۈزۈڭ';

  @override
  String get diskEncryptionPageKeyWorks => 'ئەسلىگە كەلتۈرۈش ئاچقۇچى ئىشلىدى';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'ئۇنى بىرەر بىخەتەر جايدا ساقلاشنى ئۇنتۇماڭ.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچى ئىشلىمىدى';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'ئاچقۇچ تەكشۈرۈلىدۇ ياكى ئۇ يېڭىسىغا ئالماشتۇرۇلىدۇ.';

  @override
  String get diskEncryptionPageError => 'خاتالىق';

  @override
  String get diskEncryptionPageReplaceButton =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئالماشتۇر…';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئالماشتۇر';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'يېڭى ئەسلىگە كەلتۈرۈش ئاچقۇچىنى بىرەر بىخەتەر جايغا ساقلاڭ. ئۇنى ئالماشتۇرسىڭىز، كونا ئاچقۇچنى ئەمدى ئىشلىتەلمەيسىز.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR كودىنى كۆرسەت';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'ھۆججەتكە ساقلا';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى بىخەتەر جايغا ساقلىدىم';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'ئالماشتۇر';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'تاشلىۋەت';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچى ئالماشتۇرۇلدى';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'ئۇنى بىرەر بىخەتەر جايدا ساقلاشنى ئۇنتۇماڭ.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچى ئالماشتۇرالمىدى';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئالماشتۇرۇۋاتقاندا خاتالىق كۆرۈلدى، كونا ئاچقۇچىڭىز ئىناۋەتلىك پېتى قالىدۇ.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu ئۈستەلئۈستى - شىفىرلانغان ئەسلىگە كەلتۈرۈش ئاچقۇچى';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'QR كودىنى تاراپ ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئىم باشقۇرغۇچقا ئوخشاش بىرەر بىخەتەر جايدا ساقلاڭ. كېيىن ئىشلىتىش ئۈچۈن ئۇنى سۈرەتكە تارتسىڭىزمۇ بولىدۇ.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'چاپلاش تاختىسىغا كۆچۈرۈلدى';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'كۆچۈر';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'شىفىرلاش تەڭشىكىنى ئىشلەتكىلى بولمايدۇ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'بۇ كومپيۇتېرنىڭ شىفىرلاش ھالىتىگە ئېرىشەلمىدى.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'كومپيۇتېرىڭىزنىڭ TPM سەپلىمىسى قوللايدىغان ھالەتتە ئەمەس.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'سىزنىڭ snapd نەشرىڭىزنى قوللىمايدۇ';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'بىخەتەرلىك مەركىزىنى تەكشۈرۈپ ئاندىن snapd نىڭ ئەڭ يېڭى نەشرى ئىكەنلىكىنى جەزملەڭ.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'بىخەتەرلىك مەركىزى snapd ئارايۈزىگە باغلىنالمايدۇ';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'بۇنى ئوڭشاش ئۈچۈن، تۆۋەندىكى بۇيرۇق تېرمىنالدا ئىجرا قىلىنىدۇ:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snapd ئۈستەلئۈستى بىخەتەرلىك مەركىزىگە باغلاندى: snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'PIN قوش…';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'ئىم ئىبارە قوش…';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'ئىم ئىبارە قوش';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PIN قوش';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'كومپيۇتېرىڭىز ھەر قېتىم قوزغالغاندا PIN كىرگۈزۈشىڭىز كېرەك. بۇ PIN ئىشلەتكۈچى ئىمدىن پەرقلىق.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'ئەگەر PIN نى ئۇنتۇپ قالسىڭىز، ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئىشلىتىپ دىسكىنى زىيارەت قىلىش ئىجازىتىگە قايتا ئېرىشەلەيسىز.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'كومپيۇتېرىڭىز ھەر قېتىم قوزغالغاندا ئىم ئىبارە كىرگۈزۈشىڭىز كېرەك. بۇ ئىم ئىبارە ئىشلەتكۈچى ئىمدىن پەرقلىق.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'ئەگەر ئىم ئىبارىنى ئۇنتۇپ قالسىڭىز، ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ئىشلىتىپ دىسكىنى زىيارەت قىلىش ئىجازىتىگە قايتا ئېرىشەلەيسىز.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'قوشۇمچە بىخەتەرلىك';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'قوشۇمچە بىخەتەرلىك ئۈچۈن ئىم ئىبارە ياكى PIN تەڭشىيەلەيسىز. كومپيۇتېرىڭىز ھەر قېتىم قوزغالغاندا ئۇنى كىرگۈزۈشىڭىز كېرەك.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'مول بىلىم';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'قوش';

  @override
  String get diskEncryptionPageRemovePinButton => 'PIN نى چىقىرىۋەت…';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'ئىم ئىبارىنى چىقىرىۋەت…';

  @override
  String get diskEncryptionPageAddingPin =>
      'PIN قوشۇۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'ئىم ئىبارە قوشۇۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PIN چىقىرىۋېتىۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'ئىم ئىبارە چىقىرىۋېتىۋاتىدۇ، بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچى ساقلانمىدى';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچ ھۆججىتىنى ۋاقىتلىق ئورۇنغا ساقلىيالمايدۇ';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'يوچۇن خاتالىق';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىڭىزنى ھۆججەتكە ساقلىيالمىدى';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'ئۇ ھۆججەت ئورنىغا يېزىش ئىجازىتىڭىز يوق.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'ئۇ قىسقۇچ ئورنىغا يېزىش ئىجازىتىڭىز يوق. پەرقلىق ئورۇننى سىناڭ ياكى باشقا ئۇسۇلنى ئىشلىتىڭ.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'كۆچمە دىسكىغا ئوخشاش پەرقلىق ئورۇننى سىناڭ ياكى باشقا ئۇسۇلنى ئىشلىتىڭ.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'ئەسلىگە كەلتۈرۈش ئاچقۇچىنى ساقلايدۇ';

  @override
  String get recoveryKeyFilePickerFilter => 'تېكىست ھۆججەت';

  @override
  String get recoveryKeyTPMEnabled =>
      'قاتتىق دېتال قوللايدىغان شىفىرلاش قوزغىتىلدى';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'شىفىرلىق ئاچقۇچ كومپيۇتېرىڭىزنىڭ ئىشەنچلىك سۇپا مودېلى (TPM) غا ساقلاندى.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'قاتتىق دېتال قوللايدىغان شىفىرلاش ھەققىدىكى تەپسىلات';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'شىفىرلانغان ئىم ئىبارە قوزغىتىلدى';

  @override
  String get recoveryKeyPassphraseHeader => 'ئىم ئىبارە ئۆزگەرت';

  @override
  String get recoveryKeyPassphraseBody =>
      'كومپيۇتېرىڭىز ھەر قېتىم قوزغالغاندا ئىم ئىبارە كىرگۈزۈشىڭىز كېرەك.';

  @override
  String get recoveryKeyPassphraseButton => 'ئىم ئىبارە ئۆزگەرت…';

  @override
  String get recoveryKeyPassphraseCurrent => 'نۆۋەتتىكى ئىم ئىبارە';

  @override
  String get recoveryKeyPassphraseNew => 'يېڭى ئىم ئىبارە';

  @override
  String get recoveryKeyPassphraseConfirm => 'جەزملەش ئىم ئىبارە';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'ئىم ئىبارە توغرا ئەمەس، قايتا سىناڭ';

  @override
  String get recoveryKeyPassphraseNewError =>
      'ئەڭ ئاز دېگەندە 4 ھەرپ بولۇشى كېرەك';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'ئىم ئىبارە ماس كەلمىدى. قايتا سىناڭ';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'ئىم ئىبارە ئۆزگەرت';

  @override
  String get recoveryKeyPinEnabled => 'شىفىرلانغان PIN قوزغىتىلدى';

  @override
  String get recoveryKeyPinHeader => 'شىفىرلانغان PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'شىفىرلانغان ئىم ئىبارە';

  @override
  String get recoveryKeyPinBody =>
      'كومپيۇتېرىڭىز ھەر قېتىم قوزغالغاندا PIN كىرگۈزۈشىڭىز كېرەك.';

  @override
  String get recoveryKeyPinButton => 'PIN ئۆزگەرت…';

  @override
  String get recoveryKeyPinCurrent => 'نۆۋەتتىكى PIN';

  @override
  String get recoveryKeyPinNew => 'يېڭى PIN';

  @override
  String get recoveryKeyPinConfirm => 'جەزملەش PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN خاتا، قايتا سىناڭ';

  @override
  String get recoveryKeyPinConfirmError => 'PIN ماس كەلمىدى. قايتا سىناڭ';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN ئۆزگەرت';

  @override
  String get recoveryKeyPassphraseShow => 'كۆرسەت';

  @override
  String get recoveryKeyPassphraseHide => 'يوشۇر';

  @override
  String get recoveryKeyPassphraseChange => 'ئۆزگەرت';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN يېڭىلاندى';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PIN مۇۋەپپەقىيەتلىك يېڭىلاندى.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'ئىم ئىبارە يېڭىلاندى';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'ئىم ئىبارە مۇۋەپپەقىيەتلىك يېڭىلاندى.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'ئاجىز ئىم ئىبارە، ئۇزۇنراق ياكى تېخىمۇ مۇرەككەپ قىلىڭ';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'ياخشى ئىم ئىبار، تېخىمۇ بىخەتەر بولۇشى ئۈچۈن ئۇزۇنراق ياكى تېخىمۇ مۇرەككەپ قىلىڭ';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'كۈچلۈك ئىم ئىبارە';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'ئاجىز PIN، ئۇزۇنراق ياكى مۆلچەرلەشنى تەسلەشتۈرۈڭ';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'ياخشى PIN، تېخىمۇ بىخەتەر بولۇشى ئۈچۈن ئۇزۇنراق ياكى مۆلچەرلەشنى تەسلەشتۈرۈڭ';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN يېتەرلىك ئۇزۇن';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'كاشىلا كۆرۈلدى';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'بۇ Ubuntu نەشرىدە Ubuntu Pro نى ئىشلەتكىلى بولمايدۇ';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro ئۈچۈن LTS نەشرى زۆرۈر';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'بۇ snapd نەشرى Ubuntu Pro نى قوللىمايدۇ';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ubuntu Pro نى باشقۇرۇش ئۈچۈن snapd نەشرىنى يېڭىلايدۇ';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro قوزغىتىلغان';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'كومپيۇتېردا كارخانا دەرىجىسىدىكى بىخەتەرلىك ۋە ماسلىشىشچانلىقنى ئىشلىتىش شەخسلەر ئۈچۈن ھەمىشە ھەقسىز. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Ubuntu Pro ھەققىدىكى مول بىلىم';

  @override
  String get ubuntuProEnablePro => 'Ubuntu Pro نى قوزغات';

  @override
  String get ubuntuProEnableMagic => 'Ubuntu One ھېسابتا قوزغات';

  @override
  String get ubuntuProEnableMagicSubtitle => 'ھېسابنى ھەقسىز قۇرالايسىز';

  @override
  String get ubuntuProMagicPrompt =>
      'Ubuntu One ھېسابتا تىزىمغا كىرىڭ ياكى بىر ھەقسىز قۇرۇڭ.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'تور كۆرگۈدە داۋاملاشتۇر';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'سىز $attachLink تىزىمغا كىرىپ ۋە $attachCode نى كىرگۈزەلەيسىز';
  }

  @override
  String get ubuntuProMagicError => 'Ubuntu Pro نى قوزغىتالمايدۇ، قايتا سىناڭ';

  @override
  String get ubuntuProEnableToken => 'پەرمان تاختىدا قوزغىتىدۇ';

  @override
  String get ubuntuProEnableTokenError => 'Ubuntu Pro نى قوزغىتالمايدۇ';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'ئۇچۇر تېخنىكا باشقۇرغۇچى ياكى $proLink دىن';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Ubuntu Pro پەرمان تاختىسىنى باشقۇرغۇچىڭىز ياكى $proLink دىن ئېرىشىڭ';
  }

  @override
  String get ubuntuProTokenLabel => 'پەرمان تاختا';

  @override
  String get ubuntuProDisablePro => 'Ubuntu Pro چەكلە';

  @override
  String get ubuntuProDisable => 'چەكلە';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro نى چەكلىسىڭىز بۇ كومپيۇتېردىكى مۇشتەرىلىكىڭىز توختايدۇ. داۋاملاشتۇرامسىز؟';

  @override
  String get ubuntuProEnable => 'قوزغات';

  @override
  String get ubuntuProCancel => 'ۋاز كەچ';

  @override
  String get ubuntuProFeatureEnableError =>
      'بۇ ئىقتىدارنى قوزغىتالمايدۇ، قايتا سىناڭ.';

  @override
  String get ubuntuProFeatureDisableError =>
      'بۇ ئىقتىدارنى چەكلىيەلمەيدۇ، قايتا سىناڭ.';

  @override
  String get ubuntuProCompliance => 'ماسلاشتۇرۇش ۋە كۈچەيتىش';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'پەقەت FedRAMP، HIPAA ۋە باشقا ماسلىشىش ۋە كۈچەيتىش تەلەپلىرى ئارقىلىق ياردەم بېرىش تەۋسىيە قىلىنىدۇ.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Ubuntu بىخەتەرلىك قوللانمىسى (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automates hardening and auditing with CIS benchmark and DISA-STIG profiles while allowing for environment-specific customizations.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'A US and Canada government cryptographic module certification of compliance with the FIPS 140-2 data protection standard.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Enable FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Enabling FIPS cannot be reversed and Livepatch will be permanently disabled.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Choose your preferred FIPS option';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS with updates';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installs FIPS 140-2 validated packages and allows for regular security updates.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS without updates';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installs FIPS 140-2 validated packages. These will not be updated until the next recertification.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Security compliance documentation';

  @override
  String get ubuntuProESMTitle => 'Expanded Security Maintenance (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM provides 10 years of security patches for 25,000+ open source packages. Get continuous vulnerability management for critical, high, and medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for 2,300 Ubuntu Main package until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for over 23,000 Ubuntu Universe packages until $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Enable Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Apply kernel security updates while the system runs';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Show Livepatch status in the top bar';
}
