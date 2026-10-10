// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಭದ್ರತಾ ಕೇಂದ್ರ';

  @override
  String get snapdRuleCategorySessionAllowed => 'ಲಾಗ್‌ಔಟ್ ಆಗುವವರೆಗೆ ಅನುಮತಿಸಿ';

  @override
  String get snapdRuleCategorySessionDenied => 'ಲಾಗ್‌ಔಟ್ ಆಗುವವರೆಗೆ ನಿರಾಕರಿಸಿ';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ಯಾವಾಗಲೂ ಅನುಮತಿಸಿ';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'ಯಾವಾಗಲೂ ನಿರಾಕರಿಸು';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'ಓದು';

  @override
  String get snapPermissionWriteLabel => 'ಬರೆಯಿರಿ';

  @override
  String get snapPermissionExecuteLabel => 'ಕಾರ್ಯಗತಗೊಳಿಸಿ';

  @override
  String get snapPermissionAccessLabel => 'ಪ್ರವೇಶ';

  @override
  String get snapPermissionsEnableTitle =>
      'ಸಿಸ್ಟಮ್ ಅನುಮತಿಗಳನ್ನು ಕೇಳಲು ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಅಗತ್ಯವಿದೆ';

  @override
  String get snapPermissionsEnableWarning =>
      'ನಿಮ್ಮ ಸಿಸ್ಟಂನ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ಪ್ರವೇಶವನ್ನು ನಿಯಂತ್ರಿಸಲು ಇದು ಪ್ರಾಯೋಗಿಕ ವೈಶಿಷ್ಟ್ಯವಾಗಿದೆ.';

  @override
  String get snapPermissionsEnablingLabel =>
      'ಸಕ್ರಿಯಗೊಳಿಸಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

  @override
  String get snapPermissionsDisablingLabel =>
      'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

  @override
  String get snapPermissionsExperimentalLabel => 'ಪ್ರಾಯೋಗಿಕ';

  @override
  String get snapPermissionsOtherDescription =>
      'ನೀವು ಸೆಟ್ಟಿಂಗ್‌ಗಳು › ಅಪ್ಲಿಕೇಶನ್‌ಗಳಲ್ಲಿ ಇತರ ಅನುಮತಿಗಳನ್ನು ನಿರ್ವಹಿಸಬಹುದು.';

  @override
  String get snapPermissionsPageTitle => 'ಅಪ್ಲಿಕೇಶನ್ ಅನುಮತಿಗಳು';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rules',
      one: '1 rule',
      zero: 'no rules',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$snap ಗಾಗಿ $interface ಅನುಮತಿಗಳನ್ನು ನಿರ್ವಹಿಸಿ.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ಇನ್ನೂ ಯಾವುದೇ ನಿಯಮಗಳಿಲ್ಲ';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'ಯಾವುದೇ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಇನ್ನೂ ಪ್ರವೇಶವನ್ನು ವಿನಂತಿಸಿಲ್ಲ';

  @override
  String get snapRulesRemoveAll => 'ಎಲ್ಲಾ ನಿಯಮಗಳನ್ನು ತೆಗೆದುಹಾಕಿ';

  @override
  String get snapRulesResetAllPermissions => 'ಎಲ್ಲಾ ಅನುಮತಿಗಳನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String get homeInterfacePageTitle => 'ಹೋಮ್ ಫೋಲ್ಡರ್';

  @override
  String get homeInterfacePageDescription =>
      'ನಿಮ್ಮ ಹೋಮ್ ಫೋಲ್ಡರ್‌ನಲ್ಲಿ ಫೈಲ್‌ಗಳನ್ನು ಪ್ರವೇಶಿಸಲು ಅನುಮತಿಗಳನ್ನು ನಿರ್ವಹಿಸಿ.';

  @override
  String get cameraInterfacePageTitle => 'ಕ್ಯಾಮೆರಾ';

  @override
  String get cameraInterfacePageDescription =>
      'ನಿಮ್ಮ ಕ್ಯಾಮರಾಗಳನ್ನು ಪ್ರವೇಶಿಸಲು ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಅನುಮತಿಸಿ.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'ಅನುಮತಿಗಳನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get interfacePageLinkLearnMore => 'ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ';

  @override
  String get interfacePageLinkReportIssues => 'ಸಮಸ್ಯೆಗಳನ್ನು ವರದಿ ಮಾಡಿ';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'no apps',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'ಡಿಸ್ಕ್ ಎನ್ಕ್ರಿಪ್ಶನ್';

  @override
  String get diskEncryptionPageRecoveryKey => 'ರಿಕವರಿ ಕೀ';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'ಪ್ರಾರಂಭದ ಸಮಯದಲ್ಲಿ ಡಿಸ್ಕ್ ಅನ್‌ಲಾಕ್ ಮಾಡಲು ವಿಫಲವಾದಲ್ಲಿ ನಿಮ್ಮ ಡೇಟಾಗೆ ಪ್ರವೇಶವನ್ನು ಮರಳಿ ಪಡೆಯಲು ಮರುಪ್ರಾಪ್ತಿ ಕೀ ನಿಮಗೆ ಅನುಮತಿಸುತ್ತದೆ. ಎಲ್ಲೋ ಸುರಕ್ಷಿತವಾಗಿ ಉಳಿಸಿ.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'ಪ್ರಾರಂಭದ ಸಮಯದಲ್ಲಿ ಡಿಸ್ಕ್ ಅನ್‌ಲಾಕ್ ಮಾಡಲು ವಿಫಲವಾದಲ್ಲಿ ನಿಮ್ಮ ಡೇಟಾಗೆ ಪ್ರವೇಶವನ್ನು ಮರಳಿ ಪಡೆಯಲು ಮರುಪ್ರಾಪ್ತಿ ಕೀ ನಿಮಗೆ ಅನುಮತಿಸುತ್ತದೆ. ಎಲ್ಲೋ ಸುರಕ್ಷಿತವಾಗಿ ಉಳಿಸಿ. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'ಹಾರ್ಡ್‌ವೇರ್-ಬೆಂಬಲಿತ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಕುರಿತು ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ';

  @override
  String get diskEncryptionPageCheckKey => 'ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ಪರಿಶೀಲಿಸಿ...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'ರಿಕವರಿ ಕೀ ಪರಿಶೀಲಿಸಿ';

  @override
  String get diskEncryptionPageCheck => 'ಪರಿಶೀಲಿಸಿ';

  @override
  String get diskEncryptionPageValidKey => 'ಮಾನ್ಯ ಕೀ';

  @override
  String get diskEncryptionPageInvalidKey => 'ಅಮಾನ್ಯ ಕೀ';

  @override
  String get diskEncryptionPageEnterKey => 'ನಿಮ್ಮ ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get diskEncryptionPageKeyWorks => 'ರಿಕವರಿ ಕೀ ಕೆಲಸ';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'ಎಲ್ಲೋ ಸುರಕ್ಷಿತವಾಗಿ ಇರಿಸಲು ಮರೆಯದಿರಿ.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'ರಿಕವರಿ ಕೀ ಕೆಲಸ ಮಾಡುವುದಿಲ್ಲ';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'ಕೀಲಿಯನ್ನು ಪರಿಶೀಲಿಸಿ ಅಥವಾ ಅದನ್ನು ಹೊಸದರೊಂದಿಗೆ ಬದಲಾಯಿಸಿ.';

  @override
  String get diskEncryptionPageError => 'ದೋಷ';

  @override
  String get diskEncryptionPageReplaceButton => 'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಬದಲಾಯಿಸಿ...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'ಚೇತರಿಕೆ ಕೀಲಿಯನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'ಹೊಸ ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ಎಲ್ಲೋ ಸುರಕ್ಷಿತವಾಗಿ ಉಳಿಸಿ. ಒಮ್ಮೆ ನೀವು ಅದನ್ನು ಬದಲಾಯಿಸಿದರೆ, ನೀವು ಇನ್ನು ಮುಂದೆ ಹಳೆಯ ಕೀಲಿಯನ್ನು ಬಳಸಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR ಕೋಡ್ ತೋರಿಸಿ';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'ಫೈಲ್‌ಗೆ ಉಳಿಸಿ';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'ನಾನು ನನ್ನ ಮರುಪ್ರಾಪ್ತಿ ಕೀಲಿಯನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಎಲ್ಲೋ ಉಳಿಸಿದ್ದೇನೆ';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'ಬದಲಾಯಿಸಿ';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'ತಿರಸ್ಕರಿಸು';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಬದಲಾಯಿಸಲಾಗಿದೆ';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'ಎಲ್ಲೋ ಸುರಕ್ಷಿತವಾಗಿ ಇರಿಸಲು ಮರೆಯದಿರಿ.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಬದಲಿ ವಿಫಲವಾಗಿದೆ';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'ನಿಮ್ಮ ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ಬದಲಿಸುವಲ್ಲಿ ಏನೋ ತಪ್ಪಾಗಿದೆ, ನಿಮ್ಮ ಹಳೆಯ ಕೀಯು ನಿರರ್ಥಕವಾಗಿ ಉಳಿಯುತ್ತದೆ.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'ಉಬುಂಟು ಡೆಸ್ಕ್‌ಟಾಪ್ - ಎನ್‌ಕ್ರಿಪ್ಶನ್ ರಿಕವರಿ ಕೀ';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'ಮರುಪ್ರಾಪ್ತಿ ಕೀಲಿಯನ್ನು ನಕಲಿಸಲು QR ಕೋಡ್ ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್ ನಿರ್ವಾಹಕದಂತಹ ಸುರಕ್ಷಿತ ಸ್ಥಳದಲ್ಲಿ ಅದನ್ನು ಉಳಿಸಿ. ನಂತರದ ಬಳಕೆಗಾಗಿ ನೀವು ಫೋಟೋವನ್ನು ಸಹ ತೆಗೆದುಕೊಳ್ಳಬಹುದು.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'ನಕಲು ಮಾಡಿ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'ಈ ಕಂಪ್ಯೂಟರ್‌ನ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಸ್ಥಿತಿಯನ್ನು ಹಿಂಪಡೆಯಲು ವಿಫಲವಾಗಿದೆ.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್‌ನ TPM ಕಾನ್ಫಿಗರೇಶನ್ ಬೆಂಬಲಿತ ಸ್ಥಿತಿಯಲ್ಲಿಲ್ಲ.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'ನಿಮ್ಮ snapd ಆವೃತ್ತಿಯು ಬೆಂಬಲಿತವಾಗಿಲ್ಲ';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'ಭದ್ರತಾ ಕೇಂದ್ರವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು snapd ನವೀಕೃತವಾಗಿದೆ.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'ಭದ್ರತಾ ಕೇಂದ್ರವು snapd ಇಂಟರ್ಫೇಸ್‌ಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'ಇದನ್ನು ಸರಿಪಡಿಸಲು, ಟರ್ಮಿನಲ್‌ನಲ್ಲಿ ಈ ಆಜ್ಞೆಯನ್ನು ಚಲಾಯಿಸಿ:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'ಇತರ ಆಯ್ಕೆಗಳುಸ್ನ್ಯಾಪ್ ಕನೆಕ್ಟ್ ಡೆಸ್ಕ್‌ಟಾಪ್-ಸೆಕ್ಯುರಿಟಿ-ಸೆಂಟರ್:ಸ್ನ್ಯಾಪ್-ಎಫ್‌ಡಿ-ಕಂಟ್ರೋಲ್';

  @override
  String get diskEncryptionPageAddPinButton => 'ಪಿನ್ ಸೇರಿಸಿ...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'ಪಾಸ್‌ಫ್ರೇಸ್ ಸೇರಿಸಿ...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'ಪಾಸ್‌ಫ್ರೇಸ್ ಸೇರಿಸಿ';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'ಪಿನ್ ಸೇರಿಸಿ';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ನೀವು ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ. ಈ ಪಿನ್ ನಿಮ್ಮ ಬಳಕೆದಾರ ಪಾಸ್‌ವರ್ಡ್‌ಗಿಂತ ಭಿನ್ನವಾಗಿದೆ.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ನೀವು ಮರೆತರೆ, ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ಬಳಸಿಕೊಂಡು ನೀವು ಡಿಸ್ಕ್‌ಗೆ ಪ್ರವೇಶವನ್ನು ಮರಳಿ ಪಡೆಯಬಹುದು.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ನಿಮ್ಮ ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ನೀವು ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ. ಈ ಪಾಸ್‌ಫ್ರೇಸ್ ನಿಮ್ಮ ಬಳಕೆದಾರ ಪಾಸ್‌ವರ್ಡ್‌ಗಿಂತ ಭಿನ್ನವಾಗಿದೆ.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'ನಿಮ್ಮ ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ನೀವು ಮರೆತರೆ, ಮರುಪಡೆಯುವಿಕೆ ಕೀಲಿಯನ್ನು ಬಳಸಿಕೊಂಡು ನೀವು ಡಿಸ್ಕ್‌ಗೆ ಪ್ರವೇಶವನ್ನು ಮರಳಿ ಪಡೆಯಬಹುದು.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'ಹೆಚ್ಚುವರಿ ಭದ್ರತೆ';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'ಹೆಚ್ಚುವರಿ ಭದ್ರತೆಗಾಗಿ ನೀವು ಪಾಸ್‌ಫ್ರೇಸ್ ಅಥವಾ ಪಿನ್ ಅನ್ನು ಹೊಂದಿಸಬಹುದು. ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ನೀವು ಅದನ್ನು ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'ಸೇರಿಸಿ';

  @override
  String get diskEncryptionPageRemovePinButton => 'ಪಿನ್ ತೆಗೆದುಹಾಕಿ...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'ಪಾಸ್‌ಫ್ರೇಸ್ ತೆಗೆದುಹಾಕಿ...';

  @override
  String get diskEncryptionPageAddingPin =>
      'ಪಿನ್ ಸೇರಿಸಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'ಪಾಸ್‌ಫ್ರೇಸ್ ಸೇರಿಸಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'ಪಿನ್ ತೆಗೆದುಹಾಕಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ತೆಗೆದುಹಾಕಲಾಗುತ್ತಿದೆ, ಇದು ಕೆಲವು ಸೆಕೆಂಡುಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು...';

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
  String get recoveryKeyExceptionFileSystemTitle =>
      'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಫೈಲ್ ಅನ್ನು ಉಳಿಸಲಾಗಿಲ್ಲ';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಫೈಲ್ ಅನ್ನು ತಾತ್ಕಾಲಿಕ ಸ್ಥಳದಲ್ಲಿ ಉಳಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'ಅಜ್ಞಾತ ದೋಷ';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'ನಿಮ್ಮ ಮರುಪ್ರಾಪ್ತಿ ಕೀಯನ್ನು ಫೈಲ್‌ಗೆ ಉಳಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'ಆ ಫೈಲ್ ಸ್ಥಳಕ್ಕೆ ಬರೆಯಲು ನೀವು ಅನುಮತಿಯನ್ನು ಹೊಂದಿಲ್ಲ.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'ಆ ಫೋಲ್ಡರ್‌ಗೆ ಬರೆಯಲು ನೀವು ಅನುಮತಿಯನ್ನು ಹೊಂದಿಲ್ಲ. ಬೇರೆ ಸ್ಥಳವನ್ನು ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ ಇನ್ನೊಂದು ವಿಧಾನವನ್ನು ಬಳಸಿ.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'ತೆಗೆಯಬಹುದಾದ ಡ್ರೈವ್‌ನಂತಹ ಬೇರೆ ಸ್ಥಳವನ್ನು ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ ಇನ್ನೊಂದು ವಿಧಾನವನ್ನು ಬಳಸಿ.';

  @override
  String get recoveryKeyFilePickerTitle => 'ಮರುಪ್ರಾಪ್ತಿ ಕೀ ಫೈಲ್ ಅನ್ನು ಉಳಿಸಿ';

  @override
  String get recoveryKeyFilePickerFilter => 'ಪಠ್ಯ ಫೈಲ್ಗಳು';

  @override
  String get recoveryKeyTPMEnabled =>
      'ಹಾರ್ಡ್‌ವೇರ್-ಬೆಂಬಲಿತ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಕೀಗಳನ್ನು ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್‌ನ ಟ್ರಸ್ಟೆಡ್ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಮಾಡ್ಯೂಲ್ (TPM) ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'ಹಾರ್ಡ್‌ವೇರ್-ಬೆಂಬಲಿತ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಕುರಿತು ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get recoveryKeyPassphraseHeader => 'ಪಾಸ್‌ಫ್ರೇಸ್ ಬದಲಾಯಿಸಿ';

  @override
  String get recoveryKeyPassphraseBody =>
      'ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ನಿಮ್ಮ ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ನೀವು ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get recoveryKeyPassphraseButton => 'ಪಾಸ್‌ಫ್ರೇಸ್ ಬದಲಾಯಿಸಿ...';

  @override
  String get recoveryKeyPassphraseCurrent => 'ಪ್ರಸ್ತುತ ಪಾಸ್‌ಫ್ರೇಸ್';

  @override
  String get recoveryKeyPassphraseNew => 'ಹೊಸ ಪಾಸ್‌ಫ್ರೇಸ್';

  @override
  String get recoveryKeyPassphraseConfirm =>
      'ಬಲವಾದ ಪಾಸ್‌ಫ್ರೇಸ್ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'ತಪ್ಪಾದ ಪಾಸ್‌ಫ್ರೇಸ್, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get recoveryKeyPassphraseNewError => 'ಕನಿಷ್ಠ 4 ಅಕ್ಷರಗಳ ಉದ್ದವಿರಬೇಕು';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'ಪಾಸ್‌ಫ್ರೇಸ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'ಪಾಸ್‌ಫ್ರೇಸ್ ಬದಲಾಯಿಸಿ';

  @override
  String get recoveryKeyPinEnabled =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಪಿನ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get recoveryKeyPinHeader => 'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಪಿನ್';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಪಾಸ್‌ಫ್ರೇಸ್';

  @override
  String get recoveryKeyPinBody =>
      'ನಿಮ್ಮ ಕಂಪ್ಯೂಟರ್ ಪ್ರಾರಂಭವಾದಾಗಲೆಲ್ಲಾ ನೀವು ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ನಮೂದಿಸಬೇಕಾಗುತ್ತದೆ.';

  @override
  String get recoveryKeyPinButton => 'ಪಿನ್ ಬದಲಾಯಿಸಿ...';

  @override
  String get recoveryKeyPinCurrent => 'ಪ್ರಸ್ತುತ ಪಿನ್';

  @override
  String get recoveryKeyPinNew => 'ಹೊಸ ಪಿನ್';

  @override
  String get recoveryKeyPinConfirm => 'ಪಿನ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get recoveryKeyPinCurrentError => 'ತಪ್ಪಾದ ಪಿನ್, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get recoveryKeyPinConfirmError =>
      'ಪಿನ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get recoveryKeyPinDialogHeader => 'ಪಿನ್ ಬದಲಾಯಿಸಿ';

  @override
  String get recoveryKeyPassphraseShow => 'ತೋರಿಸು';

  @override
  String get recoveryKeyPassphraseHide => 'ಮರೆಮಾಡಿ';

  @override
  String get recoveryKeyPassphraseChange => 'ಬದಲಾವಣೆ';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'ಪಿನ್ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'ನಿಮ್ಮ ಪಿನ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'ನಿಮ್ಮ ಪಾಸ್‌ಫ್ರೇಸ್ ಅನ್ನು ಯಶಸ್ವಿಯಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'ದುರ್ಬಲ ಪಾಸ್‌ಫ್ರೇಸ್, ಅದನ್ನು ಉದ್ದ ಅಥವಾ ಹೆಚ್ಚು ಸಂಕೀರ್ಣಗೊಳಿಸಿ';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'ನ್ಯಾಯೋಚಿತ ಪಾಸ್‌ಫ್ರೇಸ್, ಉತ್ತಮ ಭದ್ರತೆಗಾಗಿ ಅದನ್ನು ದೀರ್ಘ ಅಥವಾ ಹೆಚ್ಚು ಸಂಕೀರ್ಣಗೊಳಿಸಿ';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'ಬಲವಾದ ಪಾಸ್‌ಫ್ರೇಸ್';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'ದುರ್ಬಲವಾದ ಪಿನ್, ಅದನ್ನು ಉದ್ದ ಅಥವಾ ಕಡಿಮೆ ಊಹಿಸಬಹುದಾದಂತೆ ಮಾಡಿ';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'ನ್ಯಾಯೋಚಿತ ಪಿನ್, ಉತ್ತಮ ಭದ್ರತೆಗಾಗಿ ದೀರ್ಘ ಅಥವಾ ಕಡಿಮೆ ಊಹಿಸಬಹುದಾದಂತೆ ಮಾಡಿ';

  @override
  String get recoveryKeyPinEntropyOptimal => 'ಪಿನ್ ಸಾಕಷ್ಟು ಉದ್ದವಾಗಿದೆ';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'ಏನೋ ತಪ್ಪಾಗಿದೆ';

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
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

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
  String get ubuntuProMagicError => 'Unable to enable Ubuntu Pro, try again';

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
      'Disabling Ubuntu Pro will detach your subscription from this computer. Do you want to proceed?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Enable';

  @override
  String get ubuntuProCancel => 'Cancel';

  @override
  String get ubuntuProFeatureEnableError =>
      'Could not enable the feature, try again.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Could not disable the feature, try again.';

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
