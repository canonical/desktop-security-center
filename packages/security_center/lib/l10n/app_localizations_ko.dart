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
  String get diskEncryptionPageReplaceDialogSuccessHeader => 'Recovery key replaced';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => 'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader => 'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody => 'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody => 'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copy';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader => 'Encryption settings not available';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody => 'Failed to retrieve the encryption status of this computer.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody => 'Your computer\'s TPM configuration is not in a supported state.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader => 'Your snapd version is not supported';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody => 'Check the Security Center and snapd are up to date.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader => 'Security Center cannot connect to the snapd interface';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody => 'To fix this, run this command in the terminal:\nsnap connect desktop-security-center:snap-fde-control';

  @override
  String get recoveryKeyExceptionFileSystemTitle => 'Recovery key file not saved';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle => 'Recovery key file cannot be saved in a temporary location';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Unknown error';

  @override
  String get recoveryKeyExceptionFileSystemBody => 'You do not have permission to write to that folder. Try a different location or use another method.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody => 'Try a different location, such as a removable drive, or use another method.';

  @override
  String get recoveryKeyFilePickerTitle => 'Save recovery key file';

  @override
  String get recoveryKeyFilePickerFilter => 'Text files';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware-backed encryption is enabled';

  @override
  String get recoveryKeyTPMExplanationBody => 'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore => 'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled => 'Encryption passphrase is enabled';

  @override
  String get recoveryKeyPassphraseHeader => 'Change passphrase';

  @override
  String get recoveryKeyPassphraseBody => 'You need to enter your passpharse during startup to unlock the disk. You can change the passphrase but not disable it.';

  @override
  String get recoveryKeyPassphraseButton => 'Change passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Current passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'New passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirm passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError => 'Incorrect passphrase, try again';

  @override
  String get recoveryKeyPassphraseNewError => 'Must be at least 4 characters long';

  @override
  String get recoveryKeyPassphraseConfirmError => 'Passphrases do not match, try again';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Change Passphrase';

  @override
  String get recoveryKeyPinEnabled => 'Encryption PIN is enabled';

  @override
  String get recoveryKeyPinHeader => 'Encryption PIN';

  @override
  String get recoveryKeyPinBody => 'You need to enter your PIN during startup to unlock the disk. You can change the PIN but not disable it.';

  @override
  String get recoveryKeyPinButton => 'Change PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Current PIN';

  @override
  String get recoveryKeyPinNew => 'New PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirm PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Incorrect PIN, try again';

  @override
  String get recoveryKeyPinConfirmError => 'PINs do not match, try again';

  @override
  String get recoveryKeyPinDialogHeader => 'Change PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Show';

  @override
  String get recoveryKeyPassphraseHide => 'Hide';

  @override
  String get recoveryKeyPassphraseChange => 'Change';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN updated';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => 'You PIN was successfully updated.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => 'Passphrase updated';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody => 'You passphrase was successfully updated.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin => 'Weak passphrase, make it longer or more complex';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal => 'Fair passphrase, make it longer or more complex for better security';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Strong passphrase';

  @override
  String get recoveryKeyPinEntropyBelowMin => 'Weak PIN, make it longer or less predictable';

  @override
  String get recoveryKeyPinEntropyBelowOptimal => 'Fair PIN, make it longer or less predictable for better security';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN is long enough';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Something went wrong';
}
