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
  String get snapdRuleCategorySessionAllowed => 'Izinkan hingga keluar';

  @override
  String get snapdRuleCategorySessionDenied => 'Tolak hingga keluar';

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
  String get snapPermissionAccessLabel => 'Akses';

  @override
  String get snapPermissionsEnableTitle =>
      'Wajibkan aplikasi meminta izin sistem';

  @override
  String get snapPermissionsEnableWarning =>
      'Ini adalah fitur eksperimental untuk mengontrol akses ke sumber daya sistem Anda.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Mengaktifkan, ini mungkin membutuhkan beberapa detik...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Menonaktifkan, ini mungkin membutuhkan beberapa detik...';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Anda dapat mengelola izin lainnya di Pengaturan › Aplikasi.';

  @override
  String get snapPermissionsPageTitle => 'Izin aplikasi';

  @override
  String get snapPermissionsErrorTitle => 'Terjadi kesalahan';

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
  String get cameraRulesPageEmptyTileLabel =>
      'Belum ada aplikasi yang meminta akses';

  @override
  String get snapRulesRemoveAll => 'Hapus semua aturan';

  @override
  String get snapRulesResetAllPermissions => 'Atur ulang semua izin';

  @override
  String get homeInterfacePageTitle => 'Folder Beranda';

  @override
  String get homeInterfacePageDescription =>
      'Kelola izin untuk mengakses file di folder Beranda Anda.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Izinkan aplikasi mengakses kamera Anda.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Izinkan aplikasi mengakses mikrofon Anda.';

  @override
  String get interfacePageTitle => 'Kelola izin';

  @override
  String get interfacePageLinkLearnMore => 'Pelajari selengkapnya';

  @override
  String get interfacePageLinkGiveFeedback => 'Beri masukan';

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
  String get diskEncryptionPageTitle => 'Enkripsi disk';

  @override
  String get diskEncryptionPageRecoveryKey => 'Kunci pemulihan';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Kunci pemulihan memungkinkan Anda mendapatkan kembali akses ke data Anda jika disk gagal dibuka kuncinya saat startup. Simpan di tempat yang aman.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Kunci pemulihan memungkinkan Anda mendapatkan kembali akses ke data Anda jika disk gagal dibuka kuncinya saat startup. Simpan di tempat yang aman. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Pelajari selengkapnya tentang enkripsi berbasis perangkat keras';

  @override
  String get diskEncryptionPageCheckKey => 'Periksa kunci pemulihan...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Periksa kunci pemulihan';

  @override
  String get diskEncryptionPageCheck => 'Periksa';

  @override
  String get diskEncryptionPageValidKey => 'Kunci valid';

  @override
  String get diskEncryptionPageInvalidKey => 'Kunci tidak valid';

  @override
  String get diskEncryptionPageEnterKey => 'Masukkan kunci pemulihan Anda';

  @override
  String get diskEncryptionPageKeyWorks => 'Kunci pemulihan berfungsi';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ingat untuk menyimpannya di tempat yang aman.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Kunci pemulihan tidak berfungsi';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Periksa kuncinya atau ganti dengan yang baru.';

  @override
  String get diskEncryptionPageError => 'Kesalahan';

  @override
  String get diskEncryptionPageReplaceButton => 'Ganti kunci pemulihan...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Ganti kunci pemulihan';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Simpan kunci pemulihan baru di tempat yang aman. Setelah Anda menggantinya, Anda tidak akan dapat menggunakan kunci lama lagi.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Tampilkan kode QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Simpan ke file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Saya telah menyimpan kunci pemulihan di tempat yang aman';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Ganti';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Buang';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Kunci pemulihan berhasil diganti';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Ingat untuk menyimpannya di tempat yang aman.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Penggantian kunci pemulihan gagal';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Terjadi kesalahan saat mengganti kunci pemulihan Anda, kunci lama Anda akan tetap berlaku.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Kunci pemulihan enkripsi';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Pindai kode QR untuk menyalin kunci pemulihan dan simpan di tempat yang aman, seperti pengelola kata sandi. Anda juga dapat mengambil foto untuk digunakan nanti.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Disalin ke papan klip';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Salin';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Pengaturan enkripsi tidak tersedia';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Gagal mengambil status enkripsi komputer ini.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Konfigurasi TPM komputer Anda tidak dalam keadaan yang didukung.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Versi snapd Anda tidak didukung';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Periksa apakah Pusat Keamanan dan snapd sudah diperbarui.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Pusat Keamanan tidak dapat terhubung ke antarmuka snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Untuk memperbaikinya, jalankan perintah ini di terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Tambahkan PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Tambahkan frasa sandi...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Tambahkan frasa sandi';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Tambahkan PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Anda perlu memasukkan PIN setiap kali komputer Anda menyala. PIN ini berbeda dari kata sandi pengguna Anda.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Jika Anda lupa PIN, Anda dapat mendapatkan kembali akses ke disk dengan menggunakan kunci pemulihan.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Anda perlu memasukkan frasa sandi setiap kali komputer Anda menyala. Frasa sandi ini berbeda dari kata sandi pengguna Anda.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Jika Anda lupa frasa sandi, Anda dapat mendapatkan kembali akses ke disk dengan menggunakan kunci pemulihan.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Keamanan tambahan';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Anda dapat mengatur frasa sandi atau PIN untuk keamanan tambahan. Anda perlu memasukkannya setiap kali komputer Anda menyala.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Pelajari selengkapnya';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Tambah';

  @override
  String get diskEncryptionPageRemovePinButton => 'Hapus PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Hapus frasa sandi...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Menambahkan PIN, ini mungkin membutuhkan beberapa detik...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Menambahkan frasa sandi, ini mungkin membutuhkan beberapa detik...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Menghapus PIN, ini mungkin membutuhkan beberapa detik...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Menghapus frasa sandi, ini mungkin membutuhkan beberapa detik...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'File kunci pemulihan tidak tersimpan';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'File kunci pemulihan tidak dapat disimpan di lokasi sementara';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Kesalahan tidak diketahui';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Gagal menyimpan kunci pemulihan ke file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Anda tidak memiliki izin untuk menulis ke lokasi file tersebut.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Anda tidak memiliki izin untuk menulis ke folder tersebut. Coba lokasi lain atau gunakan metode lain.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Coba lokasi lain, seperti drive yang dapat dilepas, atau gunakan metode lain.';

  @override
  String get recoveryKeyFilePickerTitle => 'Simpan file kunci pemulihan';

  @override
  String get recoveryKeyFilePickerFilter => 'File teks';

  @override
  String get recoveryKeyTPMEnabled =>
      'Enkripsi berbasis perangkat keras diaktifkan';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Kunci enkripsi disimpan di Trusted Platform Module (TPM) komputer Anda.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Pelajari selengkapnya tentang enkripsi berbasis perangkat keras';

  @override
  String get recoveryKeyPassphraseEnabled => 'Frasa sandi enkripsi diaktifkan';

  @override
  String get recoveryKeyPassphraseHeader => 'Ubah frasa sandi';

  @override
  String get recoveryKeyPassphraseBody =>
      'Anda perlu memasukkan frasa sandi setiap kali komputer Anda menyala.';

  @override
  String get recoveryKeyPassphraseButton => 'Ubah frasa sandi...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Frasa sandi saat ini';

  @override
  String get recoveryKeyPassphraseNew => 'Frasa sandi baru';

  @override
  String get recoveryKeyPassphraseConfirm => 'Konfirmasi frasa sandi';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Frasa sandi salah, coba lagi';

  @override
  String get recoveryKeyPassphraseNewError => 'Harus minimal 4 karakter';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Frasa sandi tidak cocok, coba lagi';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Ubah frasa sandi';

  @override
  String get recoveryKeyPinEnabled => 'PIN enkripsi diaktifkan';

  @override
  String get recoveryKeyPinHeader => 'PIN enkripsi';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Frasa sandi enkripsi';

  @override
  String get recoveryKeyPinBody =>
      'Anda perlu memasukkan PIN setiap kali komputer Anda menyala.';

  @override
  String get recoveryKeyPinButton => 'Ubah PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN saat ini';

  @override
  String get recoveryKeyPinNew => 'PIN baru';

  @override
  String get recoveryKeyPinConfirm => 'Konfirmasi PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN salah, coba lagi';

  @override
  String get recoveryKeyPinConfirmError => 'PIN tidak cocok, coba lagi';

  @override
  String get recoveryKeyPinDialogHeader => 'Ubah PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Tampilkan';

  @override
  String get recoveryKeyPassphraseHide => 'Sembunyikan';

  @override
  String get recoveryKeyPassphraseChange => 'Ubah';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN diperbarui';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PIN Anda berhasil diperbarui.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Frasa sandi diperbarui';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Frasa sandi Anda berhasil diperbarui.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Frasa sandi lemah, buat lebih panjang atau lebih kompleks';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Frasa sandi cukup, buat lebih panjang atau lebih kompleks untuk keamanan yang lebih baik';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Frasa sandi kuat';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN lemah, buat lebih panjang atau kurang mudah ditebak';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN cukup, buat lebih panjang atau kurang mudah ditebak untuk keamanan yang lebih baik';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN sudah cukup panjang';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Terjadi kesalahan';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro tidak tersedia untuk versi Ubuntu ini';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro memerlukan rilis LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro tidak didukung oleh versi snapd ini';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Perbarui snapd untuk mengelola Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro diaktifkan';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Keamanan dan kepatuhan tingkat enterprise untuk komputer Anda. Selalu gratis untuk penggunaan pribadi. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Pelajari tentang Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Aktifkan Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Aktifkan dengan akun Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Anda akan dapat membuat akun secara gratis';

  @override
  String get ubuntuProMagicPrompt =>
      'Masuk dengan akun Ubuntu One Anda, atau buat akun secara gratis.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Lanjutkan di browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Anda juga dapat masuk di $attachLink dan memasukkan kode $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Tidak dapat mengaktifkan Ubuntu Pro, silakan coba lagi';

  @override
  String get ubuntuProEnableToken => 'Aktifkan dengan token';

  @override
  String get ubuntuProEnableTokenError => 'Tidak dapat mengaktifkan Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Dari admin IT Anda atau dari $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Dapatkan token Ubuntu Pro dari administrator Anda atau dari $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Nonaktifkan Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Nonaktifkan';

  @override
  String get ubuntuProDisablePrompt =>
      'Menonaktifkan Ubuntu Pro akan melepaskan langganan Anda dari mesin ini. Apakah Anda ingin melanjutkan?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Aktifkan';

  @override
  String get ubuntuProCancel => 'Batal';

  @override
  String get ubuntuProFeatureEnableError =>
      'Tidak dapat mengaktifkan fitur ini, silakan coba lagi.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Tidak dapat menonaktifkan fitur ini, silakan coba lagi.';

  @override
  String get ubuntuProCompliance => 'Kepatuhan dan pengerasan';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Hanya disarankan untuk membantu persyaratan kepatuhan dan pengerasan FedRAMP, HIPAA, dan lainnya.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Mengotomatiskan pengerasan dan audit dengan profil tolok ukur CIS dan DISA-STIG sekaligus memungkinkan penyesuaian khusus lingkungan.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Sertifikasi kepatuhan modul kriptografi pemerintah AS dan Kanada terhadap standar perlindungan data FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Aktifkan FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Mengaktifkan FIPS tidak dapat dibatalkan dan Livepatch akan dinonaktifkan secara permanen.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Pilih opsi FIPS yang Anda inginkan';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS dengan pembaruan';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Memasang paket tervalidasi FIPS 140-2 dan mengizinkan pembaruan keamanan rutin.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS tanpa pembaruan';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Memasang paket tervalidasi FIPS 140-2. Paket ini tidak akan diperbarui hingga sertifikasi ulang berikutnya.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentasi kepatuhan keamanan';

  @override
  String get ubuntuProESMTitle => 'Pemeliharaan Keamanan yang Diperluas (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM menyediakan 10 tahun patch keamanan untuk seluruh Arsip Ubuntu. Dapatkan manajemen kerentanan berkelanjutan untuk CVE kritis, tinggi, dan menengah yang dipilih.';

  @override
  String get ubuntuProESMMainTitle => 'Paket utama (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Pembaruan keamanan untuk paket Ubuntu Main hingga $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paket universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Pembaruan keamanan tambahan untuk paket Ubuntu Universe hingga $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Aktifkan Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Terapkan pembaruan keamanan kernel saat sistem berjalan';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Tampilkan status Livepatch di bilah atas';
}
