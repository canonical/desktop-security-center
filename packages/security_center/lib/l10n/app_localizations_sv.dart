// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Säkerhetscenter';

  @override
  String get snapdRuleCategorySessionAllowed => 'Tillåt tills utloggning';

  @override
  String get snapdRuleCategorySessionDenied => 'Neka tills utloggning';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Tillåt alltid';

  @override
  String get snapdRuleCategoryForeverDenied => 'Neka alltid';

  @override
  String get snapPermissionReadLabel => 'Läs';

  @override
  String get snapPermissionWriteLabel => 'Skriv';

  @override
  String get snapPermissionExecuteLabel => 'Exekvera';

  @override
  String get snapPermissionAccessLabel => 'Access';

  @override
  String get snapPermissionsEnableTitle =>
      'Kräv program att be om systembehörigheter';

  @override
  String get snapPermissionsEnableWarning =>
      'Det här är en experimentell funktion för att kontrollera åtkomst till ditt systems resurser.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Aktiverar, det kan ta några sekunder...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Inaktiverar, det kan ta några sekunder...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentell';

  @override
  String get snapPermissionsOtherDescription =>
      'Du kan hantera andra behörigheter i Inställningar › Program.';

  @override
  String get snapPermissionsPageTitle => 'Program behörigheter';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regler',
      one: '1 regel',
      zero: 'inga regler',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Hantera $interface behörigheter för $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Inga regler ännu';

  @override
  String get cameraRulesPageEmptyTileLabel => 'No apps requested access yet';

  @override
  String get snapRulesRemoveAll => 'Ta bort alla regler';

  @override
  String get snapRulesResetAllPermissions => 'Reset all permissions';

  @override
  String get homeInterfacePageTitle => 'Hemkatalog';

  @override
  String get homeInterfacePageDescription =>
      'Hantera behörigheter för att komma åt filer i din hemkatalog.';

  @override
  String get cameraInterfacePageTitle => 'Camera';

  @override
  String get cameraInterfacePageDescription =>
      'Allow apps to access your cameras.';

  @override
  String get interfacePageTitle => 'Hantera behörigheter';

  @override
  String get interfacePageDescription =>
      'Strikt begränsade program kommer att fråga dig innan du kommer åt filer och mappar. Den här funktionen är experimentell och kan ändras.';

  @override
  String get interfacePageLinkLearnMore => 'Läs mer';

  @override
  String get interfacePageLinkGiveFeedback => 'Ge feedback';

  @override
  String get interfacePageLinkReportIssues => 'Rapportera problem';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n flera program',
      one: '1 program',
      zero: 'inga program',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Disk Encryption';

  @override
  String get diskEncryptionPageRecoveryKey => 'Recovery key';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'The recovery key lets you regain access to your data if the disk fails to unlock during startup. Save it somewhere safe.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'The recovery key lets you regain access to your data if the disk fails to unlock during startup. Save it somewhere safe. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Learn more about hardware-backed encryption';

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
  String get diskEncryptionPageKeyWorksBody =>
      'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Recovery key does not work';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Check the key or replace it with a new one.';

  @override
  String get diskEncryptionPageError => 'Error';

  @override
  String get diskEncryptionPageReplaceButton => 'Replace recovery key...';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'Replace recovery key';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Save the new recovery key somewhere safe. Once you replace it, you will not be able to use the old key anymore.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Show QR code';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Save to file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'I saved my recovery key somewhere safe';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Replace';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Discard';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Recovery key replaced';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Remember to keep it somewhere safe.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Recovery key replacement failed';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Something went wrong replacing your recovery key, your old key will remain vaild.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Encryption recovery key';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copied to clipboard';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copy';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Encryption settings not available';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Failed to retrieve the encryption status of this computer.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Your computer\'s TPM configuration is not in a supported state.';

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
      'Recovery key file not saved';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Recovery key file cannot be saved in a temporary location';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Unknown error';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Failed to save your recovery key to file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'You do not have permission to write to that file location.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'You do not have permission to write to that folder. Try a different location or use another method.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Try a different location, such as a removable drive, or use another method.';

  @override
  String get recoveryKeyFilePickerTitle => 'Save recovery key file';

  @override
  String get recoveryKeyFilePickerFilter => 'Text files';

  @override
  String get recoveryKeyTPMEnabled => 'Hardware-backed encryption is enabled';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled => 'Encryption passphrase is enabled';

  @override
  String get recoveryKeyPassphraseHeader => 'Change passphrase';

  @override
  String get recoveryKeyPassphraseBody =>
      'You need to enter your passphrase every time your computer starts.';

  @override
  String get recoveryKeyPassphraseButton => 'Change passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Current passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'New passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirm passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Incorrect passphrase, try again';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Must be at least 4 characters long';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Passphrases do not match, try again';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Change Passphrase';

  @override
  String get recoveryKeyPinEnabled => 'Encryption PIN is enabled';

  @override
  String get recoveryKeyPinHeader => 'Encryption PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Encryption passphrase';

  @override
  String get recoveryKeyPinBody =>
      'You need to enter your PIN every time your computer starts.';

  @override
  String get recoveryKeyPinButton => 'Change PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Current PIN';

  @override
  String get recoveryKeyPinNew => 'New PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirm PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Incorrect PIN, try again';

  @override
  String get recoveryKeyPinConfirmError => 'PINs do not match, try again';

  @override
  String get recoveryKeyPinDialogHeader => 'Change PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Show';

  @override
  String get recoveryKeyPassphraseHide => 'Hide';

  @override
  String get recoveryKeyPassphraseChange => 'Change';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN updated';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'You PIN was successfully updated.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Passphrase updated';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'You passphrase was successfully updated.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Weak passphrase, make it longer or more complex';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Fair passphrase, make it longer or more complex for better security';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Strong passphrase';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Weak PIN, make it longer or less predictable';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Fair PIN, make it longer or less predictable for better security';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN is long enough';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Something went wrong';
}
