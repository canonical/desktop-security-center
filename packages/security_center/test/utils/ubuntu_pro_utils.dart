import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';
import 'package:snapd/snapd.dart';

import 'ubuntu_pro_utils.mocks.dart';

MemoryFileSystem mockOSRelease({
  required String osRelease,
}) {
  final mockFs = MemoryFileSystem.test();
  mockFs.file('/var/lib/snapd/hostfs/etc/os-release')
    ..createSync(recursive: true)
    ..writeAsStringSync(osRelease);
  mockFs.file('/etc/os-release')
    ..createSync(recursive: true)
    ..writeAsStringSync(osRelease);

  return mockFs;
}

@GenerateMocks([DBusRemoteObject])
MockDBusRemoteObject mockFeatureObject({
  UbuntuProFeatureType type = UbuntuProFeatureType.anboxCloud,
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
