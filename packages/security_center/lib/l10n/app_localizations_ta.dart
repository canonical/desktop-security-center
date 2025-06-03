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
  String get snapdRuleCategoryForeverDenied => 'எப்போதும் மறு';

  @override
  String get snapPermissionReadLabel => 'படி';

  @override
  String get snapPermissionWriteLabel => 'எழுது';

  @override
  String get snapPermissionExecuteLabel => 'இயக்கு';

  @override
  String get snapPermissionsEnableTitle => 'கணினி இசைவுகளைக் கேட்கப் பயன்பாடுகள் தேவை';

  @override
  String get snapPermissionsEnableWarning => 'உங்கள் கணினியின் வளங்களுக்கான அணுகலைக் கட்டுப்படுத்த இது ஒரு சோதனை நற்பண்பாகும்.';

  @override
  String get snapPermissionsEnablingLabel => 'செயல்படுத்த, இது சில நொடிகள் ஆகலாம் ...';

  @override
  String get snapPermissionsDisablingLabel => 'முடக்குதல், இதற்குச் சில நொடிகள் ஆகலாம் ...';

  @override
  String get snapPermissionsExperimentalLabel => 'சோதனை';

  @override
  String get snapPermissionsOtherDescription => 'பிற இசைவுகளை நீங்கள் நிர்வகிக்கலாம் அமைப்புகள்›பயன்பாடுகள்.';

  @override
  String get snapPermissionsPageTitle => 'பயன்பாட்டு இசைவுகள்';

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
  String get snapRulesRemoveAll => 'எல்லா விதிகளையும் அகற்று';

  @override
  String get homeInterfacePageTitle => 'வீட்டு கோப்புறை';

  @override
  String get homeInterfacePageDescription => 'உங்கள் வீட்டு கோப்புறையில் கோப்புகளை அணுக இசைவுகளை நிர்வகி.';

  @override
  String get interfacePageTitle => 'இசைவுகளை நிர்வகி';

  @override
  String get interfacePageDescription => 'கோப்புகள் மற்றும் கோப்புறைகளை அணுகுவதற்கு முன் கண்டிப்பாக வரையறுக்கப்பட்ட பயன்பாடுகள் உங்களிடம் கேட்கும். இந்த நற்பொருத்தம் சோதனை மற்றும் மாற்றங்களுக்கு உட்பட்டது.';

  @override
  String get interfacePageLinkLearnMore => 'மேலும் அறிக';

  @override
  String get interfacePageLinkGiveFeedback => 'கருத்து தெரிவி';

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
