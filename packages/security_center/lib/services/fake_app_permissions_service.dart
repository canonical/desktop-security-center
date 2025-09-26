import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/services/app_permissions_service.dart';

extension on SnapdRuleMask {
  SnapdRule toSnapdRule() => SnapdRule(
        id: hashCode.toString(),
        timestamp: DateTime.now(),
        snap: snap,
        interface: interface,
        constraints: constraints,
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
  late final StreamController<AppPermissionsServiceStatus> _statusController;

  @override
  Future<void> addRule(SnapdRuleMask rule) async {
    rules.add(rule.toSnapdRule());
    _statusController
        .add(AppPermissionsServiceStatus.enabled(List.from(rules)));
  }

  @override
  Future<void> removeRule(String id) async {
    rules.removeWhere((rule) => rule.id == id);
  }

  @override
  Future<void> patchRule(String id, Map<String, dynamic> constraints) async {
    final rule = rules.firstWhere((rule) => rule.id == id);
    rule.constraints.addAll(constraints);

    // Setting a permission to 'null' causes snapd to remove it from the permission map
    if (rule.interface == SnapdInterface.home.toString()) {
      (rule.constraints['permissions'] as Map<String, dynamic>)
          .removeWhere((k, v) => v == null);
    }
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
  Future<void> init() async {
    _statusController = StreamController<AppPermissionsServiceStatus>.broadcast(
      onListen: () async {
        await Future.delayed(const Duration(milliseconds: 200));
        _statusController.add(AppPermissionsServiceStatus.enabled(rules));
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _statusController.close();
  }

  @override
  Stream<AppPermissionsServiceStatus> get status => _statusController.stream;

  @override
  Future<void> disable() async {
    _statusController.add(AppPermissionsServiceStatus.disabling(0.0));
    await Future.delayed(const Duration(seconds: 3));
    _statusController.add(AppPermissionsServiceStatus.disabled());
  }

  @override
  Future<void> enable() async {
    _statusController.add(AppPermissionsServiceStatus.enabling(0.0));
    await Future.delayed(const Duration(seconds: 3));
    _statusController.add(AppPermissionsServiceStatus.enabled(rules));
}

  @override
  Future<List<String>> getSnapsWithInterface(String interface) async {
    if (interface == 'camera') {
      return ['firefox', 'cheese', 'obs-studio', 'discord'];
    }
    return [];
  }
}
