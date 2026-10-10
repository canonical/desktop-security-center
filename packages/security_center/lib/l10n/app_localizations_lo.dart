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
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'ປະຕິເສດຕະຫຼອດ';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

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
  String get snapPermissionsErrorTitle => 'ມີບາງຢ່າງຜິດພາດ';

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
  String get interfacePageLinkLearnMore => 'ຮຽນຮູ້ເພີ່ມເຕີມ';

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
      'ເຊື່ອມຕໍ່ desktop-security-center:snap-fde-control ຂອງ snap';

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
  String get diskEncryptionPageRepairHeader => 'Disk encryption needs repair';

  @override
  String get diskEncryptionPageRepairBody =>
      'Automatic repair failed during decryption. Repair the disk now to start the computer without a recovery key.';

  @override
  String get diskEncryptionPageRepairButton => 'Start repair...';

  @override
  String get diskEncryptionPageRepairing => 'Repairing...';

  @override
  String get diskEncryptionPageRepairDialogHeader => 'Repair encryption';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Hardware-backed encryption could not be repaired';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Disk encryption no longer needs repair.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Any PIN and passphrase will be removed';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'You can add them again after repair.';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'Save the new recovery key somewhere safe. Once repairing completes, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Old recovery keys will stop working';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'You may want to let your IT administrator know you are re-encrypting the disk in case they are storing any recovery keys.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Repair';

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
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

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
  String get passphraseTypePassphraseTileTitle =>
      'Require a passphrase on startup';

  @override
  String get passphraseTypePinTileTitle => 'Require a PIN on startup';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Hardware-backed encryption requires additional security in this computer.';

  @override
  String get tpmActionPageTitleActionable =>
      'There is an issue with hardware-backed encryption';

  @override
  String get tpmActionDetailsLabel => 'Technical details';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Solution $n: $text';
  }

  @override
  String tpmActionSingleSolutionLabel(String text) {
    return 'Solution: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Try the solutions below or contact IT support.';

  @override
  String get tpmActionErrorSupportSingleLabel =>
      'Try the solution below or contact IT support.';

  @override
  String get tpmActionErrorKindInternal => 'Internal error.';

  @override
  String get tpmActionErrorKindShutdownRequired => 'Power off is required.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Restart is required.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Unexpected action.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Missing argument.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Invalid argument.';

  @override
  String get tpmActionErrorKindActionFailed => 'Action failed.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'The current environment is a virtual machine.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'This computer is using older firmware (legacy BIOS) that is not compatible with this encryption method.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'This computer does not have the required security hardware (TPM 2.0) for this encryption method.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'This computer\'s TPM is disabled.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'This computer\'s TPM is already in use by another system or application.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'This computer\'s TPM is currently locked.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'This computer\'s TPM does not have enough storage available.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'This computer is not compatible with hardware-backed encryption.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'This computer is missing a required security feature (DMA protection).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'This computer is missing a required security feature (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'There is an issue with this computer\'s security configuration.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'There is software running at startup that might prevent a secure connection with the computer\'s TPM.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Absolute Persistence Module is enabled in this computer.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Secure boot is disabled in this computer or is not set in deployed mode.';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Some of the certificates verifying software in this computer are outdated or use weak protection.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'This computer is using a manual allowlist to verify software at startup.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Add-on drivers are present.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'This computer is missing a required security feature (hardware root of trust).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'There is an issue with this computer\'s TPM.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'There is an issue with this computer\'s firmware.';

  @override
  String get tpmActionFixActionReboot => 'Restart';

  @override
  String get tpmActionFixActionShutdown => 'Power off';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Restart to firmware settings';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Restart and press the settings key repeatedly during startup (commonly F2, F10 or Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Enable DMA protection manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Enable secure boot manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Enable IOMMU manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Enable PCR banks manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Enable TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Clear TPM manually';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Disable Absolute Persistence Module manually';

  @override
  String get tpmActionFixActionContactOem => 'Contact OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Contact OS vendor';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware => 'Enable TPM on restart';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Enable and clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpmViaFirmware => 'Clear TPM on restart';

  @override
  String get tpmActionFixActionClearTpm => 'Clear TPM';

  @override
  String get tpmActionFixActionProceed => 'Ignore';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Restart the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Restarting the computer may fix the issue.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Power off the computer to complete previous actions.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'You can do this in your computer\'s firmware settings.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'You might be able to do this in your computer\'s firmware settings. Check the documentation of the CPU vendor for guidance.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Check secure boot mode is set to \"deployed\".';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'This feature might be referred to as \"Virtualization Technology\", \"VT-d\" or \"AMD-Vi\".';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Ignoring this issue might result in a less secure installation.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Ignore and continue';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Clearing the TPM erases all encryption keys';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'You will lose access to all data in encrypted drives for which you do not have recovery keys. It will also break other features that depend on the TPM, such as authentication and certificates.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel =>
      'I understand the risk';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'You might be asked to confirm this action on restart.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Then you will need to start the repair again.';

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
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

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
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

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
      'ESM ໃຫ້ການປັບປຸງຄວາມປອດໄພເປັນເວລາ 10 ປີ ສຳລັບຄັງເກັບຂໍ້ມູນ Ubuntu ທັງໝົດ. ຮັບການຈັດການຈຸດອ່ອນແບບຕໍ່ເນື່ອງ ສຳລັບ CVEs ໃນລະດັບວິກິດ, ສູງ ແລະ ລະດັບປານກາງທີ່ຖືກຄັດເລືອກ.';

  @override
  String get ubuntuProESMMainTitle => 'ແພັກເກັດຫຼັກ (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'ການອັບເດດຄວາມປອດໄພສຳລັບແພັກເກດ Ubuntu Main ຈົນເຖິງປີ $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'ແພັກເກັດ Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'ການອັບເດດຄວາມປອດໄພເພີ່ມເຕີມສຳລັບແພັກເກດ Ubuntu Universe ຈົນເຖິງປີ $year';
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
