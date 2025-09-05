import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_dz.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ku.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_nn.dart';
import 'app_localizations_oc.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_se.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tg.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('ar'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bo'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('dz'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ku'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mr'),
    Locale('my'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('nn'),
    Locale('oc'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('se'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('tg'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'TW')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Security Center'**
  String get appTitle;

  /// No description provided for @snapdRuleCategorySessionAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allow until logout'**
  String get snapdRuleCategorySessionAllowed;

  /// No description provided for @snapdRuleCategorySessionDenied.
  ///
  /// In en, this message translates to:
  /// **'Deny until logout'**
  String get snapdRuleCategorySessionDenied;

  /// No description provided for @snapdRuleCategoryForeverAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allow always'**
  String get snapdRuleCategoryForeverAllowed;

  /// No description provided for @snapdRuleCategoryForeverDenied.
  ///
  /// In en, this message translates to:
  /// **'Deny always'**
  String get snapdRuleCategoryForeverDenied;

  /// No description provided for @snapPermissionReadLabel.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get snapPermissionReadLabel;

  /// No description provided for @snapPermissionWriteLabel.
  ///
  /// In en, this message translates to:
  /// **'Write'**
  String get snapPermissionWriteLabel;

  /// No description provided for @snapPermissionExecuteLabel.
  ///
  /// In en, this message translates to:
  /// **'Execute'**
  String get snapPermissionExecuteLabel;

  /// No description provided for @snapPermissionsEnableTitle.
  ///
  /// In en, this message translates to:
  /// **'Require apps to ask for system permissions'**
  String get snapPermissionsEnableTitle;

  /// No description provided for @snapPermissionsEnableWarning.
  ///
  /// In en, this message translates to:
  /// **'This is an experimental feature for controlling access to your system’s resources.'**
  String get snapPermissionsEnableWarning;

  /// No description provided for @snapPermissionsEnablingLabel.
  ///
  /// In en, this message translates to:
  /// **'Enabling, it might take a few seconds...'**
  String get snapPermissionsEnablingLabel;

  /// No description provided for @snapPermissionsDisablingLabel.
  ///
  /// In en, this message translates to:
  /// **'Disabling, it might take a few seconds...'**
  String get snapPermissionsDisablingLabel;

  /// No description provided for @snapPermissionsExperimentalLabel.
  ///
  /// In en, this message translates to:
  /// **'Experimental'**
  String get snapPermissionsExperimentalLabel;

  /// No description provided for @snapPermissionsOtherDescription.
  ///
  /// In en, this message translates to:
  /// **'You can manage other permissions in Settings › Apps.'**
  String get snapPermissionsOtherDescription;

  /// No description provided for @snapPermissionsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'App Permissions'**
  String get snapPermissionsPageTitle;

  /// No description provided for @snapRulesCount.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =0{no rules} =1{1 rule} other{{n} rules}}'**
  String snapRulesCount(int n);

  /// No description provided for @snapRulesPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage {interface} permissions for {snap}.'**
  String snapRulesPageDescription(String interface, String snap);

  /// No description provided for @snapRulesPageEmptyTileLabel.
  ///
  /// In en, this message translates to:
  /// **'No rules yet'**
  String get snapRulesPageEmptyTileLabel;

  /// No description provided for @snapRulesRemoveAll.
  ///
  /// In en, this message translates to:
  /// **'Remove all rules'**
  String get snapRulesRemoveAll;

  /// No description provided for @homeInterfacePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Home folder'**
  String get homeInterfacePageTitle;

  /// No description provided for @homeInterfacePageDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage permissions to access files in your Home folder.'**
  String get homeInterfacePageDescription;

  /// No description provided for @interfacePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage permissions'**
  String get interfacePageTitle;

  /// No description provided for @interfacePageDescription.
  ///
  /// In en, this message translates to:
  /// **'Strictly confined apps will ask you before accessing files and folders. This feature is experimental and subject to changes.'**
  String get interfacePageDescription;

  /// No description provided for @interfacePageLinkLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get interfacePageLinkLearnMore;

  /// No description provided for @interfacePageLinkGiveFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give feedback'**
  String get interfacePageLinkGiveFeedback;

  /// No description provided for @interfacePageLinkReportIssues.
  ///
  /// In en, this message translates to:
  /// **'Report issues'**
  String get interfacePageLinkReportIssues;

  /// No description provided for @interfaceSnapCount.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =0{no apps} =1{1 app} other {{n} apps}}'**
  String interfaceSnapCount(int n);

  /// No description provided for @diskEncryptionPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Disk Encryption'**
  String get diskEncryptionPageTitle;

  /// No description provided for @diskEncryptionPageRecoveryKey.
  ///
  /// In en, this message translates to:
  /// **'Recovery key'**
  String get diskEncryptionPageRecoveryKey;

  /// No description provided for @diskEncryptionPageStoreYourKey.
  ///
  /// In en, this message translates to:
  /// **'The recovery key lets you regain access to your data if your disk fails to unlock during startup. Save it somewhere safe.'**
  String get diskEncryptionPageStoreYourKey;

  /// No description provided for @diskEncryptionPageStoreYourKeyWithLink.
  ///
  /// In en, this message translates to:
  /// **'The recovery key lets you regain access to your data if your disk fails to unlock during startup. Save it somewhere safe. {learnMoreLink}'**
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink);

  /// No description provided for @diskEncryptionPageLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more about recovery keys'**
  String get diskEncryptionPageLearnMore;

  /// No description provided for @diskEncryptionPageCheckKey.
  ///
  /// In en, this message translates to:
  /// **'Check recovery key...'**
  String get diskEncryptionPageCheckKey;

  /// No description provided for @diskEncryptionPageDialogHeaderCheckKey.
  ///
  /// In en, this message translates to:
  /// **'Check Recovery Key'**
  String get diskEncryptionPageDialogHeaderCheckKey;

  /// No description provided for @diskEncryptionPageCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get diskEncryptionPageCheck;

  /// No description provided for @diskEncryptionPageValidKey.
  ///
  /// In en, this message translates to:
  /// **'Valid key'**
  String get diskEncryptionPageValidKey;

  /// No description provided for @diskEncryptionPageInvalidKey.
  ///
  /// In en, this message translates to:
  /// **'Invalid key'**
  String get diskEncryptionPageInvalidKey;

  /// No description provided for @diskEncryptionPageEnterKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your recovery key'**
  String get diskEncryptionPageEnterKey;

  /// No description provided for @diskEncryptionPageKeyWorks.
  ///
  /// In en, this message translates to:
  /// **'Recovery key works'**
  String get diskEncryptionPageKeyWorks;

  /// No description provided for @diskEncryptionPageKeyWorksBody.
  ///
  /// In en, this message translates to:
  /// **'Remember to keep it somewhere safe.'**
  String get diskEncryptionPageKeyWorksBody;

  /// No description provided for @diskEncryptionPageKeyDoesntWork.
  ///
  /// In en, this message translates to:
  /// **'Recovery key does not work'**
  String get diskEncryptionPageKeyDoesntWork;

  /// No description provided for @diskEncryptionPageKeyDoesntWorkBody.
  ///
  /// In en, this message translates to:
  /// **'Check the key or replace it with a new one.'**
  String get diskEncryptionPageKeyDoesntWorkBody;

  /// No description provided for @diskEncryptionPageError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get diskEncryptionPageError;

  /// No description provided for @diskEncryptionPageReplaceButton.
  ///
  /// In en, this message translates to:
  /// **'Replace recovery key...'**
  String get diskEncryptionPageReplaceButton;

  /// No description provided for @diskEncryptionPageReplaceDialogHeader.
  ///
  /// In en, this message translates to:
  /// **'Replace recovery key'**
  String get diskEncryptionPageReplaceDialogHeader;

  /// No description provided for @diskEncryptionPageReplaceDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Save the new recovery key somewhere safe. Once you replace it, you will not be able to use the old key anymore.'**
  String get diskEncryptionPageReplaceDialogBody;

  /// No description provided for @diskEncryptionPageReplaceDialogShowQR.
  ///
  /// In en, this message translates to:
  /// **'Show QR code'**
  String get diskEncryptionPageReplaceDialogShowQR;

  /// No description provided for @diskEncryptionPageReplaceDialogSave.
  ///
  /// In en, this message translates to:
  /// **'Save to file'**
  String get diskEncryptionPageReplaceDialogSave;

  /// No description provided for @diskEncryptionPageReplaceDialogAcknowledge.
  ///
  /// In en, this message translates to:
  /// **'I saved my recovery key somewhere safe'**
  String get diskEncryptionPageReplaceDialogAcknowledge;

  /// No description provided for @diskEncryptionPageReplaceDialogReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get diskEncryptionPageReplaceDialogReplace;

  /// No description provided for @diskEncryptionPageReplaceDialogDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get diskEncryptionPageReplaceDialogDiscard;

  /// No description provided for @diskEncryptionPageReplaceDialogSuccessHeader.
  ///
  /// In en, this message translates to:
  /// **'Recovery key replaced'**
  String get diskEncryptionPageReplaceDialogSuccessHeader;

  /// No description provided for @diskEncryptionPageReplaceDialogSuccessBody.
  ///
  /// In en, this message translates to:
  /// **'Remember to keep it somewhere safe.'**
  String get diskEncryptionPageReplaceDialogSuccessBody;

  /// No description provided for @diskEncryptionPageReplaceDialogErrorHeader.
  ///
  /// In en, this message translates to:
  /// **'Recovery key replacement failed'**
  String get diskEncryptionPageReplaceDialogErrorHeader;

  /// No description provided for @diskEncryptionPageReplaceDialogErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong replacing your recovery key, your old key will remain vaild.'**
  String get diskEncryptionPageReplaceDialogErrorBody;

  /// No description provided for @diskEncryptionPageReplaceDialogQRHeader.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu Desktop - Encryption recovery key'**
  String get diskEncryptionPageReplaceDialogQRHeader;

  /// No description provided for @diskEncryptionPageReplaceDialogQRBody.
  ///
  /// In en, this message translates to:
  /// **'Scan the QR code to copy the recovery key and save it somewhere safe, such as a password manager. You can also take a photo for later use.'**
  String get diskEncryptionPageReplaceDialogQRBody;

  /// No description provided for @diskEncryptionPageClipboardNotification.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get diskEncryptionPageClipboardNotification;

  /// No description provided for @diskEncryptionPageCopySemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get diskEncryptionPageCopySemanticLabel;

  /// No description provided for @diskEncryptionPageErrorFailedToRetrieveStatusHeader.
  ///
  /// In en, this message translates to:
  /// **'Encryption settings not available'**
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader;

  /// No description provided for @diskEncryptionPageErrorFailedToRetrieveStatusBody.
  ///
  /// In en, this message translates to:
  /// **'Failed to retrieve the encryption status of this computer.'**
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody;

  /// No description provided for @diskEncryptionPageErrorUnsupportedStateBody.
  ///
  /// In en, this message translates to:
  /// **'Your computer\'s TPM configuration is not in a supported state.'**
  String get diskEncryptionPageErrorUnsupportedStateBody;

  /// No description provided for @diskEncryptionPageErrorUnsupportedSnapdHeader.
  ///
  /// In en, this message translates to:
  /// **'Your snapd version is not supported'**
  String get diskEncryptionPageErrorUnsupportedSnapdHeader;

  /// No description provided for @diskEncryptionPageErrorUnsupportedSnapdBody.
  ///
  /// In en, this message translates to:
  /// **'Check the Security Center and snapd are up to date.'**
  String get diskEncryptionPageErrorUnsupportedSnapdBody;

  /// No description provided for @diskEncryptionPageErrorUnconnectedSnapInterfaceHeader.
  ///
  /// In en, this message translates to:
  /// **'Security Center cannot connect to the snapd interface'**
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader;

  /// No description provided for @diskEncryptionPageErrorUnconnectedSnapInterfaceBody.
  ///
  /// In en, this message translates to:
  /// **'To fix this, run this command in the terminal:'**
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody;

  /// No description provided for @diskEncryptionPageErrorUnconnectedSnapInterfaceCommand.
  ///
  /// In en, this message translates to:
  /// **'snap connect desktop-security-center:snap-fde-control'**
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand;

  /// No description provided for @recoveryKeyExceptionFileSystemTitle.
  ///
  /// In en, this message translates to:
  /// **'Recovery key file not saved'**
  String get recoveryKeyExceptionFileSystemTitle;

  /// No description provided for @recoveryKeyExceptionDisallowedPathTitle.
  ///
  /// In en, this message translates to:
  /// **'Recovery key file cannot be saved in a temporary location'**
  String get recoveryKeyExceptionDisallowedPathTitle;

  /// No description provided for @recoveryKeyExceptionUnknownTitle.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get recoveryKeyExceptionUnknownTitle;

  /// No description provided for @recoveryKeyExceptionFilePermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to save your recovery key to file'**
  String get recoveryKeyExceptionFilePermissionTitle;

  /// No description provided for @recoveryKeyExceptionFilePermissionBody.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to write to that file location.'**
  String get recoveryKeyExceptionFilePermissionBody;

  /// No description provided for @recoveryKeyExceptionFileSystemBody.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to write to that folder. Try a different location or use another method.'**
  String get recoveryKeyExceptionFileSystemBody;

  /// No description provided for @recoveryKeyExceptionDisallowedPathBody.
  ///
  /// In en, this message translates to:
  /// **'Try a different location, such as a removable drive, or use another method.'**
  String get recoveryKeyExceptionDisallowedPathBody;

  /// No description provided for @recoveryKeyFilePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Save recovery key file'**
  String get recoveryKeyFilePickerTitle;

  /// No description provided for @recoveryKeyFilePickerFilter.
  ///
  /// In en, this message translates to:
  /// **'Text files'**
  String get recoveryKeyFilePickerFilter;

  /// No description provided for @recoveryKeyTPMEnabled.
  ///
  /// In en, this message translates to:
  /// **'Hardware-backed encryption is enabled'**
  String get recoveryKeyTPMEnabled;

  /// No description provided for @recoveryKeyTPMExplanationBody.
  ///
  /// In en, this message translates to:
  /// **'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).'**
  String get recoveryKeyTPMExplanationBody;

  /// No description provided for @recoveryKeyTPMExplanationLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more about hardware-backed encryption'**
  String get recoveryKeyTPMExplanationLearnMore;

  /// No description provided for @recoveryKeyPassphraseEnabled.
  ///
  /// In en, this message translates to:
  /// **'Encryption passphrase is enabled'**
  String get recoveryKeyPassphraseEnabled;

  /// No description provided for @recoveryKeyPassphraseHeader.
  ///
  /// In en, this message translates to:
  /// **'Change passphrase'**
  String get recoveryKeyPassphraseHeader;

  /// No description provided for @recoveryKeyPassphraseBody.
  ///
  /// In en, this message translates to:
  /// **'You need to enter your passpharse during startup to unlock the disk. You can change the passphrase but not disable it.'**
  String get recoveryKeyPassphraseBody;

  /// No description provided for @recoveryKeyPassphraseButton.
  ///
  /// In en, this message translates to:
  /// **'Change passphrase...'**
  String get recoveryKeyPassphraseButton;

  /// No description provided for @recoveryKeyPassphraseCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current passphrase'**
  String get recoveryKeyPassphraseCurrent;

  /// No description provided for @recoveryKeyPassphraseNew.
  ///
  /// In en, this message translates to:
  /// **'New passphrase'**
  String get recoveryKeyPassphraseNew;

  /// No description provided for @recoveryKeyPassphraseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm passphrase'**
  String get recoveryKeyPassphraseConfirm;

  /// No description provided for @recoveryKeyPassphraseCurrentError.
  ///
  /// In en, this message translates to:
  /// **'Incorrect passphrase, try again'**
  String get recoveryKeyPassphraseCurrentError;

  /// No description provided for @recoveryKeyPassphraseNewError.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 4 characters long'**
  String get recoveryKeyPassphraseNewError;

  /// No description provided for @recoveryKeyPassphraseConfirmError.
  ///
  /// In en, this message translates to:
  /// **'Passphrases do not match, try again'**
  String get recoveryKeyPassphraseConfirmError;

  /// No description provided for @recoveryKeyPassphraseDialogHeader.
  ///
  /// In en, this message translates to:
  /// **'Change Passphrase'**
  String get recoveryKeyPassphraseDialogHeader;

  /// No description provided for @recoveryKeyPinEnabled.
  ///
  /// In en, this message translates to:
  /// **'Encryption PIN is enabled'**
  String get recoveryKeyPinEnabled;

  /// No description provided for @recoveryKeyPinHeader.
  ///
  /// In en, this message translates to:
  /// **'Encryption PIN'**
  String get recoveryKeyPinHeader;

  /// No description provided for @recoveryKeyEncrpytionPassphraseHeader.
  ///
  /// In en, this message translates to:
  /// **'Encryption passphrase'**
  String get recoveryKeyEncrpytionPassphraseHeader;

  /// No description provided for @recoveryKeyPinBody.
  ///
  /// In en, this message translates to:
  /// **'You need to enter your PIN during startup to unlock the disk. You can change the PIN but not disable it.'**
  String get recoveryKeyPinBody;

  /// No description provided for @recoveryKeyPinButton.
  ///
  /// In en, this message translates to:
  /// **'Change PIN...'**
  String get recoveryKeyPinButton;

  /// No description provided for @recoveryKeyPinCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current PIN'**
  String get recoveryKeyPinCurrent;

  /// No description provided for @recoveryKeyPinNew.
  ///
  /// In en, this message translates to:
  /// **'New PIN'**
  String get recoveryKeyPinNew;

  /// No description provided for @recoveryKeyPinConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get recoveryKeyPinConfirm;

  /// No description provided for @recoveryKeyPinCurrentError.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN, try again'**
  String get recoveryKeyPinCurrentError;

  /// No description provided for @recoveryKeyPinConfirmError.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match, try again'**
  String get recoveryKeyPinConfirmError;

  /// No description provided for @recoveryKeyPinDialogHeader.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get recoveryKeyPinDialogHeader;

  /// No description provided for @recoveryKeyPassphraseShow.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get recoveryKeyPassphraseShow;

  /// No description provided for @recoveryKeyPassphraseHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get recoveryKeyPassphraseHide;

  /// No description provided for @recoveryKeyPassphraseChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get recoveryKeyPassphraseChange;

  /// No description provided for @recoveryKeyPassphrasePinSuccessHeader.
  ///
  /// In en, this message translates to:
  /// **'PIN updated'**
  String get recoveryKeyPassphrasePinSuccessHeader;

  /// No description provided for @recoveryKeyPassphrasePinSuccessBody.
  ///
  /// In en, this message translates to:
  /// **'You PIN was successfully updated.'**
  String get recoveryKeyPassphrasePinSuccessBody;

  /// No description provided for @recoveryKeyPassphrasePassphraseSuccessHeader.
  ///
  /// In en, this message translates to:
  /// **'Passphrase updated'**
  String get recoveryKeyPassphrasePassphraseSuccessHeader;

  /// No description provided for @recoveryKeyPassphrasePassphraseSuccessBody.
  ///
  /// In en, this message translates to:
  /// **'You passphrase was successfully updated.'**
  String get recoveryKeyPassphrasePassphraseSuccessBody;

  /// No description provided for @recoveryKeyPassphraseEntropyBelowMin.
  ///
  /// In en, this message translates to:
  /// **'Weak passphrase, make it longer or more complex'**
  String get recoveryKeyPassphraseEntropyBelowMin;

  /// No description provided for @recoveryKeyPassphraseEntropyBelowOptimal.
  ///
  /// In en, this message translates to:
  /// **'Fair passphrase, make it longer or more complex for better security'**
  String get recoveryKeyPassphraseEntropyBelowOptimal;

  /// No description provided for @recoveryKeyPassphraseEntropyOptimal.
  ///
  /// In en, this message translates to:
  /// **'Strong passphrase'**
  String get recoveryKeyPassphraseEntropyOptimal;

  /// No description provided for @recoveryKeyPinEntropyBelowMin.
  ///
  /// In en, this message translates to:
  /// **'Weak PIN, make it longer or less predictable'**
  String get recoveryKeyPinEntropyBelowMin;

  /// No description provided for @recoveryKeyPinEntropyBelowOptimal.
  ///
  /// In en, this message translates to:
  /// **'Fair PIN, make it longer or less predictable for better security'**
  String get recoveryKeyPinEntropyBelowOptimal;

  /// No description provided for @recoveryKeyPinEntropyOptimal.
  ///
  /// In en, this message translates to:
  /// **'PIN is long enough'**
  String get recoveryKeyPinEntropyOptimal;

  /// No description provided for @recoveryKeySomethingWentWrongHeader.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get recoveryKeySomethingWentWrongHeader;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['am', 'ar', 'be', 'bg', 'bn', 'bo', 'bs', 'ca', 'cs', 'cy', 'da', 'de', 'dz', 'el', 'en', 'eo', 'es', 'et', 'eu', 'fa', 'fi', 'fr', 'ga', 'gl', 'gu', 'he', 'hi', 'hr', 'hu', 'id', 'is', 'it', 'ja', 'ka', 'kk', 'km', 'kn', 'ko', 'ku', 'lo', 'lt', 'lv', 'mk', 'ml', 'mr', 'my', 'nb', 'ne', 'nl', 'nn', 'oc', 'pa', 'pl', 'pt', 'ro', 'ru', 'se', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'ta', 'te', 'tg', 'th', 'tl', 'tr', 'ug', 'uk', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
    case 'zh': {
  switch (locale.countryCode) {
    case 'TW': return AppLocalizationsZhTw();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am': return AppLocalizationsAm();
    case 'ar': return AppLocalizationsAr();
    case 'be': return AppLocalizationsBe();
    case 'bg': return AppLocalizationsBg();
    case 'bn': return AppLocalizationsBn();
    case 'bo': return AppLocalizationsBo();
    case 'bs': return AppLocalizationsBs();
    case 'ca': return AppLocalizationsCa();
    case 'cs': return AppLocalizationsCs();
    case 'cy': return AppLocalizationsCy();
    case 'da': return AppLocalizationsDa();
    case 'de': return AppLocalizationsDe();
    case 'dz': return AppLocalizationsDz();
    case 'el': return AppLocalizationsEl();
    case 'en': return AppLocalizationsEn();
    case 'eo': return AppLocalizationsEo();
    case 'es': return AppLocalizationsEs();
    case 'et': return AppLocalizationsEt();
    case 'eu': return AppLocalizationsEu();
    case 'fa': return AppLocalizationsFa();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
    case 'ga': return AppLocalizationsGa();
    case 'gl': return AppLocalizationsGl();
    case 'gu': return AppLocalizationsGu();
    case 'he': return AppLocalizationsHe();
    case 'hi': return AppLocalizationsHi();
    case 'hr': return AppLocalizationsHr();
    case 'hu': return AppLocalizationsHu();
    case 'id': return AppLocalizationsId();
    case 'is': return AppLocalizationsIs();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ka': return AppLocalizationsKa();
    case 'kk': return AppLocalizationsKk();
    case 'km': return AppLocalizationsKm();
    case 'kn': return AppLocalizationsKn();
    case 'ko': return AppLocalizationsKo();
    case 'ku': return AppLocalizationsKu();
    case 'lo': return AppLocalizationsLo();
    case 'lt': return AppLocalizationsLt();
    case 'lv': return AppLocalizationsLv();
    case 'mk': return AppLocalizationsMk();
    case 'ml': return AppLocalizationsMl();
    case 'mr': return AppLocalizationsMr();
    case 'my': return AppLocalizationsMy();
    case 'nb': return AppLocalizationsNb();
    case 'ne': return AppLocalizationsNe();
    case 'nl': return AppLocalizationsNl();
    case 'nn': return AppLocalizationsNn();
    case 'oc': return AppLocalizationsOc();
    case 'pa': return AppLocalizationsPa();
    case 'pl': return AppLocalizationsPl();
    case 'pt': return AppLocalizationsPt();
    case 'ro': return AppLocalizationsRo();
    case 'ru': return AppLocalizationsRu();
    case 'se': return AppLocalizationsSe();
    case 'si': return AppLocalizationsSi();
    case 'sk': return AppLocalizationsSk();
    case 'sl': return AppLocalizationsSl();
    case 'sq': return AppLocalizationsSq();
    case 'sr': return AppLocalizationsSr();
    case 'sv': return AppLocalizationsSv();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'tg': return AppLocalizationsTg();
    case 'th': return AppLocalizationsTh();
    case 'tl': return AppLocalizationsTl();
    case 'tr': return AppLocalizationsTr();
    case 'ug': return AppLocalizationsUg();
    case 'uk': return AppLocalizationsUk();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
