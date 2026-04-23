// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Centro de Segurança';

  @override
  String get snapdRuleCategorySessionAllowed =>
      'Permitir até terminar a sessão';

  @override
  String get snapdRuleCategorySessionDenied => 'Negar até terminar a sessão';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permitir sempre';

  @override
  String get snapdRuleCategoryForeverDenied => 'Negar sempre';

  @override
  String get snapPermissionReadLabel => 'Ler';

  @override
  String get snapPermissionWriteLabel => 'Gravar';

  @override
  String get snapPermissionExecuteLabel => 'Executar';

  @override
  String get snapPermissionAccessLabel => 'Acesso';

  @override
  String get snapPermissionsEnableTitle =>
      'Requer aplicações para solicitar por permissões do sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'É uma funcionalidade experimental para controlar o acesso aos recursos do seu sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'A ativar, pode demorar uns segundos...';

  @override
  String get snapPermissionsDisablingLabel =>
      'A desativar, pode demorar uns segundos...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Pode gerir outras permissões em Definições > Aplicações.';

  @override
  String get snapPermissionsPageTitle => 'Permissões de Aplicação';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regras',
      one: '1 regra',
      zero: 'no rules',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gerir permissões de $interface para $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ainda sem regras';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Nenhum aplicativo solicitou acesso ainda';

  @override
  String get snapRulesRemoveAll => 'Remover todas as regras';

  @override
  String get snapRulesResetAllPermissions => 'Redefinir todas as permissões';

  @override
  String get homeInterfacePageTitle => 'Pasta de Início';

  @override
  String get homeInterfacePageDescription =>
      'Gerir permissões para aceder aos ficheiros na sua pasta de Início.';

  @override
  String get cameraInterfacePageTitle => 'Câmera';

  @override
  String get cameraInterfacePageDescription =>
      'Permita que os aplicativos acessem suas câmeras.';

  @override
  String get microphoneInterfacePageTitle => 'Microphone';

  @override
  String get microphoneInterfacePageDescription =>
      'Allow apps to access your microphone.';

  @override
  String get interfacePageTitle => 'Gerir permissões';

  @override
  String get interfacePageDescription =>
      'Aplicações estritamente confinadas irão perguntar-lhe antes de aceder aos ficheiros e pastas. Esta funcionalidade é experimental e está sujeita a alterações.';

  @override
  String get interfacePageLinkLearnMore => 'Saber mais';

  @override
  String get interfacePageLinkGiveFeedback => 'Dar opinião';

  @override
  String get interfacePageLinkReportIssues => 'Reportar problemas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicações',
      one: '1 aplicação',
      zero: 'no apps',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Encriptação de Disco';

  @override
  String get diskEncryptionPageRecoveryKey => 'Código de recuperação';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'O código de recuperação permite-lhe recuperar o acesso aos seus dados se o disco falhar para desbloquear durante o arranque. Guarde-o num local seguro.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'A chave de recuperação permite que você recupere o acesso aos seus dados caso o disco não desbloqueie durante a inicialização. Guarde-a em um local seguro. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Saiba mais sobre criptografia com suporte de hardware';

  @override
  String get diskEncryptionPageCheckKey => 'Verificar código de recuperação...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Verificar Código de Recuperação';

  @override
  String get diskEncryptionPageCheck => 'Verificar';

  @override
  String get diskEncryptionPageValidKey => 'Código válido';

  @override
  String get diskEncryptionPageInvalidKey => 'Código inválido';

  @override
  String get diskEncryptionPageEnterKey => 'Insira o seu código de recuperação';

  @override
  String get diskEncryptionPageKeyWorks => 'Código de recuperação funciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Lembre-se de o manter num local seguro.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Código de recuperação não funciona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Verifique o código ou substitua-o por um novo.';

  @override
  String get diskEncryptionPageError => 'Erro';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Substituir o código de recuperação...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Substituir código de recuperação';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Guarde o código de recuperação num local seguro. Depois de substituí-lo, não poderá utilizar mais o código antigo.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostrar código QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Guardar em ficheiro';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Eu guardei o meu código de recuperação num local seguro';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Substituir';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Rejeitar';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Código de recuperação substituído';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Lembre-se de o manter num local seguro.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Substituição do código de recuperação falhou';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Ocorreu algo de errado ao substituir o seu código de recuperação, o seu código antigo permanecerá válido.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Encriptação do código de recuperação';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Digitalize o código QR para copiar o código de recuperação e guardá-lo num local seguro, tal como um gestor de palavras-passe. Também pode fotografá-lo para utilizar mais tarde.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copiado para a área de transferência';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copiar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Configurações de criptografia não disponíveis';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Não foi possível recuperar o estado de criptografia deste computador.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'A configuração do TPM do seu computador não está em um estado compatível.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Sua versão do snapd não é compatível';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Verifique se o Centro de Segurança e o snapd estão atualizados.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'O Centro de Segurança não consegue se conectar à interface snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Para corrigir isso, execute o seguinte comando no terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Add PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Add passphrase...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Add passphrase';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Add PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'You will need to enter your PIN every time your computer starts. This PIN is different from your user password.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'If you forget your PIN, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'You will need to enter your passphrase every time your computer starts. This passphrase is different from your user password.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'If you forget your passphrase, you can regain access to the disk by using the recovery key.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Additional security';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'You can set a passphrase or a PIN for additional security. You will need to enter it every time your computer starts.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Learn more';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Add';

  @override
  String get diskEncryptionPageRemovePinButton => 'Remove PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Remove passphrase...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Adding PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Adding passphrase, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'Removing PIN, this may take a few seconds...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Removing passphrase, this may take a few seconds...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Ficheiro do código de recuperação não guardado';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'O ficheiro do código de recuperação não pode ser guardado numa localização temporária';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Erro desconhecido';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Failed to save your recovery key to file';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'You do not have permission to write to that file location.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Não tem permissão para gravar nessa pasta. Tente uma localização diferente ou utilize outro método.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Tente uma localização diferente, tal como uma unidade removível, ou utilize outro método.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Guardar ficheiro do código de recuperação';

  @override
  String get recoveryKeyFilePickerFilter => 'Ficheiros de texto';

  @override
  String get recoveryKeyTPMEnabled =>
      'A encriptação suportada por hardware está ativada';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'The encryption keys are stored in your computer\'s Trusted Platform Module (TPM).';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Learn more about hardware-backed encryption';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'A frase passe de encriptação está ativada';

  @override
  String get recoveryKeyPassphraseHeader => 'Alterar frase passe';

  @override
  String get recoveryKeyPassphraseBody =>
      'Tem de inserir a sua frase passe durante o arranque para desbloquear o disco. Pode-a alterar, mas não desativá-la.';

  @override
  String get recoveryKeyPassphraseButton => 'Alterar frase passe...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Frase passe atual';

  @override
  String get recoveryKeyPassphraseNew => 'Nova frase passe';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirmar frase passe';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Frase passe incorreta, tente novamente';

  @override
  String get recoveryKeyPassphraseNewError => 'Deve ter pelo menos 4 carateres';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'As frases passe não coincidem, tente novamente';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Alterar Frase Passe';

  @override
  String get recoveryKeyPinEnabled => 'O CÓDIGO de encripção está ativado';

  @override
  String get recoveryKeyPinHeader => 'CÓDIGO de Encriptação';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Encryption passphrase';

  @override
  String get recoveryKeyPinBody =>
      'Tem de inserir o seu CÓDIGO durante o arranque para desbloquear o disco. Pode alterá-lo, mas não desativá-lo.';

  @override
  String get recoveryKeyPinButton => 'Alterar CÓDIGO...';

  @override
  String get recoveryKeyPinCurrent => 'CÓDIGO Atual';

  @override
  String get recoveryKeyPinNew => 'Novo CÓDIGO';

  @override
  String get recoveryKeyPinConfirm => 'Confirmar CÓDIGO';

  @override
  String get recoveryKeyPinCurrentError => 'CÓDIGO incorreto, tente novamente';

  @override
  String get recoveryKeyPinConfirmError =>
      'Os CÓDIGOS não coincidem, tente novamente';

  @override
  String get recoveryKeyPinDialogHeader => 'Alterar CÓDIGO';

  @override
  String get recoveryKeyPassphraseShow => 'Mostrar';

  @override
  String get recoveryKeyPassphraseHide => 'Ocultar';

  @override
  String get recoveryKeyPassphraseChange => 'Alterar';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'CÓDIGO atualizado';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'O seu CÓDIGO foi atualizado com sucesso.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Frase passe atualizada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'A sua frase passe foi atualizada com sucesso.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Frase passe fraca, torne-a mais longa ou mais complexa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Frase passe razoável, torne-a mais longa ou mais complexa para melhor segurança';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Frase passe forte';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'CÓDIGO fraco, torne-o mais longo ou menos previsível';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'CÓDIGO razoável, torne-o mais longo ou menos previsível para melhor segurança';

  @override
  String get recoveryKeyPinEntropyOptimal => 'CÓDIGO é longo o suficiente';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Ocorreu algo de errado';

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
  String get ubuntuProEnabled => 'Ubuntu Pro is enabled';

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
      'ESM provides 10 years of security patches for 25,000+ open source packages. Get continuous vulnerability management for critical, high, and medium CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Main packages (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Security updates for 2,300 Ubuntu Main package until $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe packages (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Additional security updates for over 23,000 Ubuntu Universe packages until $year';
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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Centro de Segurança';

  @override
  String get snapdRuleCategorySessionAllowed => 'Permitir até o logout';

  @override
  String get snapdRuleCategorySessionDenied =>
      'Negar até que o usuário faça logout';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Permitir sempre';

  @override
  String get snapdRuleCategoryForeverDenied => 'Negar sempre';

  @override
  String get snapPermissionReadLabel => 'Ler';

  @override
  String get snapPermissionWriteLabel => 'Escrever';

  @override
  String get snapPermissionExecuteLabel => 'Executar';

  @override
  String get snapPermissionAccessLabel => 'Acesso';

  @override
  String get snapPermissionsEnableTitle =>
      'Exigir que os aplicativos solicitem permissões do sistema';

  @override
  String get snapPermissionsEnableWarning =>
      'Esta é uma funcionalidade experimental para controlar o acesso aos recursos do seu sistema.';

  @override
  String get snapPermissionsEnablingLabel =>
      'A ativação pode levar alguns segundos...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Desativar pode levar alguns segundos...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimental';

  @override
  String get snapPermissionsOtherDescription =>
      'Você pode gerenciar outras permissões em Configurações › Aplicativos.';

  @override
  String get snapPermissionsPageTitle => 'Permissões do aplicativo';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n regras',
      one: '1 regra',
      zero: 'sem regras',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return 'Gerenciar permissões de $interface para $snap.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Ainda não há regras';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Nenhum aplicativo solicitou acesso ainda';

  @override
  String get snapRulesRemoveAll => 'Remover todas as regras';

  @override
  String get snapRulesResetAllPermissions => 'Redefinir todas as permissões';

  @override
  String get homeInterfacePageTitle => 'Pasta inicial';

  @override
  String get homeInterfacePageDescription =>
      'Gerencie as permissões de acesso aos arquivos na sua pasta pessoal.';

  @override
  String get cameraInterfacePageTitle => 'Câmera';

  @override
  String get cameraInterfacePageDescription =>
      'Permita que os aplicativos acessem suas câmeras.';

  @override
  String get interfacePageTitle => 'Gerenciar permissões';

  @override
  String get interfacePageDescription =>
      'Aplicativos com acesso restrito solicitarão sua permissão antes de acessar arquivos e pastas. Este recurso é experimental e está sujeito a alterações.';

  @override
  String get interfacePageLinkLearnMore => 'Saber mais';

  @override
  String get interfacePageLinkGiveFeedback => 'Dê seu feedback';

  @override
  String get interfacePageLinkReportIssues => 'Reportar problemas';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aplicativos',
      one: '1 aplicativo',
      zero: 'nenhum aplicativo',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Criptografia de disco';

  @override
  String get diskEncryptionPageRecoveryKey => 'Chave de recuperação';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'A chave de recuperação permite que você recupere o acesso aos seus dados caso o disco não desbloqueie durante a inicialização. Guarde-a em um local seguro.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'A chave de recuperação permite que você recupere o acesso aos seus dados caso o disco não desbloqueie durante a inicialização. Guarde-a em um local seguro. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Saiba mais sobre chaves de recuperação';

  @override
  String get diskEncryptionPageCheckKey =>
      'Verifique a chave de recuperação...';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Verifique a chave de recuperação';

  @override
  String get diskEncryptionPageCheck => 'Verificar';

  @override
  String get diskEncryptionPageValidKey => 'Chave válida';

  @override
  String get diskEncryptionPageInvalidKey => 'Chave inválida';

  @override
  String get diskEncryptionPageEnterKey => 'Digite sua chave de recuperação';

  @override
  String get diskEncryptionPageKeyWorks => 'A chave de recuperação funciona';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Lembre-se de guardá-la em um lugar seguro.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'A chave de recuperação não funciona';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Verifique a chave ou substitua-a por uma nova.';

  @override
  String get diskEncryptionPageError => 'Erro';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Substituir chave de recuperação...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Substituir chave de recuperação';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Guarde a nova chave de recuperação em um local seguro. Depois de substituí-la, você não poderá mais usar a chave antiga.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'Mostrar código QR';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'Salvar em arquivo';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Guardei minha chave de recuperação em um lugar seguro';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Substituir';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Descartar';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Chave de recuperação substituída';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Lembre-se de guardá-la em um lugar seguro.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'A substituição da chave de recuperação falhou';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Ocorreu um erro ao inserir sua chave de recuperação. Sua chave antiga continuará válida.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Chave de recuperação de criptografia';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Escaneie o código QR para copiar a chave de recuperação e salve-a em um local seguro, como um gerenciador de senhas. Você também pode tirar uma foto para usar posteriormente.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'Copiado para a área de transferência';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Copiar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Configurações de criptografia não disponíveis';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Não foi possível recuperar o estado de criptografia deste computador.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'A configuração do TPM do seu computador não está em um estado compatível.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Sua versão do snapd não é compatível';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Verifique se o Centro de Segurança e o snapd estão atualizados.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'O Centro de Segurança não consegue se conectar à interface snapd';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Para corrigir isso, execute o seguinte comando no terminal:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'Adicione um PIN...';

  @override
  String get diskEncryptionPageAddPassphraseButton => 'Adicionar senha...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading => 'Adicionar senha';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'Adicione um PIN';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Você precisará inserir seu PIN sempre que iniciar o computador. Esse PIN é diferente da sua senha de usuário.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Caso se esqueça do seu PIN, poderá recuperar o acesso ao disco utilizando a chave de recuperação.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Você precisará inserir sua senha sempre que iniciar o computador. Essa senha é diferente da sua senha de usuário.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Caso se esqueça da sua senha, poderá recuperar o acesso ao disco utilizando a chave de recuperação.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Segurança Adicional';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Você pode definir uma senha ou um PIN para segurança adicional. Será necessário digitá-los sempre que o computador for iniciado.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Saiba mais';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Adicionar';

  @override
  String get diskEncryptionPageRemovePinButton => 'Remover o PIN...';

  @override
  String get diskEncryptionPageRemovePassphraseButton => 'Remover a senha...';

  @override
  String get diskEncryptionPageAddingPin =>
      'Adicionando PIN, isso pode levar alguns segundos...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Adicionando senha, isso pode levar alguns segundos...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'A remoção do PIN pode levar alguns segundos...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Removendo a senha, isso pode levar alguns segundos...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'O arquivo da chave de recuperação não foi salvo';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'O arquivo da chave de recuperação não pode ser salvo em um local temporário';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Erro desconhecido';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Não foi possível salvar sua chave de recuperação no arquivo';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Você não tem permissão para escrever nesse local de arquivo.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Você não tem permissão para escrever nessa pasta. Tente um local diferente ou use outro método.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Tente um local diferente, como uma unidade removível, ou use outro método.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Salvar arquivo de chave de recuperação';

  @override
  String get recoveryKeyFilePickerFilter => 'Arquivos de texto';

  @override
  String get recoveryKeyTPMEnabled =>
      'A criptografia com suporte de hardware está ativada';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'As chaves de criptografia são armazenadas no Módulo de Plataforma Confiável (TPM) do seu computador.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Saiba mais sobre criptografia com suporte de hardware';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'A senha de criptografia está ativada';

  @override
  String get recoveryKeyPassphraseHeader => 'Alterar senha';

  @override
  String get recoveryKeyPassphraseBody =>
      'Você precisa inserir sua senha toda vez que o computador for iniciado.';

  @override
  String get recoveryKeyPassphraseButton => 'Alterar senha...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Senha atual';

  @override
  String get recoveryKeyPassphraseNew => 'Nova senha';

  @override
  String get recoveryKeyPassphraseConfirm => 'Confirme a senha';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Senha incorreta, tente novamente';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Deve ter pelo menos 4 caracteres';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'As senhas não coincidem, tente novamente';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Alterar senha';

  @override
  String get recoveryKeyPinEnabled => 'O PIN de criptografia está ativado';

  @override
  String get recoveryKeyPinHeader => 'PIN de criptografia';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader => 'Senha de criptografia';

  @override
  String get recoveryKeyPinBody =>
      'Você precisa inserir seu PIN toda vez que seu computador for iniciado.';

  @override
  String get recoveryKeyPinButton => 'Alterar PIN...';

  @override
  String get recoveryKeyPinCurrent => 'PIN atual';

  @override
  String get recoveryKeyPinNew => 'Novo PIN';

  @override
  String get recoveryKeyPinConfirm => 'Confirme o PIN';

  @override
  String get recoveryKeyPinCurrentError => 'PIN incorreto, tente novamente';

  @override
  String get recoveryKeyPinConfirmError =>
      'Os PINs não coincidem, tente novamente';

  @override
  String get recoveryKeyPinDialogHeader => 'Alterar PIN';

  @override
  String get recoveryKeyPassphraseShow => 'Exibir';

  @override
  String get recoveryKeyPassphraseHide => 'Ocultar';

  @override
  String get recoveryKeyPassphraseChange => 'Mudar';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN atualizado';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Seu PIN foi atualizado com sucesso.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader => 'Senha atualizada';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Sua senha foi atualizada com sucesso.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Senha fraca, torne-a mais longa ou mais complexa';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Senha adequada: torne-a mais longa ou mais complexa para maior segurança';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Senha forte';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'PIN fraco, torna-o mais longo ou menos previsível';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'PIN justo, torne-o mais longo ou menos previsível para maior segurança';

  @override
  String get recoveryKeyPinEntropyOptimal => 'O PIN é longo o suficiente';

  @override
  String get recoveryKeySomethingWentWrongHeader => 'Algo deu errado';
}
