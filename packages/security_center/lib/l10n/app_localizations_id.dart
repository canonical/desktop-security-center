// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Pusat Keamanan';

  @override
  String get snapdRuleCategorySessionAllowed => 'Izinkan sampai log keluar';

  @override
  String get snapdRuleCategorySessionDenied => 'Tolak sampai log keluar';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Selalu izinkan';

  @override
  String get snapdRuleCategoryForeverDenied => 'Selalu tolak';

  @override
  String get snapPermissionReadLabel => 'Baca';

  @override
  String get snapPermissionWriteLabel => 'Tulis';

  @override
  String get snapPermissionExecuteLabel => 'Jalankan';

  @override
  String get snapPermissionsEnableTitle => 'Membutuhkan aplikasi untuk meminta izin sistem';

  @override
  String get snapPermissionsEnableWarning => 'Ini adalah fitur eksperimental untuk mengendalikan akses ke sumber daya sistem Anda.';

  @override
  String get snapPermissionsEnablingLabel => 'Memfungsikan, itu mungkin perlu waktu beberapa detik ...';

  @override
  String get snapPermissionsDisablingLabel => 'Menonaktifkan, itu mungkin perlu waktu beberapa detik ...';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimental';

  @override
  String get snapPermissionsOtherDescription => 'Anda dapat mengelola izin lain dalam Pengaturan › Aplikasi.';

  @override
  String get snapPermissionsPageTitle => 'Izin Aplikasi';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aturan',
      one: '1 aturan',
      zero: 'tidak ada aturan',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Kelola izin $interface untuk $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Belum ada aturan';

  @override
  String get snapRulesRemoveAll => 'Hapus semua aturan';

  @override
  String get homeInterfacePageTitle => 'Folder rumah';

  @override
  String get homeInterfacePageDescription => 'Kelola izin untuk mengakses berkas di folder Rumah Anda.';

  @override
  String get interfacePageTitle => 'Kelola izin';

  @override
  String get interfacePageDescription => 'Aplikasi yang ketat dibatasi akan bertanya sebelum mengakses berkas dan folder. Fitur ini eksperimen dan mungkin berubah.';

  @override
  String get interfacePageLinkLearnMore => 'Pelajari selengkapnya';

  @override
  String get interfacePageLinkGiveFeedback => 'Berikan umpan balik';

  @override
  String get interfacePageLinkReportIssues => 'Laporkan masalah';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplikasi',
      one: '1 aplikasi',
      zero: 'tidak ada aplikasi',
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
