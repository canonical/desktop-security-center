// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Centro Sicurezza';

  @override
  String get snapdRuleCategorySessionAllowed => 'Consenti fino al logout';

  @override
  String get snapdRuleCategorySessionDenied => 'Nega fino al logout';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Consenti sempre';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'Nega sempre';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'Lettura';

  @override
  String get snapPermissionWriteLabel => 'Scrittura';

  @override
  String get snapPermissionExecuteLabel => 'Eseguibile';

  @override
  String get snapPermissionAccessLabel => 'Accesso';

  @override
  String get snapPermissionsEnableTitle =>
      'Impone alle app di richiedere i permessi di sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Questa è una funzionalità sperimentale per controllare l\'accesso alle tue risorse di sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Attivazione in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Disabilitazione in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get snapPermissionsExperimentalLabel => 'Sperimentale';

  @override
  String get snapPermissionsOtherDescription =>
      'Puoi gestire gli altri permessi in Impostazioni › Applicazioni.';

  @override
  String get snapPermissionsPageTitle => 'Permessi delle applicazioni';

  @override
  String get snapPermissionsErrorTitle => 'Qualcosa è andato storto';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regole',
      one: '1 regola',
      zero: 'nessuna regola',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gestisci i permessi di $interface per $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ancora nessuna regola';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Nessuna app ha ancora richiesto l\'accesso';

  @override
  String get snapRulesRemoveAll => 'Rimuovi tutte le regole';

  @override
  String get snapRulesResetAllPermissions => 'Reimposta tutti i permessi';

  @override
  String get homeInterfacePageTitle => 'Cartella Home';

  @override
  String get homeInterfacePageDescription =>
      'Gestisci i permessi per accedere ai file della tua cartella Home.';

  @override
  String get cameraInterfacePageTitle => 'Fotocamera';

  @override
  String get cameraInterfacePageDescription =>
      'Consenti alle app di accedere alle tue fotocamere.';

  @override
  String get microphoneInterfacePageTitle => 'Microfono';

  @override
  String get microphoneInterfacePageDescription =>
      'Consenti alle app di accedere al tuo microfono.';

  @override
  String get interfacePageTitle => 'Gestione permessi';

  @override
  String get interfacePageLinkLearnMore => 'Per saperne di più';

  @override
  String get interfacePageLinkReportIssues => 'Segnala errori';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n app',
      one: '1 app',
      zero: 'nessuna app',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Crittografia del disco';

  @override
  String get diskEncryptionPageRecoveryKey => 'Chiave di ripristino';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'La chiave di ripristino ti consente di riottenere l\'accesso ai tuoi dati se il disco non riesce a sbloccarsi durante l\'avvio. Salvala in un luogo sicuro.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'La chiave di ripristino ti consente di riottenere l\'accesso ai tuoi dati se il disco non riesce a sbloccarsi durante l\'avvio. Salvala in un luogo sicuro. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Scopri di più sulla crittografia basata sull\'hardware';

  @override
  String get diskEncryptionPageCheckKey =>
      'Verifica la chiave di ripristino...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Verifica la chiave di ripristino';

  @override
  String get diskEncryptionPageCheck => 'Verifica';

  @override
  String get diskEncryptionPageValidKey => 'Chiave valida';

  @override
  String get diskEncryptionPageInvalidKey => 'Chiave non valida';

  @override
  String get diskEncryptionPageEnterKey =>
      'Inserisci la tua chiave di ripristino';

  @override
  String get diskEncryptionPageKeyWorks => 'La chiave di ripristino funziona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Ricorda di conservarla in un luogo sicuro.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'La chiave di ripristino non funziona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Verifica la chiave o sostituiscila con una nuova.';

  @override
  String get diskEncryptionPageError => 'Errore';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Sostituisci la chiave di ripristino...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Sostituisci la chiave di ripristino';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Salva la nuova chiave di ripristino in un luogo sicuro. Una volta sostituita, non potrai più utilizzare la vecchia chiave.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostra codice QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Salva su file';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ho salvato la mia chiave di ripristino in un luogo sicuro';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Sostituisci';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Scarta';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Chiave di ripristino sostituita';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Ricorda di conservarla in un luogo sicuro.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Sostituzione della chiave di ripristino non riuscita';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Si è verificato un errore durante la sostituzione della chiave di ripristino. La vecchia chiave rimarrà valida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Chiave di ripristino della crittografia';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scansiona il codice QR per copiare la chiave di ripristino e salvarla in un luogo sicuro, ad esempio in un gestore di password. Puoi anche scattare una foto per utilizzarla in seguito.';

  @override
  String get diskEncryptionPageClipboardNotification => 'Copiato negli appunti';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copia';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Impostazioni di crittografia non disponibili';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Impossibile recuperare lo stato della crittografia di questo computer.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'La configurazione TPM del computer non è in uno stato supportato.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'La tua versione di snapd non è supportata';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Verifica che Security Center e snapd siano aggiornati.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Security Center non può connettersi all\'interfaccia snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Per risolvere il problema, esegui questo comando nel terminale:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Aggiungi PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Aggiungi passphrase...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Aggiungi passphrase';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Aggiungi PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Dovrai inserire il tuo PIN ogni volta che il computer si avvia. Questo PIN è diverso dalla tua password utente.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Se dimentichi il PIN, puoi riottenere l\'accesso al disco utilizzando la chiave di ripristino.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Dovrai inserire la tua passphrase ogni volta che il computer si avvia. Questa passphrase è diversa dalla tua password utente.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Se dimentichi la passphrase, puoi riottenere l\'accesso al disco utilizzando la chiave di ripristino.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Sicurezza aggiuntiva';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Puoi impostare una passphrase o un PIN per una maggiore sicurezza. Dovrai inserirlo ogni volta che avvii il computer.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Scopri di più';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Aggiungi';

  @override
  String get diskEncryptionPageRemovePinButton => 'Rimuovi PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Rimuovi passphrase...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Aggiunta del PIN in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Aggiunta della passphrase in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Rimozione del PIN in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Rimozione della passphrase in corso, potrebbero essere necessari alcuni secondi...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'File della chiave di ripristino non salvato';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Impossibile salvare il file della chiave di ripristino in una posizione temporanea';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Errore sconosciuto';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Impossibile salvare la chiave di ripristino nel file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Non hai i permessi per scrivere in quella posizione del file.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Non hai i permessi per scrivere in quella cartella. Prova a scegliere una posizione diversa o usa un altro metodo.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Prova una posizione diversa, ad esempio un\'unità rimovibile, oppure usa un altro metodo.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Salva il file della chiave di ripristino';

  @override
  String get recoveryKeyFilePickerFilter => 'File di testo';

  @override
  String get recoveryKeyTPMEnabled =>
      'La crittografia con supporto hardware è attiva';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Le chiavi di crittografia sono archiviate nel Trusted Platform Module (TPM) del tuo computer.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Scopri di più sulla crittografia con supporto hardware';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'La passphrase di crittografia è attiva';

  @override
  String get recoveryKeyPassphraseHeader => 'Modifica passphrase';

  @override
  String get recoveryKeyPassphraseBody =>
      'Devi inserire la tua passphrase ogni volta che avvii il computer.';

  @override
  String get recoveryKeyPassphraseButton => 'Modifica passphrase...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Passphrase attuale';

  @override
  String get recoveryKeyPassphraseNew => 'Nuova passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Conferma passphrase';

  @override
  String get recoveryKeyPassphraseCurrentError => 'Passphrase errata, riprova';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Deve contenere almeno 4 caratteri';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Le passphrase non corrispondono, riprova';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Modifica passphrase';

  @override
  String get recoveryKeyPinEnabled => 'Il PIN di crittografia è attivo';

  @override
  String get recoveryKeyPinHeader => 'PIN di crittografia';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Passphrase di crittografia';

  @override
  String get recoveryKeyPinBody =>
      'Dovrai inserire il PIN ogni volta che avvii il computer.';

  @override
  String get recoveryKeyPinButton => 'Modifica PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN attuale';

  @override
  String get recoveryKeyPinNew => 'Nuovo PIN';

  @override
  String get recoveryKeyPinConfirm => 'Conferma PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN errato, riprova';

  @override
  String get recoveryKeyPinConfirmError => 'I PIN non corrispondono, riprova';

  @override
  String get recoveryKeyPinDialogHeader => 'Modifica PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Mostra';

  @override
  String get recoveryKeyPassphraseHide => 'Nascondi';

  @override
  String get recoveryKeyPassphraseChange => 'Modifica';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN aggiornato';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Il PIN è stato aggiornato correttamente.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Passphrase aggiornata';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'La passphrase è stata aggiornata correttamente.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Passphrase debole, rendila più lunga o complessa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Passphrase discreta, rendila più lunga o complessa per una maggiore sicurezza';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Passphrase sicura';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN debole, rendilo più lungo o meno prevedibile';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN discreto, rendilo più lungo o meno prevedibile per una maggiore sicurezza';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Il PIN è abbastanza lungo';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Si è verificato un errore';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro non è disponibile per questa versione di Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro richiede una versione LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro non è supportato da questa versione di snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Aggiorna snapd per gestire Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro è abilitato';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Sicurezza e conformità di livello aziendale per il tuo computer. Sempre gratuito per uso personale. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Scopri Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Abilita Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Abilita con l\'account Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Potrai creare un account gratuitamente';

  @override
  String get ubuntuProMagicPrompt =>
      'Accedi con il tuo account Ubuntu One o creane uno gratuitamente.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Continua nel browser';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Puoi anche accedere a $attachLink e inserire il codice $attachCode';
  }

  @override
  String get ubuntuProMagicError => 'Impossibile abilitare Ubuntu Pro, riprova';

  @override
  String get ubuntuProEnableToken => 'Abilita con un token';

  @override
  String get ubuntuProEnableTokenError => 'Impossibile abilitare Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Dal tuo amministratore IT o da $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Ottieni un token Ubuntu Pro dal tuo amministratore o da $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Disabilita Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Disabilita';

  @override
  String get ubuntuProDisablePrompt =>
      'La disabilitazione di Ubuntu Pro scollegherà il tuo abbonamento da questa macchina. Vuoi procedere?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'Abilita';

  @override
  String get ubuntuProCancel => 'Annulla';

  @override
  String get ubuntuProFeatureEnableError =>
      'Impossibile abilitare la funzionalità, riprova.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Impossibile disabilitare la funzionalità, riprova.';

  @override
  String get ubuntuProCompliance => 'Conformità e hardening';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Consigliato solo per supportare FedRAMP, HIPAA e altri requisiti di conformità e hardening.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatizza l\'hardening e l\'auditing con benchmark CIS e profili DISA-STIG, consentendo personalizzazioni specifiche per l\'ambiente.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Una certificazione dei moduli crittografici dei governi di Stati Uniti e Canada per la conformità allo standard di protezione dei dati FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Abilita FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'L\'abilitazione di FIPS non può essere annullata e Livepatch verrà disabilitato in modo permanente.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Scegli l\'opzione FIPS preferita';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS con aggiornamenti';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installa pacchetti convalidati FIPS 140-2 e consente regolari aggiornamenti di sicurezza.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS senza aggiornamenti';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installa pacchetti convalidati FIPS 140-2. Questi non verranno aggiornati fino alla prossima ricertificazione.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Documentazione sulla conformità alla sicurezza';

  @override
  String get ubuntuProESMTitle => 'Expanded Security Maintenance (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM fornisce 10 anni di patch di sicurezza per l\'intero archivio Ubuntu. Ottieni una gestione continua delle vulnerabilità per CVE critiche, elevate e alcune CVE di gravità media selezionate.';

  @override
  String get ubuntuProESMMainTitle => 'Pacchetti principali (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Aggiornamenti di sicurezza per i pacchetti Main di Ubuntu fino al $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Pacchetti Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Aggiornamenti di sicurezza aggiuntivi per i pacchetti Universe di Ubuntu fino al $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Abilita Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Applica aggiornamenti di sicurezza del kernel mentre il sistema è in esecuzione';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Mostra lo stato di Livepatch nella barra superiore';
}
