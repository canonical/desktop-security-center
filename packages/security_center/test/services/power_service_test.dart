import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/power_service.dart';

import 'power_service_test.mocks.dart';

@GenerateMocks([DBusClient])
void main() {
  final cases = <({
    String name,
    Future<void> Function(PowerService service) call,
    String method,
  })>[
    (name: 'restarts', call: (service) => service.reboot(), method: 'Reboot'),
    (
      name: 'powers off',
      call: (service) => service.powerOff(),
      method: 'PowerOff',
    ),
  ];

  for (final tc in cases) {
    test(tc.name, () async {
      final client = _mockClient();

      await tc.call(PowerService(client: client));

      verify(_login1Call(client, tc.method, true)).called(1);
      verifyNoMoreInteractions(client);
    });
  }

  final canCases = [
    (reply: 'yes', expected: true),
    (reply: 'challenge', expected: true),
    (reply: 'no', expected: false),
    (reply: 'na', expected: false),
  ];

  for (final tc in canCases) {
    test('can restart to the firmware settings if logind says ${tc.reply}',
        () async {
      final client = _mockClient(canReply: tc.reply);

      expect(
        await PowerService(client: client).canRebootToFirmwareSetup(),
        tc.expected,
      );
      verify(
        client.callMethod(
          destination: 'org.freedesktop.login1',
          path: DBusObjectPath('/org/freedesktop/login1'),
          interface: 'org.freedesktop.login1.Manager',
          name: 'CanRebootToFirmwareSetup',
          replySignature: DBusSignature.string,
        ),
      ).called(1);
    });
  }

  test('restarts to the firmware settings', () async {
    final client = _mockClient();

    await PowerService(client: client).rebootToFirmwareSetup();

    verifyInOrder([
      _login1Call(client, 'SetRebootToFirmwareSetup', true),
      _login1Call(client, 'Reboot', true),
    ]);
    verifyNoMoreInteractions(client);
  });

  test('stops opening the firmware settings if the restart fails', () async {
    final client = _mockClient(failing: 'Reboot');

    await expectLater(
      PowerService(client: client).rebootToFirmwareSetup(),
      throwsA(isA<DBusMethodResponseException>()),
    );

    verifyInOrder([
      _login1Call(client, 'SetRebootToFirmwareSetup', true),
      _login1Call(client, 'Reboot', true),
      _login1Call(client, 'SetRebootToFirmwareSetup', false),
    ]);
    verifyNoMoreInteractions(client);
  });
}

MockDBusClient _mockClient({String canReply = 'yes', String? failing}) {
  final client = MockDBusClient();
  when(
    client.callMethod(
      destination: anyNamed('destination'),
      path: anyNamed('path'),
      interface: anyNamed('interface'),
      name: anyNamed('name'),
      values: anyNamed('values'),
      replySignature: anyNamed('replySignature'),
      allowInteractiveAuthorization: anyNamed('allowInteractiveAuthorization'),
    ),
  ).thenAnswer((invocation) async {
    final name = invocation.namedArguments[#name];
    if (name == failing) {
      throw DBusMethodResponseException(DBusMethodErrorResponse.accessDenied());
    }
    return DBusMethodSuccessResponse([
      if (name == 'CanRebootToFirmwareSetup') DBusString(canReply),
    ]);
  });
  return client;
}

Future<DBusMethodSuccessResponse> _login1Call(
  MockDBusClient client,
  String method,
  bool argument,
) =>
    client.callMethod(
      destination: 'org.freedesktop.login1',
      path: DBusObjectPath('/org/freedesktop/login1'),
      interface: 'org.freedesktop.login1.Manager',
      name: method,
      values: [DBusBoolean(argument)],
      replySignature: DBusSignature.empty,
      allowInteractiveAuthorization: true,
    );
