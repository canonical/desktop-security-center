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

  /// Whether [rebootToFirmwareSetup] can work; throws
  /// [DBusMethodResponseException] if the call is denied, as the shutdown
  /// interface of older snapd does.
  Future<bool> canRebootToFirmwareSetup() async {
    final response = await _client.callMethod(
      destination: 'org.freedesktop.login1',
      path: DBusObjectPath('/org/freedesktop/login1'),
      interface: 'org.freedesktop.login1.Manager',
      name: 'CanRebootToFirmwareSetup',
      replySignature: DBusSignature.string,
    );
    // 'challenge' means polkit asks for authorization first
    return const {'yes', 'challenge'}
        .contains(response.values.single.asString());
  }

  /// Restarts into the firmware settings, as [reboot] does to restart.
  Future<void> rebootToFirmwareSetup() async {
    await _call('SetRebootToFirmwareSetup', true);
    try {
      await reboot();
    } on Exception {
      // Otherwise a later restart would open the firmware settings
      await _call('SetRebootToFirmwareSetup', false);
      rethrow;
    }
  }

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
