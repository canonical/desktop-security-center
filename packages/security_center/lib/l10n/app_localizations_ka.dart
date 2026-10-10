// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'უსაფრთხოების ცენტრი';

  @override
  String get snapdRuleCategorySessionAllowed => 'დაშვება გასვლამდე';

  @override
  String get snapdRuleCategorySessionDenied => 'აკრძალვა გასვლამდე';

  @override
  String get snapdRuleCategoryForeverAllowed => 'ყოველთვის დაშვება';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Update Permissions';

  @override
  String get snapdRuleCategoryForeverDenied => 'ყოველთვის აკრძალვა';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Allow temporarily';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Deny temporarily';

  @override
  String get snapdRuleCategoryAskAlways => 'Ask always';

  @override
  String get snapPermissionReadLabel => 'წაკითხვა';

  @override
  String get snapPermissionWriteLabel => 'ჩაწერა';

  @override
  String get snapPermissionExecuteLabel => 'შესრულება';

  @override
  String get snapPermissionAccessLabel => 'წვდომა';

  @override
  String get snapPermissionsEnableTitle =>
      'აპებისთვის სისტემური უფლებების მოთხოვნის აუცილებლობა';

  @override
  String get snapPermissionsEnableWarning =>
      'ეს ექსპერიმენტული ფუნქციაა თქვენი სისტემის რესურსებთან წვდომის მართვისთვის.';

  @override
  String get snapPermissionsEnablingLabel =>
      'მიმდინარეობს ჩართვა. ამას, შეიძლება, რამდენიმე წამი დასჭირდეს...';

  @override
  String get snapPermissionsDisablingLabel =>
      'ითიშება. ამას, შეიძლება რამდენიმე წამი დასჭირდეს...';

  @override
  String get snapPermissionsExperimentalLabel => 'ექსპერიმენტული';

  @override
  String get snapPermissionsOtherDescription =>
      'სხვა წვდომების მართვა შეგიძლიათ მენიუში მორგება > აპლიკაციები.';

  @override
  String get snapPermissionsPageTitle => 'აპის წვდომები';

  @override
  String get snapPermissionsErrorTitle => 'რაღაც არასწორია';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n წესი',
      one: '1 წესი',
      zero: 'წესების გარეშე',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-ის წვდომების მართვა $snap-სთვის.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'ჯერ წესები არაა';

  @override
  String get cameraRulesPageEmptyTileLabel => 'ჯერ აპებს წვდომა არ მოუთხოვიათ';

  @override
  String get snapRulesRemoveAll => 'ყველა წესის წაშლა';

  @override
  String get snapRulesResetAllPermissions => 'ყველა წვდომის ჩამოყრა';

  @override
  String get homeInterfacePageTitle => 'საწყისის საქაღალდე';

  @override
  String get homeInterfacePageDescription =>
      'მართეთ წვდომები თქვენს საწყის საქაღალდეში ფაილებთან წვდომისთვის.';

  @override
  String get cameraInterfacePageTitle => 'კამერა';

  @override
  String get cameraInterfacePageDescription =>
      'აპებისთვის კამერაზე წვდომის უფლების მიცემა.';

  @override
  String get microphoneInterfacePageTitle => 'მიკროფონი';

  @override
  String get microphoneInterfacePageDescription =>
      'აპებისთვის თქვენს მიკროფონთან წვდომის მიცემა.';

  @override
  String get interfacePageTitle => 'წვდომების მართვა';

  @override
  String get interfacePageLinkLearnMore => 'გაიგეთ მეტი';

  @override
  String get interfacePageLinkReportIssues => 'პრობლემების ანგარიში';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n აპი',
      one: '1 აპი',
      zero: 'აპების გარეშე',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'დისკის დაშიფვრა';

  @override
  String get diskEncryptionPageRecoveryKey => 'აღდგენის გასაღები';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'აღდგენის გასაღები საშუალებას გაძლევთ, დაიბრუნოთ წვდომა თქვენს მონაცემებზე, თუ სისტემის ჩატვირთვისას დისკის გაშიფვრას ვერ შეძლებთ. შეინახეთ ის სადმე უსაფრთხო ადგილას.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'აღდგენის გასაღები საშუალებას გაძლევთ, დაიბრუნოთ წვდომა თქვენს მონაცემებზე, თუ სისტემის ჩატვირთვისას დისკის გაშიფვრას ვერ შეძლებთ. შეინახეთ ის სადმე უსაფრთხო ადგილას. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'გაიგეთ მეტი აპარატურით მხარდაჭერილი დაშიფვრის შესახებ';

  @override
  String get diskEncryptionPageCheckKey => 'აღდგენის გასაღების შემოწმება...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'აღდგენის გასაღების შემოწმება';

  @override
  String get diskEncryptionPageCheck => 'შემოწმება';

  @override
  String get diskEncryptionPageValidKey => 'სწორი გასაღები';

  @override
  String get diskEncryptionPageInvalidKey => 'არასწორი გასაღები';

  @override
  String get diskEncryptionPageEnterKey => 'შეიყვანეთ თქვენი აღდგენის გასაღები';

  @override
  String get diskEncryptionPageKeyWorks => 'აღდგენის გასაღები მუშაობს';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'დაიმახსოვრეთ, ის სადმე უსაფრთხო ადგილას უნდა შეინახოთ.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'აღდგენის გასაღები არ მუშაობს';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'შეამოწმეთ გასაღები, ან ჩაანაცვლეთ ის ახლით.';

  @override
  String get diskEncryptionPageError => 'შეცდომა';

  @override
  String get diskEncryptionPageReplaceButton =>
      'აღდგენის გასაღების ჩანაცვლება...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'აღდგენის გასაღების შეცვლა';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'შეინახეთ ახალი აღდგენის გასაღები სადმე უსაფრთხო ადგილას. თუ მას შეცვლით, ძველ გასაღებს ვეღარ გამოიყენებთ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR კოდის ჩვენება';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'შენახვა ფაილში';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'მე შევინახე ჩემი აღდგენის გასაღები უსაფრთხო ადგილას';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'ჩანაცვლება';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'მოცილება';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'აღდგენის გასაღები შეიცვალა';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'დაიმახსოვრეთ, რომ ის სადმე უსაფრთხო ადგილას უნდა შეინახოთ.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'აღდგენის გასაღების შეცვლა ჩავარდა';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'რაღაც არასწორად წავიდა თქვენი აღდგენის გასაღების შენახვისას. თქვენი ძველი გასაღები გამოყენებადი დარჩა.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - დაშიფვრის აღდგენის გასაღები';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'დაასკანერეთ QR კოდი, რომ დააკოპიროთ აღდგენის გასაღები და შეინახეთ ის სადმე უსაფრთხო ადგილას, მაგალითად, პაროლების მმართველში. ასევე შეგიძლიათ, მისი სურათი გადაიღოთ.';

  @override
  String get diskEncryptionPageClipboardNotification => 'დაკოპირდა ბუფერში';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'კოპირება';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'დაშიფვრის პარამეტრები ხელმისაწვდომი არაა';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'ამ კომპიუტერის დაშიფვრის სტატუსის მიღება ჩავარდა.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'თქვენი კომპიუტერის TPM-ის კონფიგურაცია მხარდაჭერილ მდგომარეობაში არაა.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'თქვენი snapd-ის ვერსია მხარდაჭერილი არაა';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'შეამოწმეთ, არის თუ არა უსაფრთხოების ცენტრი და snapd უკანასკნელი ვერსიის.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'უსაფრთხოების ცენტრი ვერ დაუკავშირდა spand-ის ინტერფეისს';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'რომ გაასწოროთ, ტერმინალში ეს ბრძანება გაუშვით:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'PIN-კოდის დამატება...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'საკვანზო ფრაზის დამატება...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'საკვანძო ფრაზის დამატება';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PIN-კოდის დამატება';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'PIN-კოდის შეყვანა ყოველ ჯერზე დაგჭირდებათ, როცა კომპიუტერს ჩართავთ. ეს PIN-კოდი მომხმარებლის პაროლისგან განსხვავდება.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'თუ PIN-კოდი დაგავიწყდებათ, დისკთან წვდომის დაბრუნება აღდგენის გასაღებით შეგეძლებათ.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'საკვანძო ფრაზის შეყვანა დაგჭირდებათ ყოველ ჯერზე, როცა კომპიუტერს ჩართავთ. ეს საკვანძო ფრაზა განსხვავდება თქვენი მომხმარებლის პაროლისგან.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'თუ თქვენი საკვანძო ფრაზა დაგავიწყდათ, დისკთან წვდომის დაბრუნება აღდგენის გასაღებით შეგიზლიათ.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'დამატებითი უსაფრთხოება';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'დამატებითი უსაფრთხოებისთვის შეგიძლიათ, საკვანძო ფრაზა, ან PIN-კოდი დააყენოთ. მათი შეყვანა ყოველ ჯერზე დაგჭირდებათ, როცა კომპიუტერს ჩართავთ.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'გაიგეთ მეტი';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'დამატება';

  @override
  String get diskEncryptionPageRemovePinButton => 'PIN-კოდის მოცილება...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'საკვანძო ფრაზის მოცილება...';

  @override
  String get diskEncryptionPageAddingPin =>
      'მიმდინარეობს PIN-კოდის დამატება. ამას, შეიძლება, რამდენიმე წამი დასჭირდეს...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'მიმდინარეობს საკვაძო ფრაზის დამატება. ამას, შეიძლება, რამდენიმე წამი დასჭირდეს...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'მიმდინარეობს PIN-კოდის წაშლა. ამას, შეიძლება, რამდენიმე წამი დასჭირდეს...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'მიმდინარეობს საკვანძო ფრაზის წაშლა. ამას, შეიძლება, რამდენიმე წამი დასჭირდეს...';

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
      'აღდგენის გასაღების ფაილი შენახული არაა';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'აღდგენის გასაღების ფაილს დროებით ადგილას ვერ შეინახავთ';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'უცნობი შეცდომა';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'თქვენი აღდგენის გასაღების ფაილში შენახვა ჩავარდა';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'თქვენ არ გაქვთ ამ ფაილის მდებარეობაზე ჩაწერის უფლება.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'თქვენ არ გაქვთ იმ საქაღალდეში ჩაწერის უფლება. სცადეთ სხვა მდებარეობა, ან გამოიყენეთ სხვა მეთოდი.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'სცადეთ სხვა მდებარეობა. მაგალითად: მოხსნადი დისკი, ან გამოიყენეთ სხვა მეთოდი.';

  @override
  String get recoveryKeyFilePickerTitle => 'აღდგენის გასაღების ფაილის შენახვა';

  @override
  String get recoveryKeyFilePickerFilter => 'ტექსტური ფაილები';

  @override
  String get recoveryKeyTPMEnabled =>
      'აპარატურით მხარდაჭერილი დაშიფვრა ჩართულია';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'დაშიფვრის გასაღებები დამახსოვრებული თქვენი კომპიუტერის სანდო პლატფორმის მოდულში (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'გაიგეთ მეტი აპარატურით მხარდაჭერილი დაშიფვრის შესახებ';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'დაშიფვრის საკვანძო ფრაზა ჩართულია';

  @override
  String get recoveryKeyPassphraseHeader => 'საკვანძო ფრაზის შეცვლა';

  @override
  String get recoveryKeyPassphraseBody =>
      'საკვანძო ფრაზა უნდა შეიყვანოთ ყოველ ჯერზე, როცა კომპიუტერი გაეშვება.';

  @override
  String get recoveryKeyPassphraseButton => 'საკვანძო ფრაზის შეცვლა...';

  @override
  String get recoveryKeyPassphraseCurrent => 'მიმდინარე საკვანძო ფრაზა';

  @override
  String get recoveryKeyPassphraseNew => 'ახალი საკვანძო ფრაზა';

  @override
  String get recoveryKeyPassphraseConfirm => 'საკვანძო ფრაზის დადასტურება';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'არასწორი საკვანძო ფრაზა. თავიდან სცადეთ';

  @override
  String get recoveryKeyPassphraseNewError =>
      'უნდა შეიცავდეს, სულ ცოტა, 4 სიმბოლოს';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'საკვანძო ფრაზები არ ემთხვევა. თავიდან სცადეთ';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'საკვანძო ფრაზის შეცვლა';

  @override
  String get recoveryKeyPinEnabled => 'დაშიფვრის PIN-კოდი ჩართულია';

  @override
  String get recoveryKeyPinHeader => 'დაშიფვრის PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'დაშიფვრის საკვანძო ფრაზა';

  @override
  String get recoveryKeyPinBody =>
      'PIN-კოდის შეყვანა ყოველ ჯერზეა საჭირო, როცა თქვენი კომპიუტერი გაეშვება.';

  @override
  String get recoveryKeyPinButton => 'PIN-ის შეცვლა...';

  @override
  String get recoveryKeyPinCurrent => 'მიმდინარე PIN-კოდი';

  @override
  String get recoveryKeyPinNew => 'ახალი PIN-კოდი';

  @override
  String get recoveryKeyPinConfirm => 'დაადასტურეთ PIN-კოდი';

  @override
  String get recoveryKeyPinCurrentError => 'არასწორი PIN-კოდი. თავიდან სცადეთ';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-კოდები არ ემთხვევა. თავიდან სცადეთ';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN-კოდის შეცვლა';

  @override
  String get recoveryKeyPassphraseShow => 'ჩვენება';

  @override
  String get recoveryKeyPassphraseHide => 'დამალვა';

  @override
  String get recoveryKeyPassphraseChange => 'შეცვლა';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-კოდი განახლდა';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'თქვენი PIN-კოდი წარმატებით განახლდა.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'საკვანძო ფრაზა განახლდა';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'თქვენი საკვანძო ფრაზა წარმატებით განახლდა.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'საკვანძო ფრაზა სუსტია. დააგრძელეთ, ან გაართულეთ ის';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'საკვანძო ფრაზა დამაკმაყოფილებელია. უკეთესი უსაფრთხოებისთვის დააგრძელეთ, ან გაართულეთ ის';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'ძლიერი საკვანძო ფრაზა';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'სუსტი PIN-კოდი. დააგრძელეთ, ან გაართულეთ ის';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN-კოდი დამაკმაყოფილებელია. უკეთესი უსაფრთხოებისთვის დააგრძელეთ, ან ნაკლებად ადვილად გამოსაცნობი გახადეთ ის';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-კოდი საკმარისად გრძელია';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'რაღაც არასწორია';

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
      'Ubuntu-ის ამ ვერსიისთვის Ubuntu ხელმისაწვდომი არაა';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro ითხოვს LTS გამოცემას';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'snapd-ის ამ ვერსიას Ubuntu Pro-ის მხარდაჭერა არ გააჩნია';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Ubuntu Pro-ის სამართავად განაახლეთ snapd';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro ჩართულია';

  @override
  String get ubuntuProLoadingLabel => 'This may take a few seconds...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'საწარმოო დონის უსაფრთხოება და სტანდარტებთან თავსებადობა თქვენი კომპიუტერისთვის. ყოველთვის უფასო პირადი გამოყენებისთვის. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'გაიგეთ მეტი Ubunu Pro-ის შესახებ';

  @override
  String get ubuntuProEnablePro => 'Ubuntu Pro-ის ჩართვა';

  @override
  String get ubuntuProEnableMagic => 'ჩართვა Ubuntu One ანგარიშთან ერთად';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'ანგარიშის შექმნა უფასოდ შეგეძლებათ';

  @override
  String get ubuntuProMagicPrompt =>
      'შედით თქვენი Ubuntu One-ის ანგარიშით, ან შექმენით ის უფასოდ.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'ბრაუზერში გაგრძელება';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'შეგიძლიათ, შეხვიდეთ მისამართზე $attachLink და შეიყვანოთ კოდი $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Ubuntu Pro-ის ჩართვა შეუძლებელია. კიდევ სცადეთ';

  @override
  String get ubuntuProEnableToken => 'ჩართვა ტოკენით';

  @override
  String get ubuntuProEnableTokenError => 'Ubuntu Pro-ის ჩართვა შეუძლებელია';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'თქვენი IT ადმინისტრატორისგან, ან ბმულიდან $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'მიიღეთ Ubuntu Pro-ის ტოკენი თქვენი ადმინისტრატორისგან, ან ბმულიდან $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'ტოკენი';

  @override
  String get ubuntuProDisablePro => 'Ubuntu Pro-ის გამორთვა';

  @override
  String get ubuntuProDisable => 'გამორთვა';

  @override
  String get ubuntuProDisablePrompt =>
      'Ubuntu Pro-ის გამორთვა გააუქმებს ამ მანქანის გამოწერას. გააგრძელებთ?';

  @override
  String get ubuntuProDisableError => 'Could not disable Ubuntu Pro, try again';

  @override
  String get ubuntuProEnable => 'ჩართვა';

  @override
  String get ubuntuProCancel => 'გაუქმება';

  @override
  String get ubuntuProFeatureEnableError =>
      'ამ ფუნქციის ჩართვა შეუძლებელია. კიდევ სცადეთ.';

  @override
  String get ubuntuProFeatureDisableError =>
      'ამ ფუნქციის გამორთვა შეუძლებელია. კიდევ სცადეთ.';

  @override
  String get ubuntuProCompliance => 'თავსებადობა და გაძლიერება';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'მხოლოდ, რეკომენდებულია, FedRAMP, HIPAA და სხვა სტანდარტებთან თავსებადობისა და უსაფრთხოების გაძლიერების მოთხოვნებისთვის.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Ubuntu-ის უსაფრთხოების სახელმძღვანელო (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'ახდენს უსაფრთხოების გაძლიერებისა და აუდიტის ავტომატიზაციას CIS წარმადობის შემოწმებითა და DISA-STIG პროფილით გარემოზე დამოკიდებული ცვლილებების შეტანის საშუალებით.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'აშშ-ისა და კანადის მთავრობების კრიპტოგრაფიული მოდულის სერტიფიკაცია FIPS 140-2 მონაცემების დაცვის სტანდარტებთან თავსებადობის შესახებ.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'FIPS-ის ჩართვა';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'FIPS-ის ჩართვა შეუქცევადია და Livepatch სამუდამოდ გაითიშება.';

  @override
  String get ubuntuProComplianceFIPSPrompt => 'აირჩიეთ სასურველი FIPS არჩევანი';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS განახლებებით';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'დააყენებს FIPS 140-2-ით გადამოწმებულ პაკეტებს და საშუალებას იძლევა, უსაფრთხოება რეგულარულად განახლდეს.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS განახლებების გარეშე';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'დააყენებს FIPS 140-2-ით გადამოწმებულ პაკეტებს. ესენი არ განახლდება შემდეგ რესერტიფიკაციამდე.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'უსაფრთხოების თავსებადობის დოკუმენტაცია';

  @override
  String get ubuntuProESMTitle => 'გაფართოებული უსაფრთხოების რემონტი (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM მოგაწვდით 10-წლიან უსაფრთხოების Ubuntu-ის სრული არქივისთვის. მიიღეთ უწყვეტი მოწყვლადობის მართვა კრიტიკული, მაღალი და საშუალო CVE-ებისთვის.';

  @override
  String get ubuntuProESMMainTitle => 'მთავარი პაკეტები (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'უსაფრთხოების განახლებები Ubuntu-ის მთავარი პაკეტებისთვის $year-მდე';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'უნივერსალური პაკეტები (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'დამატებითი უსაფრთხოების განახლებები Ubuntu Universe-ის პაკეტებისთვის $year-მდე';
  }

  @override
  String get ubuntuProLivepatchTitle => 'ბირთვის Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Livepatch-ის ჩართვა';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'ბირთვის უსაფრთხოების განახლებების გადატარება სისტემის გამორთვის გარეშე';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Livepatch-ის სტატუსის ჩვენება ზედა პანელზე';
}
