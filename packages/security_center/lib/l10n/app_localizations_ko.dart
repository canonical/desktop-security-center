// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '보안 센터';

  @override
  String get snapdRuleCategorySessionAllowed => '로그아웃 전까지 허용';

  @override
  String get snapdRuleCategorySessionDenied => '로그아웃 전까지 거부';

  @override
  String get snapdRuleCategoryForeverAllowed => '항상 허용';

  @override
  String get snapdRuleCategoryForeverDenied => '항상 거부';

  @override
  String get snapPermissionReadLabel => '읽기';

  @override
  String get snapPermissionWriteLabel => '쓰기';

  @override
  String get snapPermissionExecuteLabel => '실행';

  @override
  String get snapPermissionsEnableTitle => '각 앱이 시스템 권한을 요청하도록 하기';

  @override
  String get snapPermissionsEnableWarning => '이 기능은 시스템 리소스 접근을 제어하기 위한 실험적 기능입니다.';

  @override
  String get snapPermissionsEnablingLabel => '켜는 중, 몇 초 걸릴 수 있습니다...';

  @override
  String get snapPermissionsDisablingLabel => '끄는 중, 몇 초 걸릴 수 있습니다...';

  @override
  String get snapPermissionsExperimentalLabel => '실험적 기능';

  @override
  String get snapPermissionsOtherDescription => '다른 권한은 설정 > 앱에서 관리 가능합니다.';

  @override
  String get snapPermissionsPageTitle => '앱 권한';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n개 정책',
      one: '1개 정책',
      zero: '정책 없음',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snap에 대한 $interface 권한을 관리합니다.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => '정책 없음';

  @override
  String get snapRulesRemoveAll => '모든 정책 삭제';

  @override
  String get homeInterfacePageTitle => '홈 폴더';

  @override
  String get homeInterfacePageDescription => '사용자의 홈 폴더의 파일에 접근하는 권한을 관리합니다.';

  @override
  String get interfacePageTitle => '권한 관리';

  @override
  String get interfacePageDescription => '엄격하게 제한된 앱은 파일과 폴더에 액세스하기 전에 사용자에게 묻습니다. 이 기능은 실험적이며 추후 변경될 수 있습니다.';

  @override
  String get interfacePageLinkLearnMore => '더 알아보기';

  @override
  String get interfacePageLinkGiveFeedback => '피드백 작성';

  @override
  String get interfacePageLinkReportIssues => '이슈 보고';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n개의 앱',
      one: '1개의 앱',
      zero: '앱 없음',
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

  @override
  String get diskEncryptionPageReplaceButton => 'Replace recovery key...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Replace recovery key';

  @override
  String get diskEncryptionPageReplaceDialogBody => 'Save the new recovery key somewhere safe. Once you replace it, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Show QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Save to file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge => 'I saved my recovery key somewhere safe';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Replace';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Discard';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => 'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => 'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody => 'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';
}
