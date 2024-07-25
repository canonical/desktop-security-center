import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

export 'package:security_center/services/app_permissions_service.dart';

part 'rules_providers.g.dart';

@riverpod
class PromptingStatusModel extends _$PromptingStatusModel {
  late final _service = getService<AppPermissionsService>();

  @override
  Future<AppPermissionsServiceStatus> build() async {
    if (await _service.isEnabled()) {
      return AppPermissionsServiceStatus.enabled();
    } else {
      return AppPermissionsServiceStatus.disabled();
    }
  }

  Future<void> _guard(
    Stream<AppPermissionsServiceStatus> Function() action,
  ) async {
    await for (final status in action()) {
      state = AsyncData(status);
    }
    state = await AsyncValue.guard(build);
  }

  Future<void> enable() => _guard(_service.enable);
  Future<void> disable() => _guard(_service.disable);
}

@riverpod
Future<List<SnapdRule>> rules(RulesRef ref) =>
    getService<AppPermissionsService>().getRules();

@riverpod
Future<Map<SnapdInterface, int>> interfaceSnapCounts(
  InterfaceSnapCountsRef ref,
) async {
  final rules = await ref.watch(rulesProvider.future);
  final interfaceSnaps = rules.fold<Map<String, Set<String>>>(
    {},
    (snaps, rule) {
      snaps[rule.interface] = (snaps[rule.interface] ?? {})..add(rule.snap);
      return snaps;
    },
  );
  return interfaceSnaps.map(
    (interface, snaps) =>
        MapEntry(SnapdInterface.fromString(interface), snaps.length),
  );
}

@riverpod
Future<Map<String, int>> snapRuleCounts(
  SnapRuleCountsRef ref, {
  required SnapdInterface interface,
}) async {
  final rules = await ref.watch(rulesProvider.future);
  return rules.fold<Map<String, int>>(
    {},
    (counts, rule) {
      if (rule.interface == interface.name) {
        counts[rule.snap] = (counts[rule.snap] ?? 0) + 1;
      }
      return counts;
    },
  );
}

@riverpod
class SnapRulesModel extends _$SnapRulesModel {
  @override
  Future<List<SnapdRule>> build({
    required String snap,
    required SnapdInterface interface,
  }) async {
    final rules = await ref.watch(rulesProvider.future);
    return rules
        .where((rule) => rule.snap == snap && rule.interface == interface.name)
        .toList();
  }

  Future<void> removeRule(String id) async {
    final service = getService<AppPermissionsService>();
    await service.removeRule(id);
    ref.invalidate(rulesProvider);
  }

  Future<void> removeAll() async {
    final service = getService<AppPermissionsService>();
    await service.removeAllRules(
      snap: snap,
      interface: interface.name,
    );
    ref.invalidate(rulesProvider);
  }
}
