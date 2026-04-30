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
  String get snapdRuleCategoryForeverDenied => 'ಯಾವಾಗಲೂ ನಿರಾಕರಿಸು';

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
  String get interfacePageDescription =>
      'ಫೈಲ್‌ಗಳು ಮತ್ತು ಫೋಲ್ಡರ್‌ಗಳನ್ನು ಪ್ರವೇಶಿಸುವ ಮೊದಲು ಕಟ್ಟುನಿಟ್ಟಾಗಿ ಸೀಮಿತವಾದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ನಿಮ್ಮನ್ನು ಕೇಳುತ್ತವೆ. ಈ ವೈಶಿಷ್ಟ್ಯವು ಪ್ರಾಯೋಗಿಕ ಮತ್ತು ಬದಲಾವಣೆಗಳಿಗೆ ಒಳಪಟ್ಟಿರುತ್ತದೆ.';

  @override
  String get interfacePageLinkLearnMore => 'ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ';

  @override
  String get interfacePageLinkGiveFeedback => 'ಪ್ರತಿಕ್ರಿಯೆ ನೀಡಿ';

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
