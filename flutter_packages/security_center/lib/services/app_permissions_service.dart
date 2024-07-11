import 'package:snapd/snapd.dart';

export 'package:snapd/snapd.dart'
    show
        SnapdRule,
        SnapdRuleMask,
        SnapdConstraints,
        SnapdRequestLifespan,
        SnapdRequestOutcome;

abstract class AppPermissionsService {
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  });

  Future<void> removeRule(String id);
  Future<void> removeAllRules({required String snap, String? interface});
}
