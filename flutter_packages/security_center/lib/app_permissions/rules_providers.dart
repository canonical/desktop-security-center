import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'rules_providers.g.dart';

@riverpod
Future<List<SnapdRule>> rules(RulesRef ref) =>
    getService<AppPermissionsService>().getRules();

@riverpod
Future<Map<String, int>> interfaceSnapCounts(InterfaceSnapCountsRef ref) async {
  final rules = await ref.watch(rulesProvider.future);
  final interfaceSnaps = rules.fold<Map<String, Set<String>>>(
    {},
    (snaps, rule) {
      snaps[rule.interface] = (snaps[rule.interface] ?? {})..add(rule.snap);
      return snaps;
    },
  );
  return interfaceSnaps
      .map((interface, snaps) => MapEntry(interface, snaps.length));
}

@riverpod
Future<Map<String, int>> snapRuleCounts(
  SnapRuleCountsRef ref, {
  required String interface,
}) async {
  final rules = await ref.watch(rulesProvider.future);
  return rules.fold<Map<String, int>>(
    {},
    (counts, rule) {
      if (rule.interface == interface) {
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
    required String interface,
  }) async {
    final rules = await ref.watch(rulesProvider.future);
    return rules
        .where((rule) => rule.snap == snap && rule.interface == interface)
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
      interface: interface,
    );
    ref.invalidate(rulesProvider);
  }
}
