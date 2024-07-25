import 'dart:convert';
import 'dart:io';

import 'package:security_center/services/app_permissions_service.dart';

extension on SnapdRuleMask {
  SnapdRule toSnapdRule() => SnapdRule(
        id: hashCode.toString(),
        timestamp: DateTime.now(),
        snap: snap,
        interface: interface,
        constraints: constraints,
        outcome: outcome,
        lifespan: lifespan,
      );
}

class FakeAppPermissionsService implements AppPermissionsService {
  FakeAppPermissionsService({required this.rules});

  factory FakeAppPermissionsService.fromFile(String path) {
    final rules = (jsonDecode(File(path).readAsStringSync()) as List)
        .map((e) => SnapdRuleMask.fromJson(e as Map<String, dynamic>))
        .map((mask) => mask.toSnapdRule())
        .toList();
    return FakeAppPermissionsService(rules: rules);
  }

  final List<SnapdRule> rules;
  bool _enabled = true;

  @override
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  }) async =>
      rules;

  @override
  Future<void> removeRule(String id) async {
    rules.removeWhere((rule) => rule.id == id);
  }

  @override
  Future<void> removeAllRules({
    required String snap,
    String? interface,
  }) async {
    rules.removeWhere(
      (rule) =>
          (rule.snap == snap) &&
          (interface == null || rule.interface == interface),
    );
  }

  @override
  Future<bool> isEnabled() async => _enabled;

  @override
  Stream<AppPermissionsServiceStatus> enable() async* {
    yield AppPermissionsServiceStatusEnabling(0.0);
    await Future.delayed(const Duration(seconds: 3));
    _enabled = true;
  }

  @override
  Stream<AppPermissionsServiceStatus> disable() async* {
    yield AppPermissionsServiceStatusDisabling(0.0);
    await Future.delayed(const Duration(seconds: 3));
    _enabled = false;
  }
}
