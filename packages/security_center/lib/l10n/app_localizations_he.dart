// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'מרכז האבטחה';

  @override
  String get snapdRuleCategorySessionAllowed => 'לאפשר עד היציאה מהחשבון';

  @override
  String get snapdRuleCategorySessionDenied => 'לדחות עד היציאה מהחשבון';

  @override
  String get snapdRuleCategoryForeverAllowed => 'לאפשר תמיד';

  @override
  String get snapdRuleCategoryForeverDenied => 'לדחות תמיד';

  @override
  String get snapPermissionReadLabel => 'קריאה';

  @override
  String get snapPermissionWriteLabel => 'כתיבה';

  @override
  String get snapPermissionExecuteLabel => 'הפעלה';

  @override
  String get snapPermissionAccessLabel => 'גישה';

  @override
  String get snapPermissionsEnableTitle => 'לדרוש מהיישומים לבקש הרשאות מערכת';

  @override
  String get snapPermissionsEnableWarning =>
      'זאת יכולת ניסיונית לשליטה בגישה למשאבי המערכת שלך.';

  @override
  String get snapPermissionsEnablingLabel =>
      'האפשרות מופעלת, זה עלול לקחת כמה שניות…';

  @override
  String get snapPermissionsDisablingLabel =>
      'האפשרות נכבית, זה עלול לקחת כמה שניות…';

  @override
  String get snapPermissionsExperimentalLabel => 'ניסיוני';

  @override
  String get snapPermissionsOtherDescription =>
      'אפשר לנהל הגדרות אחרות דרך הגדרות › יישומים.';

  @override
  String get snapPermissionsPageTitle => 'הרשאות יישום';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n כללים',
      one: 'כלל אחד',
      zero: 'אין כללים',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'ניהול ההרשאות של $interface עבור $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'אין כללים עדיין';

  @override
  String get cameraRulesPageEmptyTileLabel => 'אף יישום לא ביקש גישה עדיין';

  @override
  String get snapRulesRemoveAll => 'להסיר את כל הכללים';

  @override
  String get snapRulesResetAllPermissions => 'איפוס כל ההרשאות';

  @override
  String get homeInterfacePageTitle => 'תיקיית הבית';

  @override
  String get homeInterfacePageDescription =>
      'ניהול הרשאות לגישה לקבצים בתיקיית הבית שלך.';

  @override
  String get cameraInterfacePageTitle => 'מצלמה';

  @override
  String get cameraInterfacePageDescription =>
      'לאפשר ליישומים לגשת למצלמות שלך.';

  @override
  String get microphoneInterfacePageTitle => 'מיקרופון';

  @override
  String get microphoneInterfacePageDescription =>
      'לאפשר ליישומים לגשת למיקרופון שלך.';

  @override
  String get interfacePageTitle => 'ניהול הרשאות';

  @override
  String get interfacePageDescription =>
      'יישומים מוגבלים באופן הדוק יבקשו ממך הרשאה בטרם גישה לקבצים ולתיקיות. היכולת הזאת ניסיונית ועלולה להשתנות.';

  @override
  String get interfacePageLinkLearnMore => 'מידע נוסף';

  @override
  String get interfacePageLinkGiveFeedback => 'שליחת משוב';

  @override
  String get interfacePageLinkReportIssues => 'דיווח על תקלות';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n יישומים',
      one: 'יישום אחד',
      zero: 'אין יישומים',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'הצפנת הכונן';

  @override
  String get diskEncryptionPageRecoveryKey => 'מפתח שחזור';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'מפתח השחזור מאפשר לך להחזיר לעצמך את הגישה לנתונים שלך אם הכונן לא מפוענח עם עליית המערכת. כדאי לשמור אותו במקום בטוח.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'מפתח השחזור מאפשר לך להשיב את הגישה לנתונים שלך אם שחרור נעילת הכונן בעלייה נכשל. כדאי לשמור אותו במקום בטוח. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore => 'מידע נוסף על הצפנה בגיבוי חומרה';

  @override
  String get diskEncryptionPageCheckKey => 'בדיקת מפתח שחזור…';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey => 'בדיקת מפתח שחזור';

  @override
  String get diskEncryptionPageCheck => 'בדיקה';

  @override
  String get diskEncryptionPageValidKey => 'מפתח תקף';

  @override
  String get diskEncryptionPageInvalidKey => 'מפתח שגוי';

  @override
  String get diskEncryptionPageEnterKey => 'נא למלא מפתח שחזור';

  @override
  String get diskEncryptionPageKeyWorks => 'מפתח השחזור עובד';

  @override
  String get diskEncryptionPageKeyWorksBody => 'חשוב לשמור אותו במקום בטוח.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'מפתח השחזור לא עובד';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'נא לבדוק את המפתח או להחליף אותו בחדש.';

  @override
  String get diskEncryptionPageError => 'שגיאה';

  @override
  String get diskEncryptionPageReplaceButton => 'החלפת מפתח שחזור…';

  @override
  String get diskEncryptionPageReplaceDialogHeader => 'החלפת מפתח שחזור';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'יש לשמור את מפתח השחזור במקום בטוח. לאחר החלפתו, לא ניתן יהיה עוד להשתמש במפתח הישן.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'הצגת קוד QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'שמירה לקובץ';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'שמרתי את מפתח השחזור שלי במקום בטוח';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'החלפה';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'התעלמות';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'מפתח השחזור הוחלף';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'חשוב לזכור לשמור אותו במקום בטוח.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'החלפת מפתח השחזור נכשלה';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'משהו השתבש בהחלפת מפתח השחזור שלך, המפתח הישן שלך יישאר בתוקף.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'שולחן עבודה אובונטו - מפתח שחזור הצפנה';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'יש לסרוק את קוד ה־QR כדי להעתיק את מפתח השחזור ולשמור אותו במקום בטוח, כגון מנהל סיסמאות. אפשר גם לצלם אותו לשימוש בהמשך.';

  @override
  String get diskEncryptionPageClipboardNotification => 'הועתק ללוח הגזירים';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'העתקה';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'הגדרות ההצפנה אינן זמינות';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'משיכת מצב ההצפנה מהמחשב הזה נכשלה.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'הגדרות ה־TPM (מודול פלטפורמה מאובטחת) שלך אינן במצב נתמך.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'גרסת ה־snapd שלך אינה נתמכת';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'נא לבדוק שמרכז התוכנות ו־snapd עדכניים.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'מרכז האבטחה לא יכול להתחבר למנשק snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'כדי לתקן את זה, יש להריץ את הפקודה הזאת במסוף:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'הוספת קוד אישי (PIN)…';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'הוספת מילת צופן…';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'הוספת מילת צופן';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'הוספת קוד אישי (PIN)';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'את הקוד האישי (PIN) יש להקליד בכל עלייה של המחשב שלך. הקוד האישי הזה אינו זהה לסיסמת המשתמש שלך.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'אם שכחת את הקוד האישי (PIN) שלך, אפשר להשיב את הגישה לכונן בעזרת מפתח שחזור.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'יש למלא את מילת הצופן שלך עם כל עלייה של המחשב. מילת הצופן הזאת אינה זהה לסיסמת המשתמש שלך.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'אם שכחת את מילת הצופן שלך, אפשר להשיב את הגישה לכונן בעזרת מפתח שחזור.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'הגברת האבטחה';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'אפשר להגדיר מילת צופן או קוד אישי (PIN) להגברת האבטחה. יש להקליד אותו עם כל עלייה של המחשב.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'מידע נוסף';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'הוספה';

  @override
  String get diskEncryptionPageRemovePinButton => 'הסרת קוד אישי (PIN)…';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'הסרת מילת צופן…';

  @override
  String get diskEncryptionPageAddingPin =>
      'הקוד האישי (PIN) נוסף, הפעולה עלולה לארוך מספר שניות…';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'מילת הצופן נוספת, הפעולה הזאת עלולה לארוך מספר שניות…';

  @override
  String get diskEncryptionPageRemovingPin =>
      'מתבצעת הסרה של הקוד האישי (PIN), הפעולה הזאת עלולה לארוך מספר שניות…';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'מתבצעת הסרה של מילת הצופן, הפעולה הזאת עלולה לארוך מספר שניות…';

  @override
  String get recoveryKeyExceptionFileSystemTitle => 'קובץ מפתח השחזור לא נשמר';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'לא ניתן לשמור את קובץ מפתח השחזור במקום זמני';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'שגיאה לא ידועה';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'שמירת מפתח השחזור שלך לקובץ נכשלה';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'אין לך הרשאה לכתוב למקום של הקובץ הזה.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'אין לך הרשאה לכתוב לתיקייה הזאת. נא לנסות מקום אחר או להשתמש בשיטה אחרת.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'נא לנסות מקום אחר כגון כונן נתיק או להשתמש בשיטה אחרת.';

  @override
  String get recoveryKeyFilePickerTitle => 'שמירת קובץ מפתח שחזור';

  @override
  String get recoveryKeyFilePickerFilter => 'קובצי טקסט';

  @override
  String get recoveryKeyTPMEnabled => 'הצפנה בגיבוי חומרה פעילה';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'מפתחות האבטחה מאוחסנים במודול הפלטפורמה המאובטחת (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'מידע נוסף על הצפנה בגיבוי חומרה';

  @override
  String get recoveryKeyPassphraseEnabled => 'מילת צופן להצפנה פעילה';

  @override
  String get recoveryKeyPassphraseHeader => 'החלפת מילת צופן';

  @override
  String get recoveryKeyPassphraseBody =>
      'יש למלא את מילת הצופן שלך עם כל עלייה של המחשב שלך.';

  @override
  String get recoveryKeyPassphraseButton => 'החלפת מילת צופן…';

  @override
  String get recoveryKeyPassphraseCurrent => 'מילת צופן נוכחית';

  @override
  String get recoveryKeyPassphraseNew => 'מילת צופן חדשה';

  @override
  String get recoveryKeyPassphraseConfirm => 'אישור מילת צופן';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'מילת צופן שגויה, נא לנסות שוב';

  @override
  String get recoveryKeyPassphraseNewError =>
      'חייבת להיות באורך של 4 תווים לפחות';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'מילות הצופן סותרות זו את זו, נא לנסות שוב';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'החלפת מילת צופן';

  @override
  String get recoveryKeyPinEnabled => 'קוד הצפנה אישי פעיל';

  @override
  String get recoveryKeyPinHeader => 'קוד הצפנה אישי';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'מילת צופן להצפנה';

  @override
  String get recoveryKeyPinBody =>
      'יש למלא את הקוד האישי (PIN) שלך עם כל עלייה של המחשב שלך.';

  @override
  String get recoveryKeyPinButton => 'החלפת קוד אישי…';

  @override
  String get recoveryKeyPinCurrent => 'קוד אישי נוכחי';

  @override
  String get recoveryKeyPinNew => 'קוד אישי חדש';

  @override
  String get recoveryKeyPinConfirm => 'אישור קוד אישי';

  @override
  String get recoveryKeyPinCurrentError => 'קוד אישי שגוי, נא לנסות שוב';

  @override
  String get recoveryKeyPinConfirmError =>
      'הקודים האישיים סותרים זה את זה, נא לנסות שוב';

  @override
  String get recoveryKeyPinDialogHeader => 'החלפת קוד אישי';

  @override
  String get recoveryKeyPassphraseShow => 'הצגה';

  @override
  String get recoveryKeyPassphraseHide => 'הסתרה';

  @override
  String get recoveryKeyPassphraseChange => 'החלפה';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'הקוד האישי עודכן';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'הקוד האישי שלך עודכן בהצלחה.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'מילת הצופן עודכנה';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'מילת הצופן שלך עודכנה בהצלחה.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'מילת צופן חלשה, נא להפוך אותה למורכבת יותר לניחוש';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'מילת צופן סבירה, נא להאריך אותה או לסבך אותה כדי לשפר את האבטחה';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'מילת צופן חזקה';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'קוד אישי חלש, נא להאריך או לסבך אותו';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'קוד אישי סביר, נא להאריך או לסבך אותו לשיפור האבטחה';

  @override
  String get recoveryKeyPinEntropyOptimal => 'הקוד האישי ארוך מספיק';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'משהו השתבש';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro לא זמין לגרסה הזאת של אובונטו';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro דורש מהדורת LTS (תמיכה לטווח ארוך)';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro לא נתמך על ידי הגרסה הזאת של snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'יש לעדכן את snapd כדי לנהל Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro פעיל';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'אבטחה ברמת תאגיד ועמידה בתקנים למחשב שלך. תמיד חינמי לשימוש פרטי. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'מידע נוסף על Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'הפעלת Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'הפעלה עם חשבון Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle => 'אפשר ליצור חשבון בחינם';

  @override
  String get ubuntuProMagicPrompt =>
      'יש להיכנס עם חשבון Ubuntu One או ליצור אחד בחינם.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'להמשיך בדפדפן';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'אפשר גם להיכנס דרך $attachLink ולמלא את הקוד $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'לא ניתן להפעיל את Ubuntu Pro, נא לנסות שוב';

  @override
  String get ubuntuProEnableToken => 'הפעלה עם אסימון';

  @override
  String get ubuntuProEnableTokenError => 'לא ניתן להפעיל את Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'מהנהלת ה־IT שלך או מתוך $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'אפשר לקבל אסימון Ubuntu Pro מהנהלת המחשוב שלך או דרך $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'אסימון';

  @override
  String get ubuntuProDisablePro => 'השבתת Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'השבתה';

  @override
  String get ubuntuProDisablePrompt =>
      'השבתת Ubuntu Pro תנתק את המינוי שלך מהמכונה הזאת. להמשיך?';

  @override
  String get ubuntuProEnable => 'הפעלה';

  @override
  String get ubuntuProCancel => 'ביטול';

  @override
  String get ubuntuProFeatureEnableError =>
      'לא ניתן להפעיל את היכולת, נא לנסות שוב.';

  @override
  String get ubuntuProFeatureDisableError =>
      'לא ניתן להשבית את היכולת, נא לנסות שוב.';

  @override
  String get ubuntuProCompliance => 'תקינת אבטחה והקשחה';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'מומלץ רק לעזרה עם FedRAMP,‏ HIPAA ודרישות תקינת אבטחה והקשחה.';

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
  String get ubuntuProComplianceFIPSEnable => 'הפעלת FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'אי אפשר לחזור בך מהפעלת FIPS והטלאה חיה תושבת לצמיתות.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'נא לבחור את אפשרות ה־FIPS המועדפת עליך';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS עם עדכונים';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'התקנת חבילות מוסמכות FIPS 140-2 ומתן האפשרות לעדכוני אבטחת מידע שוטפים.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS ללא עדכונים';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'התקנת חבילות מוסמכות FIPS 140-2. הן לא תעודכנה עד להסמכה הבאה מחדש.';

  @override
  String get ubuntuProComplianceDocumentation => 'תיעוד עמידה בתקני אבטחה';

  @override
  String get ubuntuProESMTitle => 'Expanded Security Maintenance (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM provides 10 years of security patches for 25,000+ open source packages. Get continuous vulnerability management for critical, high, and medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'חבילות עיקריות (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'עדכוני אבטחה לכ־2,300 חבילות עיקריות של אובונטו עד $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'עדכוני אבטחה נוספים ליותר מ־23,000 חבילות יוניברס באובונטו עד $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'הטלאה חיה של הליבה';

  @override
  String get ubuntuProLivepatchEnableTitle => 'הפעלת הטלאה חיה';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'החלת עדכוני אבטחה של הליבה בזמן שהמערכת פעילה';

  @override
  String get ubuntuProLivepatchShowTitle => 'הצגת מצב ההטלאה החיה בסרגל העליון';
}
