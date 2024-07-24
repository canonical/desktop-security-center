import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snapd/snapd.dart';

export 'package:snapd/snapd.dart'
    show
        SnapdRule,
        SnapdRuleMask,
        SnapdConstraints,
        SnapdRequestLifespan,
        SnapdRequestOutcome;

part 'app_permissions_service.freezed.dart';

@freezed
sealed class AppPermissionsServiceStatus with _$AppPermissionsServiceStatus {
  factory AppPermissionsServiceStatus.enabled() =
      AppPermissionsServiceStatusEnabled;
  factory AppPermissionsServiceStatus.disabled() =
      AppPermissionsServiceStatusDisabled;
  factory AppPermissionsServiceStatus.error(Object error) =
      AppPermissionsServiceStatusError;
  factory AppPermissionsServiceStatus.enabling(double progress) =
      AppPermissionsServiceStatusEnabling;
  factory AppPermissionsServiceStatus.disabling(double progress) =
      AppPermissionsServiceStatusDisabling;

  AppPermissionsServiceStatus._();

  bool get isEnabled => this is AppPermissionsServiceStatusEnabled;
}

abstract class AppPermissionsService {
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  });

  Future<void> removeRule(String id);
  Future<void> removeAllRules({required String snap, String? interface});

  Future<bool> isEnabled();
  Stream<AppPermissionsServiceStatus> enable();
  Stream<AppPermissionsServiceStatus> disable();
}
