// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Güvenlik Merkezi';

  @override
  String get snapdRuleCategorySessionAllowed => 'Çıkış yapana kadar izin ver';

  @override
  String get snapdRuleCategorySessionDenied => 'Çıkış yapana kadar reddet';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Her zaman izin ver';

  @override
  String get snapdRuleCategoryForeverDenied => 'Her zaman reddet';

  @override
  String get snapPermissionReadLabel => 'Oku';

  @override
  String get snapPermissionWriteLabel => 'Yaz';

  @override
  String get snapPermissionExecuteLabel => 'Çalıştır';

  @override
  String get snapPermissionAccessLabel => 'Access';

  @override
  String get snapPermissionsEnableTitle =>
      'Uygulamaların sistem izinleri istemesini zorunlu kılın';

  @override
  String get snapPermissionsEnableWarning =>
      'Bu, sisteminizin kaynaklarına erişimi kontrol etmeye yönelik deneysel bir özelliktir.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Etkinleştiriliyor, birkaç saniye sürebilir…';

  @override
  String get snapPermissionsDisablingLabel =>
      'Devre dışı bırakılıyor, birkaç saniye sürebilir…';

  @override
  String get snapPermissionsExperimentalLabel => 'Deneysel';

  @override
  String get snapPermissionsOtherDescription =>
      'Diğer izinleri Ayarlar › Uygulamalar bölümünden yönetebilirsiniz.';

  @override
  String get snapPermissionsPageTitle => 'Uygulama İzinleri';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kurallar',
      one: '1 kural',
      zero: 'kural yok',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snap için $interface izinlerini yönetin.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Henüz kural yok';

  @override
  String get cameraRulesPageEmptyTileLabel => 'No apps requested access yet';

  @override
  String get snapRulesRemoveAll => 'Tüm kuralları kaldır';

  @override
  String get snapRulesResetAllPermissions => 'Reset all permissions';

  @override
  String get homeInterfacePageTitle => 'Ev klasörü';

  @override
  String get homeInterfacePageDescription =>
      'Ev klasöründeki dosyalara erişim izinlerini yönetin.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Allow apps to access your cameras.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Uygulamaların mikrofonunuza erişmesine izin verin.';

  @override
  String get interfacePageTitle => 'İzinleri yönet';

  @override
  String get interfacePageDescription =>
      'Sıkı kısıtlamalara tabi uygulamalar, dosya ve klasörlere erişmeden önce sizden izin isteyecektir. Bu özellik deneyseldir ve değişikliklere tabidir.';

  @override
  String get interfacePageLinkLearnMore => 'Daha fazla bilgi edin';

  @override
  String get interfacePageLinkGiveFeedback => 'Geri bildirimde bulunun';

  @override
  String get interfacePageLinkReportIssues => 'Sorunları bildirin';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n uygulama',
      one: '1 uygulama',
      zero: 'uygulama yok',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Şifreleme';

  @override
  String get diskEncryptionPageRecoveryKey => 'Kurtarma anahtarı';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Kurtarma anahtarı, başlatma sırasında diskinizin kilidi açılmazsa verilerinize yeniden erişmenizi sağlar. Anahtarı güvenli bir yere kaydedin.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'The recovery key lets you regain access to your data if the disk fails to unlock during startup. Save it somewhere safe. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Kurtarma anahtarları hakkında daha fazla bilgi edinin';

  @override
  String get diskEncryptionPageCheckKey =>
      'Kurtarma anahtarını kontrol edin...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Kurtarma Anahtarını Kontrol Edin';

  @override
  String get diskEncryptionPageCheck => 'Kontrol et';

  @override
  String get diskEncryptionPageValidKey => 'Geçerli anahtar';

  @override
  String get diskEncryptionPageInvalidKey => 'Geçersiz anahtar';

  @override
  String get diskEncryptionPageEnterKey => 'Kurtarma anahtarını girin';

  @override
  String get diskEncryptionPageKeyWorks => 'Kurtarma anahtarı çalışan';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Bunu güvenli bir yerde saklamayı unutmayın.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Kurtarma anahtarı çalışmıyor';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Anahtarı kontrol edin veya yenisiyle değiştirin.';

  @override
  String get diskEncryptionPageError => 'Hata';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Kurtarma anahtarını değiştir...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Kurtarma anahtarını değiştir';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Yeni kurtarma anahtarını güvenli bir yere saklayın. Değiştirdikten sonra eski anahtarı artık kullanamayacaksınız.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR kodunu göster';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Dosyaya kaydet';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Kurtarma anahtarımı güvenli bir yere kaydettim';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Değiştir';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'At';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Kurtarma anahtarı değiştirildi';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Bunu güvenli bir yerde saklamayı unutmayın.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Kurtarma anahtarı değişimi başarısız oldu';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Kurtarma anahtarınızı yerleştirirken bir sorun oluştu, eski anahtarınız geçerli kalacaktır.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Masaüstü - Şifreleme kurtarma anahtarı';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Kurtarma anahtarını kopyalamak ve şifre yöneticisi gibi güvenli bir yere kaydetmek için QR kodunu tarayın. Ayrıca daha sonra kullanmak üzere fotoğrafını da çekebilirsiniz.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Panoya kopyalandı';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopyala';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Şifreleme ayarları mevcut değil';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Failed to retrieve the encryption status of this computer.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Bilgisayarınızın TPM yapılandırması desteklemiyor.';

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
  String get diskEncryptionPageAddPinButton => 'PIN ekle...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Parola ekle...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Parola ekle';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PIN ekle';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Bilgisayarınız her başlatıldığında PIN kodunuzu girmeniz gerekecektir. Bu PIN kodu, kullanıcı parolanızdan farklıdır.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'PIN kodunuzu unutursanız, kurtarma anahtarını kullanarak diske tekrar erişim sağlayabilirsiniz.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'You will need to enter your passphrase every time your computer starts. This passphrase is different from your user password.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'If you forget your passphrase, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'İlave güvenlik';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'You can set a passphrase or a PIN for additional security. You will need to enter it every time your computer starts.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'daha fazla bilgi edin';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Ekle';

  @override
  String get diskEncryptionPageRemovePinButton => 'PIN\'i kaldır...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Parolayı kaldır...';

  @override
  String get diskEncryptionPageAddingPin =>
      'PIN ekleme, bu işlem birkaç saniye sürebilir...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Parola ekleme, bu işlem birkaç saniye sürebilir...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PIN kaldırma, bu işlem birkaç saniye sürebilir...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Parola kaldırma, bu işlem birkaç saniye sürebilir...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Kurtarma anahtarı dosyası kaydedilmedi';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Kurtarma anahtarı dosyası geçici bir konuma kaydedilemez';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Bilinmeyen hata';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Kurtarma anahtarınızı dosyaya kaydetme işlemi başarısız oldu';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Bu dosya konumuna yazma izniniz yok.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Bu klasöre yazma izniniz yok. Farklı bir konum deneyin veya başka bir yöntem kullanın.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Çıkarılabilir bir sürücü gibi farklı bir konum deneyin veya başka bir yöntem kullanın.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Kurtarma anahtarı dosyasını kaydedin';

  @override
  String get recoveryKeyFilePickerFilter => 'Metin dosyaları';

  @override
  String get recoveryKeyTPMEnabled =>
      'Donanım destekli şifreleme etkinleştirildi';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Şifreleme parolası etkinleştirildi';

  @override
  String get recoveryKeyPassphraseHeader => 'Parolayı değiştir';

  @override
  String get recoveryKeyPassphraseBody =>
      'Diskin kilidini açmak için başlatma sırasında parolanızı girmeniz gerekir. Parolayı değiştirebilirsiniz ancak devre dışı bırakamazsınız.';

  @override
  String get recoveryKeyPassphraseButton => 'Şifreyi değiştir...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Mevcut parola';

  @override
  String get recoveryKeyPassphraseNew => 'Yeni parola';

  @override
  String get recoveryKeyPassphraseConfirm => 'Parolayı onayla';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Yanlış parola, tekrar deneyin';

  @override
  String get recoveryKeyPassphraseNewError =>
      'En az 4 karakter uzunluğunda olmalı';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Parolalar eşleşmiyor, tekrar deneyin';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Parolayı Değiştir';

  @override
  String get recoveryKeyPinEnabled => 'Şifreleme PIN\'i etkinleştirildi';

  @override
  String get recoveryKeyPinHeader => 'Şifreleme PIN\'i';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Şifreleme parolası';

  @override
  String get recoveryKeyPinBody =>
      'Diskin kilidini açmak için başlatma sırasında PIN kodunuzu girmeniz gerekir. PIN kodunu değiştirebilirsiniz ancak devre dışı bırakamazsınız.';

  @override
  String get recoveryKeyPinButton => 'PIN\'i değiştir...';

  @override
  String get recoveryKeyPinCurrent => 'Mevcut PIN';

  @override
  String get recoveryKeyPinNew => 'Yeni PIN';

  @override
  String get recoveryKeyPinConfirm => 'PIN\'i onayla';

  @override
  String get recoveryKeyPinCurrentError => 'PIN hatalı, tekrar deneyin';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN\'ler eşleşmiyor, tekrar deneyin';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN\'i değiştir';

  @override
  String get recoveryKeyPassphraseShow => 'Göster';

  @override
  String get recoveryKeyPassphraseHide => 'Gizle';

  @override
  String get recoveryKeyPassphraseChange => 'Değiştir';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN güncellendi';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'PIN kodunuz başarıyla güncellendi.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Parola güncellendi';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Parolanız başarıyla güncellendi.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Zayıf parola cümlesi, daha uzun veya daha karmaşık hale getirin';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Güçlü bir parola kullanın, daha iyi güvenlik için daha uzun veya daha karmaşık hale getirin';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Güçlü parola';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Zayıf PIN, daha uzun veya daha az tahmin edilebilir hale getirin';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Güçlü PIN kullanın, daha iyi güvenlik için daha uzun veya daha az tahmin edilebilir hale getirin';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN yeterince uzun';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Bir şeyler ters gitti';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro bu Ubuntu sürümü için mevcut değil';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro için LTS sürümü gereklidir';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro is not supported by this snapd version';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Update snapd to manage Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro etkinleştirildi';

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
