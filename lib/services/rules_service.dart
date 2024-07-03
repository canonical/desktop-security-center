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
