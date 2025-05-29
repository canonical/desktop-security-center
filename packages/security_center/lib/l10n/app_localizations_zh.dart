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
  String get snapRulesRemoveAll => '删除所有规则';

  @override
  String get homeInterfacePageTitle => '主文件夹';

  @override
  String get homeInterfacePageDescription => '管理访问您主文件夹中文件的权限。';

  @override
  String get interfacePageTitle => '管理权限';

  @override
  String get interfacePageDescription => '严格受限的应用将会在访问文件和文件夹前询问您的授权。此功能系实验性功能且可能会在日后更改。';

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
  String get diskEncryption => 'Disk Encryption';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw(): super('zh_TW');

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
  String get interfacePageDescription => '受嚴格限制的應用程式會在存取檔案和資料夾之前詢問您。此功能是實驗性的，可能會改變。';

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
