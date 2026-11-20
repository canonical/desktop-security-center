import 'package:dbus/dbus.dart';

/// Restarts or powers off the computer through logind.
class PowerService {
  PowerService({DBusClient? client}) : _client = client ?? DBusClient.system();

  final DBusClient _client;

  /// Asks logind to restart; throws [DBusMethodResponseException] if
  /// polkit authorization is refused or fails.
  Future<void> reboot() => _call('Reboot', true);

  /// Asks logind to power off the computer, as [reboot] does to restart it.
  Future<void> powerOff() => _call('PowerOff', true);

  // Interactive, so polkit asks for authorization instead of refusing, as when
  // other users are logged in
  Future<void> _call(String method, bool argument) => _client.callMethod(
        destination: 'org.freedesktop.login1',
        path: DBusObjectPath('/org/freedesktop/login1'),
        interface: 'org.freedesktop.login1.Manager',
        name: method,
        values: [DBusBoolean(argument)],
        replySignature: DBusSignature.empty,
        allowInteractiveAuthorization: true,
      );
}
