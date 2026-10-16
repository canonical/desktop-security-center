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
      final client = MockDBusClient();
      when(
        client.callMethod(
          destination: anyNamed('destination'),
          path: anyNamed('path'),
          interface: anyNamed('interface'),
          name: anyNamed('name'),
          values: anyNamed('values'),
          replySignature: anyNamed('replySignature'),
          allowInteractiveAuthorization:
              anyNamed('allowInteractiveAuthorization'),
        ),
      ).thenAnswer((_) async => DBusMethodSuccessResponse());

      await tc.call(PowerService(client: client));

      verify(
        client.callMethod(
          destination: 'org.freedesktop.login1',
          path: DBusObjectPath('/org/freedesktop/login1'),
          interface: 'org.freedesktop.login1.Manager',
          name: tc.method,
          values: [const DBusBoolean(true)],
          replySignature: DBusSignature.empty,
          allowInteractiveAuthorization: true,
        ),
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  }
}
