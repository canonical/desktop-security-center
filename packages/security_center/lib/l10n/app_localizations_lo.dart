// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AppLocalizationsLo extends AppLocalizations {
  AppLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get appTitle => 'ສູນຄວາມປອດໄພ';

  @override
  String get snapdRuleCategorySessionAllowed => 'ອະນຸຍາດຈົນກວ່າຈະອອກຈາກລະບົບ';

  @override
  String get snapdRuleCategorySessionDenied => 'ປະຕິເສດຈົນກວ່າຈະອອກຈາກລະບົບ';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ອະນຸຍາດຕະຫຼອດ';

  @override
  String get snapdRuleCategoryForeverDenied => 'ປະຕິເສດຕະຫຼອດ';

  @override
  String get snapPermissionReadLabel => 'ອ່ານ';

  @override
  String get snapPermissionWriteLabel => 'ຂຽນ';

  @override
  String get snapPermissionExecuteLabel => 'ດຳເນີນການ';

  @override
  String get snapPermissionAccessLabel => 'ເຂົ້າເຖິງ';

  @override
  String get snapPermissionsEnableTitle =>
      'ບັງຄັບໃຫ້ແອັບຂໍອະນຸຍາດເຂົ້າເຖິງລະບົບ';

  @override
  String get snapPermissionsEnableWarning =>
      'ນີ້ແມ່ນຟີເຈີທົດລອງສຳລັບການຄວບຄຸມການເຂົ້າເຖິງຊັບພະຍາກອນຂອງລະບົບ.';

  @override
  String get snapPermissionsEnablingLabel =>
      'ກຳລັງເປີດໃຊ້ງານ, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get snapPermissionsDisablingLabel =>
      'ກຳລັງປິດໃຊ້ງານ, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get snapPermissionsExperimentalLabel => 'ທົດລອງ';

  @override
  String get snapPermissionsOtherDescription =>
      'ທ່ານສາມາດຈັດການການອະນຸຍາດອື່ນໆໄດ້ໃນ ການຕັ້ງຄ່າ › ແອັບພລິເຄຊັນ.';

  @override
  String get snapPermissionsPageTitle => 'ການອະນຸຍາດແອັບ';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ກົດ',
      one: '1 ກົດ',
      zero: 'ບໍ່ມີກົດ',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'ຈັດການການອະນຸຍາດ $interface ສຳລັບ $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ຍັງບໍ່ມີກົດເທື່ອ';

  @override
  String get cameraRulesPageEmptyTileLabel => 'ຍັງບໍ່ມີແອັບໃດຂໍເຂົ້າເຖິງເທື່ອ';

  @override
  String get snapRulesRemoveAll => 'ລຶບກົດທັງໝົດ';

  @override
  String get snapRulesResetAllPermissions => 'ຣີເຊັດການອະນຸຍາດທັງໝົດ';

  @override
  String get homeInterfacePageTitle => 'ໂຟນເດີຫຼັກ';

  @override
  String get homeInterfacePageDescription =>
      'ຈັດການການອະນຸຍາດເພື່ອເຂົ້າເຖິງໄຟລ໌ໃນໂຟນເດີຫຼັກຂອງທ່ານ.';

  @override
  String get cameraInterfacePageTitle => 'ກ້ອງ';

  @override
  String get cameraInterfacePageDescription =>
      'ອະນຸຍາດໃຫ້ແອັບເຂົ້າເຖິງກ້ອງຂອງທ່ານ.';

  @override
  String get microphoneInterfacePageTitle => 'ໄມໂຄຣໂຟນ';

  @override
  String get microphoneInterfacePageDescription =>
      'ອະນຸຍາດໃຫ້ແອັບເຂົ້າເຖິງໄມໂຄຣໂຟນຂອງທ່ານ.';

  @override
  String get interfacePageTitle => 'ຈັດການການອະນຸຍາດ';

  @override
  String get interfacePageDescription =>
      'ແອັບທີ່ຖືກຈຳກັດຢ່າງເຂັ້ມງວດຈະຖາມທ່ານກ່ອນເຂົ້າເຖິງໄຟລ໌ ແລະ ໂຟນເດີ. ຟີເຈີນີ້ແມ່ນຢູ່ໃນຂັ້ນທົດລອງ ແລະ ອາດມີການປ່ຽນແປງ.';

  @override
  String get interfacePageLinkLearnMore => 'ຮຽນຮູ້ເພີ່ມເຕີມ';

  @override
  String get interfacePageLinkGiveFeedback => 'ໃຫ້ຄຳຕິຊົມ';

  @override
  String get interfacePageLinkReportIssues => 'ລາຍງານບັນຫາ';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ແອັບ',
      one: '1 ແອັບ',
      zero: 'ບໍ່ມີແອັບ',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'ການເຂົ້າລະຫັດດິດ';

  @override
  String get diskEncryptionPageRecoveryKey => 'ຄີກູ້ຄືນ';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'ຄີກູ້ຄືນຊ່ວຍໃຫ້ທ່ານກັບມາເຂົ້າເຖິງຂໍ້ມູນຂອງທ່ານໄດ້ ຫາກດິດຂອງທ່ານປົດລັອກບໍ່ໄດ້ໃນລະຫວ່າງການເປີດເຄື່ອງ. ໃຫ້ບັນທຶກມັນໄວ້ໃນບ່ອນທີ່ປອດໄພ.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'ຄີກູ້ຄືນຊ່ວຍໃຫ້ທ່ານກັບມາເຂົ້າເຖິງຂໍ້ມູນຂອງທ່ານໄດ້ ຫາກດິດຂອງທ່ານປົດລັອກບໍ່ໄດ້ໃນລະຫວ່າງການເປີດເຄື່ອງ. ໃຫ້ບັນທຶກມັນໄວ້ໃນບ່ອນທີ່ປອດໄພ. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'ຮຽນຮູ້ເພີ່ມເຕີມກ່ຽວກັບການເຂົ້າລະຫັດດ້ວຍຮາດແວ';

  @override
  String get diskEncryptionPageCheckKey => 'ກວດສອບຄີກູ້ຄືນ...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'ກວດສອບຄີກູ້ຄືນ';

  @override
  String get diskEncryptionPageCheck => 'ກວດສອບ';

  @override
  String get diskEncryptionPageValidKey => 'ຄີຖືກຕ້ອງ';

  @override
  String get diskEncryptionPageInvalidKey => 'ຄີບໍ່ຖືກຕ້ອງ';

  @override
  String get diskEncryptionPageEnterKey => 'ປ້ອນຄີກູ້ຄືນຂອງທ່ານ';

  @override
  String get diskEncryptionPageKeyWorks => 'ຄີກູ້ຄືນໃຊ້ງານໄດ້';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'ຢ່າລືມເກັບຮັກສາມັນໄວ້ໃນບ່ອນທີ່ປອດໄພ.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'ຄີກູ້ຄືນໃຊ້ງານບໍ່ໄດ້';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'ກວດສອບຄີ ຫຼື ປ່ຽນແທນດ້ວຍຄີໃໝ່.';

  @override
  String get diskEncryptionPageError => 'ຜິດພາດ';

  @override
  String get diskEncryptionPageReplaceButton => 'ປ່ຽນແທນຄີກູ້ຄືນ...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'ປ່ຽນແທນຄີກູ້ຄືນ';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'ບັນທຶກຄີກູ້ຄືນໃໝ່ໄວ້ໃນບ່ອນທີ່ປອດໄພ. ເມື່ອທ່ານປ່ຽນແທນມັນແລ້ວ, ທ່ານຈະບໍ່ສາມາດໃຊ້ຄີເກົ່າໄດ້ອີກຕໍ່ໄປ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'ສະແດງ QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'ບັນທຶກລົງໄຟລ໌';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'ຂ້ອຍໄດ້ບັນທຶກຄີກູ້ຄືນໄວ້ໃນບ່ອນທີ່ປອດໄພແລ້ວ';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'ປ່ຽນແທນ';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'ຍົກເລີກ';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'ປ່ຽນແທນຄີກູ້ຄືນສຳເລັດແລ້ວ';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'ຢ່າລືມເກັບຮັກສາມັນໄວ້ໃນບ່ອນທີ່ປອດໄພ.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'ການປ່ຽນແທນຄີກູ້ຄືນລົ້ມເຫຼວ';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'ເກີດຂໍ້ຜິດພາດບາງຢ່າງຂະນະປ່ຽນແທນຄີກູ້ຄືນຂອງທ່ານ, ຄີເກົ່າຂອງທ່ານຈະຍັງໃຊ້ໄດ້ຄືເກົ່າ.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - ຄີກູ້ຄືນການເຂົ້າລະຫັດ';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'ສະແກນ QR code ເພື່ອສຳເນົາຄີກູ້ຄືນ ແລະ ບັນທຶກໄວ້ໃນບ່ອນທີ່ປອດໄພ, ເຊັ່ນ: ຕົວຈັດການລະຫັດຜ່ານ. ທ່ານຍັງສາມາດຖ່າຍຮູບໄວ້ເພື່ອໃຊ້ພາຍຫຼັງໄດ້.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'ສຳເນົາໄປທີ່ຄລິບບອດແລ້ວ';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'ສຳເນົາ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'ການຕັ້ງຄ່າການເຂົ້າລະຫັດບໍ່ພ້ອມໃຊ້ງານ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'ບໍ່ສາມາດດຶງສະຖານະການເຂົ້າລະຫັດຂອງຄອມພິວເຕີເຄື່ອງນີ້ໄດ້.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'ການຕັ້ງຄ່າ TPM ຂອງຄອມພິວເຕີຂອງທ່ານບໍ່ຢູ່ໃນສະຖານະທີ່ຮອງຮັບ.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'ບໍ່ຮອງຮັບ snapd ເວີຊັນຂອງທ່ານ';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'ກວດສອບໃຫ້ແນ່ໃຈວ່າ ສູນຄວາມປອດໄພ ແລະ snapd ເປັນເວີຊັນຫຼ້າສຸດ.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'ສູນຄວາມປອດໄພບໍ່ສາມາດເຊື່ອມຕໍ່ກັບ snapd interface ໄດ້';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'ເພື່ອແກ້ໄຂບັນຫານີ້, ໃຫ້ລັນຄຳສັ່ງນີ້ໃນ terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'ເພີ່ມ PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'ເພີ່ມວະລີຜ່ານ...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'ເພີ່ມວະລີຜ່ານ';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'ເພີ່ມ PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'ທ່ານຈຳເປັນຕ້ອງປ້ອນ PIN ຂອງທ່ານທຸກຄັ້ງທີ່ເປີດຄອມພິວເຕີ. PIN ນີ້ຈະຕ່າງຈາກລະຫັດຜ່ານຜູ້ໃຊ້ຂອງທ່ານ.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'ຫາກທ່ານລືມ PIN, ທ່ານສາມາດກັບມາເຂົ້າເຖິງດິດໄດ້ໂດຍການໃຊ້ຄີກູ້ຄືນ.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'ທ່ານຈຳເປັນຕ້ອງປ້ອນວະລີຜ່ານຂອງທ່ານທຸກຄັ້ງທີ່ເປີດຄອມພິວເຕີ. ວະລີຜ່ານນີ້ຈະຕ່າງຈາກລະຫັດຜ່ານຜູ້ໃຊ້ຂອງທ່ານ.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'ຫາກທ່ານລືມວະລີຜ່ານ, ທ່ານສາມາດກັບມາເຂົ້າເຖິງດິດໄດ້ໂດຍການໃຊ້ຄີກູ້ຄືນ.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'ຄວາມປອດໄພເພີ່ມເຕີມ';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'ທ່ານສາມາດຕັ້ງວະລີຜ່ານ ຫຼື PIN ເພື່ອຄວາມປອດໄພເພີ່ມເຕີມ. ທ່ານຈຳເປັນຕ້ອງປ້ອນມັນທຸກຄັ້ງທີ່ເປີດຄອມພິວເຕີ.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'ຮຽນຮູ້ເພີ່ມເຕີມ';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'ເພີ່ມ';

  @override
  String get diskEncryptionPageRemovePinButton => 'ລຶບ PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'ລຶບວະລີຜ່ານ...';

  @override
  String get diskEncryptionPageAddingPin =>
      'ກຳລັງເພີ່ມ PIN, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'ກຳລັງເພີ່ມວະລີຜ່ານ, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'ກຳລັງລຶບ PIN, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'ກຳລັງລຶບວະລີຜ່ານ, ອາດຈະໃຊ້ເວລາສອງສາມວິນາທີ...';

  @override
  String get recoveryKeyExceptionFileSystemTitle => 'ບໍ່ໄດ້ບັນທຶກໄຟລ໌ຄີກູ້ຄືນ';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'ບໍ່ສາມາດບັນທຶກໄຟລ໌ຄີກູ້ຄືນໃນບ່ອນຊົ່ວຄາວໄດ້';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'ຂໍ້ຜິດພາດທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'ບັນທຶກຄີກູ້ຄືນຂອງທ່ານລົງໄຟລ໌ບໍ່ສຳເລັດ';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'ທ່ານບໍ່ໄດ້ຮັບອະນຸຍາດໃຫ້ຂຽນລົງໃນທີ່ຕັ້ງໄຟລ໌ນັ້ນ.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'ທ່ານບໍ່ໄດ້ຮັບອະນຸຍາດໃຫ້ຂຽນລົງໃນໂຟນເດີນັ້ນ. ລອງປ່ຽນບ່ອນໃໝ່ ຫຼື ໃຊ້ອີກວິທີໜຶ່ງ.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'ລອງປ່ຽນບ່ອນໃໝ່, ເຊັ່ນ: ໄດຣຟ໌ທີ່ຖອດໄດ້, ຫຼື ໃຊ້ອີກວິທີໜຶ່ງ.';

  @override
  String get recoveryKeyFilePickerTitle => 'ບັນທຶກໄຟລ໌ຄີກູ້ຄືນ';

  @override
  String get recoveryKeyFilePickerFilter => 'ໄຟລ໌ຂໍ້ຄວາມ';

  @override
  String get recoveryKeyTPMEnabled => 'ເປີດໃຊ້ການເຂົ້າລະຫັດດ້ວຍຮາດແວແລ້ວ';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'ຄີການເຂົ້າລະຫັດຖືກເກັບໄວ້ໃນ Trusted Platform Module (TPM) ຂອງຄອມພິວເຕີຂອງທ່ານ.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'ຮຽນຮູ້ເພີ່ມເຕີມກ່ຽວກັບການເຂົ້າລະຫັດດ້ວຍຮາດແວ';

  @override
  String get recoveryKeyPassphraseEnabled => 'ເປີດໃຊ້ວະລີຜ່ານການເຂົ້າລະຫັດແລ້ວ';

  @override
  String get recoveryKeyPassphraseHeader => 'ປ່ຽນວະລີຜ່ານ';

  @override
  String get recoveryKeyPassphraseBody =>
      'ທ່ານຈຳເປັນຕ້ອງປ້ອນວະລີຜ່ານຂອງທ່ານທຸກຄັ້ງທີ່ເປີດຄອມພິວເຕີ.';

  @override
  String get recoveryKeyPassphraseButton => 'ປ່ຽນວະລີຜ່ານ...';

  @override
  String get recoveryKeyPassphraseCurrent => 'ວະລີຜ່ານປັດຈຸບັນ';

  @override
  String get recoveryKeyPassphraseNew => 'ວະລີຜ່ານໃໝ່';

  @override
  String get recoveryKeyPassphraseConfirm => 'ຢືນຢັນວະລີຜ່ານ';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'ວະລີຜ່ານບໍ່ຖືກຕ້ອງ, ລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get recoveryKeyPassphraseNewError => 'ຕ້ອງຍາວຢ່າງໜ້ອຍ 4 ຕົວອັກສອນ';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'ວະລີຜ່ານບໍ່ກົງກັນ, ລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'ປ່ຽນວະລີຜ່ານ';

  @override
  String get recoveryKeyPinEnabled => 'ເປີດໃຊ້ PIN ການເຂົ້າລະຫັດແລ້ວ';

  @override
  String get recoveryKeyPinHeader => 'PIN ການເຂົ້າລະຫັດ';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'ວະລີຜ່ານການເຂົ້າລະຫັດ';

  @override
  String get recoveryKeyPinBody =>
      'ທ່ານຈຳເປັນຕ້ອງປ້ອນ PIN ຂອງທ່ານທຸກຄັ້ງທີ່ເປີດຄອມພິວເຕີ.';

  @override
  String get recoveryKeyPinButton => 'ປ່ຽນ PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN ປັດຈຸບັນ';

  @override
  String get recoveryKeyPinNew => 'PIN ໃໝ່';

  @override
  String get recoveryKeyPinConfirm => 'ຢືນຢັນ PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN ບໍ່ຖືກຕ້ອງ, ລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get recoveryKeyPinConfirmError => 'PIN ບໍ່ກົງກັນ, ລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get recoveryKeyPinDialogHeader => 'ປ່ຽນ PIN';

  @override
  String get recoveryKeyPassphraseShow => 'ສະແດງ';

  @override
  String get recoveryKeyPassphraseHide => 'ເຊື່ອງ';

  @override
  String get recoveryKeyPassphraseChange => 'ປ່ຽນ';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'ອັບເດດ PIN ແລ້ວ';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'ອັບເດດ PIN ຂອງທ່ານສຳເລັດແລ້ວ.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'ອັບເດດວະລີຜ່ານແລ້ວ';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'ອັບເດດວະລີຜ່ານຂອງທ່ານສຳເລັດແລ້ວ.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'ວະລີຜ່ານບໍ່ປອດໄພ, ໃຫ້ຕັ້ງຍາວກວ່ານີ້ ຫຼື ຊັບຊ້ອນກວ່ານີ້';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'ວະລີຜ່ານພໍໃຊ້ໄດ້, ໃຫ້ຕັ້ງຍາວກວ່ານີ້ ຫຼື ຊັບຊ້ອນກວ່ານີ້ເພື່ອຄວາມປອດໄພທີ່ດີກວ່າ';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'ວະລີຜ່ານທີ່ແຂງແກ່ນ';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN ບໍ່ປອດໄພ, ໃຫ້ຕັ້ງຍາວກວ່ານີ້ ຫຼື ຄາດເດົາໄດ້ຍາກຂຶ້ນ';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN ພໍໃຊ້ໄດ້, ໃຫ້ຕັ້ງຍາວກວ່ານີ້ ຫຼື ຄາດເດົາໄດ້ຍາກຂຶ້ນເພື່ອຄວາມປອດໄພທີ່ດີກວ່າ';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN ຍາວພຽງພໍແລ້ວ';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'ມີບາງຢ່າງຜິດພາດ';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro ບໍ່ພ້ອມໃຊ້ງານສຳລັບ Ubuntu ເວີຊັນນີ້';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro ຈຳເປັນຕ້ອງໃຊ້ເວີຊັນ LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'ບໍ່ຮອງຮັບ Ubuntu Pro ໃນ snapd ເວີຊັນນີ້';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'ອັບເດດ snapd ເພື່ອຈັດການ Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'ເປີດໃຊ້ງານ Ubuntu Pro ແລ້ວ';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'ລະບົບຄວາມປອດໄພ ແລະ ການປະຕິບັດຕາມມາດຕະຖານລະດັບອົງກອນສຳລັບຄອມພິວເຕີຂອງທ່ານ. ຟຣີສະເໝີສຳລັບການໃຊ້ງານສ່ວນຕົວ. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'ຮຽນຮູ້ກ່ຽວກັບ Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'ເປີດໃຊ້ງານ Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'ເປີດໃຊ້ງານດ້ວຍບັນຊີ Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle => 'ທ່ານສາມາດສ້າງບັນຊີໄດ້ຟຣີ';

  @override
  String get ubuntuProMagicPrompt =>
      'ເຂົ້າສູ່ລະບົບດ້ວຍບັນຊີ Ubuntu One ຂອງທ່ານ ຫຼື ສ້າງບັນຊີໃໝ່ໄດ້ຟຣີ.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'ດຳເນີນການຕໍ່ໃນບຣາວເຊີ';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'ທ່ານຍັງສາມາດເຂົ້າສູ່ລະບົບໄດ້ທີ່ $attachLink ແລະ ປ້ອນລະຫັດ $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'ບໍ່ສາມາດເປີດໃຊ້ງານ Ubuntu Pro ໄດ້, ກະລຸນາລອງໃໝ່ອີກຄັ້ງ';

  @override
  String get ubuntuProEnableToken => 'ເປີດໃຊ້ງານດ້ວຍໂທເຄັນ';

  @override
  String get ubuntuProEnableTokenError => 'ບໍ່ສາມາດເປີດໃຊ້ງານ Ubuntu Pro ໄດ້';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'ຈາກຜູ້ດູແລລະບົບ IT ຂອງທ່ານ ຫຼື ຈາກ $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'ຮັບໂທເຄັນ Ubuntu Pro ຈາກຜູ້ດູແລລະບົບຂອງທ່ານ ຫຼື ຈາກ $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'ໂທເຄັນ';

  @override
  String get ubuntuProDisablePro => 'ປິດໃຊ້ງານ Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'ປິດໃຊ້ງານ';

  @override
  String get ubuntuProDisablePrompt =>
      'ການປິດໃຊ້ງານ Ubuntu Pro ຈະເປັນການຍົກເລີກການເຊື່ອມຕໍ່ການສະໝັກໃຊ້ຈາກເຄື່ອງນີ້. ທ່ານຕ້ອງການດຳເນີນການຕໍ່ຫຼືບໍ່?';

  @override
  String get ubuntuProEnable => 'ເປີດໃຊ້ງານ';

  @override
  String get ubuntuProCancel => 'ຍົກເລີກ';

  @override
  String get ubuntuProFeatureEnableError =>
      'ບໍ່ສາມາດເປີດໃຊ້ງານຟີເຈີນີ້ໄດ້, ກະລຸນາລອງໃໝ່ອີກຄັ້ງ.';

  @override
  String get ubuntuProFeatureDisableError =>
      'ບໍ່ສາມາດປິດໃຊ້ງານຟີເຈີນີ້ໄດ້, ກະລຸນາລອງໃໝ່ອີກຄັ້ງ.';

  @override
  String get ubuntuProCompliance =>
      'ການປະຕິບັດຕາມມາດຕະຖານ ແລະ ການເພີ່ມຄວາມເຂັ້ມງວດ';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'ແນະນຳສະເພາະສຳລັບການຊ່ວຍເຫຼືອໃນດ້ານ FedRAMP, HIPAA ແລະ ຂໍ້ກຳນົດການປະຕິບັດຕາມມາດຕະຖານ ຫຼື ການເພີ່ມຄວາມເຂັ້ມງວດອື່ນໆ.';

  @override
  String get ubuntuProComplianceUSGTitle => 'ຄູ່ມືຄວາມປອດໄພ Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'ເຮັດໃຫ້ການເພີ່ມຄວາມເຂັ້ມງວດ ແລະ ການກວດສອບເປັນແບບອັດຕະໂນມັດດ້ວຍໂປຣໄຟລ໌ CIS benchmark ແລະ DISA-STIG ພ້ອມທັງຮອງຮັບການປັບແຕ່ງສະເພາະຕາມສະພາບແວດລ້ອມ.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'ການຮັບຮອງໂມດູນການເຂົ້າລະຫັດລັບຂອງລັດຖະບານ ສະຫະລັດ ແລະ ແຄນາດາ ທີ່ສອດຄ່ອງກັບມາດຕະຖານການປົກປ້ອງຂໍ້ມູນ FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'ເປີດໃຊ້ງານ FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'ເມື່ອເປີດໃຊ້ງານ FIPS ແລ້ວຈະບໍ່ສາມາດຍົກເລີກໄດ້ ແລະ Livepatch ຈະຖືກປິດໃຊ້ງານແບບຖາວອນ.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'ເລືອກຕົວເລືອກ FIPS ທີ່ທ່ານຕ້ອງການ';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS ແບບມີການອັບເດດ';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'ຕິດຕັ້ງແພັກເກັດທີ່ຜ່ານການກວດສອບ FIPS 140-2 ແລະ ອະນຸຍາດໃຫ້ມີການອັບເດດຄວາມປອດໄພຕາມປົກກະຕິ.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS ແບບບໍ່ມີການອັບເດດ';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'ຕິດຕັ້ງແພັກເກັດທີ່ຜ່ານການກວດສອບ FIPS 140-2. ເຊິ່ງຈະບໍ່ໄດ້ຮັບການອັບເດດຈົນກວ່າຈະມີການຮັບຮອງຄືນໃໝ່ໃນຄັ້ງຕໍ່ໄປ.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'ເອກະສານການປະຕິບັດຕາມມາດຕະຖານຄວາມປອດໄພ';

  @override
  String get ubuntuProESMTitle => 'ການບຳລຸງຮັກສາຄວາມປອດໄພແບບຂະຫຍາຍ (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM ໃຫ້ບໍລິການແພັດຄວາມປອດໄພເປັນເວລາ 10 ປີ ສຳລັບແພັກເກັດໂອເພນຊອດຫຼາຍກວ່າ 25,000 ແພັກເກັດ. ໄດ້ຮັບການຈັດການຊ່ອງໂຫວ່ແບບຕໍ່ເນື່ອງສຳລັບ CVE ລະດັບວິກິດ, ສູງ ແລະ ກາງ.';

  @override
  String get ubuntuProESMMainTitle => 'ແພັກເກັດຫຼັກ (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'ການອັບເດດຄວາມປອດໄພສຳລັບ 2,300 ແພັກເກັດ Ubuntu Main ຈົນເຖິງປີ $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'ແພັກເກັດ Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'ການອັບເດດຄວາມປອດໄພເພີ່ມເຕີມສຳລັບແພັກເກັດ Ubuntu Universe ຫຼາຍກວ່າ 23,000 ແພັກເກັດ ຈົນເຖິງປີ $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'ເປີດໃຊ້ງານ Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'ປັບໃຊ້ການອັບເດດຄວາມປອດໄພຂອງເຄີເນີນໃນຂະນະທີ່ລະບົບກຳລັງເຮັດວຽກ';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'ສະແດງສະຖານະ Livepatch ຢູ່ແຖບດ້ານເທິງ';
}
