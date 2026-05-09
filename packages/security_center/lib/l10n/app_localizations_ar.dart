// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'مركز الأمان';

  @override
  String get snapdRuleCategorySessionAllowed => 'السماح حتى تسجيل الخروج';

  @override
  String get snapdRuleCategorySessionDenied => 'رفض حتى تسجيل الخروج';

  @override
  String get snapdRuleCategoryForeverAllowed => 'السماح دائما';

  @override
  String get snapdRuleCategoryForeverDenied => 'الرفض دائما';

  @override
  String get snapPermissionReadLabel => 'قراءة';

  @override
  String get snapPermissionWriteLabel => 'كتابة';

  @override
  String get snapPermissionExecuteLabel => 'تنفيذ';

  @override
  String get snapPermissionAccessLabel => 'Access';

  @override
  String get snapPermissionsEnableTitle =>
      'يتطلب من التطبيقات طلب أذونات النظام';

  @override
  String get snapPermissionsEnableWarning =>
      'هذه ميزة تجريبية للتحكم في الوصول إلى موارد نظامك.';

  @override
  String get snapPermissionsEnablingLabel =>
      'جاري التفعيل، قد يستغرق الأمر بضع ثوانٍ...';

  @override
  String get snapPermissionsDisablingLabel =>
      'جاري التعطيل، قد يستغرق الأمر بضع ثوانٍ...';

  @override
  String get snapPermissionsExperimentalLabel => 'تجريبي';

  @override
  String get snapPermissionsOtherDescription =>
      'يمكنك إدارة الأذونات الأخرى في الإعدادات › التطبيقات.';

  @override
  String get snapPermissionsPageTitle => 'أذونات التطبيق';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n قواعد',
      one: 'قاعدة واحدة',
      zero: 'لا توجد قواعد',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'إدارة أذونات $interface لـ $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'لا توجد قواعد حتى الآن';

  @override
  String get cameraRulesPageEmptyTileLabel => 'No apps requested access yet';

  @override
  String get snapRulesRemoveAll => 'إزالة جميع القواعد';

  @override
  String get snapRulesResetAllPermissions => 'Reset all permissions';

  @override
  String get homeInterfacePageTitle => 'المجلد الرئيسي';

  @override
  String get homeInterfacePageDescription =>
      'إدارة الأذونات للوصول إلى الملفات الموجودة في المجلد الرئيسي الخاص بك.';

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
  String get interfacePageTitle => 'إدارة الأذونات';

  @override
  String get interfacePageDescription =>
      'ستطلب منك التطبيقات ذات القيود الصارمة قبل الوصول إلى الملفات والمجلدات. هذه الميزة تجريبية وقابلة للتغيير.';

  @override
  String get interfacePageLinkLearnMore => 'التعرف على المزيد';

  @override
  String get interfacePageLinkGiveFeedback => 'تقديم ملاحظات';

  @override
  String get interfacePageLinkReportIssues => 'الإبلاغ عن المشكلات';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n تطبيقات',
      one: 'تطبيق واحد',
      zero: 'لا توجد تطبيقات',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'تشفير القرص';

  @override
  String get diskEncryptionPageRecoveryKey => 'مفتاح الاسترداد';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'يتيح لك مفتاح الاسترداد استعادة الوصول إلى بياناتك في حال تعذّر فتح القرص أثناء بدء التشغيل. احفظه في مكان آمن.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'يتيح لك مفتاح الاسترداد استعادة الوصول إلى بياناتك في حال تعذّر فتح القرص أثناء بدء التشغيل. احفظه في مكان آمن. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'تعرف على المزيد حول مفاتيح الاسترداد';

  @override
  String get diskEncryptionPageCheckKey => 'التحقق من مفتاح الاسترداد...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'التحقق من مفتاح الاسترداد';

  @override
  String get diskEncryptionPageCheck => 'فحص';

  @override
  String get diskEncryptionPageValidKey => 'مفتاح صالح';

  @override
  String get diskEncryptionPageInvalidKey => 'مفتاح غير صالح';

  @override
  String get diskEncryptionPageEnterKey => 'أدخل مفتاح الاسترداد الخاص بك';

  @override
  String get diskEncryptionPageKeyWorks => 'مفتاح الاسترداد يعمل';

  @override
  String get diskEncryptionPageKeyWorksBody => 'تذكر أن تحتفظ به في مكان آمن.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'مفتاح الاسترداد لا يعمل';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'تحقق من المفتاح أو استبدله بمفتاح جديد.';

  @override
  String get diskEncryptionPageError => 'خطأ';

  @override
  String get diskEncryptionPageReplaceButton => 'استبدال مفتاح الاسترداد...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'استبدال مفتاح الاسترداد';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'احفظ مفتاح الاسترداد الجديد في مكان آمن. بمجرد استبداله ، لن تتمكن من استخدام المفتاح القديم بعد الآن.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR =>
      'إظهار رمز الاستجابة السريعة';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'حفظ في الملف';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'لقد حفظت مفتاح الاسترداد الخاص بي في مكان آمن';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'استبدال';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'تجاهل';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'تم استبدال مفتاح الاسترداد';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'تذكر أن تحتفظ به في مكان آمن.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'فشل استبدال مفتاح الاسترداد';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'حدث خطأ ما عند استبدال مفتاح الاسترداد الخاص بك ، سيظل مفتاحك القديم صالحًا.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'سطح مكتب أوبونتو - مفتاح استرداد التشفير';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'امسح رمز الاستجابة السريعة لنسخ مفتاح الاسترداد وحفظه في مكان آمن، مثل مدير كلمات المرور. يمكنك أيضًا التقاط صورة لاستخدامها لاحقًا.';

  @override
  String get diskEncryptionPageClipboardNotification => 'تم نسخها إلى الحافظة';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'نسخ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'إعدادات التشفير غير متوفرة';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'فشل استرداد حالة التشفير لهذا الكمبيوتر.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'تكوين TPM للكمبيوتر الخاص بك ليس في حالة مدعومة.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'إصدار snapd الخاص بك غير مدعوم';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'تأكد من تحديث مركز الأمان و snapd.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'لم يتمكن مركز الأمان من الاتصال بواجهة snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'لإصلاح هذه المشكلة، قم بتشغيل هذا الأمر في الطرفية:';

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
      'لم يتم حفظ ملف مفتاح الاسترداد';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'لا يمكن حفظ ملف مفتاح الاسترداد في موقع مؤقت';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'خطأ غير معروف';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'فشل في حفظ مفتاح الاسترداد الخاص بك في الملف';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'ليس لديك إذن للكتابة إلى موقع الملف هذا.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'ليس لديك إذن للكتابة إلى هذا المجلد. جرب موقعا مختلفا أو استخدم طريقة أخرى.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'حاول استخدام موقع مختلف، مثل محرك أقراص قابل للإزالة، أو استخدم طريقة أخرى.';

  @override
  String get recoveryKeyFilePickerTitle => 'حفظ ملف مفتاح الاسترداد';

  @override
  String get recoveryKeyFilePickerFilter => 'ملفات نصية';

  @override
  String get recoveryKeyTPMEnabled => 'تم تمكين التشفير المدعوم بالأجهزة';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'يتم تخزين مفاتيح التشفير في وحدة النظام الأساسي الموثوق بها (TPM) الموجودة على جهاز الكمبيوتر الخاص بك.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'تعرف على المزيد حول التشفير المدعوم بالأجهزة';

  @override
  String get recoveryKeyPassphraseEnabled => 'تم تمكين عبارة مرور التشفير';

  @override
  String get recoveryKeyPassphraseHeader => 'تغيير عبارة المرور';

  @override
  String get recoveryKeyPassphraseBody =>
      'تحتاج إلى إدخال عبارة المرور الخاصة بك أثناء بدء التشغيل لإلغاء قفل القرص. يمكنك تغيير عبارة المرور ولكن لا يمكنك تعطيلها.';

  @override
  String get recoveryKeyPassphraseButton => 'تغيير عبارة المرور...';

  @override
  String get recoveryKeyPassphraseCurrent => 'عبارة المرور الحالية';

  @override
  String get recoveryKeyPassphraseNew => 'عبارة مرور جديدة';

  @override
  String get recoveryKeyPassphraseConfirm => 'تأكيد عبارة المرور';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'عبارة مرور غير صحيحة، حاول مرة أخرى';

  @override
  String get recoveryKeyPassphraseNewError =>
      'يجب أن يكون طوله 4 أحرف على الأقل';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'عبارات المرور غير متطابقة، حاول مرة أخرى';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'تغيير عبارة المرور';

  @override
  String get recoveryKeyPinEnabled => 'تم تمكين رقم التعريف الشخصي للتشفير';

  @override
  String get recoveryKeyPinHeader => 'رقم التعريف الشخصي للتشفير';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'عبارة مرور التشفير';

  @override
  String get recoveryKeyPinBody =>
      'يجب إدخال رقم التعريف الشخصي (PIN) أثناء بدء التشغيل لفتح قفل القرص. يمكنك تغيير رقم التعريف الشخصي (PIN) ولكن لا يمكنك تعطيله.';

  @override
  String get recoveryKeyPinButton => 'تغيير رقم التعريف الشخصي...';

  @override
  String get recoveryKeyPinCurrent => 'رقم التعريف الشخصي الحالي';

  @override
  String get recoveryKeyPinNew => 'رقم التعريف الشخصي الجديد';

  @override
  String get recoveryKeyPinConfirm => 'تأكيد رقم التعريف الشخصي';

  @override
  String get recoveryKeyPinCurrentError =>
      'رقم التعريف الشخصي غير صحيح، حاول مرة أخرى';

  @override
  String get recoveryKeyPinConfirmError =>
      'أرقام التعريف الشخصية غير متطابقة، حاول مرة أخرى';

  @override
  String get recoveryKeyPinDialogHeader => 'تغيير رقم التعريف الشخصي';

  @override
  String get recoveryKeyPassphraseShow => 'عرض';

  @override
  String get recoveryKeyPassphraseHide => 'أخفى';

  @override
  String get recoveryKeyPassphraseChange => 'تغيير';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader =>
      'تم تحديث رقم التعريف الشخصي';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'تم تحديث رقم التعريف الشخصي الخاص بك بنجاح.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'تم تحديث عبارة المرور';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'تم تحديث عبارة المرور الخاصة بك بنجاح.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'عبارة مرور ضعيفة ، اجعلها أطول أو أكثر تعقيدا';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'عبارة مرور عادية ، اجعلها أطول أو أكثر تعقيدا لتحسين الأمان';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'عبارة مرور قوية';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'رقم تعريف شخصي ضعيف ، اجعله أطول أو أقل قابلية للتنبؤ به';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'رقم تعريف شخصي عادي ، اجعله أطول أو أقل قابلية للتنبؤ به للحصول على أمان أفضل';

  @override
  String get recoveryKeyPinEntropyOptimal =>
      'رقم التعريف الشخصي طويل بما فيه الكفاية';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'حدث خطأ ما';

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
      'ESM provides 10 years of security patches for the entire Ubuntu Archive. Get continuous vulnerability management for critical, high and selected medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for Ubuntu Main packages until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for Ubuntu Universe packages until $year';
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
