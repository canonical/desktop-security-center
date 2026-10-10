// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Центр безопасности';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Разрешить до выхода из системы';

  @override
  String get snapdRuleCategorySessionDenied => 'Запретить до выхода из системы';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Разрешать всегда';

  @override
  String get permissionRulePopupMenuSemanticLabel => 'Обновить разрешения';

  @override
  String get snapdRuleCategoryForeverDenied => 'Никогда не разрешать';

  @override
  String get snapdRuleCategoryTemporarilyAllowed => 'Разрешить временно';

  @override
  String get snapdRuleCategoryTemporarilyDenied => 'Запретить временно';

  @override
  String get snapdRuleCategoryAskAlways => 'Спрашивать всегда';

  @override
  String get snapPermissionReadLabel => 'Чтение';

  @override
  String get snapPermissionWriteLabel => 'Запись';

  @override
  String get snapPermissionExecuteLabel => 'Выполнение';

  @override
  String get snapPermissionAccessLabel => 'Доступ';

  @override
  String get snapPermissionsEnableTitle =>
      'Требовать с изолированных приложений запрос системных разрешений';

  @override
  String get snapPermissionsEnableWarning =>
      'Это экспериментальная функция для контроля доступа к ресурсам системы.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Включение может занять несколько секунд...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Отключение, это может занять несколько секунд...';

  @override
  String get snapPermissionsExperimentalLabel => 'Экспериментально';

  @override
  String get snapPermissionsOtherDescription =>
      'Управлять другими разрешениями можно в Настройках › Приложения.';

  @override
  String get snapPermissionsPageTitle => 'Разрешения приложений';

  @override
  String get snapPermissionsErrorTitle => 'Что-то пошло не так';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n правил',
      two: '2 правила',
      one: '1 правило',
      zero: 'нет правил',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Управление разрешениями к $interface для $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Правил ещё нет';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Пока ни одно приложение не запросило доступ';

  @override
  String get snapRulesRemoveAll => 'Удалить все правила';

  @override
  String get snapRulesResetAllPermissions => 'Сбросить все разрешения';

  @override
  String get homeInterfacePageTitle => 'Домашняя папка';

  @override
  String get homeInterfacePageDescription =>
      'Управление разрешениями для доступа к файлам в Домашней папке.';

  @override
  String get cameraInterfacePageTitle => 'Камера';

  @override
  String get cameraInterfacePageDescription =>
      'Разрешить приложениям доступ к вашим камерам.';

  @override
  String get microphoneInterfacePageTitle => 'Микрофон';

  @override
  String get microphoneInterfacePageDescription =>
      'Разрешить приложениям доступ к микрофону.';

  @override
  String get interfacePageTitle => 'Управление разрешениями';

  @override
  String get interfacePageLinkLearnMore => 'Подробнее';

  @override
  String get interfacePageLinkReportIssues => 'Сообщить о проблеме';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n приложений',
      two: '2 приложения',
      one: '1 приложение',
      zero: 'нет приложений',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Шифрование диска';

  @override
  String get diskEncryptionPageRecoveryKey => 'Ключ восстановления';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Если диск не разблокируется во время запуска, то ключ восстановления позволит вам восстановить доступ к данным. Сохраните его в безопасном месте.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Ключ восстановления позволит вам восстановить доступ к данным, если диск не удалось разблокировать при запуске. Сохраните его в безопасном месте. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Подробнее об аппаратном шифровании';

  @override
  String get diskEncryptionPageCheckKey => 'Проверить ключ восстановления...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Проверка ключа восстановления';

  @override
  String get diskEncryptionPageCheck => 'Проверить';

  @override
  String get diskEncryptionPageValidKey => 'Корректный ключ';

  @override
  String get diskEncryptionPageInvalidKey => 'Некорректный ключ';

  @override
  String get diskEncryptionPageEnterKey => 'Введите свой ключ восстановления';

  @override
  String get diskEncryptionPageKeyWorks => 'Ключ восстановления работает';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Не забудьте сохранить его в безопасном месте.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Ключ восстановления не работает';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Проверьте ключ или замените его новым.';

  @override
  String get diskEncryptionPageError => 'Ошибка';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Заменить ключ восстановления...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Заменить ключ восстановления';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Сохраните новый ключ восстановления в безопасном месте. После его замены вы больше не сможете использовать старый ключ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Показать QR-код';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Сохранить в файл';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Я сохранил свой ключ восстановления в безопасном месте';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Заменить';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Отказаться';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Ключ восстановления заменён';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Не забудьте сохранить его в надёжном месте.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Не удалось заменить ключ восстановления';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'При замене ключа восстановления произошла ошибка. Ваш старый ключ останется действительным.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Ключ восстановления для шифрования';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Отсканируйте QR-код, чтобы скопировать ключ восстановления и сохранить его в безопасном месте, например, в менеджере паролей. Кроме того, вы можете сделать фотографию, чтобы воспользоваться ей позже.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Скопировано в буфер обмена';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Копировать';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Настройки шифрования недоступны';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Не удалось получить статус шифрования этого компьютера.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Конфигурация TPM вашего компьютера не поддерживается.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Ваша версия snapd не поддерживается';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Проверьте, что Центр безопасности и snapd обновлены.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Центр безопасности не может подключиться к интерфейсу snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Чтобы исправить это, выполните следующую команду в терминале:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Добавить PIN-код...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Добавить парольную фразу...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Добавить парольную фразу';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Добавить PIN-код';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Вам нужно будет вводить PIN-код при каждом запуске компьютера. Этот PIN-код отличается от пароля пользователя.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Если забудете PIN-код, вы сможете восстановить доступ к диску с помощью ключа восстановления.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Вам нужно будет вводить парольную фразу при каждом запуске компьютера. Эта парольная фраза отличается от пароля пользователя.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Если забудете парольную фразу, вы сможете восстановить доступ к диску с помощью ключа восстановления.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Дополнительная защита';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Для дополнительной защиты вы можете установить парольную фразу или PIN-код. Вам нужно будет вводить парольную фразу или PIN-код при каждом запуске компьютера.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Подробнее';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Добавить';

  @override
  String get diskEncryptionPageRemovePinButton => 'Удалить PIN-код...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Удалить парольную фразу...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Добавление PIN-кода, это может занять несколько секунд...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Добавление парольной фразы, это может занять несколько секунд...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Удаление PIN-кода, это может занять несколько секунд...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Удаление парольной фразы, это может занять несколько секунд...';

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
      'Файл ключа восстановления не сохранён';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Файл ключа восстановления не может быть сохранён во временном месте';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Неизвестная ошибка';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Не удалось сохранить ключ восстановления в файл';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'У вас нет прав на запись в этот файл.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'У вас нет разрешения на запись в эту папку. Попробуйте другое место или воспользуйтесь другим способом.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Попробуйте иное место, например съёмный диск, или воспользуйтесь другим способом.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Сохранить файл ключа восстановления';

  @override
  String get recoveryKeyFilePickerFilter => 'Текстовые файлы';

  @override
  String get recoveryKeyTPMEnabled => 'Включено аппаратное шифрование';

  @override
  String get recoveryKeyTPMNeedsRepair =>
      'Hardware-backed encryption is enabled but needs repair';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Ключи шифрования хранятся в доверенном платформенном модуле (TPM) вашего компьютера.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Узнайте больше об аппаратном шифровании';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Парольная фраза шифрования включена';

  @override
  String get recoveryKeyPassphraseHeader => 'Изменить парольную фразу';

  @override
  String get recoveryKeyPassphraseBody =>
      'Будет необходимо вводить парольную фразу при каждом запуске компьютера.';

  @override
  String get recoveryKeyPassphraseButton => 'Изменить парольную фразу...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Текущая парольная фраза';

  @override
  String get recoveryKeyPassphraseNew => 'Новая парольная фраза';

  @override
  String get recoveryKeyPassphraseConfirm => 'Подтвердите парольную фразу';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Неверная парольная фраза, попробуйте ещё раз';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Длина должна быть не менее 4 символов';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Парольные фразы не совпадают, попробуйте ещё раз';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Изменить парольную фразу';

  @override
  String get recoveryKeyPinEnabled => 'PIN-код шифрования включён';

  @override
  String get recoveryKeyPinHeader => 'PIN-код шифрования';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Парольная фраза шифрования';

  @override
  String get recoveryKeyPinBody =>
      'Будет необходимо вводить PIN-код при каждом запуске компьютера.';

  @override
  String get recoveryKeyPinButton => 'Изменить PIN-код...';

  @override
  String get recoveryKeyPinCurrent => 'Текущий PIN-код';

  @override
  String get recoveryKeyPinNew => 'Новый PIN-код';

  @override
  String get recoveryKeyPinConfirm => 'Подтвердить PIN-код';

  @override
  String get recoveryKeyPinCurrentError =>
      'Неверный PIN-код, попробуйте ещё раз';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-коды не совпадают, попробуйте ещё раз';

  @override
  String get recoveryKeyPinDialogHeader => 'Изменить PIN-код';

  @override
  String get recoveryKeyPassphraseShow => 'Показать';

  @override
  String get recoveryKeyPassphraseHide => 'Скрыть';

  @override
  String get recoveryKeyPassphraseChange => 'Изменить';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-код обновлён';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Ваш PIN-код успешно обновлён.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Парольная фраза обновлена';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Ваша парольная фраза была успешно обновлена.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Слабая парольная фраза, сделайте её длиннее или более сложной';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Подходящая парольная фраза, но для большей безопасности можете сделать её длиннее или более сложной';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Надежная парольная фраза';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Слабый PIN-код, сделайте его длиннее или менее предсказуемым';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Подходящий PIN-код, но для большей безопасности можете сделать его длиннее или менее предсказуемым';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-код достаточно длинный';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Что-то пошло не так';

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
      'Сервис Ubuntu Pro недоступен для этой версии Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Для Ubuntu Pro требуется версия LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro не поддерживается этой версией snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Обновите snapd для настройки сервиса Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Сервис Ubuntu Pro активирован';

  @override
  String get ubuntuProLoadingLabel => 'Это может занять несколько секунд...';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Безопасность и соответствие стандартам корпоративного уровня для Вашего компьютера. Бесплатно для личного использования. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Подробнее об Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Активировать Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic => 'Включить с уч. записью Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Вы можете создать учётную запись бесплатно';

  @override
  String get ubuntuProMagicPrompt =>
      'Войдите в свою учётную запись Ubuntu One или создайте её бесплатно.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Продолжить в браузере';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Вы также можете войти на сайт $attachLink и ввести код: $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Не удается активировать Ubuntu Pro, повторите попытку';

  @override
  String get ubuntuProEnableToken => 'Включить с помощью токена';

  @override
  String get ubuntuProEnableTokenError => 'Не удается активировать Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'От вашего ИТ-администратора или на сайте $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Получите токен Ubuntu Pro у своего администратора или на сайте $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Токен';

  @override
  String get ubuntuProDisablePro => 'Отключить Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Отключить';

  @override
  String get ubuntuProDisablePrompt =>
      'Отключение Ubuntu Pro отменит привязку подписки к этому компьютеру. Хотите продолжить?';

  @override
  String get ubuntuProDisableError =>
      'Не удалось отключить Ubuntu Pro. Попробуйте ещё раз';

  @override
  String get ubuntuProEnable => 'Включить';

  @override
  String get ubuntuProCancel => 'Отмена';

  @override
  String get ubuntuProFeatureEnableError =>
      'Не удалось включить функцию, повторите попытку.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Не удалось отключить функцию, повторите попытку.';

  @override
  String get ubuntuProCompliance => 'Соответствие стандартам и защита';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Рекомендуется использовать только для помощи в соблюдении требований FedRAMP, HIPAA и других стандартов соответствия и усиления защиты.';

  @override
  String get ubuntuProComplianceUSGTitle =>
      'Руководство по безопасности Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Автоматизирует защиту и аудит с использованием профилей CIS Benchmark и DISA-STIG, при этом позволяя настраивать параметры под конкретную среду.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Сертификация криптографического модуля на соответствие стандарту защиты данных FIPS 140-2 правительствами США и Канады.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Включить FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Включение FIPS не может быть отменено, и Livepatch будет навсегда отключён.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Выберите предпочтительный вариант FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS с обновлениями';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Устанавливает пакеты, сертифицированные по стандарту FIPS 140-2, и позволяет регулярно обновлять систему безопасности.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS без обновлений';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Устанавливает пакеты, сертифицированные по стандарту FIPS 140-2. Они не будут обновляться до следующей повторной сертификации.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Документация по соблюдению требований безопасности';

  @override
  String get ubuntuProESMTitle => 'Расширенное обслуживание безопасности (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM предоставляет 10 лет обновлений безопасности для всего архива Ubuntu. Получайте непрерывное управление уязвимостями для критических, высоких и выбранных уязвимостей среднего уровня (CVE).';

  @override
  String get ubuntuProESMMainTitle => 'Пакеты Main (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Обновления безопасности для пакетов Ubuntu Main до $year года';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Пакеты Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Дополнительные обновления безопасности для пакетов Ubuntu Universe до $year года';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch ядра';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Включить Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Применять обновления безопасности ядра во время работы системы';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Показывать состояние Livepatch в верхней панели';
}
