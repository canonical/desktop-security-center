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
  String get snapPermissionAccessLabel => 'Akses';

  @override
  String get snapPermissionsEnableTitle =>
      'Membutuhkan aplikasi untuk meminta izin sistem';

  @override
  String get snapPermissionsEnableWarning =>
      'Ini adalah fitur eksperimental untuk mengendalikan akses ke sumber daya sistem Anda.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Memfungsikan, itu mungkin perlu waktu beberapa detik ...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Menonaktifkan, itu mungkin perlu waktu beberapa detik ...';

  @override
  String get snapPermissionsExperimentalLabel => 'Eksperimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Anda dapat mengelola izin lain dalam Pengaturan › Aplikasi.';

  @override
  String get snapPermissionsPageTitle => 'Izin Aplikasi';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get homeInterfacePageTitle => 'Folder rumah';

  @override
  String get homeInterfacePageDescription =>
      'Kelola izin untuk mengakses berkas di folder Rumah Anda.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Izinkan aplikasi untuk mengakses kamera Anda.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'Kelola izin';

  @override
  String get interfacePageDescription =>
      'Aplikasi yang ketat dibatasi akan bertanya sebelum mengakses berkas dan folder. Fitur ini eksperimen dan mungkin berubah.';

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
  String get diskEncryptionPageTitle => 'Enkripsi Disk';

  @override
  String get diskEncryptionPageRecoveryKey => 'Kunci pemulihan';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Kunci pemulihan memungkinkan Anda mendapatkan akses ke data Anda jika disk Anda gagal untuk dibuka kuncinya selama awal mula. Simpan di suatu tempat aman.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Kunci pemulihan memungkinkan Anda mendapatkan kembali akses ke data Anda jika disk Anda gagal dibuka saat startup. Simpan di tempat yang aman. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Pelajari lebih lanjut tentang kunci pemulihan';

  @override
  String get diskEncryptionPageCheckKey => 'Periksa kunci pemulihan...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Periksa Kunci Pemulihan';

  @override
  String get diskEncryptionPageCheck => 'Periksa';

  @override
  String get diskEncryptionPageValidKey => 'Kunci yang valid';

  @override
  String get diskEncryptionPageInvalidKey => 'Kunci tidak valid';

  @override
  String get diskEncryptionPageEnterKey => 'Masukkan kunci pemulihan Anda';

  @override
  String get diskEncryptionPageKeyWorks => 'Kunci pemulihan bekerja';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ingat untuk menjaganya di suatu tempat aman.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Kunci pemulihan tidak bekerja';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Periksa kunci atau menggantinya dengan yang baru.';

  @override
  String get diskEncryptionPageError => 'Galat';

  @override
  String get diskEncryptionPageReplaceButton => 'Mengganti kunci pemulihan ...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Mengganti kunci pemulihan';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Simpan kunci pemulihan baru di suatu tempat aman. Sekali Anda menggantinya, Anda tidak akan dapat menggunakan kunci lama lagi.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Tampilkan kode QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Simpan ke berkas';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Saya menyimpan kunci pemulihan saya di suatu tempat aman';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Gantikan';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Singkirkan';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Kunci pemulihan diganti';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Ingatlah untuk menyimpannya di tempat yang aman.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Penggantian kunci pemulihan gagal';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Terjadi kesalahan saat mengganti kunci pemulihan Anda, kunci lama Anda akan tetap berlaku.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Desktop Ubuntu - Kunci pemulihan enkripsi';

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
      'Konfigurasi TPM komputer Anda tidak dalam kondisi yang didukung.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Versi snapd Anda tidak didukung';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Periksa Pusat Keamanan dan snapd apakah mutakhir.';

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
      'Berkas kunci pemulihan tidak disimpan';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Berkas kunci pemulihan tidak dapat disimpan di lokasi sementara';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Galat tak dikenal';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Gagal menyimpan kunci pemulihan Anda ke berkas';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Anda tidak memiliki izin untuk menulis ke lokasi berkas tersebut.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Anda tidak memiliki izin untuk menulis ke folder tersebut. Coba lokasi lain atau gunakan metode lain.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Cobalah lokasi lain, seperti drive lepas pasang, atau gunakan metode lain.';

  @override
  String get recoveryKeyFilePickerTitle => 'Simpan berkas kunci pemulihan';

  @override
  String get recoveryKeyFilePickerFilter => 'Berkas teks';

  @override
  String get recoveryKeyTPMEnabled =>
      'Enkripsi yang didukung perangkat keras diaktifkan';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Kunci enkripsi disimpan dalam Trusted Platform Module (TPM) komputer Anda.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Pelajari lebih lanjut tentang enkripsi yang didukung perangkat keras';

  @override
  String get recoveryKeyPassphraseEnabled => 'Frasa sandi enkripsi diaktifkan';

  @override
  String get recoveryKeyPassphraseHeader => 'Ubah frasa sandi';

  @override
  String get recoveryKeyPassphraseBody =>
      'Anda perlu memasukkan kata sandi saat memulai untuk membuka kunci disk. Anda dapat mengubah kata sandi, tetapi tidak dapat menonaktifkannya.';

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
  String get recoveryKeyPassphraseNewError =>
      'Harus minimal 4 karakter panjangnya';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Frasa sandi tidak cocok, coba lagi';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Ubah Frasa Sandi';

  @override
  String get recoveryKeyPinEnabled => 'PIN enkripsi diaktifkan';

  @override
  String get recoveryKeyPinHeader => 'PIN Enkripsi';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Frasa sandi enkripsi';

  @override
  String get recoveryKeyPinBody =>
      'Anda perlu memasukkan PIN saat memulai untuk membuka kunci disk. Anda dapat mengubah PIN, tetapi tidak dapat menonaktifkannya.';

  @override
  String get recoveryKeyPinButton => 'Ubah PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN kini';

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
      'Frasa sandi lemah, jadikan lebih panjang atau lebih rumit';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Frasa sandi yang lumayan, jadikan lebih panjang atau lebih rumit untuk keamanan yang lebih baik';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Frasa sandi yang kuat';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN lemah, jadikan lebih panjang atau lebih sulit ditebak';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN yang lumayan, jadikan lebih panjang atau lebih sulit ditebak untuk keamanan yang lebih baik';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN cukup panjang';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Ada yang salah';

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
