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
  String get diskEncryptionPageRepairHeader =>
      'Шифрование диска необходимо восстановить';

  @override
  String get diskEncryptionPageRepairBody =>
      'Автоматическое восстановление не удалось выполнить в процессе расшифровки. Восстановите диск сейчас, чтобы запустить компьютер без ключа восстановления.';

  @override
  String get diskEncryptionPageRepairButton => 'Начать восстановление...';

  @override
  String get diskEncryptionPageRepairing => 'Восстановление...';

  @override
  String get diskEncryptionPageRepairDialogHeader =>
      'Восстановление шифрования';

  @override
  String get diskEncryptionPageRepairDialogErrorHeader =>
      'Аппаратное шифрование не поддается восстановлению';

  @override
  String get diskEncryptionPageRepairDialogNotNeeded =>
      'Шифрование диска больше не требует восстановления.';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedHeader =>
      'Любой PIN-код и парольная фраза будут удалены';

  @override
  String get diskEncryptionPageRepairDialogPinOrPassphraseRemovedBody =>
      'После восстановления их можно будет установить заново.';

  @override
  String get diskEncryptionPageRepairDialogCheckKeyBody =>
      'Сброс настроек модуля TPM приводит к удалению всех ключей шифрования. Перед продолжением убедитесь, что ключ восстановления работает, так как он может понадобиться для запуска компьютера.';

  @override
  String get diskEncryptionPageRepairDialogKeyDoesntWorkBody =>
      'Проверьте ключ и попробуйте ещё раз.';

  @override
  String get diskEncryptionPageRepairDialogKeyHeader =>
      'Новый ключ восстановления';

  @override
  String get diskEncryptionPageRepairDialogKeyBody =>
      'В процессе восстановления ваш ключ восстановления будет заменён. Сохраните новый ключ восстановления в надёжном месте. После завершения восстановления Вы больше не сможете использовать старый ключ.';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningHeader =>
      'Старые ключи восстановления перестанут работать';

  @override
  String get diskEncryptionPageRepairDialogKeyWarningBody =>
      'Возможно, Вам стоит сообщить своему ИТ-администратору о том, что Вы заново шифруете диск, на случай, если у него хранятся какие-либо ключи восстановления.';

  @override
  String get diskEncryptionPageRepairDialogKeyNotUsed =>
      'Ваш текущий ключ восстановления по-прежнему действует. Новый ключ не использовался, поэтому его можно удалить.';

  @override
  String get diskEncryptionPageRepairDialogRepair => 'Восстановить';

  @override
  String get diskEncryptionPageRepairDialogNotNow => 'Не сейчас';

  @override
  String get diskEncryptionPageRepairDialogRestartBody =>
      'Перезагрузите компьютер, чтобы завершить предыдущие действия. Затем запустите восстановление заново.';

  @override
  String get diskEncryptionPageRepairDialogRestartNow => 'Перезагрузить';

  @override
  String get diskEncryptionPageRepairDialogRestartFailed =>
      'Не удалось перезагрузить компьютер. Перезагрузите его через системное меню.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffBody =>
      'Выключите компьютер, чтобы завершить предыдущие действия. Затем запустите восстановление заново.';

  @override
  String get diskEncryptionPageRepairDialogPowerOffNow => 'Выключить';

  @override
  String get diskEncryptionPageRepairDialogPowerOffFailed =>
      'Не удалось выключить компьютер. Выключите его через системное меню.';

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
      'Аппаратное шифрование включено, но требует восстановления';

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
  String get recoveryKeyPassphrase => 'Парольная фраза';

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
  String get recoveryKeyPin => 'PIN-код';

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
      'Требовать ввод парольной фразы при запуске';

  @override
  String get passphraseTypePinTileTitle =>
      'Требовать ввод PIN-кода при запуске';

  @override
  String get passphraseTypePageBodyAuthRequired =>
      'Для аппаратного шифрования на этом компьютере требуется дополнительная защита.';

  @override
  String get tpmActionPageTitleActionable =>
      'Возникла проблема с аппаратным шифрованием';

  @override
  String get tpmActionDetailsLabel => 'Технические сведения';

  @override
  String tpmActionSolutionLabel(int n, String text) {
    return 'Решение $n: $text';
  }

  @override
  String get tpmActionErrorSupportLabel =>
      'Попробуйте воспользоваться приведёнными ниже решениями или обратитесь в службу ИТ-поддержки.';

  @override
  String get tpmActionErrorSupportLabelSingle =>
      'Попробуйте воспользоваться приведённым ниже решением или обратитесь в службу ИТ-поддержки.';

  @override
  String get tpmActionErrorKindInternal => 'Внутренняя ошибка.';

  @override
  String get tpmActionErrorKindShutdownRequired =>
      'Необходимо выключить устройство.';

  @override
  String get tpmActionErrorKindRebootRequired => 'Необходима перезагрузка.';

  @override
  String get tpmActionErrorKindUnexpectedAction => 'Неожиданное действие.';

  @override
  String get tpmActionErrorKindMissingArgument => 'Отсутствует аргумент.';

  @override
  String get tpmActionErrorKindInvalidArgument => 'Недопустимый аргумент.';

  @override
  String get tpmActionErrorKindActionFailed => 'Действие не выполнено.';

  @override
  String get tpmActionErrorKindRunningInVm =>
      'Текущая среда является виртуальной машиной.';

  @override
  String get tpmActionErrorKindSystemNotEfi =>
      'На этом компьютере установлена устаревшая версия прошивки (legacy BIOS), которая несовместима с данным методом шифрования.';

  @override
  String get tpmActionErrorKindEfiVariableAccess =>
      'В прошивке этого компьютера обнаружена проблема.';

  @override
  String get tpmActionErrorKindNoSuitableTpm2Device =>
      'На этом компьютере отсутствует необходимое аппаратное обеспечение безопасности (TPM 2.0) для данного метода шифрования.';

  @override
  String get tpmActionErrorKindTpmDeviceDisabled =>
      'Модуль TPM на этом компьютере отключен.';

  @override
  String get tpmActionErrorKindTpmHierarchiesOwned =>
      'Модуль TPM этого компьютера уже используется другой системой или приложением.';

  @override
  String get tpmActionErrorKindTpmDeviceLockoutLockedOut =>
      'Модуль TPM этого компьютера в настоящее время заблокирован.';

  @override
  String get tpmActionErrorKindInsufficientTpmStorage =>
      'В модуле TPM этого компьютера недостаточно свободного места.';

  @override
  String get tpmActionErrorKindUnsupportedPlatform =>
      'Этот компьютер не поддерживает аппаратное шифрование.';

  @override
  String get tpmActionErrorKindInsufficientDmaProtection =>
      'В этом компьютере отсутствует необходимая функция безопасности (защита DMA).';

  @override
  String get tpmActionErrorKindNoKernelIommu =>
      'На этом компьютере отсутствует необходимая функция безопасности (IOMMU).';

  @override
  String get tpmActionErrorKindHostSecurity =>
      'Проблема с конфигурацией безопасности этого компьютера.';

  @override
  String get tpmActionErrorKindSysPrepApplicationsPresent =>
      'При запуске системы загружается другое ПО, которое может препятствовать безопасному соединению с модулем TPM компьютера.';

  @override
  String get tpmActionErrorKindAbsolutePresent =>
      'Модуль Absolute Persistence включен на этом компьютере.';

  @override
  String get tpmActionErrorKindInvalidSecureBootMode =>
      'Безопасная загрузка отключена на этом компьютере или не настроена в режиме «развернуто».';

  @override
  String get tpmActionErrorKindWeakSecureBootAlgorithmDetected =>
      'Некоторые сертификаты, подтверждающие ПО на этом компьютере, устарели или используют слабую защиту.';

  @override
  String get tpmActionErrorKindPreOsSecureBootAuthByEnrolledDigests =>
      'Этот компьютер использует ручной список разрешенных программ для проверки ПО при запуске.';

  @override
  String get tpmActionErrorKindAddonDriversPresent =>
      'Присутствуют доп. драйверы.';

  @override
  String get tpmActionErrorKindNoHardwareRootOfTrust =>
      'На этом компьютере отсутствует необходимая функция безопасности (аппаратный корень доверия).';

  @override
  String get tpmActionErrorKindGenericTpm =>
      'Проблема с модулем TPM этого компьютера.';

  @override
  String get tpmActionErrorKindGenericFirmware =>
      'В прошивке этого компьютера обнаружена проблема.';

  @override
  String get tpmActionFixActionReboot => 'Перезагрузить';

  @override
  String get tpmActionFixActionShutdown => 'Выключить';

  @override
  String get tpmActionFixActionRebootToFwSettings =>
      'Перезагрузить в настройки прошивки';

  @override
  String get tpmActionFixActionRebootToFwSettingsInstructions =>
      'Перезагрузите компьютер и во время запуска несколько раз нажмите клавишу настроек (обычно это F2, F10 или Delete).';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientDmaProtection =>
      'Включить защиту DMA вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsInsufficientTpmStorage =>
      'Очистить TPM вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootMode =>
      'Включить безопасную загрузку вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommu =>
      'Включить IOMMU вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoSuitablePcrBank =>
      'Включить банки PCR вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceDisabled =>
      'Включить TPM вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmDeviceLockoutLockedOut =>
      'Очистить TPM вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsTpmHierarchiesOwned =>
      'Очистить TPM вручную';

  @override
  String get tpmActionFixActionRebootToFwSettingsAbsolutePresent =>
      'Отключить модуль Absolute Persistence вручную';

  @override
  String get tpmActionFixActionContactOem => 'Связаться с OEM';

  @override
  String get tpmActionFixActionContactOsVendor => 'Связаться с поставщиком ОС';

  @override
  String get tpmActionFixActionEnableTpmViaFirmware =>
      'Включить TPM при перезапуске';

  @override
  String get tpmActionFixActionEnableAndClearTpmViaFirmware =>
      'Включить и очистить TPM при перезапуске';

  @override
  String get tpmActionFixActionClearTpmViaFirmware =>
      'Очистить TPM при перезапуске';

  @override
  String get tpmActionFixActionClearTpm => 'Очистить TPM';

  @override
  String get tpmActionFixActionProceed => 'Игнорировать';

  @override
  String get tpmActionFixActionRebootDescription =>
      'Перезагрузите компьютер, чтобы завершить предыдущие действия.';

  @override
  String get tpmActionFixActionRebootTpmDeviceFailureDescription =>
      'Перезагрузка компьютера может решить проблему.';

  @override
  String get tpmActionFixActionShutdownDescription =>
      'Выключите компьютер, чтобы завершить предыдущие действия.';

  @override
  String get tpmActionFixActionRebootToFwSettingsDescription =>
      'Это можно сделать в настройках прошивки компьютера.';

  @override
  String get tpmActionFixActionRebootToFwSettingsWithDocsDescription =>
      'Вы можете сделать это в настройках прошивки компьютера. Обратитесь к документации поставщика процессора за инструкциями.';

  @override
  String get tpmActionFixActionRebootToFwSettingsInvalidSecureBootModeHint =>
      'Убедитесь, что режим безопасной загрузки установлен на «развернуто».';

  @override
  String get tpmActionFixActionRebootToFwSettingsNoKernelIommuHint =>
      'Эта функция может называться «Технология виртуализации», «VT-d» или «AMD-Vi».';

  @override
  String get tpmActionFixActionProceedDescription =>
      'Игнорирование этой проблемы может снизить уровень безопасности данного компьютера.';

  @override
  String get tpmActionIgnoreAndContinueLabel => 'Игнорировать и продолжить';

  @override
  String get tpmActionFixActionClearTpmWarningTitle =>
      'Очистка TPM приведёт к удалению всех ключей шифрования';

  @override
  String get tpmActionFixActionClearTpmWarningBody =>
      'Вы лишитесь доступа ко всем данным на зашифрованных дисках, для которых у Вас нет ключей восстановления. Кроме того, это приведет к сбою других функций, зависящих от модуля TPM, таких как аутентификация и сертификаты.';

  @override
  String get tpmActionFixActionClearTpmConfirmationLabel => 'Я осознаю риск';

  @override
  String get tpmActionFixActionCaveatConfirm =>
      'При перезапуске может быть предложено подтвердить это действие.';

  @override
  String get tpmActionFixActionCaveatRetry =>
      'Затем вам придётся начать восстановление заново.';

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
