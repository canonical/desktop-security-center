// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Centre de sécurité';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Autoriser jusqu’à fermeture de session';

  @override
  String get snapdRuleCategorySessionDenied =>
      'Refuser jusqu’à fermeture de session';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Autoriser toujours';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Refuser toujours';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'Lecture';

  @override
  String get snapPermissionWriteLabel => 'Écrire';

  @override
  String get snapPermissionExecuteLabel => 'Exécution';

  @override
  String get snapPermissionAccessLabel => 'Accès';

  @override
  String get snapPermissionsEnableTitle =>
      'Exiger que les apps demandent des autorisations système';

  @override
  String get snapPermissionsEnableWarning =>
      'Il s’agit d’une fonctionnalité expérimentale pour contrôler l’accès aux ressources de votre système.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Activation, cela pourrait prendre quelques secondes...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Désactivation, cela pourrait prendre quelques secondes...';

  @override
  String get snapPermissionsExperimentalLabel => 'Expérimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Vous pouvez gérer d’autres autorisations dans Paramètres › Applications.';

  @override
  String get snapPermissionsPageTitle => 'Permissions d\'app';

  @override
  String get snapPermissionsErrorTitle => 'Quelque chose a mal tourné';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n règles',
      one: '1 règle',
      zero: 'aucune règle',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gérer autorisations $interface pour $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Pas encore de règles';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Aucune app n’a encore demandé l’accès';

  @override
  String get snapRulesRemoveAll => 'Supprimer toutes les règles';

  @override
  String get snapRulesResetAllPermissions =>
      'Réinitialiser toutes autorisations';

  @override
  String get homeInterfacePageTitle => 'Dossier d’accueil';

  @override
  String get homeInterfacePageDescription =>
      'Gérer les autorisations d’accès aux fichiers dans votre dossier personnel.';

  @override
  String get cameraInterfacePageTitle => 'Caméra';

  @override
  String get cameraInterfacePageDescription =>
      'Autorise les apps à accéder à vos caméras.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Autoriser les apps à accéder à votre microphone.';

  @override
  String get interfacePageTitle => 'Gérer permissions';

  @override
  String get interfacePageLinkLearnMore => 'En savoir plus';

  @override
  String get interfacePageLinkReportIssues => 'Signaler un problème';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n apps',
      one: '1 app',
      zero: 'aucune app',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Chiffrement disque';

  @override
  String get diskEncryptionPageRecoveryKey => 'Clé de secours';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La clé de secours vous permet de récupérer l’accès à vos données si le disque ne parvient pas à se déverrouiller au démarrage. Enregistrez-la dans un endroit sûr.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La clé de récupération (de secours) vous permet de retrouver l’accès à vos données si le disque ne parvient pas à se déverrouiller pendant le démarrage. Enregistrez-la dans un endroit sûr. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'En savoir plus sur le chiffrement assisté par matériel';

  @override
  String get diskEncryptionPageCheckKey => 'Vérification clé de secours...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Vérifier clé de secours';

  @override
  String get diskEncryptionPageCheck => 'Vérifier';

  @override
  String get diskEncryptionPageValidKey => 'Clé valide';

  @override
  String get diskEncryptionPageInvalidKey => 'Clé invalide';

  @override
  String get diskEncryptionPageEnterKey => 'Entrez votre clé de secours';

  @override
  String get diskEncryptionPageKeyWorks => 'Clé de secours fonctionne';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'N’oubliez pas de la garder en lieu sûr.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Clé de secours ne fonctionne pas';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Vérifiez la clé ou la remplacer par une nouvelle.';

  @override
  String get diskEncryptionPageError => 'Erreur';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Remplacement clé de secours...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Remplacer clé de secours';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Sauvegardez la nouvelle clé de secours dans un endroit sûr. Une fois que vous l’avez remplacée, vous ne pourrez plus utiliser l’ancienne clé.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Afficher code QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Sauvegarde vers fichier';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'J’ai sauvegardé(e) ma clé de secours dans un endroit sûr';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Remplacer';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Rejeter';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Clé de secours remplacée';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'N’oubliez pas de la garder quelque part en sécurité.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Échec du remplacement de la clé de secours';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Quelque chose s’est mal passé en remplaçant votre clé de secours, votre ancienne clé restera valide.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Clé de secours de chiffrement';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scannez le code QR pour copier la clé de secours et l’enregistrer dans un endroit sûr, tel qu\'un gestionnaire de mots de passe. Vous pouvez également prendre une photo pour une utilisation ultérieure.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copié dans le presse-papiers';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copier';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Paramètres de chiffrement non disponibles';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Échec de la récupération du statut de chiffrement de cet ordinateur.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La configuration du TPM de votre ordinateur n’est pas dans un état pris en charge.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Votre version Snapd n’est pas prise en charge';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Vérifiez que le centre de sécurité et Snapd sont à jour.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Le centre de sécurité ne parvient pas à se connecter à l’interface Snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Pour résoudre ceci, exécutez cette commande dans le terminal :';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Ajout PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Ajout phrase de passe...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Ajouter phrase de passe';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Ajouter PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Vous devrez entrer votre code PIN chaque fois que votre ordinateur démarre. Ce code PIN est différent de votre mot de passe utilisateur.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Si vous oubliez votre code PIN, vous pouvez récupérer l’accès au disque en utilisant la clé de récupération.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Vous devrez entrer votre phrase de passe chaque fois que votre ordinateur démarre. Cette phrase de passe est différente de votre mot de passe utilisateur.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Si vous oubliez votre phrase de passe, vous pouvez récupérer l’accès au disque en utilisant la clé de récupération.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Sécurité supplémentaire';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Vous pouvez définir une phrase de passe ou un code PIN pour une sécurité supplémentaire. Vous devrez l’entrer chaque fois que votre ordinateur démarre.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'En apprendre davantage';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Ajout';

  @override
  String get diskEncryptionPageRemovePinButton => 'Retire PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Retire phrase de passe...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Ajout de PIN, cela peut prendre quelques secondes...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Ajout d’une phrase de passe, cela peut prendre quelques secondes...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Retire le code PIN, cela peut prendre quelques secondes...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Retire la phrase de passe, cela peut prendre quelques secondes...';

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
      'Fichier clé de secours non sauvegardé';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Le fichier de clé de secours ne peut pas être enregistré dans un emplacement temporaire';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Erreur inconnue';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Échec d\'enregistrement de votre clé de récupération dans le fichier';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Vous n’avez pas la permission d’écrire dans cet emplacement de fichier.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Vous n’avez pas l’autorisation d’écrire dans ce dossier. Essayez un emplacement différent ou utilisez une autre méthode.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Essayez un emplacement différent, tel qu\'un lecteur amovible, ou utilisez une autre méthode.';

  @override
  String get recoveryKeyFilePickerTitle => 'Sauvegarder fichier clé de secours';

  @override
  String get recoveryKeyFilePickerFilter => 'Fichiers texte';

  @override
  String get recoveryKeyTPMEnabled => 'Le chiffrement matériel est activé';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Les clés de chiffrement sont stockées dans le module TPM (Trusted Platform Module) de votre ordinateur.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'En savoir plus sur le chiffrement matériel';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Phrase de passe de chiffrement activée';

  @override
  String get recoveryKeyPassphraseHeader => 'Changer phrase de passe';

  @override
  String get recoveryKeyPassphraseBody =>
      'Vous devez entrer votre phrase de passe chaque fois que votre ordinateur démarre.';

  @override
  String get recoveryKeyPassphraseButton => 'Changer phrase de passe...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Phrase de passe actuelle';

  @override
  String get recoveryKeyPassphraseNew => 'Nouvelle phrase de passe';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirmer phrase de passe';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Phrase de passe incorrecte, réessayez';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Doit comporter au moins 4 caractères de long';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Les phrases de passe ne correspondent pas, réessayez';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Changer phrase de passe';

  @override
  String get recoveryKeyPinEnabled => 'Le PIN de chiffrement est activé';

  @override
  String get recoveryKeyPinHeader => 'PIN de chiffrement';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Phrase de passe de chiffrement';

  @override
  String get recoveryKeyPinBody =>
      'Vous devez entrer votre code PIN chaque fois que votre ordinateur démarre.';

  @override
  String get recoveryKeyPinButton => 'Changer PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN actuel';

  @override
  String get recoveryKeyPinNew => 'Nouveau PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirmer PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorrect, réessayez';

  @override
  String get recoveryKeyPinConfirmError =>
      'Les PIN ne correspondent pas, réessayez';

  @override
  String get recoveryKeyPinDialogHeader => 'Changer PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Montrer';

  @override
  String get recoveryKeyPassphraseHide => 'Cacher';

  @override
  String get recoveryKeyPassphraseChange => 'Changer';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN mis à jour';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Votre PIN a été mis à jour avec succès.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Phrases de passe mise à jour';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Votre phrase de passe a été mise à jour avec succès.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Phrase de passe faible, faites-la plus longue ou plus complexe';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Phrase de passe suffisante, rendez-la plus longue ou plus complexe pour une meilleure sécurité';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Phrase de passe forte';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Code PIN faible, rendez-le plus long ou moins prévisible';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN acceptable, le rendre plus long ou moins prévisible pour une meilleure sécurité';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Le PIN est suffisamment long';

  @override
  String get recoveryKeySomethingWentWrongHeader =>
      'Quelque chose a mal tourné';

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
      'Ubuntu Pro n’est pas disponible pour cette version d’Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro nécessite une version LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro n’est pas pris en charge par cette version de Snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Mettre à jour Snapd pour gérer Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro est activé';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Sécurité et conformité de niveau entreprise pour votre ordinateur. Toujours gratuit pour un usage personnel. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Découvrez Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Activer Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Activer avec un compte Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Vous pourrez créer un compte gratuitement';

  @override
  String get ubuntuProMagicPrompt =>
      'Connectez-vous avec votre compte Ubuntu One, ou créez-en un gratuitement.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continuer dans le navigateur';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Vous pouvez également vous connecter sur $attachLink et entrer le code $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Impossible d’activer Ubuntu Pro, veuillez réessayer';

  @override
  String get ubuntuProEnableToken => 'Activer avec un jeton';

  @override
  String get ubuntuProEnableTokenError => 'Incapable d’activer Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Depuis votre administrateur informatique ou depuis $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Obtenez un jeton Ubuntu Pro depuis votre administrateur ou depuis $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Jeton';

  @override
  String get ubuntuProDisablePro => 'Désactiver Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Désactiver';

  @override
  String get ubuntuProDisablePrompt =>
      'Désactiver Ubuntu Pro détachera votre abonnement de cette machine. Voulez-vous continuer ?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Activer';

  @override
  String get ubuntuProCancel => 'Annuler';

  @override
  String get ubuntuProFeatureEnableError =>
      'Impossible d’activer la fonctionnalité, veuillez réessayer.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Impossible de désactiver la fonctionnalité, veuillez réessayer.';

  @override
  String get ubuntuProCompliance => 'Conformité et durcissement';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Seulement recommandé pour aider avec FedRAMP, HIPAA et d’autres exigences de conformité et de durcissement.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Guide de sécurité Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatise le durcissement et l’audit avec les profils de référence CIS et DISA-STIG tout en permettant des personnalisations spécifiques à l’environnement.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Une certification de module cryptographique des gouvernements américain et canadien en conformité avec la norme de protection des données FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Activer FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'L’activation de FIPS ne peut pas être inversée et Livepatch sera définitivement désactivé.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Choisissez votre option FIPS préférée';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS avec mises à jour';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installe des paquetages validés FIPS 140-2 et permet des mises à jour de sécurité régulières.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS sans mises à jour';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installe des paquets validés FIPS 140-2. Ceux-ci ne seront pas mis à jour avant la prochaine recertification.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentation de conformité à la sécurité';

  @override
  String get ubuntuProESMTitle => 'Maintenance de sécurité étendue (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM fournit 10 ans de correctifs de sécurité pour l\'archive Ubuntu entière. Obtenez la gestion continue des vulnérabilités pour les CVEs critiques, élevées et moyennes sélectionnées.';

  @override
  String get ubuntuProESMMainTitle => 'Principaux paquetages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Mises à jour de sécurité pour les paquetages Ubuntu Main jusqu’en $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquetages d\'Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Mises à jour de sécurité supplémentaires pour Ubuntu Universe jusqu’en $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch pour le noyau';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activer Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Appliquer les mises à jour de sécurité du noyau pendant que le système s’exécute';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Afficher le statut de Livepatch dans la barre supérieure';
}
