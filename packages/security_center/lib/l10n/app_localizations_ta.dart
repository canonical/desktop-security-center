// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பாதுகாப்பு நடுவண்';

  @override
  String get snapdRuleCategorySessionAllowed => 'வெளியேறும் வரை இசைவு';

  @override
  String get snapdRuleCategorySessionDenied => 'வெளியேறும் வரை மறு';

  @override
  String get snapdRuleCategoryForeverAllowed => 'எப்போதும் இசைவு';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'எப்போதும் மறு';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'படி';

  @override
  String get snapPermissionWriteLabel => 'எழுது';

  @override
  String get snapPermissionExecuteLabel => 'இயக்கு';

  @override
  String get snapPermissionAccessLabel => 'அணுகல்';

  @override
  String get snapPermissionsEnableTitle =>
      'கணினி இசைவுகளைக் கேட்கப் பயன்பாடுகள் தேவை';

  @override
  String get snapPermissionsEnableWarning =>
      'உங்கள் கணினியின் வளங்களுக்கான அணுகலைக் கட்டுப்படுத்த இது ஒரு சோதனை நற்பண்பாகும்.';

  @override
  String get snapPermissionsEnablingLabel =>
      'இயக்குகிறது, இதற்கு சில வினாடிகள் ஆகலாம்...';

  @override
  String get snapPermissionsDisablingLabel =>
      'முடக்குகிறது, இதற்கு சில வினாடிகள் ஆகலாம்...';

  @override
  String get snapPermissionsExperimentalLabel => 'சோதனை';

  @override
  String get snapPermissionsOtherDescription =>
      'பிற இசைவுகளை நீங்கள் நிர்வகிக்கலாம் அமைப்புகள்›பயன்பாடுகள்.';

  @override
  String get snapPermissionsPageTitle => 'பயன்பாட்டு இசைவுகள்';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n விதிகள்',
      one: '1 விதி',
      zero: 'விதிகள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snapக்கான $interface இசைவுகளை நிர்வகி.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'இன்னும் விதிகள் இல்லை';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'இதுவரை எந்த ஆப்சும் அணுகலைக் கோரவில்லை';

  @override
  String get snapRulesRemoveAll => 'எல்லா விதிகளையும் அகற்று';

  @override
  String get snapRulesResetAllPermissions =>
      'அனைத்து அனுமதிகளையும் மீட்டமைக்கவும்';

  @override
  String get homeInterfacePageTitle => 'வீட்டு கோப்புறை';

  @override
  String get homeInterfacePageDescription =>
      'உங்கள் வீட்டு கோப்புறையில் கோப்புகளை அணுக இசைவுகளை நிர்வகி.';

  @override
  String get cameraInterfacePageTitle => 'கேமரா';

  @override
  String get cameraInterfacePageDescription =>
      'உங்கள் கேமராக்களை அணுக ஆப்சை அனுமதிக்கவும்.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'இசைவுகளை நிர்வகி';

  @override
  String get interfacePageLinkLearnMore => 'மேலும் அறிக';

  @override
  String get interfacePageLinkReportIssues => 'சிக்கல்களைப் புகாரளி';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n பயன்பாடுகள்',
      one: '1 பயன்பாடு',
      zero: 'பயன்பாடுகள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'வட்டு குறியாக்கம்';

  @override
  String get diskEncryptionPageRecoveryKey => 'மீட்பு விசை';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'தொடக்கத்தின் போது வட்டு திறக்கத் தவறினால், மீட்பு விசை உங்கள் தரவை மீண்டும் அணுக உதவுகிறது. பாதுகாப்பான இடத்தில் சேமிக்கவும்.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'தொடக்கத்தின் போது வட்டு திறக்கத் தவறினால், மீட்பு விசை உங்கள் தரவை மீண்டும் அணுக உதவுகிறது. பாதுகாப்பான இடத்தில் சேமிக்கவும். $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'வன்பொருள் உதவி குறியாக்கத்தைப் பற்றி மேலும் அறிக';

  @override
  String get diskEncryptionPageCheckKey => 'மீட்பு விசையை சரிபார்க்கவும் ...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'மீட்பு விசையை சரிபார்க்கவும்';

  @override
  String get diskEncryptionPageCheck => 'சரிபார்';

  @override
  String get diskEncryptionPageValidKey => 'செல்லுபடியாகும் விசை';

  @override
  String get diskEncryptionPageInvalidKey => 'தவறான விசை';

  @override
  String get diskEncryptionPageEnterKey => 'உங்கள் மீட்பு விசையை உள்ளிடவும்';

  @override
  String get diskEncryptionPageKeyWorks => 'மீட்பு விசை படைப்புகள்';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'அதை எங்காவது பாதுகாப்பாக வைத்திருக்க நினைவில் கொள்ளுங்கள்.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'மீட்பு விசை வேலை செய்யாது';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'விசையை சரிபார்க்கவும் அல்லது புதிய ஒன்றை மாற்றவும்.';

  @override
  String get diskEncryptionPageError => 'பிழை';

  @override
  String get diskEncryptionPageReplaceButton => 'மீட்பு விசையை மாற்றவும் ...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'மீட்பு விசையை மாற்றவும்';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'புதிய மீட்பு விசையை எங்காவது பாதுகாப்பாக சேமிக்கவும். நீங்கள் அதை மாற்றியதும், நீங்கள் இனி பழைய விசையைப் பயன்படுத்த முடியாது.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR குறியீட்டைக் காட்டு';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'கோப்பில் சேமிக்கவும்';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'எனது மீட்பு விசையை எங்காவது பாதுகாப்பாக சேமித்தேன்';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'மாற்றவும்';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'நிராகரிக்கவும்';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'மீட்பு விசை மாற்றப்பட்டது';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'அதை எங்காவது பாதுகாப்பாக வைத்திருக்க நினைவில் கொள்ளுங்கள்.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'மீட்பு விசை மாற்று தோல்வியுற்றது';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'உங்கள் மீட்பு விசையை மாற்றுவதில் ஏதோ தவறு ஏற்பட்டது, உங்கள் பழைய விசை செல்லுபடியாகும்.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'உபுண்டு டெச்க்டாப் - குறியாக்க மீட்பு விசை';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'மீட்பு விசையை நகலெடுக்க QR குறியீட்டை வருடு செய்து கடவுச்சொல் நிர்வாகி போன்ற எங்காவது பாதுகாப்பாக சேமிக்கவும். பின்னர் பயன்படுத்த நீங்கள் ஒரு புகைப்படத்தையும் எடுக்கலாம்.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'இடைநிலைப்பலகைக்கு நகலெடுக்கப்பட்டது';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'நகலெடு';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'குறியாக்க அமைப்புகள் கிடைக்கவில்லை';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'இந்த கணினியின் குறியாக்க நிலையை மீட்டெடுப்பதில் தோல்வி.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'உங்கள் கணினியின் டிபிஎம் உள்ளமைவு ஆதரிக்கப்படும் நிலையில் இல்லை.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'உங்கள் SNAPD பதிப்பு ஆதரிக்கப்படவில்லை';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'பாதுகாப்பு மையத்தை சரிபார்க்கவும், SNAPD புதுப்பித்த நிலையில் உள்ளது.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'பாதுகாப்பு மையத்தால் ச்னாப் இடைமுகத்துடன் இணைக்க முடியாது';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'இதை சரிசெய்ய, இந்த கட்டளையை முனையத்தில் இயக்கவும்:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap இணை desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'பின்னைச் சேர்...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'கடவுச்சொற்றொடரைச் சேர்...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'கடவுச்சொற்றொடரைச் சேர்க்கவும்';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'பின்னைச் சேர்க்கவும்';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'உங்கள் கணினி தொடங்கும் ஒவ்வொரு முறையும் உங்கள் பின்னை உள்ளிட வேண்டும். இந்த பின் உங்கள் பயனர் கடவுச்சொல்லிலிருந்து வேறுபட்டது.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'உங்கள் பின்னை மறந்துவிட்டால், மீட்டெடுப்பு விசையைப் பயன்படுத்தி வட்டுக்கான அணுகலை மீண்டும் பெறலாம்.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'உங்கள் கணினி தொடங்கும் ஒவ்வொரு முறையும் உங்கள் கடவுச்சொற்றொடரை உள்ளிட வேண்டும். இந்த கடவுச்சொற்றொடரை உங்கள் பயனர் கடவுச்சொல்லில் இருந்து வேறுபட்டது.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'உங்கள் கடவுச்சொற்றொடரை மறந்துவிட்டால், மீட்டெடுப்பு விசையைப் பயன்படுத்தி வட்டுக்கான அணுகலை மீண்டும் பெறலாம்.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'கூடுதல் பாதுகாப்பு';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'கூடுதல் பாதுகாப்பிற்காக நீங்கள் கடவுச்சொற்றொடரை அல்லது பின்னை அமைக்கலாம். உங்கள் கணினி தொடங்கும் ஒவ்வொரு முறையும் நீங்கள் அதை உள்ளிட வேண்டும்.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'மேலும் அறிக';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'கூட்டு';

  @override
  String get diskEncryptionPageRemovePinButton => 'பின்னை அகற்று...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'கடவுச்சொற்றொடரை அகற்று...';

  @override
  String get diskEncryptionPageAddingPin =>
      'பின்னைச் சேர்க்கிறது, இதற்குச் சில வினாடிகள் ஆகலாம்...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'கடவுச்சொற்றொடரைச் சேர்க்கிறது, இதற்கு சில வினாடிகள் ஆகலாம்...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'பின்னை அகற்றுகிறது, இதற்கு சில வினாடிகள் ஆகலாம்...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'கடவுச்சொற்றொடரை அகற்றுகிறது, இதற்கு சில வினாடிகள் ஆகலாம்...';

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
      'மீட்பு விசை கோப்பு சேமிக்கப்படவில்லை';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'மீட்பு முக்கிய கோப்பை தற்காலிக இடத்தில் சேமிக்க முடியாது';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'தெரியாத பிழை';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'கோப்புக்கு உங்கள் மீட்பு விசையை சேமிப்பதில் தோல்வி';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'அந்த கோப்பு இருப்பிடத்திற்கு எழுத உங்களுக்கு இசைவு இல்லை.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'அந்த கோப்புறையில் எழுத உங்களுக்கு இசைவு இல்லை. வேறு இடத்தை முயற்சிக்கவும் அல்லது மற்றொரு முறையைப் பயன்படுத்தவும்.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'நீக்கக்கூடிய இயக்கி போன்ற வேறு இடத்தை முயற்சிக்கவும் அல்லது மற்றொரு முறையைப் பயன்படுத்தவும்.';

  @override
  String get recoveryKeyFilePickerTitle => 'மீட்பு விசை கோப்பை சேமிக்கவும்';

  @override
  String get recoveryKeyFilePickerFilter => 'உரை கோப்புகள்';

  @override
  String get recoveryKeyTPMEnabled =>
      'வன்பொருள் உதவி குறியாக்கம் இயக்கப்பட்டது';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'குறியாக்க விசைகள் உங்கள் கணினியின் நம்பகமான இயங்குதள தொகுதிகளில் (டிபிஎம்) சேமிக்கப்படுகின்றன.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'வன்பொருள் உதவி குறியாக்கம் பற்றி மேலும் அறிக';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'குறியாக்க பாச்ஃபிரச் இயக்கப்பட்டது';

  @override
  String get recoveryKeyPassphraseHeader => 'கடவுச்சொற்றொடரை மாற்றவும்';

  @override
  String get recoveryKeyPassphraseBody =>
      'உங்கள் கணினி தொடங்கும் ஒவ்வொரு முறையும் உங்கள் கடவுச்சொற்றொடரை உள்ளிட வேண்டும்.';

  @override
  String get recoveryKeyPassphraseButton => 'கடவுச்சொற்றொடரை மாற்றவும் ...';

  @override
  String get recoveryKeyPassphraseCurrent => 'தற்போதைய கடவுச்சொல்';

  @override
  String get recoveryKeyPassphraseNew => 'புதிய கடவுச்சொல்';

  @override
  String get recoveryKeyPassphraseConfirm => 'பாச்ஃபிரேசை உறுதிப்படுத்தவும்';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'தவறான கடவுச்சொல், மீண்டும் முயற்சிக்கவும்';

  @override
  String get recoveryKeyPassphraseNewError =>
      'குறைந்தது 4 எழுத்துக்கள் நீளமாக இருக்க வேண்டும்';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'கடவுச்சொற்கள் பொருந்தவில்லை, மீண்டும் முயற்சிக்கவும்';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'கடவுச்சொற்றொடரை மாற்றவும்';

  @override
  String get recoveryKeyPinEnabled => 'குறியாக்க முள் இயக்கப்பட்டது';

  @override
  String get recoveryKeyPinHeader => 'குறியாக்க முள்';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'குறியாக்க பாச்ஃபிரச்';

  @override
  String get recoveryKeyPinBody =>
      'உங்கள் கணினி தொடங்கும் ஒவ்வொரு முறையும் உங்கள் பின்னை உள்ளிட வேண்டும்.';

  @override
  String get recoveryKeyPinButton => 'முள் மாற்றவும் ...';

  @override
  String get recoveryKeyPinCurrent => 'தற்போதைய முள்';

  @override
  String get recoveryKeyPinNew => 'புதிய முள்';

  @override
  String get recoveryKeyPinConfirm => 'முள் உறுதிப்படுத்தவும்';

  @override
  String get recoveryKeyPinCurrentError =>
      'தவறான முள், மீண்டும் முயற்சிக்கவும்';

  @override
  String get recoveryKeyPinConfirmError =>
      'ஊசிகள் பொருந்தவில்லை, மீண்டும் முயற்சிக்கவும்';

  @override
  String get recoveryKeyPinDialogHeader => 'முள் மாற்றவும்';

  @override
  String get recoveryKeyPassphraseShow => 'காட்டு';

  @override
  String get recoveryKeyPassphraseHide => 'மறை';

  @override
  String get recoveryKeyPassphraseChange => 'மாற்றம்';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader =>
      'முள் புதுப்பிக்கப்பட்டது';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'நீங்கள் முள் வெற்றிகரமாக புதுப்பிக்கப்பட்டது.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'கடவுச்சொல் புதுப்பிக்கப்பட்டது';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'நீங்கள் கடவுச்சொல் வெற்றிகரமாக புதுப்பிக்கப்பட்டது.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'பலவீனமான கடவுச்சொல், அதை நீண்டதாகவோ அல்லது சிக்கலானதாகவோ செய்யுங்கள்';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'நியாயமான பாச்ஃபிரேச், சிறந்த பாதுகாப்பிற்காக நீண்ட அல்லது மிகவும் சிக்கலானதாக மாற்றவும்';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'வலுவான கடவுச்சொற்றொடர்';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'பலவீனமான முள், நீண்டதாகவோ அல்லது குறைவாகவோ கணிக்கக்கூடியதாக மாற்றவும்';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'நியாயமான முள், சிறந்த பாதுகாப்பிற்கு நீண்டதாகவோ அல்லது குறைவாகவோ கணிக்கக்கூடியதாக மாற்றவும்';

  @override
  String get recoveryKeyPinEntropyOptimal => 'முள் நீண்டது';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'ஏதோ தவறு நடந்தது';

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
      'Ubuntu Pro is not available for this Ubuntu version';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requires an LTS release';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro is not supported by this snapd version';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Update snapd to manage Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro is enabled';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Enterprise-grade security and compliance for your computer. Always free for personal use. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Learn about Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Enable Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Enable with Ubuntu One account';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'You will be able to create an account for free';

  @override
  String get ubuntuProMagicPrompt =>
      'Log in with your Ubuntu One account, or create one for free.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continue in browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'You can also log in at $attachLink and enter the code $attachCode';
  }

  @override
  String get ubuntuProMagicError => 'Unable to enable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnableToken => 'Enable with a token';

  @override
  String get ubuntuProEnableTokenError => 'Unable to enable Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'From your IT admin or from $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Get an Ubuntu Pro token from your administrator or from $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Disable Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Disable';

  @override
  String get ubuntuProDisablePrompt =>
      'Disabling Ubuntu Pro will detach your subscription from this computer. Do you want to proceed?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

  @override
  String get ubuntuProFeatureEnableError =>
      'Could not enable the feature, try again.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Could not disable the feature, try again.';

  @override
  String get ubuntuProCompliance => 'Compliance and hardening';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Only recommended to assist with FedRAMP, HIPAA and other compliance and hardening requirements.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

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
      'ESM provides 10 years of security patches for the entire Ubuntu Archive. Get continuous vulnerability management for critical, high and selected medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for Ubuntu Main packages until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for Ubuntu Universe packages until $year';
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
