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
  String get snapdRuleCategoryForeverDenied => 'ყოველთვის აკრძალვა';

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
  String get snapPermissionsErrorTitle => 'Something went wrong';

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
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'წვდომების მართვა';

  @override
  String get interfacePageDescription =>
      'მკაცრად შეზღუდული აპები თქვენს დადასტურებას მოითხოვენ ფაილებთან და საქაღალდეებთან წვდომამდე. ეს ფუნქცია ექსპერიმენტულია და მუდმივად იცვლება.';

  @override
  String get interfacePageLinkLearnMore => 'გაიგეთ მეტი';

  @override
  String get interfacePageLinkGiveFeedback => 'უკუკავშირი';

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
  String get ubuntuProEnabled => 'Ubuntu Pro ჩართულია';

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
  String get ubuntuProDisableError =>
      'Could not disable Ubuntu Pro. Please try again.';

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
