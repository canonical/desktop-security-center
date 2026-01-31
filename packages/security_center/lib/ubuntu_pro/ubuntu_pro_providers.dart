import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsettings/gsettings.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'ubuntu_pro_providers.g.dart';
part 'ubuntu_pro_providers.freezed.dart';

@freezed
sealed class UbuntuProAttachState with _$UbuntuProAttachState {
  factory UbuntuProAttachState.input() = UbuntuProAttachStateInput;
  factory UbuntuProAttachState.loading() = UbuntuProAttachStateLoading;
  factory UbuntuProAttachState.error() = UbuntuProAttachStateError;
  factory UbuntuProAttachState.success() = UbuntuProAttachStateSuccess;
}

@freezed
class UbuntuProData with _$UbuntuProData {
  factory UbuntuProData({
    required UbuntuProAttachState state,
    required UbuntuProManagerData manager,
    @Default('') String token,
  }) = _UbuntuProData;

  const UbuntuProData._();

  bool get validToken => token.length >= 24 && token.length <= 30;
}

@riverpod
class UbuntuProModel extends _$UbuntuProModel {
  final _service = getService<UbuntuProManagerService>();

  @override
  UbuntuProData build() {
    _service.stream.stream.listen((data) {
      state = state.copyWith(manager: _service.data);
    });

    return UbuntuProData(
      manager: _service.data,
      state: UbuntuProAttachState.input(),
    );
  }

  Future<void> attach() async {
    try {
      state = state.copyWith(state: UbuntuProAttachState.loading());
      await _service.attach(state.token);
      state = state.copyWith(state: UbuntuProAttachState.success());
    } on DBusMethodResponseException {
      state = state.copyWith(state: UbuntuProAttachState.error());
    }
  }

  Future<void> detach() async {
    try {
      state = state.copyWith(state: UbuntuProAttachState.loading());
      await _service.detach();
      state = state.copyWith(state: UbuntuProAttachState.success());
    } on DBusMethodResponseException {
      state = state.copyWith(state: UbuntuProAttachState.error());
    }
  }

  void setToken(String token) {
    if (state.state is UbuntuProAttachStateError) {
      state = state.copyWith(state: UbuntuProAttachState.input());
    }
    state = state.copyWith(token: token);
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
sealed class UbuntuProFeatureState with _$UbuntuProFeatureState {
  factory UbuntuProFeatureState.enabled() = UbuntuProFeatureStateEnabled;
  factory UbuntuProFeatureState.disabled() = UbuntuProFeatureStateDisabled;
  factory UbuntuProFeatureState.loading() = UbuntuProFeatureStateLoading;
  factory UbuntuProFeatureState.error() = UbuntuProFeatureStateError;
}

@freezed
class UbuntuProFeatureData with _$UbuntuProFeatureData {
  factory UbuntuProFeatureData({
    required UbuntuProFeatureState state,
    required UbuntuProServiceData data,
    required StreamSubscription<UbuntuProServiceData>? stream,
  }) = _UbuntuProFeatureData;

  const UbuntuProFeatureData._();

  bool get canToggle => data.entitled && state is! UbuntuProFeatureStateLoading;
}

@riverpod
class UbuntuProFeatureModel extends _$UbuntuProFeatureModel {
  final _service = getService<UbuntuProManagerService>();

  @override
  UbuntuProFeatureData? build(UbuntuProFeature feature) {
    final featureService = _service.getFeature(feature);
    if (featureService == null) {
      return null;
    }

    ref.onDispose(() async => await state?.stream?.cancel());
    return UbuntuProFeatureData(
      state: featureService.enabled
          ? UbuntuProFeatureState.enabled()
          : UbuntuProFeatureState.disabled(),
      data: featureService,
      stream: featureService.stream?.stream.listen(_featureUpdated),
    );
  }

  void _featureUpdated(UbuntuProServiceData data) {
    state = state?.copyWith(
      data: data,
      state: data.enabled
          ? UbuntuProFeatureState.enabled()
          : UbuntuProFeatureState.disabled(),
    );
  }

  Future<void> toggleFeature(bool value) async {
    if (state == null) {
      return;
    }

    state!.data.enabled ? await disableFeature() : await enableFeature();
  }

  Future<void> enableFeature() async {
    if (state == null) {
      return;
    }

    state = state?.copyWith(state: UbuntuProFeatureState.loading());
    try {
      await _service.enableFeature(feature);
    } on DBusMethodResponseException {
      state = state?.copyWith(state: UbuntuProFeatureState.error());
    }
  }

  Future<void> disableFeature() async {
    if (state == null) {
      return;
    }

    state = state?.copyWith(state: UbuntuProFeatureState.loading());
    try {
      await _service.disableFeature(feature);
    } on DBusMethodResponseException {
      state = state?.copyWith(state: UbuntuProFeatureState.error());
    }
  }
}

enum FIPSType {
  fips,
  fipsUpdates,
}

@freezed
class FIPSData with _$FIPSData {
  factory FIPSData({
    required FIPSType type,
    required bool canEnable,
    required bool enabled,
  }) = _FIPSData;
}

@riverpod
class FIPSModel extends _$FIPSModel {
  @override
  FIPSData build() {
    final fipsProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.fips));
    final fipsUpdatesProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.fipsUpdates));

    final canEnable = fipsProvider?.data.entitled ?? false;
    final enabled = (fipsProvider?.data.enabled ?? false) ||
        (fipsUpdatesProvider?.data.enabled ?? false);

    return FIPSData(
      type: FIPSType.fipsUpdates,
      canEnable: canEnable,
      enabled: enabled,
    );
  }

  void setType(FIPSType type) {
    state = state.copyWith(type: type);
  }

  Future<void> enable() async {
    final selectedProvider = switch (state.type) {
      FIPSType.fips => UbuntuProFeature.fips,
      FIPSType.fipsUpdates => UbuntuProFeature.fipsUpdates,
    };
    await ref
        .read(ubuntuProFeatureModelProvider(selectedProvider).notifier)
        .enableFeature();
  }
}

@freezed
class MagicAttachData with _$MagicAttachData {
  factory MagicAttachData({
    required UbuntuProAttachState state,
    required MagicAttachResponse response,
  }) = _MagicAttachData;

  const MagicAttachData._();

  bool get validContract => response.contractID != null;
}

@riverpod
class MagicAttachModel extends _$MagicAttachModel {
  static const refreshDuration = Duration(seconds: 10);

  final _service = getService<MagicAttachService>();
  final _proService = getService<UbuntuProManagerService>();
  late final Timer _timer;

  @override
  Future<MagicAttachData> build() async {
    final response = await _service.newToken();
    _timer = Timer.periodic(
      refreshDuration,
      (timer) => updateToken(),
    );
    ref.onDispose(() => _timer.cancel());

    return MagicAttachData(
      response: response,
      state: UbuntuProAttachState.input(),
    );
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
    try {
      state = AsyncData(
        state.value!.copyWith(state: UbuntuProAttachState.loading()),
      );
      await _proService.attach(state.value!.response.contractToken!);
      state = AsyncData(
        state.value!.copyWith(state: UbuntuProAttachState.success()),
      );
    } on DBusMethodResponseException {
      state = AsyncData(
        state.value!.copyWith(state: UbuntuProAttachState.error()),
      );
    }
  }
}
