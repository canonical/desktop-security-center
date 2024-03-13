import 'package:desktop_security_center/src/ubuntu_pro/pro_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pro_feature_controller.g.dart';

@riverpod
bool isFeatureEnabled(IsFeatureEnabledRef ref, ProFeature feature) {
  return ref.watch(proFeatureControllerProvider).asData?.value[feature] ??
      false;
}

@riverpod
class ProFeatureController extends _$ProFeatureController {
  @override
  Future<Map<ProFeature, bool>> build() async {
    final proClient = ref.watch(proClientProvider);
    final result = await (
      proClient.isMachineProAttached(),
      proClient.isEsmAppsEnabled(),
      proClient.isEsmInfraEnabled(),
      proClient.isKernelLivePatchEnabled()
    ).wait;

    return {
      ProFeature.isMachineAttached: result.$1,
      ProFeature.esmApps: result.$2,
      ProFeature.esmInfra: result.$3,
      ProFeature.kernelLivePatch: result.$4,
    };
  }

  Future<void> toggleFeature(ProFeature feature) async {
    final proClient = ref.read(proClientProvider);
    switch (feature) {
      case ProFeature.esmApps:
        if (await proClient.isEsmAppsEnabled()) {
          await proClient.disableEsmApps();
        } else {
          await proClient.enableEsmApps();
        }
        break;
      case ProFeature.esmInfra:
        if (await proClient.isEsmInfraEnabled()) {
          await proClient.disableEsmInfra();
        } else {
          await proClient.enableEsmInfra();
        }
        break;
      case ProFeature.kernelLivePatch:
        if (await proClient.isKernelLivePatchEnabled()) {
          await proClient.disableKernelLivePatch();
        } else {
          await proClient.enableKernelLivePatch();
        }
        break;
      case ProFeature.isMachineAttached:
        /* if (await proClient.isMachineProAttached()) {
          await proClient.disableMachinePro();
        } else {
          await proClient.enableMachinePro();
        } */
        break;
    }
    state.whenData((value) {
      final newMap = Map.of(value)
        ..update(feature, (v) => !(value[feature] ?? false));
      state = AsyncData(newMap);
    });
  }
}
