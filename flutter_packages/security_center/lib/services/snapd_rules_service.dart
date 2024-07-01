import 'package:snapd/snapd.dart';

export 'package:snapd/snapd.dart'
    show SnapdRule, SnapdConstraints, SnapdRequestLifespan, SnapdRequestOutcome;

abstract class RulesService {
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  });

  Future<void> removeRule(String id);
  Future<void> removeAllRules({required String snap, String? interface});
}

class SnapdRulesService implements RulesService {
  SnapdRulesService(this._client);
  final SnapdClient _client;

  @override
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  }) async =>
      _client.getRules(
        snap: snap,
        interface: interface,
      );

  @override
  Future<void> removeRule(String id) async {
    await _client.removeRule(id);
  }

  @override
  Future<void> removeAllRules({required String snap, String? interface}) async {
    await _client.removeRules(
      snap,
      interface: interface,
    );
  }
}

class MockRulesService implements RulesService {
  final rules = [
    SnapdRule(
      id: '1',
      timestamp: DateTime.now(),
      snap: 'firefox',
      interface: 'home',
      constraints: const SnapdConstraints(
        pathPattern: '/home/**',
        permissions: ['read', 'write'],
      ),
      outcome: SnapdRequestOutcome.allow,
      lifespan: SnapdRequestLifespan.forever,
    ),
    SnapdRule(
      id: '2',
      timestamp: DateTime.now(),
      snap: 'thunderbird',
      interface: 'home',
      constraints: const SnapdConstraints(
        pathPattern: '/home/.*',
        permissions: ['read', 'write'],
      ),
      outcome: SnapdRequestOutcome.allow,
      lifespan: SnapdRequestLifespan.forever,
    ),
    SnapdRule(
      id: '3',
      timestamp: DateTime.now(),
      snap: 'thunderbird',
      interface: 'home',
      constraints: const SnapdConstraints(
        pathPattern: '/foo/bar*',
        permissions: ['read'],
      ),
      outcome: SnapdRequestOutcome.deny,
      lifespan: SnapdRequestLifespan.session,
    ),
  ];

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
}
