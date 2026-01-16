import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapd/snapd.dart';

part 'ubuntu_pro_providers.g.dart';
part 'ubuntu_pro_providers.freezed.dart';

@freezed
class UbuntuProModelData with _$UbuntuProModelData {
  factory UbuntuProModelData({
    required bool attached,
  }) = _UbuntuProModelData;
}

@riverpod
class UbuntuProModel extends _$UbuntuProModel {
  final DBusClient dbusClient = DBusClient.system();
  late final StreamSubscription<DBusSignal> propertiesChangedSignal;

  @override
  Future<UbuntuProModelData> build() async {
    final object = DBusRemoteObjectManager(
      dbusClient,
      name: 'com.canonical.UbuntuAdvantage',
      path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
    );

    final attached = await object.getProperty(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attached',
    );

    propertiesChangedSignal = object.propertiesChanged.listen(
      _onPropertiesChanged,
      onError: _onPropertiesChangedError,
    );
    ref.onDispose(() async {
      await propertiesChangedSignal.cancel();
    });

    return UbuntuProModelData(attached: attached.asBoolean());
  }

  Future<void> _onPropertiesChanged(DBusSignal signal) async {
    if (signal.path.value != '/com/canonical/UbuntuAdvantage/Manager') return;

    final attached =
        signal.values[1].asStringVariantDict()['Attached']?.asBoolean();
    if (attached != null) {
      state = AsyncData(
        UbuntuProModelData(attached: attached),
      );
    }
  }

  Future<void> _onPropertiesChangedError(
    Object error,
    StackTrace stackTrace,
  ) async {
    state = AsyncError(error, stackTrace);
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
