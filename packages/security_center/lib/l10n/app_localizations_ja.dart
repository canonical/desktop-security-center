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
  String get snapdRuleCategoryForeverDenied => '常に拒否';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rules',
      one: '1 rule',
      zero: 'no rules',
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
  String get interfacePageDescription =>
      '完全に閉じ込められたアプリはファイルやフォルダーにアクセスする前にあなたに尋ねます。この機能は実験的で変更される可能性があります。';

  @override
  String get interfacePageLinkLearnMore => '詳しく知る';

  @override
  String get interfacePageLinkGiveFeedback => 'フィードバック';

  @override
  String get interfacePageLinkReportIssues => '問題を報告';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'no apps',
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
  String get diskEncryptionPageDialogHeaderCheckKey => 'リカバリーキーをチェック';

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
  String get diskEncryptionPageReplaceButton => 'リカバリーキーを置き換える...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'リカバリーキーを置き換える';

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
  String get diskEncryptionPageReplaceDialogDiscard => '破棄する';

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
      'ESMは25000を超えるオープンソースパッケージのセキュリティパッチを提供します。CVEの緊急、重要、警告に対する継続した脆弱性管理を獲得できます。';

  @override
  String get ubuntuProESMMainTitle => 'Mainパッケージ(esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return '$year までの2300に渡るUbuntu Mainパッケージのセキュリティアップデート';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universeパッケージ(esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return '$year までの23000に渡るUbuntu Universeパッケージの追加セキュリティアップデート';
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
