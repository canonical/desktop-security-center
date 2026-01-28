import 'dart:async';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsettings/gsettings.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'ubuntu_pro_providers.g.dart';
part 'ubuntu_pro_providers.freezed.dart';

@riverpod
class UbuntuProModel extends _$UbuntuProModel {
  final _service = getService<UbuntuProManagerService>();

  @override
  UbuntuProData build() {
    _service.stream.stream.listen((data) {
      state = data;
    });

    return _service.data;
  }

  Future<void> attach(String token) async {
    await _service.attach(token);
  }

  Future<void> detach() async {
    await _service.detach();
  }
}

@freezed
class UbuntuProAvailabilityData with _$UbuntuProAvailabilityData {
  factory UbuntuProAvailabilityData({
    required bool available,
    required String? version,
  }) = _UbuntuProAvailabilityData;
}

@riverpod
class UbuntuProAvailabilityModel extends _$UbuntuProAvailabilityModel {
  @override
  Future<UbuntuProAvailabilityData> build() async {
    final version = await _getVersion();
    return UbuntuProAvailabilityData(
      available: _isLTS(version),
      version: version,
    );
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
}

@riverpod
Stream<List<String>> updateNotifierStream(Ref ref) async* {
  final settings = GSettings('com.ubuntu.update-notifier');
  await for (final keys in settings.keysChanged) {
    yield keys;
  }
}

@freezed
class GSettingsUpdateNotifierData with _$GSettingsUpdateNotifierData {
  factory GSettingsUpdateNotifierData({
    required bool showStatusIcon,
  }) = _GSettingsUpdateNotifierData;
}

@riverpod
class GSettingsUpdateNotifierModel extends _$GSettingsUpdateNotifierModel {
  final settings = GSettings('com.ubuntu.update-notifier');

  @override
  Future<GSettingsUpdateNotifierData> build() async {
    ref.watch(updateNotifierStreamProvider);

    return GSettingsUpdateNotifierData(
      showStatusIcon: await _getStatusIcon(),
    );
  }

  Future<bool> _getStatusIcon() async {
    final showStatusIcon = await settings.get('show-livepatch-status-icon');
    return showStatusIcon.asBoolean();
  }

  Future<void> toggleStatusIcon(bool value) async {
    await settings.set('show-livepatch-status-icon', DBusBoolean(value));
  }
}

@freezed
class UbuntuProServiceData with _$UbuntuProServiceData {
  factory UbuntuProServiceData({
    required DBusRemoteObject object,
    required String path,
    required String name,
    required bool entitled,
    required String status,
  }) = _UbuntuProServiceData;

  factory UbuntuProServiceData.fromMap(
    String path,
    Map<String, DBusValue> dbusMap,
  ) {
    return UbuntuProServiceData(
      object: DBusRemoteObject(
        DBusClient.system(),
        name: 'com.canonical.UbuntuAdvantage',
        path: DBusObjectPath(path),
      ),
      path: path,
      name: dbusMap['Name']!.asString(),
      entitled: dbusMap['Entitled']!.asString() == 'yes',
      status: dbusMap['Status']!.asString(),
    );
  }

  const UbuntuProServiceData._();

  bool get enabled => status == 'enabled';
}

enum UbuntuProFeature {
  anboxCloud,
  fipsUpdates,
  realtimeKernel,
  landscape,
  esmInfra,
  esmApps,
  livepatch,
  usg,
}

@riverpod
class UbuntuProFeatureModel extends _$UbuntuProFeatureModel {
  final DBusClient dbusClient = DBusClient.system();
  late final StreamSubscription<DBusSignal> stream;

  StreamSubscription<DBusSignal>? propertiesChangedStream;

  @override
  Future<UbuntuProServiceData?> build(UbuntuProFeature feature) async {
    final object = DBusRemoteObjectManager(
      dbusClient,
      name: 'com.canonical.UbuntuAdvantage',
      path: DBusObjectPath('/'),
    );

    // obtain initial feature state
    final objects = await object.getManagedObjects();
    UbuntuProServiceData? value;
    for (final object in objects.entries) {
      if (!object.key.value
          .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
        continue;
      }
      value = _featureStatus(object.key.value, object.value);
      if (value != null) {
        await _clearListeners();
        propertiesChangedStream =
            value.object.propertiesChanged.listen(_onPropertiesChanged);
        break;
      }
    }

    stream = object.signals.listen((signal) {
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
    ref.onDispose(() async {
      await stream.cancel();
    });

    return value;
  }

  void _onPropertiesChanged(DBusPropertiesChangedSignal signal) {
    if (signal.changedProperties['Status'] != null) {
      state = AsyncData(
        state.value!
            .copyWith(status: signal.changedProperties['Status']!.asString()),
      );
    }
  }

  Future<void> _onInterfacesAdded(
    DBusObjectManagerInterfacesAddedSignal signal,
  ) async {
    if (signal.changedPath.value
        .startsWith('/com/canonical/UbuntuAdvantage/Services/')) {
      final data = _featureStatus(
        signal.changedPath.value,
        signal.interfacesAndProperties,
      );
      if (data != null) {
        await _clearListeners();
        state = AsyncData(data);
        propertiesChangedStream =
            data.object.propertiesChanged.listen(_onPropertiesChanged);
      }
    }
  }

  Future<void> _clearListeners() async {
    if (state.valueOrNull != null) {
      await propertiesChangedStream?.cancel();
      propertiesChangedStream = null;
    }
  }

  UbuntuProServiceData? _featureStatus(
    String path,
    Map<String, Map<String, DBusValue>> properties,
  ) {
    final obj = UbuntuProServiceData.fromMap(
      path,
      properties['com.canonical.UbuntuAdvantage.Service']!,
    );

    if (obj.name != feature.name.toKebabCase()) {
      return null;
    }

    return obj;
  }

  Future<void> _onInterfacesRemoved(
    DBusObjectManagerInterfacesRemovedSignal signal,
  ) async {
    if (signal.changedPath.value
            .startsWith('/com/canonical/UbuntuAdvantage/Services/') &&
        state.valueOrNull != null &&
        state.value!.path == signal.changedPath.value) {
      await _clearListeners();
      state = AsyncData(null);
    }
  }

  Future<void> toggleFeature(bool value) async {
    if (state.valueOrNull == null) {
      return;
    }

    state.value!.enabled ? await disableFeature() : await enableFeature();
  }

  Future<void> enableFeature() async {
    if (state.valueOrNull == null) {
      return;
    }

    state = const AsyncLoading();
    try {
      await state.value?.object
          .callMethod('com.canonical.UbuntuAdvantage.Service', 'Enable', []);
    } on DBusMethodResponseException {
      state = AsyncData(state.value);
    }
  }

  Future<void> disableFeature() async {
    if (state.valueOrNull == null) {
      return;
    }

    state = const AsyncLoading();
    try {
      await state.value?.object
          .callMethod('com.canonical.UbuntuAdvantage.Service', 'Disable', []);
    } on DBusMethodResponseException {
      state = AsyncData(state.value);
    }
  }
}

@freezed
class MagicAttachData with _$MagicAttachData {
  factory MagicAttachData({
    required MagicAttachResponse response,
  }) = _MagicAttachData;

  const MagicAttachData._();

  bool get validContract => response.contractID != null;
}

@riverpod
class MagicAttachModel extends _$MagicAttachModel {
  final _service = getService<MagicAttachService>();
  final _proService = getService<UbuntuProManagerService>();
  late final Timer _timer;

  @override
  Future<MagicAttachData> build() async {
    await _service.init();
    final response = await _service.newToken();
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (timer) => updateToken(),
    );
    ref.onDispose(() => _timer.cancel());
    return MagicAttachData(response: response);
  }

  Future<void> updateToken() async {
    if (!state.hasValue) return;

    final contractResponse =
        await _service.getContractToken(state.value!.response.token);
    state = AsyncData(state.value!.copyWith(response: contractResponse));

    if (state.value!.validContract) {
      _timer.cancel();
    }
  }

  Future<void> attach() async {
    if (state.value == null || !state.value!.validContract) {
      state = AsyncError(
        'Magic attach contract is invalid',
        StackTrace.current,
      );
    }
    await _proService.attach(state.value!.response.contractToken!);
  }
}
