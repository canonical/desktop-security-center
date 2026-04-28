// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Sicherheitszentrum';

  @override
  String get snapdRuleCategorySessionAllowed => 'Bis zur Abmeldung zulassen';

  @override
  String get snapdRuleCategorySessionDenied => 'Bis zur Abmeldung verweigern';

  @override
  String get snapdRuleCategoryForeverAllowed => 'Immer zulassen';

  @override
  String get snapdRuleCategoryForeverDenied => 'Immer verweigern';

  @override
  String get snapPermissionReadLabel => 'Lesen';

  @override
  String get snapPermissionWriteLabel => 'Schreiben';

  @override
  String get snapPermissionExecuteLabel => 'Ausführen';

  @override
  String get snapPermissionAccessLabel => 'Zugriff';

  @override
  String get snapPermissionsEnableTitle =>
      'Apps müssen nach Systemberechtigungen fragen';

  @override
  String get snapPermissionsEnableWarning =>
      'Dies ist eine experimentelle Funktion zur Kontrolle des Zugriffs auf die Ressourcen Ihres Systems.';

  @override
  String get snapPermissionsEnablingLabel =>
      'Wird aktiviert, dies kann einige Sekunden dauern ...';

  @override
  String get snapPermissionsDisablingLabel =>
      'Wird deaktiviert, dies kann einige Sekunden dauern ...';

  @override
  String get snapPermissionsExperimentalLabel => 'Experimentell';

  @override
  String get snapPermissionsOtherDescription =>
      'Sie können andere Berechtigungen unter Einstellungen › Anwendungen verwalten.';

  @override
  String get snapPermissionsPageTitle => 'App-Berechtigungen';

  @override
  String get snapPermissionsErrorTitle => 'Something went wrong';

  @override
  String snapRulesCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Regeln',
      one: '1 Regel',
      zero: 'keine Regeln',
    );
    return '$_temp0';
  }

  @override
  String snapRulesPageDescription(String interface, String snap) {
    return '$interface-Berechtigungen für $snap verwalten.';
  }

  @override
  String get snapRulesPageEmptyTileLabel => 'Noch keine Regeln';

  @override
  String get cameraRulesPageEmptyTileLabel =>
      'Noch keine Apps haben Zugriff angefordert';

  @override
  String get snapRulesRemoveAll => 'Alle Regeln entfernen';

  @override
  String get snapRulesResetAllPermissions => 'Alle Berechtigungen zurücksetzen';

  @override
  String get homeInterfacePageTitle => 'Benutzerordner';

  @override
  String get homeInterfacePageDescription =>
      'Berechtigungen für den Zugriff auf Dateien in Ihrem Benutzerordner verwalten.';

  @override
  String get cameraInterfacePageTitle => 'Kamera';

  @override
  String get cameraInterfacePageDescription =>
      'Erlauben Sie Apps den Zugriff auf Ihre Kameras.';

  @override
  String get microphoneInterfacePageTitle => 'Mikrofon';

  @override
  String get microphoneInterfacePageDescription =>
      'Apps den Zugriff auf Ihr Mikrofon erlauben.';

  @override
  String get interfacePageTitle => 'Berechtigungen verwalten';

  @override
  String get interfacePageDescription =>
      'Streng begrenzte Apps werden Sie fragen, bevor sie auf Dateien und Ordner zugreifen. Diese Funktion ist experimentell und kann sich noch ändern.';

  @override
  String get interfacePageLinkLearnMore => 'Mehr erfahren';

  @override
  String get interfacePageLinkGiveFeedback => 'Rückmeldung geben';

  @override
  String get interfacePageLinkReportIssues => 'Probleme melden';

  @override
  String interfaceSnapCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Apps',
      one: '1 App',
      zero: 'keine Apps',
    );
    return '$_temp0';
  }

  @override
  String get diskEncryptionPageTitle => 'Festplattenverschlüsselung';

  @override
  String get diskEncryptionPageRecoveryKey => 'Wiederherstellungsschlüssel';

  @override
  String get diskEncryptionPageStoreYourKey =>
      'Mit dem Wiederherstellungsschlüssel können Sie wieder auf Ihre Daten zugreifen, wenn der Datenträger beim Start nicht entsperrt werden kann. Speichern Sie ihn an einem sicheren Ort.';

  @override
  String diskEncryptionPageStoreYourKeyWithLink(String learnMoreLink) {
    return 'Mit dem Wiederherstellungsschlüssel können Sie wieder auf Ihre Daten zugreifen, wenn die Festplatte beim Start nicht entsperrt werden kann. Bewahren Sie ihn an einem sicheren Ort auf. $learnMoreLink';
  }

  @override
  String get diskEncryptionPageLearnMore =>
      'Erfahren Sie mehr über hardwarebasierte Verschlüsselung';

  @override
  String get diskEncryptionPageCheckKey =>
      'Prüfe Wiederherstellungsschlüssel …';

  @override
  String get diskEncryptionPageDialogHeaderCheckKey =>
      'Wiederherstellungsschlüssel prüfen';

  @override
  String get diskEncryptionPageCheck => 'Prüfen';

  @override
  String get diskEncryptionPageValidKey => 'Gültiger Schlüssel';

  @override
  String get diskEncryptionPageInvalidKey => 'Ungültiger Schlüssel';

  @override
  String get diskEncryptionPageEnterKey =>
      'Ihren Wiederherstellungsschlüssel eingeben';

  @override
  String get diskEncryptionPageKeyWorks =>
      'Wiederherstellungsschlüssel funktioniert';

  @override
  String get diskEncryptionPageKeyWorksBody =>
      'Bewahren Sie ihn an einem sicheren Ort auf.';

  @override
  String get diskEncryptionPageKeyDoesntWork =>
      'Wiederherstellungsschlüssel funktioniert nicht';

  @override
  String get diskEncryptionPageKeyDoesntWorkBody =>
      'Überprüfen Sie den Schlüssel oder ersetzen Sie ihn durch einen neuen.';

  @override
  String get diskEncryptionPageError => 'Fehler';

  @override
  String get diskEncryptionPageReplaceButton =>
      'Wiederherstellungsschlüssel ersetzen...';

  @override
  String get diskEncryptionPageReplaceDialogHeader =>
      'Wiederherstellungsschlüssel ersetzen';

  @override
  String get diskEncryptionPageReplaceDialogBody =>
      'Speichern Sie den neuen Wiederherstellungsschlüssel an einem sicheren Ort. Sobald Sie ihn ersetzt haben, können Sie den alten Schlüssel nicht mehr verwenden.';

  @override
  String get diskEncryptionPageReplaceDialogShowQR => 'QR-Code anzeigen';

  @override
  String get diskEncryptionPageReplaceDialogSave => 'In Datei speichern';

  @override
  String get diskEncryptionPageReplaceDialogAcknowledge =>
      'Ich habe meinen Wiederherstellungsschlüssel an einem sicheren Ort gespeichert';

  @override
  String get diskEncryptionPageReplaceDialogReplace => 'Ersetzen';

  @override
  String get diskEncryptionPageReplaceDialogDiscard => 'Verwerfen';

  @override
  String get diskEncryptionPageReplaceDialogSuccessHeader =>
      'Wiederherstellungsschlüssel ersetzt';

  @override
  String get diskEncryptionPageReplaceDialogSuccessBody =>
      'Denken Sie daran, ihn an einem sicheren Ort aufzubewahren.';

  @override
  String get diskEncryptionPageReplaceDialogErrorHeader =>
      'Ersetzung des Wiederherstellungsschlüssels fehlgeschlagen';

  @override
  String get diskEncryptionPageReplaceDialogErrorBody =>
      'Beim Ersetzen Ihres Wiederherstellungsschlüssels ist etwas schiefgelaufen, Ihr alter Schlüssel bleibt gültig.';

  @override
  String get diskEncryptionPageReplaceDialogQRHeader =>
      'Ubuntu Desktop - Wiederherstellungsschlüssel für die Verschlüsselung';

  @override
  String get diskEncryptionPageReplaceDialogQRBody =>
      'Scannen Sie den QR-Code, um den Wiederherstellungsschlüssel zu kopieren, und speichern Sie ihn an einem sicheren Ort, z. B. in einem Passwortmanager. Sie können auch ein Foto zur späteren Verwendung machen.';

  @override
  String get diskEncryptionPageClipboardNotification =>
      'In die Zwischenablage kopiert';

  @override
  String get diskEncryptionPageCopySemanticLabel => 'Kopieren';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusHeader =>
      'Verschlüsselungseinstellungen nicht verfügbar';

  @override
  String get diskEncryptionPageErrorFailedToRetrieveStatusBody =>
      'Der Verschlüsselungsstatus dieses Computers konnte nicht abgerufen werden.';

  @override
  String get diskEncryptionPageErrorUnsupportedStateBody =>
      'Die TPM-Konfiguration Ihres Computers befindet sich nicht in einem unterstützten Zustand.';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdHeader =>
      'Ihre snapd-Version wird nicht unterstützt';

  @override
  String get diskEncryptionPageErrorUnsupportedSnapdBody =>
      'Überprüfen Sie, ob das Sicherheitszentrum und snapd auf dem neuesten Stand sind.';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceHeader =>
      'Das Sicherheitszentrum kann keine Verbindung zur snapd-Schnittstelle herstellen';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceBody =>
      'Um dies zu beheben, führen Sie diesen Befehl im Terminal aus:';

  @override
  String get diskEncryptionPageErrorUnconnectedSnapInterfaceCommand =>
      'snap connect desktop-security-center:snap-fde-control';

  @override
  String get diskEncryptionPageAddPinButton => 'PIN hinzufügen ...';

  @override
  String get diskEncryptionPageAddPassphraseButton =>
      'Passphrase hinzufügen ...';

  @override
  String get diskEncryptionPageAddPassphraseDialogHeading =>
      'Passphrase hinzufügen';

  @override
  String get diskEncryptionPageAddPinDialogHeading => 'PIN hinzufügen';

  @override
  String get diskEncryptionPageAddPinDialogBodyMain =>
      'Sie müssen Ihre PIN bei jedem Start Ihres Computers eingeben. Diese PIN unterscheidet sich von Ihrem Benutzerpasswort.';

  @override
  String get diskEncryptionPageAddPinDialogBodyRecovery =>
      'Wenn Sie Ihre PIN vergessen haben, können Sie mithilfe des Wiederherstellungsschlüssels wieder Zugriff auf die Festplatte erhalten.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyMain =>
      'Sie müssen Ihre Passphrase bei jedem Start Ihres Computers eingeben. Diese Passphrase unterscheidet sich von Ihrem Benutzerpasswort.';

  @override
  String get diskEncryptionPageAddPassphraseDialogBodyRecovery =>
      'Wenn Sie Ihre Passphrase vergessen haben, können Sie mithilfe des Wiederherstellungsschlüssels wieder Zugriff auf die Festplatte erhalten.';

  @override
  String get diskEncryptionPageAdditionalSecurityHeader =>
      'Zusätzliche Sicherheit';

  @override
  String get diskEncryptionPageAdditionalSecurityBody =>
      'Sie können für zusätzliche Sicherheit eine Passphrase oder eine PIN festlegen. Diese müssen Sie bei jedem Start Ihres Computers eingeben.';

  @override
  String get diskEncryptionPageAdditionalSecurityLearnMore => 'Mehr erfahren';

  @override
  String get diskEncryptionPageAddPinDialogSaveButton => 'Hinzufügen';

  @override
  String get diskEncryptionPageRemovePinButton => 'PIN entfernen ...';

  @override
  String get diskEncryptionPageRemovePassphraseButton =>
      'Passphrase entfernen ...';

  @override
  String get diskEncryptionPageAddingPin =>
      'PIN wird hinzugefügt, dies kann einige Sekunden dauern ...';

  @override
  String get diskEncryptionPageAddingPassphrase =>
      'Passphrase wird hinzugefügt, dies kann einige Sekunden dauern ...';

  @override
  String get diskEncryptionPageRemovingPin =>
      'PIN wird entfernt, dies kann einige Sekunden dauern ...';

  @override
  String get diskEncryptionPageRemovingPassphrase =>
      'Passphrase wird entfernt, dies kann einige Sekunden dauern ...';

  @override
  String get recoveryKeyExceptionFileSystemTitle =>
      'Wiederherstellungsschlüsseldatei nicht gespeichert';

  @override
  String get recoveryKeyExceptionDisallowedPathTitle =>
      'Die Wiederherstellungsschlüsseldatei kann nicht an einem temporären Ort gespeichert werden';

  @override
  String get recoveryKeyExceptionUnknownTitle => 'Unbekannter Fehler';

  @override
  String get recoveryKeyExceptionFilePermissionTitle =>
      'Fehler beim Speichern Ihres Wiederherstellungsschlüssels in einer Datei';

  @override
  String get recoveryKeyExceptionFilePermissionBody =>
      'Sie haben keine Berechtigung, in diesen Dateispeicherort zu schreiben.';

  @override
  String get recoveryKeyExceptionFileSystemBody =>
      'Sie haben keine Berechtigung, in diesen Ordner zu schreiben. Versuchen Sie es an einem anderen Ort oder mit einer anderen Methode.';

  @override
  String get recoveryKeyExceptionDisallowedPathBody =>
      'Versuchen Sie es an einem anderen Ort, z. B. auf einem Wechsellaufwerk, oder verwenden Sie eine andere Methode.';

  @override
  String get recoveryKeyFilePickerTitle =>
      'Wiederherstellungsschlüsseldatei speichern';

  @override
  String get recoveryKeyFilePickerFilter => 'Textdateien';

  @override
  String get recoveryKeyTPMEnabled =>
      'Hardwaregestützte Verschlüsselung ist aktiviert';

  @override
  String get recoveryKeyTPMExplanationBody =>
      'Die Verschlüsselungsschlüssel werden im Trusted Platform Module (TPM) Ihres Computers gespeichert.';

  @override
  String get recoveryKeyTPMExplanationLearnMore =>
      'Erfahren Sie mehr über hardwaregestützte Verschlüsselung';

  @override
  String get recoveryKeyPassphraseEnabled =>
      'Verschlüsselungspassphrase ist aktiviert';

  @override
  String get recoveryKeyPassphraseHeader => 'Passphrase ändern';

  @override
  String get recoveryKeyPassphraseBody =>
      'Sie müssen Ihre Passphrase bei jedem Start Ihres Computers eingeben.';

  @override
  String get recoveryKeyPassphraseButton => 'Passphrase ändern ...';

  @override
  String get recoveryKeyPassphraseCurrent => 'Aktuelle Passphrase';

  @override
  String get recoveryKeyPassphraseNew => 'Neue Passphrase';

  @override
  String get recoveryKeyPassphraseConfirm => 'Passphrase bestätigen';

  @override
  String get recoveryKeyPassphraseCurrentError =>
      'Falsche Passphrase, bitte erneut versuchen';

  @override
  String get recoveryKeyPassphraseNewError =>
      'Muss mindestens 4 Zeichen lang sein';

  @override
  String get recoveryKeyPassphraseConfirmError =>
      'Passphrasen stimmen nicht überein, bitte erneut versuchen';

  @override
  String get recoveryKeyPassphraseDialogHeader => 'Passphrase ändern';

  @override
  String get recoveryKeyPinEnabled => 'Verschlüsselungs-PIN ist aktiviert';

  @override
  String get recoveryKeyPinHeader => 'Verschlüsselungs-PIN';

  @override
  String get recoveryKeyEncrpytionPassphraseHeader =>
      'Verschlüsselungspassphrase';

  @override
  String get recoveryKeyPinBody =>
      'Sie müssen Ihre PIN bei jedem Start Ihres Computers eingeben.';

  @override
  String get recoveryKeyPinButton => 'PIN ändern ...';

  @override
  String get recoveryKeyPinCurrent => 'Aktuelle PIN';

  @override
  String get recoveryKeyPinNew => 'Neue PIN';

  @override
  String get recoveryKeyPinConfirm => 'PIN bestätigen';

  @override
  String get recoveryKeyPinCurrentError =>
      'Falsche PIN, bitte erneut versuchen';

  @override
  String get recoveryKeyPinConfirmError =>
      'PINs stimmen nicht überein, bitte erneut versuchen';

  @override
  String get recoveryKeyPinDialogHeader => 'PIN ändern';

  @override
  String get recoveryKeyPassphraseShow => 'Anzeigen';

  @override
  String get recoveryKeyPassphraseHide => 'Ausblenden';

  @override
  String get recoveryKeyPassphraseChange => 'Ändern';

  @override
  String get recoveryKeyPassphrasePinSuccessHeader => 'PIN aktualisiert';

  @override
  String get recoveryKeyPassphrasePinSuccessBody =>
      'Ihre PIN wurde erfolgreich aktualisiert.';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessHeader =>
      'Passphrase aktualisiert';

  @override
  String get recoveryKeyPassphrasePassphraseSuccessBody =>
      'Ihre Passphrase wurde erfolgreich aktualisiert.';

  @override
  String get recoveryKeyPassphraseEntropyBelowMin =>
      'Schwache Passphrase, verlängern Sie sie oder machen Sie sie komplexer';

  @override
  String get recoveryKeyPassphraseEntropyBelowOptimal =>
      'Angemessene Passphrase, machen Sie sie länger oder komplexer, um die Sicherheit zu erhöhen';

  @override
  String get recoveryKeyPassphraseEntropyOptimal => 'Starke Passphrase';

  @override
  String get recoveryKeyPinEntropyBelowMin =>
      'Schwache PIN, machen Sie sie länger oder weniger vorhersehbar';

  @override
  String get recoveryKeyPinEntropyBelowOptimal =>
      'Angemessene PIN, machen Sie sie länger oder weniger vorhersehbar, um die Sicherheit zu erhöhen';

  @override
  String get recoveryKeyPinEntropyOptimal => 'PIN ist lang genug';

  @override
  String get recoveryKeySomethingWentWrongHeader =>
      'Irgendetwas ist schiefgelaufen';

  @override
  String get ubuntuProPageTitle => 'Ubuntu Pro';

  @override
  String get ubuntuProNotSupported =>
      'Ubuntu Pro ist für diese Ubuntu-Version nicht verfügbar';

  @override
  String get ubuntuProNotSupportedDetails =>
      'Ubuntu Pro erfordert eine LTS-Version';

  @override
  String get ubuntuProNotSupportedSnapd =>
      'Ubuntu Pro wird von dieser snapd-Version nicht unterstützt';

  @override
  String get ubuntuProNotSupportedSnapdDetails =>
      'Aktualisieren Sie snapd zum Verwalten von Ubuntu Pro';

  @override
  String get ubuntuProEnabled => 'Ubuntu Pro ist aktiviert';

  @override
  String ubuntuProDisabled(String learnMoreLink) {
    return 'Sicherheit und Compliance auf Unternehmensniveau für Ihren Computer. Für den privaten Gebrauch immer kostenlos. $learnMoreLink';
  }

  @override
  String get ubuntuProLearnMore => 'Mehr über Ubuntu Pro erfahren';

  @override
  String get ubuntuProEnablePro => 'Ubuntu Pro aktivieren';

  @override
  String get ubuntuProEnableMagic => 'Mit Ubuntu One-Konto aktivieren';

  @override
  String get ubuntuProEnableMagicSubtitle =>
      'Sie können kostenlos ein Konto erstellen';

  @override
  String get ubuntuProMagicPrompt =>
      'Melden Sie sich mit Ihrem Ubuntu One-Konto an oder erstellen Sie eines kostenlos.';

  @override
  String get ubuntuProMagicContinueInBrowser => 'Im Browser fortfahren';

  @override
  String ubuntuProMagicDescription(String attachLink, String attachCode) {
    return 'Sie können sich auch unter $attachLink anmelden und den Code $attachCode eingeben';
  }

  @override
  String get ubuntuProMagicError =>
      'Ubuntu Pro kann nicht aktiviert werden, bitte versuchen Sie es erneut';

  @override
  String get ubuntuProEnableToken => 'Mit einem Token aktivieren';

  @override
  String get ubuntuProEnableTokenError =>
      'Ubuntu Pro kann nicht aktiviert werden';

  @override
  String ubuntuProEnableTokenSubtitle(String proLink) {
    return 'Von Ihrem IT-Administrator oder von $proLink';
  }

  @override
  String ubuntuProTokenPrompt(String proLink) {
    return 'Beziehen Sie einen Ubuntu Pro-Token von Ihrem Administrator oder von $proLink';
  }

  @override
  String get ubuntuProTokenLabel => 'Token';

  @override
  String get ubuntuProDisablePro => 'Ubuntu Pro deaktivieren';

  @override
  String get ubuntuProDisable => 'Deaktivieren';

  @override
  String get ubuntuProDisablePrompt =>
      'Durch die Deaktivierung von Ubuntu Pro wird Ihr Abonnement von diesem Gerät getrennt. Möchten Sie fortfahren?';

  @override
  String get ubuntuProEnable => 'Aktivieren';

  @override
  String get ubuntuProCancel => 'Abbrechen';

  @override
  String get ubuntuProFeatureEnableError =>
      'Die Funktion konnte nicht aktiviert werden, bitte versuchen Sie es erneut.';

  @override
  String get ubuntuProFeatureDisableError =>
      'Die Funktion konnte nicht deaktiviert werden, bitte versuchen Sie es erneut.';

  @override
  String get ubuntuProCompliance => 'Compliance und Härtung';

  @override
  String get ubuntuProComplianceDisclaimer =>
      'Nur zur Erfüllung von FedRAMP- und HIPAA-Anforderungen sowie anderen Compliance- und Sicherheitsanforderungen empfohlen.';

  @override
  String get ubuntuProComplianceUSGTitle => 'Ubuntu Security Guide (USG)';

  @override
  String get ubuntuProComplianceUSGDescription =>
      'Automatisiert die Härtung und Auditierung mit CIS-Benchmark- und DISA-STIG-Profilen und ermöglicht gleichzeitig umgebungsspezifische Anpassungen.';

  @override
  String get ubuntuProComplianceFIPSTitle => 'FIPS 140-2';

  @override
  String get ubuntuProComplianceFIPSDescription =>
      'Eine Zertifizierung von Kryptografiemodulen durch die Regierungen der USA und Kanadas hinsichtlich der Einhaltung des Datenschutzstandards FIPS 140-2.';

  @override
  String get ubuntuProComplianceFIPSEnable => 'FIPS aktivieren';

  @override
  String get ubuntuProComplianceFIPSDisclaimer =>
      'Die Aktivierung von FIPS kann nicht rückgängig gemacht werden und Livepatch wird dauerhaft deaktiviert.';

  @override
  String get ubuntuProComplianceFIPSPrompt =>
      'Wählen Sie Ihre bevorzugte FIPS-Option aus';

  @override
  String get ubuntuProComplianceFIPSUpdates => 'FIPS mit Aktualisierungen';

  @override
  String get ubuntuProComplianceFIPSUpdatesDescription =>
      'Installiert FIPS 140-2-validierte Pakete und ermöglicht regelmäßige Sicherheitsaktualisierungen.';

  @override
  String get ubuntuProComplianceFIPSNoUpdates => 'FIPS ohne Aktualisierungen';

  @override
  String get ubuntuProComplianceFIPSNoUpdatesDescription =>
      'Installiert FIPS 140-2-validierte Pakete. Diese werden bis zur nächsten Rezertifizierung nicht aktualisiert.';

  @override
  String get ubuntuProComplianceDocumentation =>
      'Dokumentation zur Einhaltung von Sicherheitsvorschriften';

  @override
  String get ubuntuProESMTitle => 'Erweiterte Sicherheitswartung (ESM)';

  @override
  String get ubuntuProESMDescription =>
      'ESM bietet 10 Jahre lang Sicherheitspatches für über 25.000 Open-Source-Pakete. Profitieren Sie von kontinuierlichem Schwachstellenmanagement für kritische, hohe und mittlere CVEs.';

  @override
  String get ubuntuProESMMainTitle => 'Hauptpakete (esm-infra)';

  @override
  String ubuntuProESMMainDescription(int year) {
    return 'Sicherheitsaktualisierungen für 2300 Ubuntu-Hauptpakete bis $year';
  }

  @override
  String get ubuntuProESMUniverseTitle => 'Universe-Pakete (esm-apps)';

  @override
  String ubuntuProESMUniverseDescription(int year) {
    return 'Zusätzliche Sicherheitsaktualisierungen für über 23.000 Ubuntu-Universe-Pakete bis $year';
  }

  @override
  String get ubuntuProLivepatchTitle => 'Kernel-Livepatch';

  @override
  String get ubuntuProLivepatchEnableTitle => 'Livepatch aktivieren';

  @override
  String get ubuntuProLivepatchEnableDescription =>
      'Kernel-Sicherheitsaktualisierungen während des laufenden Systems anwenden';

  @override
  String get ubuntuProLivepatchShowTitle =>
      'Livepatch-Status in der oberen Leiste anzeigen';
}
