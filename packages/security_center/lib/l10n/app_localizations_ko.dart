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
  String get snapPermissionAccessLabel => '접근';

  @override
  String get snapPermissionsEnableTitle => '각 앱이 시스템 권한을 요청하도록 하기';

  @override
  String get snapPermissionsEnableWarning =>
      '이 기능은 시스템 리소스 접근을 제어하기 위한 실험적 기능입니다.';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get cameraRulesPageEmptyTileLabel => '아직 접근을 요청한 앱이 없습니다';

  @override
  String get snapRulesRemoveAll => '모든 정책 삭제';

  @override
  String get snapRulesResetAllPermissions => '모든 권한 재설정';

  @override
  String get homeInterfacePageTitle => '홈 폴더';

  @override
  String get homeInterfacePageDescription => '사용자의 홈 폴더의 파일에 접근하는 권한을 관리합니다.';

  @override
  String get cameraInterfacePageTitle => '카메라';

  @override
  String get cameraInterfacePageDescription => '앱이 카메라에 접근할 수 있게 승인합니다.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => '권한 관리';

  @override
  String get interfacePageDescription =>
      '엄격하게 제한된 앱은 파일과 폴더에 액세스하기 전에 사용자에게 묻습니다. 이 기능은 실험적이며 추후 변경될 수 있습니다.';

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
  String get diskEncryptionPageTitle => '디스크 암호화';

  @override
  String get diskEncryptionPageRecoveryKey => '복구 키';

  @override
  String get diskEncryptionPageStoreYourKey =>
      '복구 키는 시작 중에 디스크 잠금 해제가 실패했을 경우 데이터에 다시 접근하기 위해 필요합니다. 다른 안전한 장소에 보관해 두십시오.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return '복구 키는 시작 중에 디스크 잠금 해제가 실패했을 경우 데이터에 다시 접근하기 위해 필요합니다. 다른 안전한 장소에 보관해 두십시오. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => '복구 키에 대해 더 알아보기';

  @override
  String get diskEncryptionPageCheckKey => '복구 키 검증...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => '복구 키 검증';

  @override
  String get diskEncryptionPageCheck => '검증';

  @override
  String get diskEncryptionPageValidKey => '유효한 키';

  @override
  String get diskEncryptionPageInvalidKey => '유효하지 않은 키';

  @override
  String get diskEncryptionPageEnterKey => '복구 키를 입력하세요';

  @override
  String get diskEncryptionPageKeyWorks => '복구 키가 정상 작동함';

  @override
  String get diskEncryptionPageKeyWorksBody => '다른 안전한 장소에 보관해 두십시오.';

  @override
  String get diskEncryptionPageKeyDoesntWork => '복구 키가 동작하지 않음';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      '키를 다시 확인하거나 새로운 키로 교체하십시오.';

  @override
  String get diskEncryptionPageError => '오류';

  @override
  String get diskEncryptionPageReplaceButton => '복구 키 교체하기...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => '복구 키 교체하기';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      '새로운 복구 키를 다른 안전한 장소에 보관해 두십시오. 키를 교체하면 이전 키는 더 이상 사용할 수 없습니다.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR 코드 보이기';

  @override
  String get diskEncryptionPageReplaceDialogSave => '파일로 저장';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      '복구 키를 다른 안전한 곳에 저장했습니다';

  @override
  String get diskEncryptionPageReplaceDialogReplace => '교체';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => '폐기';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => '복구 키 교체됨';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      '다른 안전한 곳에 보관해 두십시오.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader => '복구 키 교체 실패';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      '복구 키를 교체하는 데 문제가 발생했습니다. 기존 키는 그대로 사용 가능합니다.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => '우분투 데스크톱 - 암호화 복구 키';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'QR 코드를 스캔하여 복구 키를 복사하고 암호 관리자 등의 다른 안전한 장소에 보관해 두십시오. 나중에 사용하기 위해 사진을 찍어 보관할 수도 있습니다.';

  @override
  String get diskEncryptionPageClipboardNotification => '클립보드에 복사됨';

  @override
  String get diskEncryptionPageCopySemanticLabel => '복사';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      '암호화 설정 사용 불가';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      '이 컴퓨터의 암호화 상태를 가져올 수 없습니다.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      '이 컴퓨터의 TPM 설정이 지원되지 않는 상태입니다.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'snapd 버전이 지원되지 않습니다';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      '보안 센터와 snapd가 업데이트되었는지 확인하세요.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      '보안 센터가 snapd 인터페이스에 연결할 수 없습니다';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      '이 문제를 해결하려면 터미널에서 다음 명령어를 실행하세요:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Add PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Add passphrase...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Add passphrase';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Add PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'You will need to enter your PIN every time your computer starts. This PIN is different from your user password.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'If you forget your PIN, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'You will need to enter your passphrase every time your computer starts. This passphrase is different from your user password.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'If you forget your passphrase, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Additional security';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'You can set a passphrase or a PIN for additional security. You will need to enter it every time your computer starts.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Learn more';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Add';

  @override
  String get diskEncryptionPageRemovePinButton => 'Remove PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Remove passphrase...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Adding PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Adding passphrase, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Removing PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Removing passphrase, this may take a few seconds...';

  @override
  String get recoveryKeyExceptionFileSystemTitle => '복구 키 파일 저장되지 않음';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      '복구 키 파일을 임시 경로에 저장할 수 없음';

  @override
  String get recoveryKeyExceptionUnknownTitle => '알 수 없는 오류';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Failed to save your recovery key to file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'You do not have permission to write to that file location.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      '해당 폴더에 쓰기 권한이 없습니다. 다른 경로를 사용하거나 다른 방법을 시도해 보십시오.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      '이동식 저장소 등의 다른 경로를 지정하거나 다른 방법을 이용하십시오.';

  @override
  String get recoveryKeyFilePickerTitle => '복구 키 파일 저장';

  @override
  String get recoveryKeyFilePickerFilter => '텍스트 파일';

  @override
  String get recoveryKeyTPMEnabled => '하드웨어 기반 암호화 활성화됨';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled => '암호화 비밀번호 활성화됨';

  @override
  String get recoveryKeyPassphraseHeader => '비밀번호 변경';

  @override
  String get recoveryKeyPassphraseBody =>
      '시작할 때 비밀번호를 입력하여 디스크를 잠금 해제해야 합니다. 비밀번호를 바꿀 수는 있지만 해제할 수는 없습니다.';

  @override
  String get recoveryKeyPassphraseButton => '비밀번호 변경...';

  @override
  String get recoveryKeyPassphraseCurrent => '현재 비밀번호';

  @override
  String get recoveryKeyPassphraseNew => '새로운 비밀번호';

  @override
  String get recoveryKeyPassphraseConfirm => '비밀번호 확인';

  @override
  String get recoveryKeyPassphraseCurrentError => '비밀번호가 틀렸습니다. 다시 시도해 보세요';

  @override
  String get recoveryKeyPassphraseNewError => '4글자 이상이어야 합니다';

  @override
  String get recoveryKeyPassphraseConfirmError => '비밀번호가 일치하지 않습니다. 다시 시도하세요';

  @override
  String get recoveryKeyPassphraseDialogHeader => '비밀번호 변경';

  @override
  String get recoveryKeyPinEnabled => '암호화 PIN 활성화됨';

  @override
  String get recoveryKeyPinHeader => '암호화 PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Encryption passphrase';

  @override
  String get recoveryKeyPinBody =>
      '시작할 때 PIN을 입력하여 디스크를 잠금 해제해야 합니다. PIN을 바꿀 수는 있지만 해제할 수는 없습니다.';

  @override
  String get recoveryKeyPinButton => 'PIN 변경...';

  @override
  String get recoveryKeyPinCurrent => '현재 PIN';

  @override
  String get recoveryKeyPinNew => '새로운 PIN';

  @override
  String get recoveryKeyPinConfirm => 'PIN 확인';

  @override
  String get recoveryKeyPinCurrentError => 'PIN이 틀렸습니다. 다시 시도해 보세요';

  @override
  String get recoveryKeyPinConfirmError => 'PIN이 일치하지 않습니다. 다시 시도하세요';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN 변경';

  @override
  String get recoveryKeyPassphraseShow => '보이기';

  @override
  String get recoveryKeyPassphraseHide => '숨기기';

  @override
  String get recoveryKeyPassphraseChange => '변경';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN 업데이트됨';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => 'PIN이 업데이트 완료되었습니다.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => '비밀번호 업데이트됨';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      '비밀번호가 업데이트 완료되었습니다.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      '약한 비밀번호입니다. 더 길거나 복잡하게 만드세요';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      '적당한 비밀번호입니다. 더 길거나 복잡하게 만들어 더욱 안전한 비밀번호를 만드세요';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => '강력한 비밀번호';

  @override
  String get recoveryKeyPinEntropyBelowMin => '약한 PIN입니다. 더 길거나 예측하기 힘들게 만드세요';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      '적당한 PIN입니다. 더 길거나 예측하기 힘들게 만들어 더욱 안전힌 PIN을 만드세요';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN이 충분히 깁니다';

  @override
  String get recoveryKeySomethingWentWrongHeader => '문제가 발생했습니다';

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
  String get ubuntuProMagicError =>
      'Unable to enable Ubuntu Pro, please try again';

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
      'Disabling Ubuntu Pro will detach your subscription from this machine. Do you want to proceed?';

  @override
  String get ubuntuProDisableError =>
      'Could not disable Ubuntu Pro. Please try again.';

  @override
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

  @override
  String get ubuntuProFeatureEnableError =>
      'Could not enable the feature, please try again.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Could not disable the feature, please try again.';

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
