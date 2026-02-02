import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsettings/gsettings.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:snapd/snapd.dart';

part 'ubuntu_pro_service.freezed.dart';
part 'ubuntu_pro_service.g.dart';

enum UbuntuProFeature {
  anboxCloud,
  fips,
  fipsUpdates,
  realtimeKernel,
  landscape,
  esmInfra,
  esmApps,
  livepatch,
  usg,
}

@freezed
class UbuntuProManagerData with _$UbuntuProManagerData {
  factory UbuntuProManagerData({
    required bool attached,
    bool? available,
    String? version,
  }) = _UbuntuProManagerData;
}

@freezed
class UbuntuProServiceData with _$UbuntuProServiceData {
  factory UbuntuProServiceData({
    required DBusRemoteObject object,
    required UbuntuProFeature type,
    required String path,
    required String name,
    required bool entitled,
    required String status,
    StreamSubscription<DBusPropertiesChangedSignal>? propertiesChanged,
    StreamController<UbuntuProServiceData>? stream,
  }) = _UbuntuProServiceData;

  factory UbuntuProServiceData.fromMap(
    String path,
    Map<String, DBusValue> dbusMap,
  ) {
    final name = dbusMap['Name']!.asString();
    return UbuntuProServiceData(
      object: DBusRemoteObject(
        DBusClient.system(),
        name: 'com.canonical.UbuntuAdvantage',
        path: DBusObjectPath(path),
      ),
      path: path,
      name: name,
      entitled: dbusMap['Entitled']!.asString() == 'yes',
      status: dbusMap['Status']!.asString(),
      type: UbuntuProFeature.values
          .firstWhere((f) => f.name.toKebabCase() == name),
    );
  }

  const UbuntuProServiceData._();

  bool get enabled => status == 'enabled';
}

class UbuntuProManagerService {
  final DBusClient _dbusClient = DBusClient.system();
  late final StreamSubscription<DBusSignal> _propertiesChangedSignal;
  late final StreamSubscription<DBusSignal> _serviceManagerListener;
  late final DBusRemoteObjectManager _manager;
  late final DBusRemoteObjectManager _serviceManager;
  final Map<UbuntuProFeature, UbuntuProServiceData> _featureMap = {};
  UbuntuProManagerData data = UbuntuProManagerData(attached: false);

  late final StreamController<UbuntuProManagerData> stream;

  Future<void> init() async {
    stream = StreamController.broadcast();

    _manager = DBusRemoteObjectManager(
      _dbusClient,
      name: 'com.canonical.UbuntuAdvantage',
      path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
    );
    _serviceManager = DBusRemoteObjectManager(
      _dbusClient,
      name: 'com.canonical.UbuntuAdvantage',
      path: DBusObjectPath('/'),
    );

    final objects = await _serviceManager.getManagedObjects();
    for (final object in objects.entries) {
      if (!object.key.value
          .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
        continue;
      }

      final featureObj = UbuntuProServiceData.fromMap(
        object.key.value,
        object.value['com.canonical.UbuntuAdvantage.Service']!,
      );
      _featureMap.putIfAbsent(
        featureObj.type,
        () => featureObj.copyWith(
          propertiesChanged:
              featureObj.object.propertiesChanged.listen(_onPropertiesChanged),
          stream: StreamController.broadcast(),
        ),
      );
    }

    _serviceManagerListener = _serviceManager.signals.listen((signal) {
      switch (signal) {
        case DBusObjectManagerInterfacesAddedSignal():
          _onInterfacesAdded(signal);
          break;
        case DBusObjectManagerInterfacesRemovedSignal():
          _onInterfacesRemoved(signal);
          break;
        default:
          break;
      }
    });

    _propertiesChangedSignal =
        _manager.propertiesChanged.listen(_onPropertiesChanged);

    final attached = await _manager.getProperty(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attached',
    );

    final version = await _getVersion();
    data = UbuntuProManagerData(
      attached: attached.asBoolean(),
      available: _isLTS(version),
      version: version,
    );

    stream.add(data);
  }

  Future<void> dispose() async {
    await _propertiesChangedSignal.cancel();
    await _serviceManagerListener.cancel();
    await stream.close();

    for (final value in _featureMap.values) {
      await value.stream?.close();
      await value.propertiesChanged?.cancel();
    }
  }

  Future<void> _onInterfacesAdded(
    DBusObjectManagerInterfacesAddedSignal signal,
  ) async {
    if (!signal.changedPath.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      return;
    }

    final featureObj = UbuntuProServiceData.fromMap(
      signal.changedPath.value,
      signal.interfacesAndProperties['com.canonical.UbuntuAdvantage.Service']!,
    );
    _featureMap.putIfAbsent(
      featureObj.type,
      () => _featureMap.putIfAbsent(
        featureObj.type,
        () => featureObj.copyWith(
          propertiesChanged:
              featureObj.object.propertiesChanged.listen(_onPropertiesChanged),
          stream: StreamController.broadcast(),
        ),
      ),
    );
  }

  Future<void> _onInterfacesRemoved(
    DBusObjectManagerInterfacesRemovedSignal signal,
  ) async {
    if (!signal.changedPath.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      return;
    }

    final feature = _featureMap.entries
        .firstWhere((f) => f.value.path == signal.changedPath.value);
    await feature.value.propertiesChanged?.cancel();
    _featureMap.remove(feature.key);
  }

  Future<void> _onPropertiesChanged(DBusPropertiesChangedSignal signal) async {
    if (signal.path.value == '/com/canonical/UbuntuAdvantage/Manager') {
      final attached =
          signal.values[1].asStringVariantDict()['Attached']?.asBoolean();
      if (attached != null) {
        data = data.copyWith(attached: attached);
      }
      stream.add(data);
    } else if (signal.path.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      if (signal.changedProperties['Status'] != null) {
        final feature = _featureMap.entries
            .firstWhere((f) => f.value.path == signal.path.value);
        _featureMap.update(
          feature.key,
          (v) => v.copyWith(
            status: signal.changedProperties['Status']!.asString(),
          ),
        );
        _featureMap[feature.key]?.stream?.add(_featureMap[feature.key]!);
      }
    }
  }

  Future<String?> _getVersion() async {
    final filePath = Platform.environment['SNAP'] != null
        ? '/var/lib/snapd/hostfs/etc/os-release'
        : '/etc/os-release';

    final osRelease = await File(filePath).readAsLines();
    for (final line in osRelease) {
      final split = line.split('=');
      final key = split[0].trim();
      var value = split[1].trim();
      if ((value.startsWith('"') && value.endsWith('"')) ||
          (value.startsWith('\'') && value.endsWith('\''))) {
        value = value.substring(1, value.length - 1);
      }

      if (key.toUpperCase() == 'VERSION') {
        return value;
      }
    }

    return null;
  }

  bool _isLTS(String? version) {
    return version != null && version.contains('LTS');
  }

  UbuntuProServiceData? getFeature(UbuntuProFeature feature) {
    return _featureMap[feature];
  }

  Future<void> enableFeature(UbuntuProFeature feature) async {
    final featureData = getFeature(feature);
    await featureData?.object.callMethod(
      'com.canonical.UbuntuAdvantage.Service',
      'Enable',
      [],
    );
  }

  Future<void> disableFeature(UbuntuProFeature feature) async {
    final featureData = getFeature(feature);
    await featureData?.object.callMethod(
      'com.canonical.UbuntuAdvantage.Service',
      'Disable',
      [],
    );
  }

  Future<void> attach(String token) async {
    await _manager.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attach',
      [DBusString(token)],
    );
  }

  Future<void> detach() async {
    await _manager.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Detach',
      [],
    );
  }
}

@freezed
class MagicAttachResponse with _$MagicAttachResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory MagicAttachResponse({
    required DateTime expires,
    required int expiresIn,
    required String token,
    required String userCode,
    String? contractID,
    String? contractToken,
  }) = _MagicAttachResponse;

  factory MagicAttachResponse.fromJson(Map<String, dynamic> json) =>
      _$MagicAttachResponseFromJson(json);
}

class MagicAttachService {
  static const defaultEtcPath = '/etc/ubuntu-advantage';
  static const defaultConfigFile = 'uaclient.conf';
  static const v1MagicAttach = '/v1/magic-attach';

  late final String _apiBase = _getAPIBase();

  Future<MagicAttachResponse> newToken() async {
    final uri = Uri.parse(_apiBase).replace(path: v1MagicAttach);
    final response = await http.post(uri);

    if (response.statusCode >= 300) {
      throw HttpException(
        'Magic attach got response code ${response.statusCode}: ${response.body}',
      );
    }

    final jsonBody = jsonDecode(response.body);
    return MagicAttachResponse.fromJson(jsonBody as Map<String, dynamic>);
  }

  Future<MagicAttachResponse> getContractToken(String token) async {
    final uri = Uri.parse(_apiBase).replace(path: v1MagicAttach);
    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode >= 300) {
      throw HttpException(
        'Magic attach got response code ${response.statusCode}: ${response.body}',
      );
    }

    final jsonBody = jsonDecode(response.body);
    return MagicAttachResponse.fromJson(jsonBody as Map<String, dynamic>);
  }

  String _getAPIBase() {
    final configFile = File(_getConfigPath()).readAsLinesSync();
    for (final line in configFile) {
      if (line.trim().startsWith('contract_url: ')) {
        final contractURL = line.replaceFirst('contract_url:', '').trim();
        if (contractURL.isNotEmpty) {
          return contractURL;
        }
      }
    }

    return '';
  }

  String _getConfigPath() {
    final configPath = Platform.environment['UA_CONFIG_FILE'];
    if (configPath != null) {
      return configPath;
    }

    return path.join(defaultEtcPath, defaultConfigFile);
  }
}

class GSettingsIconService {
  final settings = GSettings('com.ubuntu.update-notifier');
  late final StreamController<List<String>> stream;

  late final StreamSubscription<List<String>> _streamSubscription;

  Future<void> init() async {
    stream = StreamController.broadcast();
    _streamSubscription =
        settings.keysChanged.listen((data) => stream.add(data));
  }

  Future<void> dispose() async {
    await stream.close();
    await _streamSubscription.cancel();
  }

  Future<bool> getStatusIcon() async {
    final showStatusIcon = await settings.get('show-livepatch-status-icon');
    return showStatusIcon.asBoolean();
  }

  Future<void> toggleStatusIcon(bool value) async {
    await settings.set('show-livepatch-status-icon', DBusBoolean(value));
  }
}
