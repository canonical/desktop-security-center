// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '安全中心';

  @override
  String get snapdRuleCategorySessionAllowed => '直到登出前都允许';

  @override
  String get snapdRuleCategorySessionDenied => '直到登出前都拒绝';

  @override
  String get snapdRuleCategoryForeverAllowed => '始终允许';

  @override
  String get snapdRuleCategoryForeverDenied => '始终拒绝';

  @override
  String get snapPermissionReadLabel => '读取';

  @override
  String get snapPermissionWriteLabel => '写入';

  @override
  String get snapPermissionExecuteLabel => '执行';

  @override
  String get snapPermissionAccessLabel => 'Access';

  @override
  String get snapPermissionsEnableTitle => '要求应用程序申请系统权限';

  @override
  String get snapPermissionsEnableWarning => '这是一项用于控制对您系统资源访问的实验性功能。';

  @override
  String get snapPermissionsEnablingLabel => '正在启用，此操作可能需要一些时间...';

  @override
  String get snapPermissionsDisablingLabel => '正在禁用，此操作可能需要一些时间...';

  @override
  String get snapPermissionsExperimentalLabel => '实验性';

  @override
  String get snapPermissionsOtherDescription => '您可以在 设置 > 应用程序 中管理其它权限。';

  @override
  String get snapPermissionsPageTitle => '应用程序权限';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 则规则',
      one: '1 则规则',
      zero: '0 则规则',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '管理 $snap 的 $interface 权限。';
  }

  @override
  String get snapRulesPageEmptyTileLabel => '尚无规则';

  @override
  String get cameraRulesPageEmptyTileLabel => 'No apps requested access yet';

  @override
  String get snapRulesRemoveAll => '删除所有规则';

  @override
  String get snapRulesResetAllPermissions => 'Reset all permissions';

  @override
  String get homeInterfacePageTitle => '主文件夹';

  @override
  String get homeInterfacePageDescription => '管理访问您主文件夹中文件的权限。';

  @override
  String get cameraInterfacePageTitle => 'Camera';

  @override
  String get cameraInterfacePageDescription =>
      'Allow apps to access your cameras.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => '管理权限';

  @override
  String get interfacePageDescription =>
      '严格受限的应用将会在访问文件和文件夹前询问您的授权。此功能系实验性功能且可能会在日后更改。';

  @override
  String get interfacePageLinkLearnMore => '了解更多';

  @override
  String get interfacePageLinkGiveFeedback => '意见反馈';

  @override
  String get interfacePageLinkReportIssues => '报告问题';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 个应用',
      one: '1 个应用',
      zero: '0 个应用',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'The recovery key lets you regain access to your data if the disk fails to unlock during startup. Save it somewhere safe.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'The recovery key lets you regain access to your data if the disk fails to unlock during startup. Save it somewhere safe. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Learn more about hardware-backed encryption';

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
  String get diskEncryptionPageKeyWorksBody =>
      'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Recovery key does not work';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Check the key or replace it with a new one.';

  @override
  String get diskEncryptionPageError => 'Error';

  @override
  String get diskEncryptionPageReplaceButton => 'Replace recovery key...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Replace recovery key';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Save the new recovery key somewhere safe. Once you replace it, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Show QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Save to file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'I saved my recovery key somewhere safe';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Replace';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Discard';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Recovery key replaced';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copy';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Encryption settings not available';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Failed to retrieve the encryption status of this computer.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Your computer\'s TPM configuration is not in a supported state.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Your snapd version is not supported';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Check the Security Center and snapd are up to date.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Security Center cannot connect to the snapd interface';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'To fix this, run this command in the terminal:';

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
  String get recoveryKeyExceptionFileSystemTitle =>
      'Recovery key file not saved';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Recovery key file cannot be saved in a temporary location';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Unknown error';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Failed to save your recovery key to file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'You do not have permission to write to that file location.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'You do not have permission to write to that folder. Try a different location or use another method.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Try a different location, such as a removable drive, or use another method.';

  @override
  String get recoveryKeyFilePickerTitle => 'Save recovery key file';

  @override
  String get recoveryKeyFilePickerFilter => 'Text files';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware-backed encryption is enabled';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled => 'Encryption passphrase is enabled';

  @override
  String get recoveryKeyPassphraseHeader => 'Change passphrase';

  @override
  String get recoveryKeyPassphraseBody =>
      'You need to enter your passphrase every time your computer starts.';

  @override
  String get recoveryKeyPassphraseButton => 'Change passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Current passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'New passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirm passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Incorrect passphrase, try again';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Must be at least 4 characters long';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Passphrases do not match, try again';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Change Passphrase';

  @override
  String get recoveryKeyPinEnabled => 'Encryption PIN is enabled';

  @override
  String get recoveryKeyPinHeader => 'Encryption PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Encryption passphrase';

  @override
  String get recoveryKeyPinBody =>
      'You need to enter your PIN every time your computer starts.';

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
  String get recoveryKeyPassphrasePinSuccessBody =>
      'You PIN was successfully updated.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Passphrase updated';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'You passphrase was successfully updated.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Weak passphrase, make it longer or more complex';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Fair passphrase, make it longer or more complex for better security';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Strong passphrase';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Weak PIN, make it longer or less predictable';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Fair PIN, make it longer or less predictable for better security';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN is long enough';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Something went wrong';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro is not available for this Ubuntu version';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro requires an LTS release';

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
      'You will be able to register a new account';

  @override
  String get ubuntuProMagicPrompt =>
      'Use your existing free personal or company Ubuntu One account, or register a new account.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continue in browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'You can also log in at $attachLink and enter the code $attachCode';
  }

  @override
  String get ubuntuProEnableToken => 'Enable with a token';

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
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

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
  String get ubuntuProESMMainDescription =>
      'Security updates for 2,300 Ubuntu Main package until 2036';

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String get ubuntuProESMUniverseDescription =>
      'Additional security updates for over 23,000 Ubuntu Universe packages until 2036';

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

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => '安全中心';

  @override
  String get snapdRuleCategorySessionAllowed => '允許直到登出';

  @override
  String get snapdRuleCategorySessionDenied => '拒絕直到登出';

  @override
  String get snapdRuleCategoryForeverAllowed => '總是允許';

  @override
  String get snapdRuleCategoryForeverDenied => '總是拒絕';

  @override
  String get snapPermissionReadLabel => '讀取';

  @override
  String get snapPermissionWriteLabel => '寫入';

  @override
  String get snapPermissionExecuteLabel => '執行';

  @override
  String get snapPermissionsEnableTitle => '要求應用程式請求系統權限';

  @override
  String get snapPermissionsEnableWarning => '這是一項實驗性功能，用於控制對系統資源的存取。';

  @override
  String get snapPermissionsEnablingLabel => '啟用中，可能需要幾秒鐘...';

  @override
  String get snapPermissionsDisablingLabel => '停用中，可能需要幾秒鐘...';

  @override
  String get snapPermissionsExperimentalLabel => '實驗性的';

  @override
  String get snapPermissionsOtherDescription => '您可以在「設定」>「程式」中管理其他權限。';

  @override
  String get snapPermissionsPageTitle => '應用程式權限';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 條規則',
      one: '1 條規則',
      zero: '沒有規則',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '管理 $snap 的$interface權限。';
  }

  @override
  String get snapRulesPageEmptyTileLabel => '還沒有規則';

  @override
  String get snapRulesRemoveAll => '移除所有規則';

  @override
  String get homeInterfacePageTitle => '家目錄';

  @override
  String get homeInterfacePageDescription => '管理存取您家目錄中檔案的權限。';

  @override
  String get interfacePageTitle => '管理權限';

  @override
  String get interfacePageDescription =>
      '受嚴格限制的應用程式會在存取檔案和資料夾之前詢問您。此功能是實驗性的，可能會改變。';

  @override
  String get interfacePageLinkLearnMore => '了解更多';

  @override
  String get interfacePageLinkGiveFeedback => '意見回饋';

  @override
  String get interfacePageLinkReportIssues => '回報問題';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 個應用程式',
      one: '1 個應用程式',
      zero: '沒有應用程式',
    );
    return '$_temp0';
  }
}
