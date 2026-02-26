import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'ubuntu_pro_utils.mocks.dart';

Future<HttpServer> mockMagicAttachServer({
  required String token,
  String? contractToken,
  bool expireToken = false,
}) async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  addTearDown(server.close);

  final listener = server.listen((request) async {
    final method = request.method;
    final path = request.uri.path;
    final now = DateTime.now();

    switch (method) {
      case 'GET':
        switch (path) {
          case '/v1/magic-attach':
            if (expireToken) {
              request.response.statusCode = 401;
            } else {
              request.response.write(
                jsonEncode(
                  MagicAttachResponse(
                    expires: now.copyWith(minute: now.minute + 10),
                    expiresIn: 10,
                    token: token,
                    userCode: 'abc',
                    contractID: 'def',
                    contractToken: contractToken,
                  ).toJson(),
                ),
              );
            }
            await request.response.close();
            break;
          default:
            throw Exception('Unhandled HTTP request path');
        }
        break;
      case 'POST':
        switch (path) {
          case '/v1/magic-attach':
            request.response.write(
              jsonEncode(
                MagicAttachResponse(
                  expires: now.copyWith(minute: now.minute + 10),
                  expiresIn: 10,
                  token: token,
                  userCode: 'abc',
                ).toJson(),
              ),
            );
            await request.response.close();
            break;
          default:
            throw Exception('Unhandled HTTP request path');
        }
        break;
      default:
        throw Exception('Unhandled HTTP method');
    }
  });
  addTearDown(listener.cancel);

  return server;
}

@GenerateMocks([GSettingsIconService])
GSettingsIconService registerMockGSettingsIconService() {
  final service = MockGSettingsIconService();
  final stream = StreamController<List<String>>.broadcast();
  var showIcon = false;

  when(service.stream).thenAnswer((_) => stream.stream);
  when(service.getStatusIcon()).thenAnswer((_) async {
    return showIcon;
  });
  when(service.toggleStatusIcon(any)).thenAnswer((inv) async {
    showIcon = inv.positionalArguments.first as bool;
    stream.add(['show-livepatch-status-icon']);
  });

  registerMockService<GSettingsIconService>(service);
  addTearDown(unregisterService<GSettingsIconService>);
  addTearDown(stream.close);
  return service;
}

@GenerateMocks([MagicAttachService])
MagicAttachService registerMockMagicAttachService() {
  final service = MockMagicAttachService();

  when(service.newToken()).thenAnswer(
    (_) async => MagicAttachResponse(
      expires: DateTime.now(),
      expiresIn: 0,
      token: 'token',
      userCode: 'userCode',
    ),
  );
  when(service.getContractToken('token')).thenAnswer(
    (_) async => MagicAttachResponse(
      expires: DateTime.now(),
      expiresIn: 0,
      token: 'token',
      userCode: 'userCode',
      contractID: 'contractID',
      contractToken: validToken,
    ),
  );

  registerMockService<MagicAttachService>(service);
  addTearDown(unregisterService<MagicAttachService>);
  return service;
}

@GenerateMocks([UbuntuProManagerService])
UbuntuProManagerService registerMockUbuntuProManagerService({
  bool attached = true,
  bool available = true,
}) {
  final service = MockUbuntuProManagerService();
  final stream = StreamController<UbuntuProManagerData>.broadcast();
  final data = UbuntuProManagerData(
    attached: attached,
    available: available,
    eolDate: DateTime.now(),
  );

  when(service.data).thenReturn(data);
  when(service.stream).thenAnswer((_) => stream.stream);
  when(service.detach()).thenAnswer((_) async {
    stream.add(
      data.copyWith(attached: false),
    );
  });
  when(service.attach(validToken)).thenAnswer((_) async {
    stream.add(
      data.copyWith(attached: true),
    );
  });
  when(service.attach(invalidToken)).thenThrow(
    DBusMethodResponseException(DBusMethodErrorResponse('Invalid token')),
  );
  stream.add(data);

  registerMockService<UbuntuProManagerService>(service);
  addTearDown(unregisterService<UbuntuProManagerService>);
  addTearDown(stream.close);
  return service;
}

@GenerateMocks([UbuntuProFeatureService])
UbuntuProFeatureService registerMockUbuntuProFeatureService({
  bool featuresEnabled = true,
  bool featuresEntitled = true,
}) {
  final service = MockUbuntuProFeatureService();
  final stream = StreamController<UbuntuProFeatureType>.broadcast();
  final featureMap = <UbuntuProFeatureType, UbuntuProFeature>{};

  when(service.stream).thenAnswer((_) => stream.stream);

  for (final featureType in UbuntuProFeatureType.values) {
    final feature = UbuntuProFeature(
      object: MockDBusRemoteObject(),
      type: featureType,
      path:
          '/com/canonical/UbuntuAdvantage/Services/${featureType.toPathPart()}',
      name: featureType.name.toKebabCase(),
      entitled: featuresEntitled,
      status: featuresEnabled ? 'enabled' : 'disabled',
    );
    featureMap.putIfAbsent(featureType, () => feature);

    when(service.getFeature(featureType))
        .thenAnswer((_) => featureMap[featureType]);
    when(service.isEnabled(featureType))
        .thenAnswer((_) => featureMap[featureType]!.enabled);
    when(service.enableFeature(featureType)).thenAnswer((_) async {
      featureMap[featureType] =
          featureMap[featureType]!.copyWith(status: 'enabled');
      stream.add(featureType);
    });
    when(service.disableFeature(featureType)).thenAnswer((_) async {
      featureMap[featureType] =
          featureMap[featureType]!.copyWith(status: 'disabled');
      stream.add(featureType);
    });
  }

  registerMockService<UbuntuProFeatureService>(service);
  addTearDown(unregisterService<UbuntuProFeatureService>);
  addTearDown(stream.close);
  return service;
}

/// Create relevant files that are usually needed to manage Ubuntu Pro.
MemoryFileSystem mockProFilesystem({
  required String osRelease,
  required String ubuntuCsv,
  String? uaclientConf,
}) {
  final mockFs = MemoryFileSystem.test();
  mockFs.file('/var/lib/snapd/hostfs/etc/os-release')
    ..createSync(recursive: true)
    ..writeAsStringSync(osRelease);
  mockFs.file('/etc/os-release')
    ..createSync(recursive: true)
    ..writeAsStringSync(osRelease);

  mockFs.file('/usr/share/distro-info/ubuntu.csv')
    ..createSync(recursive: true)
    ..writeAsStringSync(ubuntuCsv);

  if (uaclientConf != null) {
    mockFs.file('/etc/ubuntu-advantage/uaclient.conf')
      ..createSync(recursive: true)
      ..writeAsStringSync(uaclientConf);
  }

  return mockFs;
}

@GenerateMocks([DBusRemoteObject])
MockDBusRemoteObject mockFeatureObject({
  UbuntuProFeatureType type = UbuntuProFeatureType.esmApps,
  bool attached = false,
}) {
  final object = MockDBusRemoteObject();
  final stream = StreamController<DBusPropertiesChangedSignal>.broadcast();
  addTearDown(stream.close);

  when(object.propertiesChanged).thenAnswer((_) => stream.stream);

  when(
    object.callMethod('com.canonical.UbuntuAdvantage.Service', 'Enable', []),
  ).thenAnswer((_) async {
    if (!attached) {
      throw DBusMethodResponseException(
        DBusMethodErrorResponse('Not attached'),
      );
    }

    stream.add(
      DBusPropertiesChangedSignal(
        DBusSignal(
          sender: ':1.557',
          path: DBusObjectPath(
            '/com/canonical/UbuntuAdvantage/Services/${type.toPathPart()}',
          ),
          interface: 'org.freedesktop.DBus.Properties',
          name: 'PropertiesChanged',
          values: [
            DBusString('com.canonical.UbuntuAdvantage.Service'),
            DBusDict.stringVariant({'Status': DBusString('enabled')}),
            DBusArray.string([]),
          ],
        ),
      ),
    );

    return DBusMethodSuccessResponse([]);
  });

  when(
    object.callMethod('com.canonical.UbuntuAdvantage.Service', 'Disable', []),
  ).thenAnswer((_) async {
    if (!attached) {
      throw DBusMethodResponseException(
        DBusMethodErrorResponse('Not attached'),
      );
    }

    stream.add(
      DBusPropertiesChangedSignal(
        DBusSignal(
          sender: ':1.557',
          path: DBusObjectPath(
            '/com/canonical/UbuntuAdvantage/Services/${type.toPathPart()}',
          ),
          interface: 'org.freedesktop.DBus.Properties',
          name: 'PropertiesChanged',
          values: [
            DBusString('com.canonical.UbuntuAdvantage.Service'),
            DBusDict.stringVariant({'Status': DBusString('disabled')}),
            DBusArray.string([]),
          ],
        ),
      ),
    );

    return DBusMethodSuccessResponse([]);
  });

  return object;
}

class FakeFeatureManagerObject extends Fake implements DBusRemoteObjectManager {
  FakeFeatureManagerObject({
    required this.type,
    this.attached = false,
    this.enabled = false,
  }) : _stream = StreamController<DBusSignal>.broadcast();

  final UbuntuProFeatureType type;
  final bool attached;
  final bool enabled;
  final StreamController<DBusSignal> _stream;

  @override
  late final Stream<DBusSignal> signals = _stream.stream;

  @override
  Future<Map<DBusObjectPath, Map<String, Map<String, DBusValue>>>>
      getManagedObjects() async {
    return attached ? attachedManagedObjects(enabled) : detachedManagedObjects;
  }

  void emitInterfaceAdded() {
    _stream.add(
      DBusObjectManagerInterfacesAddedSignal(
        DBusSignal(
          sender: ':1.231',
          path: DBusObjectPath('/'),
          interface: 'org.freedesktop.DBus.ObjectManager',
          name: 'InterfacesAdded',
          values: [
            DBusObjectPath(
              '/com/canonical/UbuntuAdvantage/Services/${type.toPathPart()}',
            ),
            DBusDict(
              DBusSignature('s'),
              DBusSignature('a{sv}'),
              {
                DBusString('com.canonical.UbuntuAdvantage.Service'):
                    DBusDict.stringVariant(
                  {
                    'Name': DBusString(type.name.toKebabCase()),
                    'Description': DBusString('description'),
                    'Entitled': DBusString('yes'),
                    'Status': DBusString(enabled ? 'enabled' : 'disabled'),
                  },
                ),
              },
            ),
          ],
        ),
      ),
    );
  }

  void emitInterfaceRemoved() {
    _stream.add(
      DBusObjectManagerInterfacesRemovedSignal(
        DBusSignal(
          sender: ':1.231',
          path: DBusObjectPath('/'),
          interface: 'org.freedesktop.DBus.ObjectManager',
          name: 'InterfacesRemoved',
          values: [
            DBusObjectPath(
              '/com/canonical/UbuntuAdvantage/Services/${type.toPathPart()}',
            ),
            DBusArray.string(['com.canonical.UbuntuAdvantage.Service']),
          ],
        ),
      ),
    );
  }
}

@GenerateMocks([DBusRemoteObjectManager])
MockDBusRemoteObjectManager mockProManagerObject({
  bool attached = false,
}) {
  final objectManager = MockDBusRemoteObjectManager();
  final stream = StreamController<DBusPropertiesChangedSignal>.broadcast();
  addTearDown(stream.close);

  when(objectManager.propertiesChanged).thenAnswer((_) => stream.stream);
  when(objectManager.getProperty(any, any))
      .thenAnswer((_) async => DBusBoolean(attached));
  when(
    objectManager.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attach',
      [DBusString(validToken)],
    ),
  ).thenAnswer((invocation) async {
    stream.add(
      DBusPropertiesChangedSignal(
        DBusSignal(
          sender: ':1.231',
          path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
          interface: 'org.freedesktop.DBus.Properties',
          name: 'PropertiesChanged',
          values: [
            DBusString('com.canonical.UbuntuAdvantage.Manager'),
            DBusDict.stringVariant({'Attached': DBusBoolean(true)}),
            DBusArray.string([]),
          ],
        ),
      ),
    );

    return DBusMethodSuccessResponse([]);
  });
  when(
    objectManager.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attach',
      [DBusString(invalidToken)],
    ),
  ).thenThrow(
    DBusMethodResponseException(
      DBusMethodErrorResponse('Invalid token'),
    ),
  );
  when(
    objectManager.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Detach',
      any,
    ),
  ).thenAnswer((_) async {
    stream.add(
      DBusPropertiesChangedSignal(
        DBusSignal(
          sender: ':1.231',
          path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
          interface: 'org.freedesktop.DBus.Properties',
          name: 'PropertiesChanged',
          values: [
            DBusString('com.canonical.UbuntuAdvantage.Manager'),
            DBusDict.stringVariant({'Attached': DBusBoolean(false)}),
            DBusArray.string([]),
          ],
        ),
      ),
    );

    return DBusMethodSuccessResponse([]);
  });

  return objectManager;
}

const validToken = 'CJd8MMN8wXSWsv7wJT8c8dDK';
const invalidToken = 'CK2RYDcKfupxwXdWhSAxQPCeiULntK';

// content of /etc/os-release for 24.04 LTS
const osReleaseLTS = '''
PRETTY_NAME="Ubuntu 24.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.3 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
''';

// content of /etc/os-release for 24.10
const osReleaseNonLTS = '''
PRETTY_NAME="Ubuntu 24.10"
NAME="Ubuntu"
VERSION_ID="24.10"
VERSION="24.10 (Oracular Oriole)"
VERSION_CODENAME=oracular
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=oracular
LOGO=ubuntu-logo
''';

// excerpt of /usr/share/distro-info/ubuntu.csv
const ubuntuCsv = '''
version,codename,series,created,release,eol,eol-server,eol-esm
22.04 LTS,Jammy Jellyfish,jammy,2021-10-14,2022-04-21,2027-06-01,2027-06-01,2032-04-21
22.10,Kinetic Kudu,kinetic,2022-04-21,2022-10-20,2023-07-20
23.04,Lunar Lobster,lunar,2022-10-20,2023-04-20,2024-01-25
23.10,Mantic Minotaur,mantic,2023-04-20,2023-10-12,2024-07-11
24.04 LTS,Noble Numbat,noble,2023-10-12,2024-04-25,2029-05-31,2029-05-31,2034-04-25
24.10,Oracular Oriole,oracular,2024-04-25,2024-10-10,2025-07-10
25.04,Plucky Puffin,plucky,2024-10-10,2025-04-17,2026-01-15
25.10,Questing Quokka,questing,2025-04-17,2025-10-09,2026-07-09
26.04 LTS,Resolute Raccoon,resolute,2025-10-09,2026-04-23,2031-05-29,2031-05-29,2036-04-23
''';

String mockUaclientConf(int port) => '''
contract_url: http://localhost:$port
log_level: debug
''';

Map<DBusObjectPath, Map<String, Map<String, DBusValue>>> attachedManagedObjects(
  bool enabled,
) {
  final enabledString = enabled ? 'enabled' : 'disabled';
  return {
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/realtime_2dkernel'):
        {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('realtime-kernel'),
        'Description':
            DBusString('Ubuntu kernel with PREEMPT_RT patches integrated'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/usg'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('usg'),
        'Description': DBusString('Security compliance and audit tools'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/landscape'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('landscape'),
        'Description':
            DBusString('Management and administration tool for Ubuntu'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/livepatch'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('livepatch'),
        'Description': DBusString('Canonical Livepatch service'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/esm_2dapps'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('esm-apps'),
        'Description':
            DBusString('Expanded Security Maintenance for Applications'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'): {
      'com.canonical.UbuntuAdvantage.Manager': {
        'Attached': DBusBoolean(true),
        'DaemonVersion': DBusString('1.8'),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/fips'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('fips'),
        'Description': DBusString(
          'FIPS compliant crypto packages with stable security updates',
        ),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/fips_2dupdates'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('fips-updates'),
        'Description': DBusString(
          'FIPS compliant crypto packages with stable security updates',
        ),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/anbox_2dcloud'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('anbox-cloud'),
        'Description': DBusString('Scalable Android in the cloud'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
    DBusObjectPath('/com/canonical/UbuntuAdvantage/Services/esm_2dinfra'): {
      'com.canonical.UbuntuAdvantage.Service': {
        'Name': DBusString('esm-infra'),
        'Description':
            DBusString('Expanded Security Maintenance for Infrastructure'),
        'Entitled': DBusString('yes'),
        'Status': DBusString(enabledString),
      },
    },
  };
}

final detachedManagedObjects = {
  DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'): {
    'com.canonical.UbuntuAdvantage.Manager': {
      'Attached': DBusBoolean(true),
      'DaemonVersion': DBusString('1.8'),
    },
  },
};
