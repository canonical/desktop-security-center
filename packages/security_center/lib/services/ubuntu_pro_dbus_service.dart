import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:dbus/dbus.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snapd/snapd.dart';

part 'ubuntu_pro_dbus_service.freezed.dart';

enum UbuntuProFeatureType {
  fips,
  fipsUpdates,
  esmInfra,
  esmApps,
  livepatch,
  usg,
}

extension FeatureTypePath on UbuntuProFeatureType {
  String toPathPart() {
    return name.toKebabCase().replaceAll('-', '_2d');
  }
}

@freezed
class UbuntuProManagerData with _$UbuntuProManagerData {
  factory UbuntuProManagerData({
    required bool attached,
    bool? available,
    DateTime? eolDate,
  }) = _UbuntuProManagerData;
}

@freezed
class UbuntuProFeatureDetails with _$UbuntuProFeatureDetails {
  factory UbuntuProFeatureDetails({
    required UbuntuProFeature data,
    required StreamSubscription<DBusPropertiesChangedSignal>
        propertiesChangedStream,
  }) = _UbuntuProFeatureDetails;
}

@freezed
class UbuntuProFeature with _$UbuntuProFeature {
  factory UbuntuProFeature({
    required DBusRemoteObject object,
    required UbuntuProFeatureType? type,
    required String path,
    required String name,
    required bool entitled,
    required String status,
  }) = _UbuntuProFeature;

  factory UbuntuProFeature.fromMap(
    String path,
    Map<String, DBusValue> dbusMap,
    DBusRemoteObject object,
  ) {
    final name = dbusMap['Name']!.asString();

    return UbuntuProFeature(
      object: object,
      path: path,
      name: name,
      entitled: dbusMap['Entitled']!.asString() == 'yes',
      status: dbusMap['Status']!.asString(),
      type: UbuntuProFeatureType.values
          .firstWhereOrNull((f) => f.name.toKebabCase() == name),
    );
  }

  const UbuntuProFeature._();

  bool get enabled => status == 'enabled';
}

/// Ubuntu Pro service that monitors and modifies features enabled by being Pro-attached.
class UbuntuProFeatureService {
  UbuntuProFeatureService({
    DBusClient? client,
    @visibleForTesting DBusRemoteObjectManager? objectManager,
    @visibleForTesting DBusRemoteObject Function(String path)? objectFactory,
  })  : _dbusClient = client ?? DBusClient.system(),
        _objectManager = objectManager,
        _objectFactory = objectFactory;

  DBusRemoteObjectManager? _objectManager;
  DBusRemoteObject Function(String path)? _objectFactory;

  final DBusClient _dbusClient;
  final Map<UbuntuProFeatureType, UbuntuProFeatureDetails> _featureMap = {};
  late final StreamSubscription<DBusSignal> _featureManagerListener;
  late final StreamController<UbuntuProFeatureType> _stream;

  /// Broadcast stream that notifies any time a feature type updates via D-Bus.
  Stream<UbuntuProFeatureType> get stream => _stream.stream;

  /// Initializes the service.
  Future<void> init() async {
    _stream = StreamController.broadcast();
    _objectManager = _objectManager ??
        DBusRemoteObjectManager(
          _dbusClient,
          name: 'com.canonical.UbuntuAdvantage',
          path: DBusObjectPath('/'),
        );
    _objectFactory = _objectFactory ??
        (path) => DBusRemoteObject(
              DBusClient.system(),
              name: 'com.canonical.UbuntuAdvantage',
              path: DBusObjectPath(path),
            );

    final objects = await _objectManager!.getManagedObjects();
    for (final object in objects.entries) {
      if (!object.key.value
          .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
        continue;
      }

      await _updateFeature(
        object.key.value,
        object.value['com.canonical.UbuntuAdvantage.Service']!,
      );
    }

    _featureManagerListener = _objectManager!.signals.listen((signal) {
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
  }

  /// Cleans up remaining listeners.
  Future<void> dispose() async {
    await _featureManagerListener.cancel();
    for (final key in _featureMap.keys.toList()) {
      await _removeFeature(key);
    }
    await _stream.close();
  }

  /// Get whether a feature is enabled or not. If the feature is not available,
  /// this function will also return `false`.
  bool isEnabled(UbuntuProFeatureType feature) =>
      getFeature(feature)?.enabled ?? false;

  /// Get a feature being tracked, possibly null if unavailable.
  UbuntuProFeature? getFeature(UbuntuProFeatureType feature) {
    return _featureMap[feature]?.data;
  }

  /// Enable a Pro feature over D-Bus.
  Future<void> enableFeature(UbuntuProFeatureType feature) async {
    final featureData = getFeature(feature);
    await featureData?.object.callMethod(
      'com.canonical.UbuntuAdvantage.Service',
      'Enable',
      [],
    );
  }

  /// Disable a Pro feature over D-Bus.
  Future<void> disableFeature(UbuntuProFeatureType feature) async {
    final featureData = getFeature(feature);
    await featureData?.object.callMethod(
      'com.canonical.UbuntuAdvantage.Service',
      'Disable',
      [],
    );
  }

  /// Emitted when a feature gets disabled/enabled.
  Future<void> _onPropertiesChanged(DBusPropertiesChangedSignal signal) async {
    if (!signal.path.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      return;
    }

    if (signal.changedProperties['Status'] == null) return;

    final feature = _featureMap.entries
        .firstWhereOrNull((f) => f.value.data.path == signal.path.value);
    if (feature == null) return;

    _featureMap.update(
      feature.key,
      (v) => v.copyWith(
        data: v.data.copyWith(
          status: signal.changedProperties['Status']!.asString(),
        ),
      ),
    );
    _stream.add(feature.key);
  }

  /// Emitted when a feature is added to D-Bus (usually on attach).
  Future<void> _onInterfacesAdded(
    DBusObjectManagerInterfacesAddedSignal signal,
  ) async {
    if (!signal.changedPath.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      return;
    }

    await _updateFeature(
      signal.changedPath.value,
      signal.interfacesAndProperties['com.canonical.UbuntuAdvantage.Service']!,
    );
  }

  /// Emitted when a feature is removed from D-Bus (usually on detach).
  Future<void> _onInterfacesRemoved(
    DBusObjectManagerInterfacesRemovedSignal signal,
  ) async {
    if (!signal.changedPath.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      return;
    }

    final feature = _featureMap.entries
        .firstWhereOrNull((f) => f.value.data.path == signal.changedPath.value);
    if (feature == null) return;

    await _removeFeature(feature.key);
  }

  /// Update a feature with its new data.
  Future<void> _updateFeature(
    String path,
    Map<String, DBusValue> dbusMap,
  ) async {
    final featureObj = UbuntuProFeature.fromMap(
      path,
      dbusMap,
      _objectFactory!(path),
    );

    if (featureObj.type == null) return;

    _featureMap.update(
      featureObj.type!,
      (details) => details.copyWith(data: featureObj),
      ifAbsent: () => UbuntuProFeatureDetails(
        data: featureObj,
        propertiesChangedStream:
            featureObj.object.propertiesChanged.listen(_onPropertiesChanged),
      ),
    );
    _stream.add(featureObj.type!);
  }

  /// Remove a feature from being tracked internally.
  Future<void> _removeFeature(UbuntuProFeatureType featureType) async {
    final feature = _featureMap.remove(featureType);
    _stream.add(featureType);
    if (feature == null) return;

    await feature.propertiesChangedStream.cancel();
  }
}

/// Ubuntu Pro service that monitors and modifies Pro attachment status over D-Bus.
class UbuntuProManagerService {
  UbuntuProManagerService({
    DBusClient? client,
    @visibleForTesting DBusRemoteObjectManager? objectManager,
    @visibleForTesting FileSystem? fs,
  })  : _dbusClient = client ?? DBusClient.system(),
        _objectManager = objectManager,
        _fs = fs ?? LocalFileSystem();

  final FileSystem _fs;
  DBusRemoteObjectManager? _objectManager;

  final DBusClient _dbusClient;
  late final StreamSubscription<DBusSignal> _propertiesChangedSignal;
  late final StreamController<UbuntuProManagerData> _stream;
  UbuntuProManagerData _data = UbuntuProManagerData(attached: false);

  /// Current data of Pro attachment.
  UbuntuProManagerData get data => _data;

  /// Broadcast stream that updates every time attachment data changes via D-Bus.
  Stream<UbuntuProManagerData> get stream => _stream.stream;

  /// Initializes the service.
  Future<void> init() async {
    _stream = StreamController.broadcast();
    _objectManager = _objectManager ??
        DBusRemoteObjectManager(
          _dbusClient,
          name: 'com.canonical.UbuntuAdvantage',
          path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
        );
    _propertiesChangedSignal =
        _objectManager!.propertiesChanged.listen(_onPropertiesChanged);

    final releases = await _getReleases();
    final series = await _getSeries();
    final lts = await _isLTS(series, releases);
    final eolDate =
        series != null && lts ? _getEndOfSupport(series, releases) : null;

    final attached = await _objectManager!.getProperty(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attached',
    );

    _data = UbuntuProManagerData(
      attached: attached.asBoolean(),
      available: lts,
      eolDate: eolDate,
    );
    _stream.add(_data);
  }

  /// Cleans up remaining listeners.
  Future<void> dispose() async {
    await _propertiesChangedSignal.cancel();
    await _stream.close();
  }

  /// Attach the machine over D-Bus.
  Future<void> attach(String token) async {
    await _objectManager!.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attach',
      [DBusString(token)],
    );
  }

  /// Detach the machine over D-Bus.
  Future<void> detach() async {
    await _objectManager!.callMethod(
      'com.canonical.UbuntuAdvantage.Manager',
      'Detach',
      [],
    );
  }

  /// Emitted when attachment status changes over D-Bus.
  Future<void> _onPropertiesChanged(DBusPropertiesChangedSignal signal) async {
    if (signal.path.value != '/com/canonical/UbuntuAdvantage/Manager') return;

    final attached =
        signal.values[1].asStringVariantDict()['Attached']?.asBoolean();
    if (attached != null) {
      _data = _data.copyWith(attached: attached);
    }
    _stream.add(_data);
  }

  /// Get past Ubuntu releases from ubuntu.csv.
  Future<List<List<dynamic>>> _getReleases() async {
    final filePath = '/usr/share/distro-info/ubuntu.csv';
    final csvContent = await _fs.file(filePath).readAsString();
    final data = CsvToListConverter(eol: '\n').convert(csvContent);
    return data.skip(1).toList();
  }

  /// Get the Ubuntu version of the machine.
  Future<String?> _getSeries() async {
    final filePath = Platform.environment['SNAP'] != null
        ? '/var/lib/snapd/hostfs/etc/os-release'
        : '/etc/os-release';
    final osRelease = await _fs.file(filePath).readAsLines();

    for (final line in osRelease) {
      final split = line.split('=');
      final key = split[0].trim();
      var value = split[1].trim();
      if ((value.startsWith('"') && value.endsWith('"')) ||
          (value.startsWith('\'') && value.endsWith('\''))) {
        value = value.substring(1, value.length - 1);
      }

      if (key.toUpperCase() == 'VERSION_CODENAME') {
        return value;
      }
    }

    return null;
  }

  /// Determine if an Ubuntu version string is an LTS.
  Future<bool> _isLTS(String? series, List<List<dynamic>> releases) async {
    for (final row in releases) {
      if (row[2] == series) {
        return row[0].toString().contains('LTS');
      }
    }

    return false;
  }

  /// Get the estimated end-of-support year for a given Ubuntu version.
  DateTime? _getEndOfSupport(String? series, List<List<dynamic>> releases) {
    for (final row in releases) {
      if (row[2] == series) {
        return DateTime.tryParse(row.last.toString());
      }
    }

    return null;
  }
}
