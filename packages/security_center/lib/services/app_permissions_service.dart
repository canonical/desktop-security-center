import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snapd/snapd.dart';

export 'package:snapd/snapd.dart'
    show SnapdRule, SnapdRuleMask, SnapdRequestLifespan, SnapdRequestOutcome;

part 'app_permissions_service.freezed.dart';

@freezed
sealed class AppPermissionsServiceStatus with _$AppPermissionsServiceStatus {
  factory AppPermissionsServiceStatus.enabled(List<SnapdRule> rules) =
      AppPermissionsServiceStatusEnabled;
  factory AppPermissionsServiceStatus.disabled() =
      AppPermissionsServiceStatusDisabled;
  factory AppPermissionsServiceStatus.error(Object error) =
      AppPermissionsServiceStatusError;
  factory AppPermissionsServiceStatus.enabling(double progress) =
      AppPermissionsServiceStatusEnabling;
  factory AppPermissionsServiceStatus.disabling(double progress) =
      AppPermissionsServiceStatusDisabling;
  factory AppPermissionsServiceStatus.waitingForAuth() =
      AppPermissionsServiceStatusWaitingForAuth;
  factory AppPermissionsServiceStatus.waitingForSnapd() =
      AppPermissionsServiceStatusWaitingForSnapd;
  factory AppPermissionsServiceStatus.unavailable() =
      AppPermissionsServiceStatusUnavailable;

  AppPermissionsServiceStatus._();

  bool get isEnabled => this is AppPermissionsServiceStatusEnabled;
  bool get isEnabling => this is AppPermissionsServiceStatusEnabling;
}

abstract class AppPermissionsService {
  Future<void> init();
  Future<void> dispose();

  Stream<AppPermissionsServiceStatus> get status;

  Future<void> enable();
  Future<void> disable();
  Future<void> addRule(SnapdRuleMask rule);
  Future<void> removeRule(String id);
  Future<void> patchRule(String id, Map<String, dynamic> constraints);
  Future<void> removeAllRules({required String snap, String? interface});
  Future<List<String>> getSnapsWithInterface(String interface);
}
