import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/app_permissions/camera_interface.dart'
    as camera_interface;
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/microphone_interface.dart'
    as microphone_interface;
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
Future<List<String>> cameraSnaps(Ref ref) async {
  final service = getService<AppPermissionsService>();
  return service.getSnapsWithInterface('camera');
}

@riverpod
Future<List<String>> microphoneSnaps(Ref ref) async {
  final service = getService<AppPermissionsService>();
  return service.getSnapsWithInterface('microphone');
}

@riverpod
Future<Map<SnapdInterface, int>> interfaceSnapCounts(
  Ref ref,
) async {
  final interfaceSnapCounts = <SnapdInterface, int>{};

  // For home interface, get all rules
  final rules = await ref.watch(rulesProvider.future);
  final homeSnaps = rules
      .where((rule) => rule.interface == 'home')
      .map((rule) => rule.snap)
      .toSet();
  interfaceSnapCounts[SnapdInterface.home] = homeSnaps.length;

  final cameraSnaps = await ref.watch(cameraSnapsProvider.future);
  interfaceSnapCounts[SnapdInterface.camera] = cameraSnaps.length;

  final microphoneSnaps = await ref.watch(microphoneSnapsProvider.future);
  interfaceSnapCounts[SnapdInterface.microphone] = microphoneSnaps.length;

  return interfaceSnapCounts;
}

@riverpod
Future<Map<String, int>> snapRuleCounts(
  Ref ref, {
  required SnapdInterface interface,
}) async {
  final rules = await ref.watch(rulesProvider.future);

  return switch (interface) {
    SnapdInterface.camera => _buildSnapCountsMap(
        rules,
        interface.name,
        await ref.watch(cameraSnapsProvider.future),
      ),
    SnapdInterface.microphone => _buildSnapCountsMap(
        rules,
        interface.name,
        await ref.watch(microphoneSnapsProvider.future),
      ),
    _ => rules.fold<Map<String, int>>(
        {},
        (counts, rule) {
          if (rule.interface == interface.name) {
            counts[rule.snap] = (counts[rule.snap] ?? 0) + 1;
          }
          return counts;
        },
      )
  };
}

Map<String, int> _buildSnapCountsMap(
  List<SnapdRule> rules,
  String interfaceName,
  List<String> snaps,
) {
  final counts = <String, int>{};
  for (final snap in snaps) {
    counts[snap] = 0;
  }
  for (final rule in rules) {
    if (rule.interface == interfaceName && counts.containsKey(rule.snap)) {
      counts[rule.snap] = counts[rule.snap]! + 1;
    }
  }
  return counts;
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
    List<HomePermission> permissions,
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

@riverpod
class SnapCameraRulesModel extends _$SnapCameraRulesModel {
  @override
  Future<List<SnapdCameraRuleFragment>> build({
    required String snap,
  }) async {
    final rules = await ref.watch(rulesProvider.future);
    return rules
        .where(
          (rule) =>
              rule.snap == snap &&
              SnapdInterface.fromString(rule.interface) ==
                  SnapdInterface.camera,
        )
        .map(SnapdCameraRuleFragment.fromRule)
        .toList();
  }

  Future<void> removeRule(String id) async {
    final service = getService<AppPermissionsService>();
    await service.removeRule(id);
    ref.invalidate(rulesProvider);
  }

  Future<void> createAccessRule({
    SnapdRequestOutcome outcome = SnapdRequestOutcome.allow,
    SnapdRequestLifespan lifespan = SnapdRequestLifespan.forever,
  }) async {
    final constraints = camera_interface.CameraRuleConstraints(
      permissions: {
        camera_interface.CameraPermission.access:
            camera_interface.PermissionConstraints(
          outcome: outcome,
          lifespan: lifespan,
        ),
      },
    );

    final rule = SnapdRuleMask(
      snap: snap,
      interface: SnapdInterface.camera.name,
      constraints: constraints.toJson(),
    );

    final service = getService<AppPermissionsService>();
    await service.addRule(rule);
    ref.invalidate(rulesProvider);
  }

  Future<void> removeAll() async {
    final service = getService<AppPermissionsService>();
    await service.removeAllRules(
      snap: snap,
      interface: SnapdInterface.camera.name,
    );
    ref.invalidate(rulesProvider);
  }
}

@riverpod
class SnapMicrophoneRulesModel extends _$SnapMicrophoneRulesModel {
  @override
  Future<List<SnapdMicrophoneRuleFragment>> build({
    required String snap,
  }) async {
    final rules = await ref.watch(rulesProvider.future);
    return rules
        .where(
          (rule) =>
              rule.snap == snap &&
              SnapdInterface.fromString(rule.interface) ==
                  SnapdInterface.microphone,
        )
        .map(SnapdMicrophoneRuleFragment.fromRule)
        .toList();
  }

  Future<void> removeRule(String id) async {
    final service = getService<AppPermissionsService>();
    await service.removeRule(id);
    ref.invalidate(rulesProvider);
  }

  Future<void> createAccessRule({
    SnapdRequestOutcome outcome = SnapdRequestOutcome.allow,
    SnapdRequestLifespan lifespan = SnapdRequestLifespan.forever,
  }) async {
    final constraints = microphone_interface.MicrophoneRuleConstraints(
      permissions: {
        microphone_interface.MicrophonePermission.access:
            microphone_interface.PermissionConstraints(
          outcome: outcome,
          lifespan: lifespan,
        ),
      },
    );

    final rule = SnapdRuleMask(
      snap: snap,
      interface: SnapdInterface.microphone.name,
      constraints: constraints.toJson(),
    );

    final service = getService<AppPermissionsService>();
    await service.addRule(rule);
    ref.invalidate(rulesProvider);
  }

  Future<void> removeAll() async {
    final service = getService<AppPermissionsService>();
    await service.removeAllRules(
      snap: snap,
      interface: SnapdInterface.microphone.name,
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
    required List<HomePermission> permissions,
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
              constraints.permissions.map(HomePermission.fromString).toList(),
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

@freezed
class SnapdCameraRuleFragment with _$SnapdCameraRuleFragment {
  const factory SnapdCameraRuleFragment({
    required String ruleId,
    required String snap,
    required camera_interface.CameraPermission permission,
    required SnapdRequestOutcome outcome,
    required SnapdRequestLifespan lifespan,
    DateTime? expiration,
  }) = _SnapdCameraRuleFragment;

  factory SnapdCameraRuleFragment.fromRule(SnapdRule rule) {
    if (rule.outcome != null) {
      // Top level outcome, lifespan & expiration identifies this as coming from the old
      // snapd API where we have a simpler rule format.
      return SnapdCameraRuleFragment(
        ruleId: rule.id,
        snap: rule.snap,
        permission: camera_interface.CameraPermission.access,
        outcome: rule.outcome!,
        lifespan: rule.lifespan!,
        expiration: rule.expiration,
      );
    }

    final constraints =
        camera_interface.CameraRuleConstraints.fromJson(rule.constraints);

    // Camera interface should only have 'access' permission
    final permission = constraints.permissions.keys.first;
    final permissionConstraints = constraints.permissions[permission]!;

    return SnapdCameraRuleFragment(
      ruleId: rule.id,
      snap: rule.snap,
      permission: permission,
      outcome: permissionConstraints.outcome,
      lifespan: permissionConstraints.lifespan,
      expiration: permissionConstraints.expiration,
    );
  }
}

@freezed
class SnapdMicrophoneRuleFragment with _$SnapdMicrophoneRuleFragment {
  const factory SnapdMicrophoneRuleFragment({
    required String ruleId,
    required String snap,
    required microphone_interface.MicrophonePermission permission,
    required SnapdRequestOutcome outcome,
    required SnapdRequestLifespan lifespan,
    DateTime? expiration,
  }) = _SnapdMicrophoneRuleFragment;

  factory SnapdMicrophoneRuleFragment.fromRule(SnapdRule rule) {
    if (rule.outcome != null) {
      // Top level outcome, lifespan & expiration identifies this as coming from the old
      // snapd API where we have a simpler rule format.
      return SnapdMicrophoneRuleFragment(
        ruleId: rule.id,
        snap: rule.snap,
        permission: microphone_interface.MicrophonePermission.access,
        outcome: rule.outcome!,
        lifespan: rule.lifespan!,
        expiration: rule.expiration,
      );
    }

    final constraints = microphone_interface.MicrophoneRuleConstraints.fromJson(
      rule.constraints,
    );

    // Microphone interface should only have 'access' permission
    final permission = constraints.permissions.keys.first;
    final permissionConstraints = constraints.permissions[permission]!;

    return SnapdMicrophoneRuleFragment(
      ruleId: rule.id,
      snap: rule.snap,
      permission: permission,
      outcome: permissionConstraints.outcome,
      lifespan: permissionConstraints.lifespan,
      expiration: permissionConstraints.expiration,
    );
  }
}
