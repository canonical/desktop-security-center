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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get diskEncryptionPageTitle => '磁盘加密';

  @override
  String get diskEncryptionPageRecoveryKey => '恢复密钥';

  @override
  String get diskEncryptionPageStoreYourKey =>
      '恢复密钥让您恢复访问您的数据当您的磁盘在启动时无法解锁。请在一些安全的地方保存。';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return '恢复密钥让您恢复访问您的数据当您的磁盘在启动时无法解锁。请在一些安全的地方保存。$learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => '了解更多关于恢复密钥';

  @override
  String get diskEncryptionPageCheckKey => '检查恢复密钥...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => '检查恢复密钥';

  @override
  String get diskEncryptionPageCheck => '检查';

  @override
  String get diskEncryptionPageValidKey => '有效密钥';

  @override
  String get diskEncryptionPageInvalidKey => '无效密钥';

  @override
  String get diskEncryptionPageEnterKey => '输入您的恢复密钥';

  @override
  String get diskEncryptionPageKeyWorks => '恢复密钥有效';

  @override
  String get diskEncryptionPageKeyWorksBody => '记得把它存在安全的地方。';

  @override
  String get diskEncryptionPageKeyDoesntWork => '恢复密钥不起作用';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => '检查您的密钥或者用一个新的密钥替代它。';

  @override
  String get diskEncryptionPageError => '错误';

  @override
  String get diskEncryptionPageReplaceButton => '更换恢复密钥...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => '更换恢复密钥';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      '在某个安全的位置保存新的恢复密钥。在您替换之后，您将不能在用老密钥。';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => '显示二维码';

  @override
  String get diskEncryptionPageReplaceDialogSave => '保存到文件';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      '我已经在某个安全的位置保存了我的恢复密钥';

  @override
  String get diskEncryptionPageReplaceDialogReplace => '更换';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => '舍弃';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => '恢复密钥已更换';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => '记得把它放到一个安全的地方。';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader => '恢复密钥更换失败';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      '在替换您的恢复密钥时发生了一些错误，您的老密钥将会保持有效。';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu 桌面 — 加密恢复密钥';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      '扫描这个二维码以复制恢复密钥并且保存到某个安全的位置，例如密码管理器。您也可以拍照方便后期使用。';

  @override
  String get diskEncryptionPageClipboardNotification => '已复制到粘贴板';

  @override
  String get diskEncryptionPageCopySemanticLabel => '复制';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader => '加密设置不可用';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      '在返回您的电脑的加密状况时出现错误。';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      '您的电脑的TPM配置不在一个受支持的状态。';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader => '您的snapd版本不受支持';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody => '检查安全中心与snap保持最新。';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      '安全中心不能连接到snapd界面';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      '要修复这个，在终端中输入：';

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
  String get recoveryKeyExceptionFileSystemTitle => '恢复密钥文件未保存';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle => '恢复密钥文件不能保存到临时位置';

  @override
  String get recoveryKeyExceptionUnknownTitle => '未知错误';

  @override
  String get recoveryKeyExceptionFilePermissionTitle => '无法保存恢复密钥到文件';

  @override
  String get recoveryKeyExceptionFilePermissionBody => '您没有权以写到那个文件位置中。';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      '您没有写入该文件夹的权限，请尝试其他位置或使用其他方法。';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      '尝试一个不同的地址，例如可移动磁盘，或者用其他的方式。';

  @override
  String get recoveryKeyFilePickerTitle => '保存恢复密钥文件';

  @override
  String get recoveryKeyFilePickerFilter => '文本文件';

  @override
  String get recoveryKeyTPMEnabled => '硬件返回加密已启用';

  @override
  String get recoveryKeyTPMExplanationBody => '加密密钥已经储存到您的电脑的信任平台模块（TPM）。';

  @override
  String get recoveryKeyTPMExplanationLearnMore => '了解更多关于硬件返回加密';

  @override
  String get recoveryKeyPassphraseEnabled => '密码加密已启用';

  @override
  String get recoveryKeyPassphraseHeader => '修改密码';

  @override
  String get recoveryKeyPassphraseBody =>
      '您需要在开机的时候输入您的密码以解锁磁盘。您可以修改密码但是不能禁用它。';

  @override
  String get recoveryKeyPassphraseButton => '修改密码...';

  @override
  String get recoveryKeyPassphraseCurrent => '当前密码';

  @override
  String get recoveryKeyPassphraseNew => '新密码';

  @override
  String get recoveryKeyPassphraseConfirm => '确认密码';

  @override
  String get recoveryKeyPassphraseCurrentError => '错误的密码，请重试';

  @override
  String get recoveryKeyPassphraseNewError => '必须至少4个字符长';

  @override
  String get recoveryKeyPassphraseConfirmError => '密码不匹配，请重试';

  @override
  String get recoveryKeyPassphraseDialogHeader => '修改密码';

  @override
  String get recoveryKeyPinEnabled => '加密PIN已启用';

  @override
  String get recoveryKeyPinHeader => '加密PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => '加密密码';

  @override
  String get recoveryKeyPinBody => '您需要在开机的时候输入PIN以解锁此磁盘。您可以修改PIN但是不能禁用它。';

  @override
  String get recoveryKeyPinButton => '改变PIN...';

  @override
  String get recoveryKeyPinCurrent => '当前PIN';

  @override
  String get recoveryKeyPinNew => '新的PIN';

  @override
  String get recoveryKeyPinConfirm => '确认PIN';

  @override
  String get recoveryKeyPinCurrentError => '错误的PIN，请重试';

  @override
  String get recoveryKeyPinConfirmError => 'PIN不匹配，请重试';

  @override
  String get recoveryKeyPinDialogHeader => '更改PIN';

  @override
  String get recoveryKeyPassphraseShow => '显示';

  @override
  String get recoveryKeyPassphraseHide => '隐藏';

  @override
  String get recoveryKeyPassphraseChange => '修改';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN已更新';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => '您的PIN成功更新。';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => '密码已更新';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody => '您的密码已成功更新。';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin => '弱密码，请使它更长或者更复杂';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      '短的密码，请确保它更长或者更复杂以更好的安全';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => '强密码';

  @override
  String get recoveryKeyPinEntropyBelowMin => '弱PIN，请让它更长或者更难以预测';

  @override
  String get recoveryKeyPinEntropyBelowOptimal => '可猜测PIN，请使它变得更长或者更难以预测以变得更安全';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN足够长';

  @override
  String get recoveryKeySomethingWentWrongHeader => '发生了一些错误';

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
  String get snapPermissionAccessLabel => '存取';

  @override
  String get snapPermissionsEnableTitle => '要求應用程式請求系統權限';

  @override
  String get snapPermissionsEnableWarning => '這是一項實驗性功能，用於控制對系統資源的存取。';

  @override
  String get snapPermissionsEnablingLabel => '啟用中，此過程可能需要數秒鐘...';

  @override
  String get snapPermissionsDisablingLabel => '停用中，此過程可能需要數秒鐘...';

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
  String get cameraRulesPageEmptyTileLabel => '目前尚無應用程式要求存取權限';

  @override
  String get snapRulesRemoveAll => '移除所有規則';

  @override
  String get snapRulesResetAllPermissions => '重設所有權限';

  @override
  String get homeInterfacePageTitle => '家目錄';

  @override
  String get homeInterfacePageDescription => '管理存取您家目錄中檔案的權限。';

  @override
  String get cameraInterfacePageTitle => '相機';

  @override
  String get cameraInterfacePageDescription => '允許應用程式存取您的相機。';

  @override
  String get microphoneInterfacePageTitle => '麥克風';

  @override
  String get microphoneInterfacePageDescription => '允許應用程式存取您的麥克風。';

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

  @override
  String get diskEncryptionPageTitle => '磁碟加密';

  @override
  String get diskEncryptionPageRecoveryKey => '復原金鑰';

  @override
  String get diskEncryptionPageStoreYourKey =>
      '如果磁碟在啟動期間無法解鎖，復原金鑰可讓您重新取得資料。請將它保存在安全的地方。';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return '如果磁碟在啟動時無法解鎖，復原金鑰可讓您重新取得資料。將它保存在安全的地方。$learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => '深入了解硬體支援的加密技術';

  @override
  String get diskEncryptionPageCheckKey => '檢查復原金鑰...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => '檢查復原金鑰';

  @override
  String get diskEncryptionPageCheck => '檢查';

  @override
  String get diskEncryptionPageValidKey => '有效金鑰';

  @override
  String get diskEncryptionPageInvalidKey => '無效金鑰';

  @override
  String get diskEncryptionPageEnterKey => '輸入您的復原金鑰';

  @override
  String get diskEncryptionPageKeyWorks => '復原金鑰有效';

  @override
  String get diskEncryptionPageKeyWorksBody => '記住把它放在安全的地方。';

  @override
  String get diskEncryptionPageKeyDoesntWork => '復原金鑰不起作用';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => '檢查金鑰或更換新的。';

  @override
  String get diskEncryptionPageError => '錯誤';

  @override
  String get diskEncryptionPageReplaceButton => '更換復原金鑰...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => '更換復原金鑰';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      '將新的復原金鑰保存在安全的地方。一旦更換，您將無法再使用舊金鑰。';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => '顯示 QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => '儲存至檔案';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge => '我將我的復原金鑰保存在安全的地方';

  @override
  String get diskEncryptionPageReplaceDialogReplace => '更換';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => '捨棄';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => '已更換復原金鑰';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody => '記住把它放在安全的地方。';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader => '復原金鑰更換失敗';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      '更換您的復原金鑰時出錯了，您的舊金鑰仍然有效。';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader => 'Ubuntu 桌面 - 加密復原金鑰';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      '掃描 QR code 以複製復原金鑰，並將其保存到安全的地方，例如密碼管理器。您也可以拍張照片以供日後使用。';

  @override
  String get diskEncryptionPageClipboardNotification => '已複製到剪貼簿';

  @override
  String get diskEncryptionPageCopySemanticLabel => '複製';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader => '加密設定不可用';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      '擷取這台電腦的加密狀態失敗。';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      '您的電腦 TPM 配置處於不受支持的狀態。';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader => '您的 snapd 版本不受支援';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      '請確認安全中心與 snapd 已更新至最新版。';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      '安全中心無法連接到 snapd 介面';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      '為了解決此問題, 請於終端機中執行下列指令:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => '加入 PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => '加入密碼短語...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => '加入密碼短語';

  @override
  String get diskEncryptionPageAddPinDialogHeading => '加入 PIN 碼';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      '每次電腦啟動時，您都需輸入 PIN 碼。此識別碼與您的使用者密碼不同。';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      '若您忘記 PIN 碼，可使用復原金鑰重新取得磁碟存取權。';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      '每次電腦啟動時，您都需輸入您的密碼短語。此密碼短語與您的使用者密碼不同。';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      '若您忘記密碼短語，可透過使用復原金鑰重新取得磁碟存取權限。';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => '額外的安全措施';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      '您可以設定密碼短語或 PIN 碼以加強安全性。每次電腦啟動時，您都需輸入此密碼。';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => '了解更多';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => '新增';

  @override
  String get diskEncryptionPageRemovePinButton => '移除 PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => '移除密碼短語...';

  @override
  String get diskEncryptionPageAddingPin => '正在新增 PIN 碼，此過程可能需要數秒鐘...';

  @override
  String get diskEncryptionPageAddingPassphrase => '正在新增密碼短語，此過程可能需要數秒鐘...';

  @override
  String get diskEncryptionPageRemovingPin => '正在移除 PIN 碼，此過程可能需要數秒鐘...';

  @override
  String get diskEncryptionPageRemovingPassphrase => '正在移除密碼短語，此過程可能需要數秒鐘...';

  @override
  String get recoveryKeyExceptionFileSystemTitle => '未儲存復原金鑰檔案';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle => '復原金鑰檔案無法儲存於暫存位置';

  @override
  String get recoveryKeyExceptionUnknownTitle => '未知錯誤';

  @override
  String get recoveryKeyExceptionFilePermissionTitle => '無法將您的復原金鑰儲存至檔案';

  @override
  String get recoveryKeyExceptionFilePermissionBody => '您沒有寫入該檔案位置的權限。';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      '您沒有寫入該資料夾的權限。請嘗試不同的位置或使用其他方法。';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      '嘗試不同的位置，例如卸除式磁碟機，或使用其他方法。';

  @override
  String get recoveryKeyFilePickerTitle => '儲存復原金鑰檔案';

  @override
  String get recoveryKeyFilePickerFilter => '文字檔';

  @override
  String get recoveryKeyTPMEnabled => '已啟用硬體支援加密';

  @override
  String get recoveryKeyTPMExplanationBody => '加密金鑰儲存在電腦的可信賴平台模組 (TPM) 中。';

  @override
  String get recoveryKeyTPMExplanationLearnMore => '進一步了解硬體支援的加密';

  @override
  String get recoveryKeyPassphraseEnabled => '已啟用加密密碼';

  @override
  String get recoveryKeyPassphraseHeader => '變更密碼';

  @override
  String get recoveryKeyPassphraseBody => '每次電腦啟動時，您都需要輸入您的密碼短語。';

  @override
  String get recoveryKeyPassphraseButton => '變更密碼...';

  @override
  String get recoveryKeyPassphraseCurrent => '目前的密碼';

  @override
  String get recoveryKeyPassphraseNew => '新密碼';

  @override
  String get recoveryKeyPassphraseConfirm => '確認密碼';

  @override
  String get recoveryKeyPassphraseCurrentError => '密碼不正確，請重試';

  @override
  String get recoveryKeyPassphraseNewError => '必須至少有 4 個字元';

  @override
  String get recoveryKeyPassphraseConfirmError => '密碼不符，請重試';

  @override
  String get recoveryKeyPassphraseDialogHeader => '變更密碼';

  @override
  String get recoveryKeyPinEnabled => '加密 PIN 碼已啟用';

  @override
  String get recoveryKeyPinHeader => '加密 PIN 碼';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => '加密密碼';

  @override
  String get recoveryKeyPinBody => '每次電腦啟動時，您都需要輸入您的 PIN 碼。';

  @override
  String get recoveryKeyPinButton => '變更 PIN 碼...';

  @override
  String get recoveryKeyPinCurrent => '目前 PIN 碼';

  @override
  String get recoveryKeyPinNew => '新 PIN 碼';

  @override
  String get recoveryKeyPinConfirm => '確認 PIN 碼';

  @override
  String get recoveryKeyPinCurrentError => 'PIN 碼不正確，請重試';

  @override
  String get recoveryKeyPinConfirmError => 'PIN 碼不符，請重試';

  @override
  String get recoveryKeyPinDialogHeader => '變更 PIN 碼';

  @override
  String get recoveryKeyPassphraseShow => '顯示';

  @override
  String get recoveryKeyPassphraseHide => '隱藏';

  @override
  String get recoveryKeyPassphraseChange => '變更';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN 碼已更新';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => '您的 PIN 碼已成功更新。';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => '密碼已更新';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody => '您的密碼已成功更新。';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin => '密碼太弱，請將它設得更長或更複雜';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      '公平的密碼，將它變得更長或更複雜，以提高安全性';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => '強大的密碼';

  @override
  String get recoveryKeyPinEntropyBelowMin => '較弱的 PIN 碼，使其更長或更難預測';

  @override
  String get recoveryKeyPinEntropyBelowOptimal => '公平的 PIN 碼，使其更長或更不易預測，以提高安全性';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN 碼夠長';

  @override
  String get recoveryKeySomethingWentWrongHeader => '出了問題';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported => '此 Ubuntu 版本不提供 Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro 需要 LTS 版本';

  @override
  String get ubuntuProNotSupportedSnapd => '此 snapd 版本不支援 Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedSnapdDetails => '更新 snapd 以管理 Ubuntu Pro';

  @override
  String get ubuntuProEnabled => '已啟用 Ubuntu Pro';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return '為您的電腦提供企業級的安全防護與合規性。個人使用始終免費。$learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => '了解 Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => '啟用 Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => '使用 Ubuntu One 帳戶啟用';

  @override
  String get ubuntuProEnableMagicSubtitle => '您將能夠免費建立一個帳戶';

  @override
  String get ubuntuProMagicPrompt => '請使用您的 Ubuntu One 帳戶登入，或免費建立一個帳戶。';

  @override
  String get ubuntuProMagicContinueInBrowser => '在瀏覽器中繼續';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return '您也可以透過 $attachLink 登入，並輸入驗證碼 $attachCode';
  }

  @override
  String get ubuntuProMagicError => '無法啟用 Ubuntu Pro，請重試';

  @override
  String get ubuntuProEnableToken => '使用 token 啟用';

  @override
  String get ubuntuProEnableTokenError => '無法啟用 Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return '來自您的 IT 管理員，或來自 $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return '請向您的系統管理員索取 Ubuntu Pro token，或前往 $proLink 取得';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => '停用 Ubuntu Pro';

  @override
  String get ubuntuProDisable => '停用';

  @override
  String get ubuntuProDisablePrompt => '停用 Ubuntu Pro 將解除您在此台電腦上的訂閱。您要繼續嗎？';

  @override
  String get ubuntuProEnable => '啟用';

  @override
  String get ubuntuProCancel => '取消';

  @override
  String get ubuntuProFeatureEnableError => '無法啟用此功能，請重試。';

  @override
  String get ubuntuProFeatureDisableError => '無法停用此功能，請重試。';

  @override
  String get ubuntuProCompliance => '合規性與系統強化';

  @override
  String get ubuntuProComplianceDisclaimer =>
      '僅建議用於協助符合 FedRAMP、HIPAA 及其他合規與強化安全措施的要求。';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu 安全指南 (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      '透過 CIS 基準與 DISA-STIG 設定檔，自動化執行系統強化與稽核作業，同時支援針對特定環境的客製化調整。';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      '美國與加拿大政府針對符合 FIPS 140-2 資料保護標準所頒發的加密模組合規認證。';

  @override
  String get ubuntuProComplianceFIPSEnable => '啟用 FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      '啟用 FIPS 後無法撤銷，且 Livepatch 將永久停用。';

  @override
  String get ubuntuProComplianceFIPSPrompt => '請選擇您偏好的 FIPS 選項';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS 及其更新';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      '安裝通過 FIPS 140-2 驗證的軟體包，並允許定期進行安全性更新。';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => '未更新版本的 FIPS';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      '安裝通過 FIPS 140-2 驗證的軟體包。這些軟體包將不會更新，直至下次重新認證為止。';

  @override
  String get ubuntuProComplianceDocumentation => '資安合規文件';

  @override
  String get ubuntuProESMTitle => '擴展安全維護 (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM 為 25,000 多個開源軟體包提供長達 10 年的安全性修補程式。針對關鍵、高風險及中風險的 CVE，提供持續性的漏洞管理服務。';

  @override
  String get ubuntuProESMMainTitle => '主要軟體包 (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return '2,300 個 Ubuntu Main 軟體包的安全更新，直至 $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe 軟體包 (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return '針對超過 23,000 個 Ubuntu Universe 軟體包的額外安全性更新，有效期至 $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => '啟用 Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription => '在系統運行時套用核心安全性更新';

  @override
  String get ubuntuProLivepatchShowTitle => '在頂端列顯示 Livepatch 狀態';
}
