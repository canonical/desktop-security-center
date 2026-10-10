// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'セキュリティセンター';

  @override
  String get snapdRuleCategorySessionAllowed => 'ログアウトまで許可';

  @override
  String get snapdRuleCategorySessionDenied => 'ログアウトまで拒否';

  @override
  String get snapdRuleCategoryForeverAllowed => '常に許可';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => '常に拒否';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => '読み取り';

  @override
  String get snapPermissionWriteLabel => '書き込み';

  @override
  String get snapPermissionExecuteLabel => '実行';

  @override
  String get snapPermissionAccessLabel => 'アクセス';

  @override
  String get snapPermissionsEnableTitle => 'システムのパーミッションを求めるようアプリに要求する';

  @override
  String get snapPermissionsEnableWarning =>
      'これはコンピューターのリソースへのアクセスを制御するための実験的な機能です。';

  @override
  String get snapPermissionsEnablingLabel => '有効にしています。数秒かかることがあります...';

  @override
  String get snapPermissionsDisablingLabel => '無効にしています。数秒かかることがあります...';

  @override
  String get snapPermissionsExperimentalLabel => '実験的';

  @override
  String get snapPermissionsOtherDescription => '他のパーミッションは設定 › アプリで管理できます。';

  @override
  String get snapPermissionsPageTitle => 'アプリのパーミッション';

  @override
  String get snapPermissionsErrorTitle => '何らかの問題が発生しました';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n個のルール',
      one: '1個のルール',
      zero: 'ルールなし',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snap向けの$interfaceパーミッションを管理します。';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ルールなし';

  @override
  String get cameraRulesPageEmptyTileLabel => 'アクセスをリクエストしたアプリはまだありません';

  @override
  String get snapRulesRemoveAll => 'すべてのルールを削除';

  @override
  String get snapRulesResetAllPermissions => 'すべてのパーミッションをリセット';

  @override
  String get homeInterfacePageTitle => 'ホームフォルダー';

  @override
  String get homeInterfacePageDescription =>
      'ホームフォルダーにあるファイルにアクセスするパーミッションを管理します。';

  @override
  String get cameraInterfacePageTitle => 'カメラ';

  @override
  String get cameraInterfacePageDescription => 'アプリにカメラへのアクセスを許可する。';

  @override
  String get microphoneInterfacePageTitle => 'マイク';

  @override
  String get microphoneInterfacePageDescription => 'アプリにマイクへのアクセスを許可する。';

  @override
  String get interfacePageTitle => 'パーミッションを管理';

  @override
  String get interfacePageLinkLearnMore => '詳しく知る';

  @override
  String get interfacePageLinkReportIssues => '問題を報告';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n個のアプリ',
      one: '1個のアプリ',
      zero: 'アプリなし',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'ディスク暗号化';

  @override
  String get diskEncryptionPageRecoveryKey => 'リカバリーキー';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'リカバリーキーは起動時にディスクのロック解除に失敗した場合、再びアクセスできるようにするために必要なものです。どこか安全なところに保存してください。';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'リカバリーキーは起動時にディスクのロック解除に失敗した場合、再びアクセスできるようにするために必要なものです。どこか安全なところに保存してください。$learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => 'ハードウェアベースの暗号化についての詳細';

  @override
  String get diskEncryptionPageCheckKey => 'リカバリーキーをチェック...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'リカバリーキーのチェック';

  @override
  String get diskEncryptionPageCheck => 'チェック';

  @override
  String get diskEncryptionPageValidKey => '有効なキー';

  @override
  String get diskEncryptionPageInvalidKey => '無効なキー';

  @override
  String get diskEncryptionPageEnterKey => 'リカバリーキーを入力';

  @override
  String get diskEncryptionPageKeyWorks => 'リカバリーキーは動作しています';

  @override
  String get diskEncryptionPageKeyWorksBody => 'どこか安全なところに保存してください。';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'リカバリーキーが動作していません';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody => 'キーを確認するか、新しいものに置き換えてください。';

  @override
  String get diskEncryptionPageError => 'エラー';

  @override
  String get diskEncryptionPageReplaceButton => 'リカバリーキーを置き換え...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'リカバリーキーの置き換え';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      '新しいリカバリーキーをどこか安全な場所に保存します。いったん置き換えると、古いキーはもう使えなくなります。';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QRコードを表示';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'ファイルに保存';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'リカバリーキーを安全なところに保存しました';

  @override
  String get diskEncryptionPageReplaceDialogReplace => '置き換える';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => '取り消す';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader => 'リカバリーキーを置き換えました';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      '忘れずにどこか安全なところに保存してください。';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'リカバリーキーの置き換えに失敗しました';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      '何らかの理由でリカバリーキーの置き換えに失敗しました。古いキーが有効です。';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntuデスクトップ - 暗号化リカバリーキー';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'QRコードをスキャンしてリカバリーキーを保存し、パスワードマネージャーなどの安全なところに保存してください。後の利用のため、写真を撮ってください。';

  @override
  String get diskEncryptionPageClipboardNotification => 'クリップボードにコピー';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'コピー';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      '暗号化設定が利用できません';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'このコンピューターの暗号化状態を取得するのに失敗しました。';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'このコンピューターのTPM設定がサポートされている状態になっていません。';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'このsnapdバージョンはサポートされていません';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'セキュリティセンターとsnapdがアップデートされているか確認してください。';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'セキュリティセンターがsnapdインターフェースに接続できません';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      '修正するには次のコマンドを実行します:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'PINを追加...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'パスフレーズを追加...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'パスフレーズを追加';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PINを追加';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'PINはコンピューターを起動するたびに入力する必要があります。PINはユーザーパスワードとは異なります。';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'PINを忘れた場合、リカバリーキーを使用してディスクへのアクセスを取り戻します。';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'コンピューター起動時に毎回パスフレーズを入力する必要があります。このパスフレーズはユーザーパスワードとは異なります。';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'パスワードを忘れた場合、リカバリーキーを使用してディスクへのアクセスを取り戻します。';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => '追加のセキュリティ';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      '追加のセキュリティとしてパスフレーズまたはPINを設定できます。コンピューターを起動するたびに入力する必要があります。';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => '詳しく知る';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => '追加';

  @override
  String get diskEncryptionPageRemovePinButton => 'PINを削除...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'パスフレーズを削除...';

  @override
  String get diskEncryptionPageAddingPin => 'PINを追加しています。数秒かかることがあります...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'パスフレーズを追加しています。数秒かかることがあります...';

  @override
  String get diskEncryptionPageRemovingPin => 'PINを削除しています。数秒かかることがあります...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'パスフレーズを削除しています。数秒かかることがあります...';

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
  String get recoveryKeyExceptionFileSystemTitle => 'リカバリーキーファイルが保存できませんでした';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'リカバリーキーファイルが一時場所に保存できませんでした';

  @override
  String get recoveryKeyExceptionUnknownTitle => '不明なエラー';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'リカバリーキーをファイルに保存するのに失敗しました';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'そのファイルの場所に書き込めるパーミッションがありません。';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'フォルダーに保存する権限がありません。別の場所にするか、他の方法にしてください。';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'USBメモリーなど別の場所に保存するか、他の方法にしてください。';

  @override
  String get recoveryKeyFilePickerTitle => 'リカバリーキーファイルの保存';

  @override
  String get recoveryKeyFilePickerFilter => 'テキストファイル';

  @override
  String get recoveryKeyTPMEnabled => 'ハードウェアベース暗号化は有効です';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      '暗号化キーはこのコンピューターのTrusted Platform Module (TPM)に保存されています。';

  @override
  String get recoveryKeyTPMExplanationLearnMore => 'ハードウェアベース暗号化についての詳細';

  @override
  String get recoveryKeyPassphraseEnabled => '暗号化パスワードは有効です';

  @override
  String get recoveryKeyPassphraseHeader => 'パスフレーズを変更';

  @override
  String get recoveryKeyPassphraseBody => 'コンピューターを起動する際に毎回パスフレーズを入力する必要があります。';

  @override
  String get recoveryKeyPassphraseButton => 'パスフレーズを変更...';

  @override
  String get recoveryKeyPassphraseCurrent => '現在のパスフレーズ';

  @override
  String get recoveryKeyPassphraseNew => '新しいパスフレーズ';

  @override
  String get recoveryKeyPassphraseConfirm => 'パスフレーズを確認';

  @override
  String get recoveryKeyPassphraseCurrentError => 'パスフレーズが間違っています。もう一度試してください';

  @override
  String get recoveryKeyPassphraseNewError => '最低4文字以上である必要があります';

  @override
  String get recoveryKeyPassphraseConfirmError => 'パスフレーズが一致しません。もう一度試してください';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'パスフレーズを変更';

  @override
  String get recoveryKeyPinEnabled => '暗号化PINは有効です';

  @override
  String get recoveryKeyPinHeader => '暗号化PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => '暗号化パスフレーズ';

  @override
  String get recoveryKeyPinBody => 'コンピューターを起動する際に毎回PINを入力する必要があります。';

  @override
  String get recoveryKeyPinButton => 'PINを変更...';

  @override
  String get recoveryKeyPinCurrent => '現在のPIN';

  @override
  String get recoveryKeyPinNew => '新しいPIN';

  @override
  String get recoveryKeyPinConfirm => 'PINを確認';

  @override
  String get recoveryKeyPinCurrentError => 'PINが間違っています。もう一度試してください';

  @override
  String get recoveryKeyPinConfirmError => 'PINが一致しません。もう一度試してください';

  @override
  String get recoveryKeyPinDialogHeader => 'PINを変更';

  @override
  String get recoveryKeyPassphraseShow => '表示';

  @override
  String get recoveryKeyPassphraseHide => '隠す';

  @override
  String get recoveryKeyPassphraseChange => '変更';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PINを更新しました';

  @override
  String get recoveryKeyPassphrasePinSuccessBody => 'PINを更新するのに成功しました。';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => 'パスフレーズを更新しました';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'パスフレーズのアップデートに成功しました。';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      '弱いパスフレーズなので長くするかもっと複雑にしてください';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      '適切なパスフレーズにするため、もっと長くするかもっと複雑にするかでよりよいセキュリティにしてください';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => '強いパスフレーズ';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      '弱いPINなのでもっと長くするか、簡単に予想できないものにしてください';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      '適切なPINにするため、もっと長くするか簡単に予想できないものにしてよりよりセキュリティにしてください';

  @override
  String get recoveryKeyPinEntropyOptimal => '充分な強度のPINです';

  @override
  String get recoveryKeySomethingWentWrongHeader => '何かがおかしいです';

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
  String get ubuntuProNotSupported => 'このバージョンのUbuntuではUbuntu Proは利用できません';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu ProはLTSリリースである必要があります';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Proはこのsnapdバージョンではサポートされていません';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ubuntu Proを管理するにはsnapdをアップデートしてください';

  @override
  String get ubuntuProEnabled => 'Ubuntu Proは有効です';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'コンピューターにエンタープライズグレードのセキュリティとコンプライアンスを提供します。個人利用の場合は常に無料です。 $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Ubuntu Proを詳しく知る';

  @override
  String get ubuntuProEnablePro => 'Ubuntu Proを有効にする';

  @override
  String get ubuntuProEnableMagic => 'Ubuntu Oneアカウントで有効にする';

  @override
  String get ubuntuProEnableMagicSubtitle => 'アカウント作成は無料です';

  @override
  String get ubuntuProMagicPrompt => 'Ubuntu Oneアカウントでログインするか、無料で作成してください。';

  @override
  String get ubuntuProMagicContinueInBrowser => 'ブラウザーで継続';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return '$attachLink からログインし、コード $attachCode を入力してください';
  }

  @override
  String get ubuntuProMagicError => 'Ubuntu Proを有効にできません。やり直してください';

  @override
  String get ubuntuProEnableToken => 'トークンで有効化';

  @override
  String get ubuntuProEnableTokenError => 'Ubuntu Proを有効にできません';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'IT管理者か $proLink より';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return '管理者か $proLink からUbuntu Proのトークンを取得してください';
  }

  @override
  String get ubuntuProTokenLabel => 'トークン';

  @override
  String get ubuntuProDisablePro => 'Ubuntu Proを無効にする';

  @override
  String get ubuntuProDisable => '無効';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Proを無効にするとこのマシンをサブスクリプションから除外することになります。継続しますか？';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => '有効';

  @override
  String get ubuntuProCancel => 'キャンセル';

  @override
  String get ubuntuProFeatureEnableError => '機能を有効にできません。やり直してください。';

  @override
  String get ubuntuProFeatureDisableError => '機能を無効にできません。やり直してください。';

  @override
  String get ubuntuProCompliance => 'コンプライアンスとハードニング';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'FedRAMP、HIPAA、その他のコンプライアンスおよびセキュリティ要件への対応でのみ推奨されます。';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntuセキュリティガイド (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'CISベンチマークおよびDISA-STIGプロファイルを使用して、環境固有のカスタマイズを行いつつ、セキュリティ強化と監査を自動化します。';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'FIPS 140-2データ保護標準に準拠する、米国およびカナダ政府の暗号化モジュール認証。';

  @override
  String get ubuntuProComplianceFIPSEnable => 'FIPSを有効化';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPSを有効にすると元に戻せず、Livepatchは永久に無効になります。';

  @override
  String get ubuntuProComplianceFIPSPrompt => 'FIPSオプションを選択してください';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'アップデートありFIPS';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'FIPS 140-2適合パッケージをインストールし、通常のセキュリティアップデートを許可します。';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'アップデートなしFIPS';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'FIPS 140-2適合パッケージをインストールします。次の再認証までアップデートされません。';

  @override
  String get ubuntuProComplianceDocumentation => 'セキュリティコンプライアンスのドキュメント';

  @override
  String get ubuntuProESMTitle => '拡張セキュリティメンテンナンス(ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESMはUbuntuアーカイブ全体のセキュリティパッチを提供します。緊急、重要、選ばれた警告レベルのCVEに対して継続的に脆弱性管理を行います。';

  @override
  String get ubuntuProESMMainTitle => 'Mainパッケージ(esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return '$year年までのUbuntu Mainパッケージのセキュリティアップデート';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universeパッケージ(esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return '$year年までのUbuntu Universeパッケージの追加セキュリティアップデート';
  }

  @override
  String get ubuntuProLivepatchTitle => 'カーネルLivepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Livepatchを有効化';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'システムの実行中にカーネルのセキュリティアップデートを適用';

  @override
  String get ubuntuProLivepatchShowTitle => 'Livepatchステータスをトップバーに表示';
}
