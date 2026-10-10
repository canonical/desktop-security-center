// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'Ionad Slándála';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Ceadaigh go dtí go logáil amach';

  @override
  String get snapdRuleCategorySessionDenied => 'Diúltaigh go dtí logáil amach';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Ceadaigh i gcónaí';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Nuashonraigh na ceadanna';

  @override
  String get snapdRuleCategoryForeverDenied => 'Diúltaigh i gcónaí';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Ceadaigh go sealadach';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Diúltaigh go sealadach';

  @override
  String get snapdRuleCategoryAskAlways => 'Cuir ceist i gcónaí';

  @override
  String get snapPermissionReadLabel => 'Léigh';

  @override
  String get snapPermissionWriteLabel => 'Scríobh';

  @override
  String get snapPermissionExecuteLabel => 'Rith';

  @override
  String get snapPermissionAccessLabel => 'Rochtain';

  @override
  String get snapPermissionsEnableTitle =>
      'Ceangail ar aipeanna i mbosca gainimh ceadanna a iarraidh';

  @override
  String get snapPermissionsEnableWarning =>
      'Is gné thurgnamhach é seo chun rochtain ar acmhainní do chórais a rialú.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Ag cumasú, d’fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Ag díchumasú, d\'fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String get snapPermissionsExperimentalLabel => 'Turgnamhach';

  @override
  String get snapPermissionsOtherDescription =>
      'Is féidir leat ceadanna eile a bhainistiú faoi Socruithe › Aipeanna.';

  @override
  String get snapPermissionsPageTitle => 'Ceadanna aipeanna';

  @override
  String get snapPermissionsErrorTitle => 'Chuaigh rud éigin mícheart';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rialacha',
      one: '1 riail',
      zero: 'gan rialacha',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Bainistigh ceadanna $interface le haghaidh $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Níl aon rialacha fós';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Níl aon aipeanna tar éis rochtain a iarraidh go fóill';

  @override
  String get snapRulesRemoveAll => 'Bain na rialacha go léir';

  @override
  String get snapRulesResetAllPermissions => 'Athshocraigh na ceadanna go léir';

  @override
  String get homeInterfacePageTitle => 'Fillteán baile';

  @override
  String get homeInterfacePageDescription =>
      'Bainistigh ceadanna chun comhaid a rochtain i d\'fhillteán Baile.';

  @override
  String get cameraInterfacePageTitle => 'Ceamara';

  @override
  String get cameraInterfacePageDescription =>
      'Lig d’aipeanna rochtain a fháil ar do cheamaraí.';

  @override
  String get microphoneInterfacePageTitle => 'Micreafón';

  @override
  String get microphoneInterfacePageDescription =>
      'Lig d’aipeanna rochtain a fháil ar do mhicreafón.';

  @override
  String get interfacePageTitle => 'Bainistigh ceadanna';

  @override
  String get interfacePageLinkLearnMore => 'Foghlaim níos mó';

  @override
  String get interfacePageLinkReportIssues => 'Saincheisteanna a thuairisciú';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aipeanna',
      one: '1 aip',
      zero: 'gan aipeanna',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Criptiú diosca';

  @override
  String get diskEncryptionPageRecoveryKey => 'Eochair aisghabhála';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Ligeann an eochair aisghabhála duit rochtain a fháil ar do shonraí arís mura ndíghlasálann an diosca le linn an tosaithe. Sábháil in áit shábháilte í.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Ligeann an eochair aisghabhála duit rochtain a fháil ar do shonraí arís mura ndíghlasálann an diosca le linn an tosaithe. Sábháil é in áit shábháilte. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Foghlaim tuilleadh faoi chriptiú atá bunaithe ar chrua-earraí';

  @override
  String get diskEncryptionPageCheckKey => 'Seiceáil eochair aisghabhála...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Seiceáil eochair aisghabhála';

  @override
  String get diskEncryptionPageCheck => 'Seiceáil';

  @override
  String get diskEncryptionPageValidKey => 'Eochair bhailí';

  @override
  String get diskEncryptionPageInvalidKey => 'Eochair neamhbhailí';

  @override
  String get diskEncryptionPageEnterKey =>
      'Cuir isteach d\'eochair aisghabhála';

  @override
  String get diskEncryptionPageKeyWorks => 'Oibríonn eochair aisghabhála';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Cuimhnigh é a choinneáil in áit shábháilte.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Ní oibríonn an eochair aisghabhála';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Seiceáil an eochair nó cuir ceann nua ina háit.';

  @override
  String get diskEncryptionPageError => 'Earráid';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Athraigh eochair aisghabhála...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Athsholáthar eochair aisghabhála';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Sábháil an eochair athshlánaithe nua in áit shábháilte. Nuair a chuirfidh tú ceann eile ina háit, ní bheidh tú in ann an seaneochair a úsáid a thuilleadh.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Taispeáin cód QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Sábháil chuig comhad';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Shábháil mé m\'eochair aisghabhála in áit shábháilte';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Athsholáthair';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Caith amach';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Eochair aisghabhála athsholáthraithe';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Cuimhnigh é a choinneáil in áit shábháilte.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Theip ar athsholáthar eochrach aisghabhála';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Tharla fadhb agus d’eochair aisghabhála á cur isteach, fanfaidh d’eochair shean bailí.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Deasc Ubuntu - Eochair aisghabhála criptithe';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scan an cód QR chun an eochair aisghabhála a chóipeáil agus í a shábháil in áit shábháilte, amhail bainisteoir pasfhocal. Is féidir leat grianghraf a thógáil freisin lena úsáid níos déanaí.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Cóipeáilte chuig an ghearrthaisce';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Cóipeáil';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Níl socruithe criptithe ar fáil';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Theip ar stádas criptithe an ríomhaire seo a aisghabháil.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Níl cumraíocht TPM do ríomhaire i riocht a bhfuil tacaíocht ann dó.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Ní thacaítear le do leagan snapd';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Seiceáil an bhfuil an tIonad Slándála agus snapd cothrom le dáta.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Ní féidir leis an Ionad Slándála ceangal leis an gcomhéadan snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Chun é seo a shocrú, rith an t-ordú seo sa teirminéal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect ionad-slándála-deisce: snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Cuir PIN leis...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Cuir frása faire leis...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Cuir frása faire leis';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Cuir PIN leis';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Beidh ort do PIN a iontráil gach uair a thosaíonn do ríomhaire. Tá an PIN seo difriúil ó do phasfhocal úsáideora.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Má dhéanann tú dearmad ar do PIN, is féidir leat rochtain a fháil ar an diosca arís trí úsáid a bhaint as an eochair aisghabhála.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Beidh ort do phasfhocal a iontráil gach uair a thosaíonn do ríomhaire. Tá an pasfhocal seo difriúil ó do phasfhocal úsáideora.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Má dhéanann tú dearmad ar do phasfrása, is féidir leat rochtain a fháil ar an diosca arís trí úsáid a bhaint as an eochair aisghabhála.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Slándáil bhreise';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Is féidir leat frása faire nó PIN a shocrú le haghaidh slándála breise. Beidh ort é a iontráil gach uair a thosaíonn do ríomhaire.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Foghlaim níos mó';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Cuir leis';

  @override
  String get diskEncryptionPageRemovePinButton => 'Bain an PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Bain an focal faire...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Ag cur PIN leis, d\'fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Ag cur frása faire leis, d’fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Ag baint an UAP, d\'fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Ag baint an phasfhocail, d\'fhéadfadh sé seo cúpla soicind a thógáil...';

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
      'Níor sábháladh comhad eochrach aisghabhála';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Ní féidir comhad eochrach aisghabhála a shábháil in áit shealadach';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Earráid anaithnid';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Theip ar d’eochair aisghabhála a shábháil chuig an gcomhad';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Níl cead agat scríobh chuig an suíomh comhaid sin.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Níl cead agat scríobh chuig an bhfillteán sin. Bain triail as suíomh difriúil nó bain úsáid as modh eile.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Bain triail as suíomh difriúil, amhail tiomántán inbhainte, nó bain úsáid as modh eile.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Sábháil comhad eochrach aisghabhála';

  @override
  String get recoveryKeyFilePickerFilter => 'Comhaid téacs';

  @override
  String get recoveryKeyTPMEnabled => 'Tá criptiú crua-earraí cumasaithe';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Stóráiltear na heochracha criptithe i Modúl Ardáin Iontaofa (TPM) do ríomhaire.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Foghlaim tuilleadh faoi chriptiú atá bunaithe ar chrua-earraí';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Tá frása faire criptithe cumasaithe';

  @override
  String get recoveryKeyPassphraseHeader => 'Athraigh an frása faire';

  @override
  String get recoveryKeyPassphraseBody =>
      'Ní mór duit do phasfhocal a iontráil gach uair a thosaíonn do ríomhaire.';

  @override
  String get recoveryKeyPassphraseButton => 'Athraigh an focal faire...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Pasfrása reatha';

  @override
  String get recoveryKeyPassphraseNew => 'Pasfrása nua';

  @override
  String get recoveryKeyPassphraseConfirm => 'Deimhnigh an frása faire';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Pasfrása mícheart, déan iarracht arís';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Ní mór ceithre charachtar ar a laghad a bheith ann';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Ní hionann na frásaí faire, déan iarracht arís';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Athraigh an frása faire';

  @override
  String get recoveryKeyPinEnabled => 'Tá UAP criptithe cumasaithe';

  @override
  String get recoveryKeyPinHeader => 'UAP criptithe';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Pasfrása criptithe';

  @override
  String get recoveryKeyPinBody =>
      'Ní mór duit do PIN a iontráil gach uair a thosaíonn do ríomhaire.';

  @override
  String get recoveryKeyPinButton => 'Athraigh UAP...';

  @override
  String get recoveryKeyPinCurrent => 'UAP reatha';

  @override
  String get recoveryKeyPinNew => 'UAP nua';

  @override
  String get recoveryKeyPinConfirm => 'Deimhnigh an UAP';

  @override
  String get recoveryKeyPinCurrentError => 'UAP mícheart, déan iarracht arís';

  @override
  String get recoveryKeyPinConfirmError =>
      'Ní hionann na UAPanna, déan iarracht arís';

  @override
  String get recoveryKeyPinDialogHeader => 'Athraigh an UAP';

  @override
  String get recoveryKeyPassphraseShow => 'Taispeáin';

  @override
  String get recoveryKeyPassphraseHide => 'Folaigh';

  @override
  String get recoveryKeyPassphraseChange => 'Athraigh';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'UAP nuashonraithe';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Nuashonraíodh do UAP go rathúil.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Pasfrása nuashonraithe';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Nuashonraíodh d’fhrása faire go rathúil.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Pasfrása lag, déan níos faide nó níos casta é';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Pasfrása cothrom, déan níos faide nó níos casta é le haghaidh slándála níos fearr';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Pasfrása láidir';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'UAP lag, déan níos faide nó níos lú intuartha é';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'UAP cothrom, déan é níos faide nó níos lú intuartha le haghaidh slándála níos fearr';

  @override
  String get recoveryKeyPinEntropyOptimal => 'Tá an UAP fada go leor';

  @override
  String get recoveryKeySomethingWentWrongHeader =>
      'Chuaigh rud éigin mícheart';

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
      'Níl Ubuntu Pro ar fáil don leagan seo de Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Éilíonn Ubuntu Pro scaoileadh LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ní thacaíonn an leagan snapd seo le Ubuntu Pro';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Nuashonraigh snapd chun Ubuntu Pro a bhainistiú';

  @override
  String get ubuntuProEnabled => 'Tá Ubuntu Pro cumasaithe';

  @override
  String get ubuntuProLoadingLabel =>
      'D’fhéadfadh sé seo cúpla soicind a thógáil...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Slándáil agus comhlíonadh den scoth chun do ríomhaire. Saor in aisce i gcónaí le haghaidh úsáide pearsanta. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Foghlaim faoi Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Cumasaigh Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Cumasaigh le cuntas Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Beidh tú in ann cuntas a chruthú saor in aisce';

  @override
  String get ubuntuProMagicPrompt =>
      'Logáil isteach le do chuntas Ubuntu One, nó cruthaigh ceann saor in aisce.';

  @override
  String get ubuntuProMagicContinueInBrowser =>
      'Lean ar aghaidh sa bhrabhsálaí';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Is féidir leat logáil isteach ag $attachLink agus an cód $attachCode a iontráil freisin';
  }

  @override
  String get ubuntuProMagicError =>
      'Ní féidir Ubuntu Pro a chumasú; déan iarracht arís';

  @override
  String get ubuntuProEnableToken => 'Cumasaigh le comhartha';

  @override
  String get ubuntuProEnableTokenError => 'Ní féidir Ubuntu Pro a chumasú';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Ó do riarthóir TF nó ó $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Faigh comhartha Ubuntu Pro ó do riarthóir nó ó $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Comhartha';

  @override
  String get ubuntuProDisablePro => 'Díchumasaigh Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Díchumasaigh';

  @override
  String get ubuntuProDisablePrompt =>
      'Má dhíchumasaíonn tú Ubuntu Pro, dícheanglófar do shíntiús ón ríomhaire seo. Ar mhaith leat leanúint ar aghaidh?';

  @override
  String get ubuntuProDisableError =>
      'Níorbh fhéidir Ubuntu Pro a dhíchumasú; déan iarracht arís';

  @override
  String get ubuntuProEnable => 'Cumasaigh';

  @override
  String get ubuntuProCancel => 'Cealaigh';

  @override
  String get ubuntuProFeatureEnableError =>
      'Níorbh fhéidir an ghné a chumasú; déan iarracht arís.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Níorbh fhéidir an ghné a dhíchumasú; déan iarracht arís.';

  @override
  String get ubuntuProCompliance => 'Comhlíonadh agus cruaiteadh';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Ní mholtar ach chun cabhrú le FedRAMP, HIPAA agus ceanglais chomhlíonta agus cruaite eile.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Treoir Slándála Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Uathoibríonn sé cruaite agus iniúchadh le próifílí tagarmhairc CIS agus DISA-STIG agus ceadaíonn sé saincheaptha timpeallacht-shonracha.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Deimhniú modúil chripteagrafaíochta ó rialtas SAM agus Cheanada a léiríonn comhlíonadh leis an gcaighdeán cosanta sonraí FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Cumasaigh FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Ní féidir cumasú FIPS a aisiompú agus díchumasófar Livepatch go buan.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Roghnaigh do rogha FIPS is fearr leat';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS le nuashonruithe';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Suiteálann sé pacáistí bailíochtaithe FIPS 140-2 agus ceadaíonn sé nuashonruithe slándála rialta.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS gan nuashonruithe';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Suiteálann sé pacáistí bailíochtaithe FIPS 140-2. Ní dhéanfar iad seo a nuashonrú go dtí an chéad athdheimhniú eile.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Doiciméadú comhlíontachta slándála';

  @override
  String get ubuntuProESMTitle => 'Cothabháil Slándála Leathnaithe (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'Soláthraíonn ESM paistí slándála 10 mbliana do Chartlann Ubuntu ar fad. Faigh bainistíocht leanúnach leochaileachta do CVEanna criticiúla, arda agus meánmhéide roghnaithe.';

  @override
  String get ubuntuProESMMainTitle => 'Príomhphacáistí (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Nuashonruithe slándála do phacáistí príomhúla Ubuntu go dtí $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Pacáistí Cruinne (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Nuashonruithe slándála breise do phacáistí Ubuntu Universe go dtí $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Paiste Beo na hEithne';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Cumasaigh Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Cuir nuashonruithe slándála eithne i bhfeidhm agus an córas ag rith';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Taispeáin stádas Livepatch sa bharra barr';
}
