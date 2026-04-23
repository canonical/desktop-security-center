// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Κέντρο Ασφαλείας';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Να επιτρέπεται μέχρι να αποσυνδεθείτε';

  @override
  String get snapdRuleCategorySessionDenied =>
      'Να απορρίπτεται μέχρι να αποσυνδεθείτε';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Να επιτρέπεται πάντα';

  @override
  String get snapdRuleCategoryForeverDenied => 'Να απορρίπτεται πάντα';

  @override
  String get snapPermissionReadLabel => 'Ανάγνωση';

  @override
  String get snapPermissionWriteLabel => 'Εγγραφή';

  @override
  String get snapPermissionExecuteLabel => 'Εκτέλεση';

  @override
  String get snapPermissionAccessLabel => 'Πρόσβαση';

  @override
  String get snapPermissionsEnableTitle =>
      'Να απαιτείται από τις εφαρμογές να ζητούν άδειες συστήματος';

  @override
  String get snapPermissionsEnableWarning =>
      'Αυτή είναι μια πειραματική λειτουργία για τον έλεγχο της πρόσβασης στους πόρους του συστήματός σας.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Ενεργοποίηση, αυτό μπορεί να διαρκέσει λίγα δευτερόλεπτα...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Απενεργοποίηση, αυτό μπορεί να διαρκέσει λίγα δευτερόλεπτα...';

  @override
  String get snapPermissionsExperimentalLabel => 'Πειραματικά';

  @override
  String get snapPermissionsOtherDescription =>
      'Μπορείτε να διαχειριστείτε άλλες άδειες στις Ρυθμίσεις › Εφαρμογές.';

  @override
  String get snapPermissionsPageTitle => 'Άδειες Εφαρμογής';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n κανόνες',
      one: '1 κανόνας',
      zero: 'κανένας κανόνας',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Διαχείριση αδειών του $interface για το πακέτο $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Κανένας κανόνας ακόμα';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Καμία εφαρμογή δεν έχει ζητήσει πρόσβαση ακόμα';

  @override
  String get snapRulesRemoveAll => 'Αφαίρεση όλων των κανόνων';

  @override
  String get snapRulesResetAllPermissions => 'Επαναφορά όλων των αδειών';

  @override
  String get homeInterfacePageTitle => 'Προσωπικός φάκελος';

  @override
  String get homeInterfacePageDescription =>
      'Διαχείριση αδειών για πρόσβαση σε αρχεία στον Προσωπικό σας φάκελο.';

  @override
  String get cameraInterfacePageTitle => 'Κάμερα';

  @override
  String get cameraInterfacePageDescription =>
      'Να επιτρέπεται στις εφαρμογές να έχουν πρόσβαση στις κάμερές σας.';

  @override
  String get microphoneInterfacePageTitle => 'Μικρόφωνο';

  @override
  String get microphoneInterfacePageDescription =>
      'Να επιτρέπεται στις εφαρμογές να έχουν πρόσβαση στο μικρόφωνό σας.';

  @override
  String get interfacePageTitle => 'Διαχείριση αδειών';

  @override
  String get interfacePageDescription =>
      'Οι εφαρμογές με αυστηρό περιορισμό θα σας ζητούν άδεια πριν αποκτήσουν πρόσβαση σε αρχεία και φακέλους. Αυτή η λειτουργία είναι πειραματική και υπόκειται σε αλλαγές.';

  @override
  String get interfacePageLinkLearnMore => 'Μάθετε περισσότερα';

  @override
  String get interfacePageLinkGiveFeedback => 'Υποβολή σχολίων';

  @override
  String get interfacePageLinkReportIssues => 'Αναφορά προβλήματος';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n εφαρμογές',
      one: '1 εφαρμογή',
      zero: 'καμία εφαρμογή',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Κρυπτογράφηση δίσκου';

  @override
  String get diskEncryptionPageRecoveryKey => 'Κλειδί ανάκτησης';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Το κλειδί ανάκτησης σάς επιτρέπει να ανακτήσετε την πρόσβαση στα δεδομένα σας εάν το ξεκλείδωμα του δίσκου αποτύχει κατά την εκκίνηση. Αποθηκεύστε το σε ασφαλές μέρος.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Το κλειδί ανάκτησης σάς επιτρέπει να ανακτήσετε την πρόσβαση στα δεδομένα σας εάν το ξεκλείδωμα του δίσκου αποτύχει κατά την εκκίνηση. Αποθηκεύστε το σε ασφαλές μέρος. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Μάθετε περισσότερα για την κρυπτογράφηση με υποστήριξη υλικού';

  @override
  String get diskEncryptionPageCheckKey => 'Έλεγχος κλειδιού ανάκτησης...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Έλεγχος κλειδιού ανάκτησης';

  @override
  String get diskEncryptionPageCheck => 'Έλεγχος';

  @override
  String get diskEncryptionPageValidKey => 'Έγκυρο κλειδί';

  @override
  String get diskEncryptionPageInvalidKey => 'Μη έγκυρο κλειδί';

  @override
  String get diskEncryptionPageEnterKey => 'Εισαγάγετε το κλειδί ανάκτησης';

  @override
  String get diskEncryptionPageKeyWorks => 'Το κλειδί ανάκτησης είναι έγκυρο';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Θυμηθείτε να το φυλάξετε σε ασφαλές μέρος.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Το κλειδί ανάκτησης δεν είναι έγκυρο';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Ελέγξτε το κλειδί ή αντικαταστήστε το με ένα νέο.';

  @override
  String get diskEncryptionPageError => 'Σφάλμα';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Αντικατάσταση κλειδιού ανάκτησης...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Αντικατάσταση κλειδιού ανάκτησης';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Αποθηκεύστε το νέο κλειδί ανάκτησης σε ασφαλές μέρος. Μόλις το αντικαταστήσετε, δεν θα μπορείτε πλέον να χρησιμοποιήσετε το παλιό κλειδί.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Εμφάνιση κώδικα QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Αποθήκευση σε αρχείο';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Αποθήκευσα το κλειδί ανάκτησης σε ασφαλές μέρος';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Αντικατάσταση';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Απόρριψη';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Το κλειδί ανάκτησης αντικαταστάθηκε';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Θυμηθείτε να το φυλάξετε σε ασφαλές μέρος.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Απέτυχε η αντικατάσταση του κλειδιού ανάκτησης';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Παρουσιάστηκε ένα σφάλμα κατά την αντικατάσταση του κλειδιού ανάκτησης· το παλιό σας κλειδί παραμένει σε ισχύ.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Κλειδί ανάκτησης κρυπτογράφησης';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Σαρώστε τον κώδικα QR για να αντιγράψετε το κλειδί ανάκτησης και αποθηκεύστε το σε ένα ασφαλές μέρος, όπως ένας διαχειριστής κωδικών πρόσβασης. Μπορείτε επίσης να το βγάλετε φωτογραφία για μελλοντική χρήση.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Αντιγράφηκε στο πρόχειρο';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Αντιγραφή';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Οι ρυθμίσεις κρυπτογράφησης δεν είναι διαθέσιμες';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Αποτυχία ανάκτησης της κατάστασης κρυπτογράφησης αυτού του υπολογιστή.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Η διαμόρφωση του TPM του υπολογιστή σας δεν βρίσκεται σε υποστηριζόμενη κατάσταση.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Η έκδοση του snapd που διαθέτετε δεν υποστηρίζεται';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Βεβαιωθείτε ότι το Κέντρο Ασφαλείας και το snapd είναι ενημερωμένα.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Το Κέντρο Ασφαλείας δεν μπορεί να συνδεθεί στη διεπαφή του snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Για να το διορθώσετε αυτό, εκτελέστε την εξής εντολή στο τερματικό:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Προσθήκη PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Προσθήκη συνθηματικής φράσης...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Προσθήκη συνθηματικής φράσης';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Προσθήκη PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Θα χρειαστεί να εισάγετε το PIN σας κάθε φορά που εκκινείται ο υπολογιστής σας. Αυτό το PIN είναι διαφορετικό από τον κωδικό πρόσβασης του χρήστη σας.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Αν ξεχάσετε το PIN σας, μπορείτε να αποκτήσετε ξανά πρόσβαση στον δίσκο χρησιμοποιώντας το κλειδί ανάκτησης.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Θα χρειαστεί να εισάγετε τη συνθηματική σας φράση κάθε φορά που εκκινείται ο υπολογιστής σας. Αυτή η συνθηματική φράση είναι διαφορετικό από τον κωδικό πρόσβασης του χρήστη σας.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Αν ξεχάσετε τη συνθηματική φράση σας, μπορείτε να αποκτήσετε ξανά πρόσβαση στον δίσκο χρησιμοποιώντας το κλειδί ανάκτησης.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Πρόσθετη ασφάλεια';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Μπορείτε να ορίσετε μια συνθηματική φράση ή ένα PIN για πρόσθετη ασφάλεια. Θα χρειαστεί να το εισάγετε κάθε φορά που εκκινείται ο υπολογιστής σας.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Μάθετε περισσότερα';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Προσθήκη';

  @override
  String get diskEncryptionPageRemovePinButton => 'Αφαίρεση PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Αφαίρεση συνθηματικής φράσης...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Γίνεται προσθήκη PIN, αυτό μπορεί να διαρκέσει μερικά δευτερόλεπτα...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Γίνεται προσθήκη συνθηματικής φράσης, αυτό μπορεί να διαρκέσει μερικά δευτερόλεπτα...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Γίνεται αφαίρεση του PIN, αυτό μπορεί να διαρκέσει μερικά δευτερόλεπτα...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Γίνεται αφαίρεση της συνθηματικής φράσης, αυτό μπορεί να διαρκέσει μερικά δευτερόλεπτα...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Το αρχείο κλειδιού ανάκτησης δεν αποθηκεύτηκε';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Το αρχείο κλειδιού ανάκτησης δεν μπορεί να αποθηκευτεί σε προσωρινή τοποθεσία';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Άγνωστο σφάλμα';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Αποτυχία αποθήκευσης του κλειδιού ανάκτησης σε αρχείο';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Δεν έχετε δικαίωμα εγγραφής σε αυτή τη θέση αρχείου.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Δεν έχετε δικαίωμα εγγραφής σε αυτόν τον φάκελο. Δοκιμάστε μια διαφορετική τοποθεσία ή χρησιμοποιήστε μια άλλη μέθοδο.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Δοκιμάστε μια διαφορετική τοποθεσία, όπως μια αφαιρούμενη μονάδα δίσκου, ή χρησιμοποιήστε μια άλλη μέθοδο.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Αποθήκευση αρχείου κλειδιού ανάκτησης';

  @override
  String get recoveryKeyFilePickerFilter => 'Αρχεία κειμένου';

  @override
  String get recoveryKeyTPMEnabled =>
      'Η κρυπτογράφηση με υποστήριξη υλικού είναι ενεργοποιημένη';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Τα κλειδιά κρυπτογράφησης είναι αποθηκευμένα στη Μονάδα Έμπιστης Πλατφόρμας (TPM) του υπολογιστή σας.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Μάθετε περισσότερα για την κρυπτογράφηση με υποστήριξη υλικού';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Η συνθηματική φράση κρυπτογράφησης είναι ενεργοποιημένη';

  @override
  String get recoveryKeyPassphraseHeader => 'Αλλαγή συνθηματικής φράσης';

  @override
  String get recoveryKeyPassphraseBody =>
      'Θα χρειαστεί να εισάγετε τη συνθηματική φράση σας κάθε φορά που εκκινείται ο υπολογιστής σας.';

  @override
  String get recoveryKeyPassphraseButton => 'Αλλαγή συνθηματικής φράσης...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Τρέχουσα συνθηματική φράση';

  @override
  String get recoveryKeyPassphraseNew => 'Νέα συνθηματική φράση';

  @override
  String get recoveryKeyPassphraseConfirm => 'Επιβεβαίωση συνθηματικής φράσης';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Μη έγκυρη συνθηματική φράση, δοκιμάστε ξανά';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Πρέπει να έχει μήκος τουλάχιστον 4 χαρακτήρων';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Οι συνθηματικές φράσεις δεν ταιριάζουν, δοκιμάστε ξανά';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Αλλαγή συνθηματικής φράσης';

  @override
  String get recoveryKeyPinEnabled =>
      'Το PIN κρυπτογράφησης είναι ενεργοποιημένο';

  @override
  String get recoveryKeyPinHeader => 'PIN κρυπτογράφησης';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Συνθηματική φράση κρυπτογράφησης';

  @override
  String get recoveryKeyPinBody =>
      'Πρέπει να εισαγάγετε το PIN σας κάθε φορά που ξεκινά ο υπολογιστής σας.';

  @override
  String get recoveryKeyPinButton => 'Αλλαγή PIN...';

  @override
  String get recoveryKeyPinCurrent => 'Τρέχον PIN';

  @override
  String get recoveryKeyPinNew => 'Νέο PIN';

  @override
  String get recoveryKeyPinConfirm => 'Επιβεβαίωση PIN';

  @override
  String get recoveryKeyPinCurrentError => 'Μη έγκυρο PIN, δοκιμάστε ξανά';

  @override
  String get recoveryKeyPinConfirmError =>
      'Τα PIN δεν ταιριάζουν, δοκιμάστε ξανά';

  @override
  String get recoveryKeyPinDialogHeader => 'Αλλαγή PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Εμφάνιση';

  @override
  String get recoveryKeyPassphraseHide => 'Απόκρυψη';

  @override
  String get recoveryKeyPassphraseChange => 'Αλλαγή';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'Το PIN ενημερώθηκε';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Το PIN σας ενημερώθηκε με επιτυχία.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Η συνθηματική φράση ενημερώθηκε';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Η συνθηματική σας φράση ενημερώθηκε με επιτυχία.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Ασθενής συνθηματική φράση, κάντε την μεγαλύτερη ή πιο σύνθετη';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Μέτρια συνθηματική φράση, κάντε την μεγαλύτερη ή πιο σύνθετη για καλύτερη ασφάλεια';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Ισχυρή συνθηματική φράση';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Ασθενές PIN, κάντε το μεγαλύτερο ή λιγότερο προβλέψιμο';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Μέτριο PIN, κάντε το μεγαλύτερο ή λιγότερο προβλέψιμο για καλύτερη ασφάλεια';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Το PIN είναι αρκετά μεγάλο';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Κάτι πήγε στραβά';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Το Ubuntu Pro δεν είναι διαθέσιμο για αυτήν την έκδοση του Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Το Ubuntu Pro απαιτεί μια έκδοση LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Το Ubuntu Pro δεν υποστηρίζεται από αυτήν την έκδοση του snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ενημερώστε το snapd για τη διαχείριση του Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Το Ubuntu Pro είναι ενεργοποιημένο';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Ασφάλεια και συμμόρφωση επιπέδου επιχείρησης για τον υπολογιστή σας. Πάντα δωρεάν για προσωπική χρήση. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Μάθετε περισσότερα για το Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Ενεργοποίηση του Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Ενεργοποίηση με λογαριασμό Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Θα μπορέσετε να δημιουργήσετε έναν λογαριασμό δωρεάν';

  @override
  String get ubuntuProMagicPrompt =>
      'Συνδεθείτε με τον λογαριασμό σας στο Ubuntu One ή δημιουργήστε έναν δωρεάν.';

  @override
  String get ubuntuProMagicContinueInBrowser =>
      'Συνέχεια στο πρόγραμμα περιήγησης';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Μπορείτε επίσης να συνδεθείτε στη διεύθυνση $attachLink και να εισαγάγετε τον κωδικό $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Αδυναμία ενεργοποίησης του Ubuntu Pro, δοκιμάστε ξανά';

  @override
  String get ubuntuProEnableToken => 'Ενεργοποίηση με διακριτικό (token)';

  @override
  String get ubuntuProEnableTokenError =>
      'Αδυναμία ενεργοποίησης του Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Από τον διαχειριστή IT σας ή από το $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Λάβετε ένα διακριτικό (token) Ubuntu Pro από τον διαχειριστή σας ή από το $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Διακριτικό';

  @override
  String get ubuntuProDisablePro => 'Απενεργοποίηση του Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Απενεργοποίηση';

  @override
  String get ubuntuProDisablePrompt =>
      'Η απενεργοποίηση του Ubuntu Pro θα αποσυνδέσει τη συνδρομή σας από αυτό το μηχάνημα. Θέλετε να συνεχίσετε;';

  @override
  String get ubuntuProEnable => 'Ενεργοποίηση';

  @override
  String get ubuntuProCancel => 'Ακύρωση';

  @override
  String get ubuntuProFeatureEnableError =>
      'Αδυναμία ενεργοποίησης της λειτουργίας, δοκιμάστε ξανά.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Αδυναμία απενεργοποίησης της λειτουργίας, δοκιμάστε ξανά.';

  @override
  String get ubuntuProCompliance => 'Συμμόρφωση και θωράκιση';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Συνιστάται μόνο για υποστήριξη σε απαιτήσεις FedRAMP, HIPAA και άλλες ανάγκες συμμόρφωσης και θωράκισης.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Οδηγός Ασφάλειας Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Αυτοματοποιεί τη θωράκιση και τον έλεγχο με προφίλ συμμόρφωσης CIS benchmark και DISA-STIG, επιτρέποντας παράλληλα προσαρμογές ανάλογα με το περιβάλλον.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Μια πιστοποίηση κρυπτογραφικών μονάδων των κυβερνήσεων των ΗΠΑ και του Καναδά για τη συμμόρφωση με το πρότυπο προστασίας δεδομένων FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Ενεργοποίηση FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Η ενεργοποίηση του FIPS δεν μπορεί να αναιρεθεί και το Livepatch θα απενεργοποιηθεί μόνιμα.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Επιλέξτε την επιθυμητή επιλογή FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS με ενημερώσεις';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Εγκαθιστά πακέτα επικυρωμένα κατά FIPS 140-2 και επιτρέπει τακτικές ενημερώσεις ασφαλείας.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS χωρίς ενημερώσεις';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Εγκαθιστά πακέτα επικυρωμένα κατά FIPS 140-2. Αυτά δεν θα ενημερωθούν μέχρι την επόμενη επαναπιστοποίηση.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Τεκμηρίωση συμμόρφωσης ασφαλείας';

  @override
  String get ubuntuProESMTitle => 'Διευρυμένη Συντήρηση Ασφαλείας (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'Το ESM παρέχει 10 χρόνια διορθώσεων ασφαλείας για περισσότερα από 25.000 πακέτα ανοιχτού κώδικα. Λάβετε συνεχή διαχείριση ευπαθειών για κρίσιμα, υψηλά και μεσαίας προτεραιότητας CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Κύρια πακέτα (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Ενημερώσεις ασφαλείας για 2.300 πακέτα του Ubuntu Main μέχρι το $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Πακέτα Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Πρόσθετες ενημερώσεις ασφαλείας για πάνω από 23.000 πακέτα του Ubuntu Universe μέχρι το $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch για τον πυρήνα';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Ενεργοποίηση του Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Εφαρμογή των ενημερώσεων ασφαλείας του πυρήνα ενώ το σύστημα βρίσκεται σε λειτουργία';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Εμφάνιση της κατάστασης του Livepatch στην πάνω μπάρα';
}
