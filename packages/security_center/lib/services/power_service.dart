import 'package:dbus/dbus.dart';

/// Restarts or powers off the computer through logind.
class PowerService {
  PowerService({DBusClient? client}) : _client = client ?? DBusClient.system();

  final DBusClient _client;

  /// Asks logind to restart the computer.
  ///
  /// Completes once logind starts the restart, and throws a
  /// [DBusMethodResponseException] if it refuses, as when the user doesn't
  /// authorize it.
  Future<void> reboot() => _call('Reboot');

  /// Asks logind to power off the computer, as [reboot] does to restart it.
  Future<void> powerOff() => _call('PowerOff');

  // Interactive, so polkit asks for authorization instead of refusing, as when
  // other users are logged in
  Future<void> _call(String method) => _client.callMethod(
        destination: 'org.freedesktop.login1',
        path: DBusObjectPath('/org/freedesktop/login1'),
        interface: 'org.freedesktop.login1.Manager',
        name: method,
        values: const [DBusBoolean(true)],
        replySignature: DBusSignature.empty,
        allowInteractiveAuthorization: true,
      );
}
