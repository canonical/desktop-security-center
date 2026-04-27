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
  String get snapdRuleCategoryForeverDenied => 'Refuser toujours';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get interfacePageDescription =>
      'Les applications limitées strictement vous demanderont avant d’accéder aux fichiers et dossiers. Cette fonctionnalité est expérimentale et sujète à modifications.';

  @override
  String get interfacePageLinkLearnMore => 'En savoir plus';

  @override
  String get interfacePageLinkGiveFeedback => 'Donner votre avis';

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
  String get diskEncryptionPageTitle => 'Chiffrement du disque';

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
      'ESM fournit 10 ans de correctifs de sécurité pour plus de 25 000 paquetages open source. Obtenez la gestion continue des vulnérabilités pour les CVE critiques, élevées et moyennes.';

  @override
  String get ubuntuProESMMainTitle => 'Principaux paquetages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Mises à jour de sécurité pour 2 300 paquetages Ubuntu Main jusqu’en $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Paquetages d\'Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Mises à jour de sécurité supplémentaires pour plus de 23 000 paquetages Ubuntu Universe jusqu’en $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Activer Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Appliquer les mises à jour de sécurité du noyau pendant que le système s’exécute';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Afficher le statut de Livepatch dans la barre supérieure';
}
