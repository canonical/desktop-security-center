// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'უსაფრთხოების ცენტრი';

  @override
  String get snapdRuleCategorySessionAllowed => 'დაშვება გასვლამდე';

  @override
  String get snapdRuleCategorySessionDenied => 'აკრძალვა გასვლამდე';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ყოველთვის დაშვება';

  @override
  String get snapdRuleCategoryForeverDenied => 'ყოველთვის აკრძალვა';

  @override
  String get snapPermissionReadLabel => 'წაკითხვა';

  @override
  String get snapPermissionWriteLabel => 'ჩაწერა';

  @override
  String get snapPermissionExecuteLabel => 'გაშვება';

  @override
  String get snapPermissionsEnableTitle => 'აპებისთვის სისტემური უფლებების მოთხოვნის აუცილებლობა';

  @override
  String get snapPermissionsEnableWarning => 'ეს ექსპერიმენტული ფუნქციაა თქვენი სისტემის რესურსებთან წვდომის მართვისთვის.';

  @override
  String get snapPermissionsEnablingLabel => 'მიმდინარეობს ჩართვა. ამას რამდენიმე წამი დასჭირდება...';

  @override
  String get snapPermissionsDisablingLabel => 'მიმდინარეობს გათიშვა. ამას რამდენიმე წამი დასჭირდება...';

  @override
  String get snapPermissionsExperimentalLabel => 'ექსპერიმენტული';

  @override
  String get snapPermissionsOtherDescription => 'სხვა წვდომების მართვა შეგუძლიათ მენიუში მორგება > აპლიკაციები.';

  @override
  String get snapPermissionsPageTitle => 'აპის წვდომები';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n წესი',
      one: '1 წესი',
      zero: 'წესების გარეშე',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-ის წვდომების მართვა $snap-სთვის.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ჯერ წესები არაა';

  @override
  String get snapRulesRemoveAll => 'ყველა წესის წაშლა';

  @override
  String get homeInterfacePageTitle => 'საწყისის საქაღალდე';

  @override
  String get homeInterfacePageDescription => 'მართეთ წვდომები თქენს საწყის საქაღალდეში ფაილებთან წვდომისთვის.';

  @override
  String get interfacePageTitle => 'წვდომების მართვა';

  @override
  String get interfacePageDescription => 'მკაცრად შეზღუდული აპები თქვენს დადასტურებას მოითხოვენ ფაილებთან და საქაღალდეებთან წვდომამდე. ეს ფუნქცია ექსპერიმენტულია და მუდმივად იცვლება.';

  @override
  String get interfacePageLinkLearnMore => 'გაიგეთ მეტი';

  @override
  String get interfacePageLinkGiveFeedback => 'უკუკავშირი';

  @override
  String get interfacePageLinkReportIssues => 'პრობლემების ანგარიში';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n აპი',
      one: '1 აპი',
      zero: 'აპების გარეშე',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryption => 'Disk Encryption';
}
