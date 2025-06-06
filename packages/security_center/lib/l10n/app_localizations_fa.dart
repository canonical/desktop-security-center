// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'مرکز امنیت';

  @override
  String get snapdRuleCategorySessionAllowed => 'اجازه تا خروج';

  @override
  String get snapdRuleCategorySessionDenied => 'رد تا خروج';

  @override
  String get snapdRuleCategoryForeverAllowed => 'اجازه برای همیشه';

  @override
  String get snapdRuleCategoryForeverDenied => 'رد کردن برای همیشه';

  @override
  String get snapPermissionReadLabel => 'خواندن';

  @override
  String get snapPermissionWriteLabel => 'نوشتن';

  @override
  String get snapPermissionExecuteLabel => 'اجرا';

  @override
  String get snapPermissionsEnableTitle => 'نیازمند درخواست اجازهٔ سامانه‌ای از سوی کاره';

  @override
  String get snapPermissionsEnableWarning => 'این یک ویژگی آزمایشی برای واپایش دسترسی به منابع سامانه‌تان است.';

  @override
  String get snapPermissionsEnablingLabel => 'به کار انداختن. ممکن است چند ثانیه زمان ببرد…';

  @override
  String get snapPermissionsDisablingLabel => 'از کار انداختن. ممکن است چند ثانیه زمان ببرد…';

  @override
  String get snapPermissionsExperimentalLabel => 'آزمایشی';

  @override
  String get snapPermissionsOtherDescription => 'مدیریت دیگر اجازه‌ها در تنظمیات › برنامه‌ها.';

  @override
  String get snapPermissionsPageTitle => 'اجازه‌های کاره';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n قاعده',
      zero: 'بدون قاعده',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'مدیریت اجازه‌های $interface برای $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'هنوز بدون قاعده';

  @override
  String get snapRulesRemoveAll => 'برداشتن همهٔ قاعده‌ها';

  @override
  String get homeInterfacePageTitle => 'شاخهٔ خانه';

  @override
  String get homeInterfacePageDescription => 'مدیریت اجازه‌ها برای دسترسی به پرونده‌ها در شاخهٔ خانگیتان.';

  @override
  String get interfacePageTitle => 'مدیریت اجازه‌ها';

  @override
  String get interfacePageDescription => 'Strictly confined apps will ask you before accessing files and folders. This feature is experimental and subject to changes.';

  @override
  String get interfacePageLinkLearnMore => 'دانستن بیش‌تر';

  @override
  String get interfacePageLinkGiveFeedback => 'دادن بازخورد';

  @override
  String get interfacePageLinkReportIssues => 'گزارش اشکال‌ها';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n کاره',
      zero: 'بدون کاره',
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
}
