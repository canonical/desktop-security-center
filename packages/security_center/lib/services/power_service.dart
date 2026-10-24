import 'package:dbus/dbus.dart';

/// What [PowerService.run] asks logind to do.
enum PowerAction {
  reboot('Reboot'),
  powerOff('PowerOff');

  const PowerAction(this._logindMethod);

  final String _logindMethod;
}

/// Restarts or powers off the computer through logind.
class PowerService {
  PowerService({DBusClient? client}) : _client = client ?? DBusClient.system();

  final DBusClient _client;

  /// Asks logind to restart or power off the computer.
  ///
  /// Completes once logind starts it, and throws a
  /// [DBusMethodResponseException] if it refuses, as when the user doesn't
  /// authorize it.
  Future<void> run(PowerAction action) => _client.callMethod(
        destination: 'org.freedesktop.login1',
        path: DBusObjectPath('/org/freedesktop/login1'),
        interface: 'org.freedesktop.login1.Manager',
        name: action._logindMethod,
        // Interactive, so polkit asks for authorization instead of refusing,
        // as when other users are logged in
        values: const [DBusBoolean(true)],
        replySignature: DBusSignature.empty,
        allowInteractiveAuthorization: true,
      );
}
