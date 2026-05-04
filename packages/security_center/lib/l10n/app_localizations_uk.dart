// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Центр безпеки';

  @override
  String get snapdRuleCategorySessionAllowed => 'Дозволити до виходу з системи';

  @override
  String get snapdRuleCategorySessionDenied => 'Заборонити до виходу з системи';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Завжди дозволяти';

  @override
  String get snapdRuleCategoryForeverDenied => 'Завжди забороняти';

  @override
  String get snapPermissionReadLabel => 'Читання';

  @override
  String get snapPermissionWriteLabel => 'Запис';

  @override
  String get snapPermissionExecuteLabel => 'Виконання';

  @override
  String get snapPermissionAccessLabel => 'Доступ';

  @override
  String get snapPermissionsEnableTitle =>
      'Вимагати від застосунків запитувати про системні дозволи';

  @override
  String get snapPermissionsEnableWarning =>
      'Це експериментальна можливість контролю доступу до ресурсів системи.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Увімкнення, це може тривати кілька секунд...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Вимкнення, це може тривати кілька секунд...';

  @override
  String get snapPermissionsExperimentalLabel => 'Експериментально';

  @override
  String get snapPermissionsOtherDescription =>
      'Ви можете керувати іншими дозволами в Налаштуваннях › Програми.';

  @override
  String get snapPermissionsPageTitle => 'Дозволи застосунків';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n правило',
      many: '$n правил',
      few: '$n правила',
      one: '1 правило',
      zero: 'немає правил',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Керувати дозволами $interface для $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ще немає правил';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Жодні застосунки ще не запитували доступ';

  @override
  String get snapRulesRemoveAll => 'Вилучити всі правила';

  @override
  String get snapRulesResetAllPermissions => 'Скинути всі дозволи';

  @override
  String get homeInterfacePageTitle => 'Домашня тека';

  @override
  String get homeInterfacePageDescription =>
      'Керувати дозволами на доступ до файлів у теці «Домівка».';

  @override
  String get cameraInterfacePageTitle => 'Камера';

  @override
  String get cameraInterfacePageDescription =>
      'Дозволити застосункам отримувати доступ до ваших камер.';

  @override
  String get microphoneInterfacePageTitle => 'Мікрофон';

  @override
  String get microphoneInterfacePageDescription =>
      'Дозволити застосункам отримувати доступ до вашого мікрофону.';

  @override
  String get interfacePageTitle => 'Керувати дозволами';

  @override
  String get interfacePageDescription =>
      'Суворо обмежені застосунки запитуватимуть вас перед доступом до файлів і тек. Ця функція експериментальна і може бути змінена.';

  @override
  String get interfacePageLinkLearnMore => 'Докладніше';

  @override
  String get interfacePageLinkGiveFeedback => 'Надіслати відгук';

  @override
  String get interfacePageLinkReportIssues => 'Повідомити про проблеми';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n застосунок',
      many: '$n застосунків',
      few: '$n застосунки',
      one: '1 застосунок',
      zero: 'немає застосунків',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Шифрування диска';

  @override
  String get diskEncryptionPageRecoveryKey => 'Ключ відновлення';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Ключ відновлення дає змогу відновити доступ до ваших даних, якщо диск не вдасться розблокувати під час завантаження. Збережіть його в безпечному місці.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Ключ відновлення дає вам змогу відновити доступ до ваших даних, якщо диск не розблокується під час запуску. Збережіть його в безпечному місці. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Докладніше про апаратне шифрування';

  @override
  String get diskEncryptionPageCheckKey => 'Перевірити ключ відновлення...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Перевірити ключ відновлення';

  @override
  String get diskEncryptionPageCheck => 'Перевірити';

  @override
  String get diskEncryptionPageValidKey => 'Дійсний ключ';

  @override
  String get diskEncryptionPageInvalidKey => 'Недійсний ключ';

  @override
  String get diskEncryptionPageEnterKey => 'Введіть свій ключ відновлення';

  @override
  String get diskEncryptionPageKeyWorks => 'Ключ відновлення працює';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Не забудьте зберегти його в безпечному місці.';

  @override
  String get diskEncryptionPageKeyDoesntWork => 'Ключ відновлення не працює';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Перевірте ключ або замініть його новим.';

  @override
  String get diskEncryptionPageError => 'Помилка';

  @override
  String get diskEncryptionPageReplaceButton => 'Замініть ключ відновлення...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Замініть ключ відновлення';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Збережіть новий ключ відновлення в безпечному місці. Після його заміни ви більше не зможете використовувати старий ключ.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Показати QR код';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Зберегти у файл';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ключ відновлення збережено в надійному місці';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Замінити';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Відхилити';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Ключ відновлення замінено';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Не забудьте зберегти його в безпечному місці.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Не вдалося замінити ключ відновлення';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Сталася помилка під час заміни ключа відновлення, ваш старий ключ залишиться дійсним.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Ключ відновлення шифрування';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Відскануйте QR-код, щоб скопіювати ключ відновлення, і збережіть його в безпечному місці, наприклад у менеджері паролів. Ви також можете зробити фото для подальшого використання.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Скопійовано в буфер обміну';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Копіювати';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Налаштування шифрування недоступні';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Не вдалося отримати стан шифрування цього комп\'ютера.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Конфігурація TPM вашого комп\'ютера не підтримується.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Ваша версія Snapd не підтримується';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Перевірте, чи оновлені Security Center та snapd.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Security Center не може підключитися до інтерфейсу snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Щоб виправити це, виконайте цю команду в терміналі:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Додати PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Додати парольну фразу...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Додати парольну фразу';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Додати PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Вам потрібно буде вводити свій PIN-код щоразу, коли комп\'ютер запускається. Цей PIN-код відрізняється від вашого пароля користувача.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Якщо ви забудете свій PIN-код, ви можете відновити доступ до диска за допомогою ключа відновлення.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Вам потрібно буде вводити свою парольну фразу щоразу під час запуску комп\'ютера. Ця парольна фраза відрізняється від вашого пароля користувача.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Якщо ви забудете свою парольну фразу, ви можете відновити доступ до диска за допомогою ключа відновлення.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader => 'Додаткова безпека';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Ви можете встановити парольну фразу або PIN-код для додаткової безпеки. Вам потрібно буде вводити це щоразу під час запуску комп\'ютера.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore =>
      'Дізнатися більше';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Додати';

  @override
  String get diskEncryptionPageRemovePinButton => 'Видалити PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Видалити парольну фразу...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Додавання PIN-коду, це може тривати кілька секунд...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Додавання парольної фрази, це може тривати кілька секунд...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Видалення PIN-коду, це може тривати кілька секунд...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Видалення парольної фрази, це може тривати кілька секунд...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Файл ключа відновлення не збережено';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Файл ключа відновлення не можна зберегти у тимчасовому розташуванні';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Невідома помилка';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Не вдалося зберегти ключ відновлення у файл';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'У вас немає дозволу на запис у це місце розташування файлу.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'У вас немає дозволу на запис до цієї теки. Спробуйте інше розташування або використайте інший спосіб.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Спробуйте інше розташування, наприклад, змінний диск, або використайте інший метод.';

  @override
  String get recoveryKeyFilePickerTitle => 'Зберегти файл ключа відновлення';

  @override
  String get recoveryKeyFilePickerFilter => 'Текстовий файл';

  @override
  String get recoveryKeyTPMEnabled => 'Апаратне шифрування ввімкнено';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Ключі шифрування зберігаються в модулі Trusted Platform Module (TPM) вашого комп\'ютера.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Дізнайтеся більше про шифрування з апаратним забезпеченням';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Парольна фраза шифрування увімкнена';

  @override
  String get recoveryKeyPassphraseHeader => 'Змінити парольну фразу';

  @override
  String get recoveryKeyPassphraseBody =>
      'Вам потрібно вводити свою парольну фразу щоразу, коли комп\'ютер запускається.';

  @override
  String get recoveryKeyPassphraseButton => 'Змінити парольну фразу...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Поточна парольна фраза';

  @override
  String get recoveryKeyPassphraseNew => 'Нова парольна фраза';

  @override
  String get recoveryKeyPassphraseConfirm => 'Підтвердити парольну фразу';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Неправильна парольна фраза, спробуйте ще раз';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Має містити щонайменше 4 символи';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Парольні фрази не збігаються, спробуйте ще раз';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Змінити парольну фразу';

  @override
  String get recoveryKeyPinEnabled => 'PIN-код для шифрування увімкнено';

  @override
  String get recoveryKeyPinHeader => 'PIN-код шифрування';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Пароль шифрування';

  @override
  String get recoveryKeyPinBody =>
      'Вам потрібно вводити свій PIN-код щоразу, коли комп\'ютер запускається.';

  @override
  String get recoveryKeyPinButton => 'Змінити PIN-код...';

  @override
  String get recoveryKeyPinCurrent => 'Поточний PIN-код';

  @override
  String get recoveryKeyPinNew => 'Новий PIN-код';

  @override
  String get recoveryKeyPinConfirm => 'Підтвердьте PIN-код';

  @override
  String get recoveryKeyPinCurrentError =>
      'Неправильний PIN-код, спробуйте ще раз';

  @override
  String get recoveryKeyPinConfirmError =>
      'PIN-коди не збігаються, спробуйте ще раз';

  @override
  String get recoveryKeyPinDialogHeader => 'Змінити PIN-код';

  @override
  String get recoveryKeyPassphraseShow => 'Показати';

  @override
  String get recoveryKeyPassphraseHide => 'Сховати';

  @override
  String get recoveryKeyPassphraseChange => 'Змінити';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN-код оновлено';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Ваш PIN-код успішно оновлено.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Парольну фразу оновлено';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Ваша парольна фраза успішно оновлена.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Слабка парольна фраза, зробіть її довшою і складнішою';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Достатня парольна фраза, зробіть її довшою або складнішою для кращої безпеки';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Надійна парольна фраза';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Слабкий PIN-код, зробіть його довшим або менш передбачуваним';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Достатній PIN-код, зробіть його довшим або менш передбачуваним для кращої безпеки';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN-код достатньо довгий';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Щось пішло не так';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro недоступний для цієї версії Ubuntu';

  @override
  String get ubuntuProNotSupportedDetails => 'Ubuntu Pro вимагає випуску LTS';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro не підтримується цією версією snapd';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Оновіть snapd для керування Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro увімкнено';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Безпека та відповідність корпоративного рівня для вашого комп\'ютера. Завжди безкоштовно для особистого використання. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Дізнайтеся про Ubuntu Pro';

  @override
  String get ubuntuProEnablePro => 'Увімкнути Ubuntu Pro';

  @override
  String get ubuntuProEnableMagic =>
      'Увімкнути за допомогою облікового запису Ubuntu One';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Ви зможете створити обліковий запис безкоштовно';

  @override
  String get ubuntuProMagicPrompt =>
      'Увійдіть, використовуючи свій обліковий запис Ubuntu One, або створіть його безкоштовно.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Продовжіть у браузері';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Ви також можете увійти за адресою $attachLink та ввести код $attachCode';
  }

  @override
  String get ubuntuProMagicError =>
      'Не вдалося ввімкнути Ubuntu Pro, спробуйте ще раз';

  @override
  String get ubuntuProEnableToken => 'Увімкнути за допомогою токена';

  @override
  String get ubuntuProEnableTokenError => 'Не вдається ввімкнути Ubuntu Pro';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Від вашого ІТ-адміністратора або з $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Отримайте токен Ubuntu Pro у свого адміністратора або на сайті $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Токен';

  @override
  String get ubuntuProDisablePro => 'Вимкнути Ubuntu Pro';

  @override
  String get ubuntuProDisable => 'Вимкнути';

  @override
  String get ubuntuProDisablePrompt =>
      'Вимкнення Ubuntu Pro від\'єднає вашу підписку від цього комп’ютера. Продовжити?';

  @override
  String get ubuntuProDisableError =>
      'Could not disable Ubuntu Pro. Please try again.';

  @override
  String get ubuntuProEnable => 'Увімкнути';

  @override
  String get ubuntuProCancel => 'Скасувати';

  @override
  String get ubuntuProFeatureEnableError =>
      'Не вдалося ввімкнути функцію, спробуйте ще раз.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Не вдалося вимкнути функцію, спробуйте ще раз.';

  @override
  String get ubuntuProCompliance => 'Відповідність та посилення захисту';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Рекомендовано лише для допомоги з FedRAMP, HIPAA та іншими вимогами щодо відповідності та посилення безпеки.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Посібник з безпеки Ubuntu (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Автоматизує посилення захисту та аудит за допомогою бенчмарків CIS та профілів DISA-STIG, водночас дозволяючи налаштування відповідно до середовища.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Сертифікація криптографічного модуля уряду США та Канади на відповідність стандарту захисту даних FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'Увімкнути FIPS';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Увімкнення FIPS не можна скасувати, і Livepatch буде назавжди вимкнено.';

  @override
  String get ubuntuProComplianceFIPSPrompt => 'Виберіть бажаний варіант FIPS';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS з оновленнями';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Встановлює перевірені пакети FIPS 140-2 та дозволяє регулярні оновлення безпеки.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS без оновлень';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Встановлює перевірені пакети FIPS 140-2. Вони не будуть оновлені до наступної пересертифікації.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Документація щодо відповідності вимогам безпеки';

  @override
  String get ubuntuProESMTitle => 'Розширене обслуговування безпеки (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM надає 10 років виправлень безпеки для понад 25 000 пакетів з відкритим кодом. Отримайте безперервне керування вразливостями для критичних, високо- та середнього рівня CVE.';

  @override
  String get ubuntuProESMMainTitle => 'Основні пакети (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Оновлення безпеки для 2300 основних пакетів Ubuntu до $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Пакети Universe (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Додаткові оновлення безпеки для понад 23 000 пакетів Ubuntu Universe до $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Livepatch для ядра';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Увімкнути Livepatch';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Застосовуйте оновлення безпеки ядра під час роботи системи';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Показати стан Livepatch у верхній панелі';
}
