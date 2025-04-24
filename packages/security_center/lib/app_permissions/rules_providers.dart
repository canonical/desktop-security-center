import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

export 'package:security_center/services/app_permissions_service.dart';

part 'rules_providers.freezed.dart';
part 'rules_providers.g.dart';

@riverpod
class PromptingStatusModel extends _$PromptingStatusModel {
  late final _service = getService<AppPermissionsService>();

  @override
  Stream<AppPermissionsServiceStatus> build() => _service.status;

  Future<void> enable() => _service.enable();
  Future<void> disable() => _service.disable();
}

@riverpod
Future<List<SnapdRule>> rules(Ref ref) async =>
    switch (await ref.watch(promptingStatusModelProvider.future)) {
      AppPermissionsServiceStatusEnabled(rules: final rules) => rules,
      _ => [],
    };

@riverpod
Future<Map<SnapdInterface, int>> interfaceSnapCounts(
  Ref ref,
) async {
  final rules = await ref.watch(rulesProvider.future);
  final interfaceSnaps = rules.fold<Map<String, Set<String>>>(
    {'home': {}},
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
  Ref ref, {
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

@riverpod
class SnapHomeRulesModel extends _$SnapHomeRulesModel {
  @override
  Future<List<SnapdHomeRuleFragment>> build({
    required String snap,
  }) async {
    final rules = await ref.watch(rulesProvider.future);
    return rules
        .where(
          (rule) =>
              rule.snap == snap &&
              SnapdInterface.fromString(rule.interface) == SnapdInterface.home,
        )
        .expand(SnapdHomeRuleFragment.fromRule)
        .toList();
  }

  Future<void> removeRule(String id) async {
    final service = getService<AppPermissionsService>();
    await service.removeRule(id);
    ref.invalidate(rulesProvider);
  }

  Future<void> removePermissions(
    String id,
    List<Permission> permissions,
  ) async {
    final constraints = {
      'permissions': {for (final p in permissions) p.name: null},
    };
    final service = getService<AppPermissionsService>();
    await service.patchRule(id, constraints);
    ref.invalidate(rulesProvider);
  }

  Future<void> removeAll() async {
    final service = getService<AppPermissionsService>();
    await service.removeAllRules(
      snap: snap,
      interface: SnapdInterface.home.name,
    );
    ref.invalidate(rulesProvider);
  }
}

@freezed
class SnapdHomeRuleFragment with _$SnapdHomeRuleFragment {
  const factory SnapdHomeRuleFragment({
    required String ruleId,
    required bool deleteRuleOnRemoval,
    required String snap,
    required String pathPattern,
    required List<Permission> permissions,
    required SnapdRequestOutcome outcome,
    required SnapdRequestLifespan lifespan,
    DateTime? expiration,
  }) = _SnapdHomeRuleFragment;

  static List<SnapdHomeRuleFragment> fromConstraints(
    String id,
    String snap,
    HomeRuleConstraints constraints,
  ) {
    final isSinglePermission = constraints.permissions.length == 1;

    return constraints.permissions.entries
        .map(
          (entry) => SnapdHomeRuleFragment(
            ruleId: id,
            deleteRuleOnRemoval: isSinglePermission,
            snap: snap,
            pathPattern: constraints.pathPattern,
            permissions: [entry.key],
            outcome: entry.value.outcome,
            lifespan: entry.value.lifespan,
            expiration: entry.value.expiration,
          ),
        )
        .toList();
  }

  static List<SnapdHomeRuleFragment> fromRule(SnapdRule rule) {
    if (rule.outcome != null) {
      // Top level outcome, lifespan & expiration identifies this as coming from the old
      // snapd API where we will only have a single rule fragment per rule.
      final constraints = OldHomeRuleConstraints.fromJson(rule.constraints);

      return [
        SnapdHomeRuleFragment(
          ruleId: rule.id,
          // Keeping previous behaviour of only supporting removal of the entire rule
          deleteRuleOnRemoval: true,
          snap: rule.snap,
          pathPattern: constraints.pathPattern,
          permissions:
              constraints.permissions.map(Permission.fromString).toList(),
          outcome: rule.outcome!,
          lifespan: rule.lifespan!,
          expiration: rule.expiration,
        ),
      ];
    }

    final constraints = HomeRuleConstraints.fromJson(rule.constraints);

    return SnapdHomeRuleFragment.fromConstraints(
      rule.id,
      rule.snap,
      constraints,
    );
  }
}
