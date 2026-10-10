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
  String get permissionRulePopupMenuSemanticLabel => 'ئىجازەت يېڭىلا';

  @override
  String get snapdRuleCategoryForeverDenied => 'ھەمىشە رەت قىلىدۇ';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'ۋاقىتلىق يول قوي';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'ۋاقىتلىق رەت قىل';

  @override
  String get snapdRuleCategoryAskAlways => 'ھەمىشە سورا';

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
      'قۇم قۇتىدا سىنالغان ئەپ ئىجازەت ئىلتىماس قىلىشى زۆرۈر';

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
  String get snapPermissionsErrorTitle => 'خاتالىق كۆرۈلدى';

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
  String get interfacePageLinkLearnMore => 'مول بىلىم';

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
  String get diskEncryptionPageRepairHeader => 'Disk encryption needs repair';

  @override
  String get diskEncryptionPageRepairBody =>
      'Automatic repair failed during decryption. Repair the disk now to start the computer without a recovery key.';

  @override
  String get diskEncryptionPageRepairButton => 'Start repair...';

  @override
  String get diskEncryptionPageRepairing => 'Repairing...';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Repair encryption';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Hardware-backed encryption could not be repaired';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Disk encryption no longer needs repair.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Any PIN and passphrase will be removed';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'You can add them again after repair.';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'Save the new recovery key somewhere safe. Once repairing completes, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Old recovery keys will stop working';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'You may want to let your IT administrator know you are re-encrypting the disk in case they are storing any recovery keys.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Repair';

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
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

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
  String get passphraseTypePassphraseTileTitle =>
      'Require a passphrase on startup';

  @override
  String get passphraseTypePinTileTitle => 'Require a PIN on startup';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Hardware-backed encryption requires additional security in this computer.';

  @override
  String get tpmActionPageTitleActionable =>
      'There is an issue with hardware-backed encryption';

  @override
  String get tpmActionDetailsLabel => 'Technical details';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Solution $n: $text';
  }

  @override
  String tpmActionSingleSolutionLabel(String text) {
    return 'Solution: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Try the solutions below or contact IT support.';

  @override
  String get tpmActionErrorSupportSingleLabel =>
      'Try the solution below or contact IT support.';

  @override
  String get tpmActionErrorKindInternal => 'Internal error.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Power off is required.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Restart is required.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Unexpected action.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Missing argument.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Invalid argument.';

  @override
  String get tpmActionErrorKindActionFailed => 'Action failed.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'The current environment is a virtual machine.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'This computer is using older firmware (legacy BIOS) that is not compatible with this encryption method.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'This computer does not have the required security hardware (TPM 2.0) for this encryption method.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'This computer\'s TPM is disabled.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'This computer\'s TPM is already in use by another system or application.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'This computer\'s TPM is currently locked.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'This computer\'s TPM does not have enough storage available.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'This computer is not compatible with hardware-backed encryption.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'This computer is missing a required security feature (DMA protection).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'This computer is missing a required security feature (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'There is an issue with this computer\'s security configuration.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'There is software running at startup that might prevent a secure connection with the computer\'s TPM.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Absolute Persistence Module is enabled in this computer.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Secure boot is disabled in this computer or is not set in deployed mode.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Some of the certificates verifying software in this computer are outdated or use weak protection.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'This computer is using a manual allowlist to verify software at startup.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Add-on drivers are present.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'This computer is missing a required security feature (hardware root of trust).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'There is an issue with this computer\'s TPM.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionFixActionReboot => 'Restart';

  @override
  String get tpmActionFixActionShutdown => 'Power off';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Restart to firmware settings';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Restart and press the settings key repeatedly during startup (commonly F2, F10 or Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Enable DMA protection manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Enable secure boot manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Enable IOMMU manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Enable PCR banks manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Enable TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Disable Absolute Persistence Module manually';

  @override
  String get tpmActionFixActionContactOem => 'Contact OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Contact OS vendor';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware => 'Enable TPM on restart';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Enable and clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpmViaFirmware => 'Clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpm => 'Clear TPM';

  @override
  String get tpmActionFixActionProceed => 'Ignore';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Restart the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Restarting the computer may fix the issue.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Power off the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'You can do this in your computer\'s firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'You might be able to do this in your computer\'s firmware settings. Check the documentation of the CPU vendor for guidance.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Check secure boot mode is set to \"deployed\".';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'This feature might be referred to as \"Virtualization Technology\", \"VT-d\" or \"AMD-Vi\".';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Ignoring this issue might result in a less secure installation.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Ignore and continue';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Clearing the TPM erases all encryption keys';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'You will lose access to all data in encrypted drives for which you do not have recovery keys. It will also break other features that depend on the TPM, such as authentication and certificates.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'I understand the risk';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'You might be asked to confirm this action on restart.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Then you will need to start the repair again.';

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
  String get ubuntuProLoadingLabel => 'بۇنىڭغا بىر قانچە سېكۇنت كېتىشى مۇمكىن…';

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
  String get ubuntuProDisableError =>
      'Ubuntu Pro نى چەكلىيەلمەيدۇ، قايتا سىناڭ';

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
      'CIS ئۆلچەك ۋە DISA-STIG سەپلىمە ھۆججەت ئارقىلىق ئۆزلۈكىدىن ئىجرا قىلىش سىستېمىسىنى كۈچەيتىش ۋە تەكشۈرۈشنى ئاپتوماتلاشتۇرىدۇ، شۇنىڭ بىلەن بىللە مۇھىم ئۆزگەرگۈچىسىنى ئالاھىدە خاسلاشتۇرۇشقا يول قويىدۇ.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'ئامېرىكا ۋە كانادا ھۆكۈمىتىنىڭ FIPS 140-2 سانلىق مەلۇمات قوغداش ئۆلچىمىگە ماس كېلىدىغان شىفىرلاش مودېلىغا تارقاتقان گۇۋاھنامىسى.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'FIPS نى قوزغات';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS قوزغىتىلغاندىن كېيىن كەينىگە ياندۇرغىلى بولمايدۇ، Livepatch مەڭگۈلۈك چەكلىنىدۇ.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'FIPS تاللانمىسىنىڭ مايىللىقى تاللىنىدۇ';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS ۋە يېڭىلاش';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'FIPS 140-2 دەلىللەشتىن ئۆتكەن بوغچىنى ئورنىتىپ قەرەللىك ھالدا بىخەتەرلىك يېڭىلىنىشى ئورنىتىشقا يول قويىدۇ.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'يېڭىلانمىغان FIPS';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'FIPS 140-2 دەلىللەشتىن ئۆتكەن بوغچىنى ئورنىتىدۇ. بۇلار كېيىنكى قېتىم قايتىدىن گۇۋاھنامە دەلىللەنمىگۈچە يېڭىلانمايدۇ.';

  @override
  String get ubuntuProComplianceDocumentation => 'بىخەتەرلىككە ئۇيغۇن قوللانما';

  @override
  String get ubuntuProESMTitle => 'كېڭەيتىلگەن بىخەتەرلىك ئاسراش (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'كېڭەيتىلگەن بىخەتەرلىك ئاسراش (ESM) پۈتكۈل Ubuntu ئارخىپىغا 10 يىل بىخەتەرلىك يامىقى تەمىنلەيدۇ. خەتەرلىك، يۇقىرى ۋە ئوتتۇرىھال دەرىجىدىكى كۆپ كۆرۈلىدىغان ئاجىزلىق باھالاش سىستېمىسىدىكى نومۇرىغا ئاساسەن ئۈزلۈكسىز ئاجىزلىق باشقۇرۇش مۇلازىمىتىگە ئېرىشىڭ.';

  @override
  String get ubuntuProESMMainTitle => 'ئاساسىي بوغچا (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Ubuntu ئاساسىي بوغچىسى ئۈچۈن $year غىچە بىخەتەرلىك يېڭىلىنىشى';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe بوغچا (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Ubuntu Universe بوغچىغا $year غىچە قوشۇمچە بىخەتەرلىك يېڭىلىنىشى';
  }

  @override
  String get ubuntuProLivepatchTitle => 'يادرو شۇئان ياماق';

  @override
  String get ubuntuProLivepatchEnableTitle => 'شۇئان ياماقنى قوزغات';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'سىستېما ئىجرا قىلىنىۋاتقاندا يادرونىڭ بىخەتەرلىك يېڭىلىنىشىنى قوللىنىدۇ';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'شۇئان ياماق ھالىتىنى چوققا بالداقتا كۆرسىتىدۇ';
}
