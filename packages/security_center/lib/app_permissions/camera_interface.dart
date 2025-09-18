import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';

part 'camera_interface.freezed.dart';
part 'camera_interface.g.dart';

/// Constraints for a camera interface [SnapdRule].
@freezed
class CameraRuleConstraints with _$CameraRuleConstraints {
    const factory CameraRuleConstraints({
        required Map<Permission, PermissionConstraints> permissions,
    }) = _CameraRuleConstraints;

  factory CameraRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$CameraRuleConstraintsFromJson(json);
}

/// Permission level constraints for a camera interface [SnapdRule].
@freezed
class PermissionConstraints with _$PermissionConstraints {
  const factory PermissionConstraints({
    required SnapdRequestOutcome outcome,
    required SnapdRequestLifespan lifespan,
    DateTime? expiration,
  }) = _PermissionConstraints;

  factory PermissionConstraints.fromJson(Map<String, dynamic> json) =>
      _$PermissionConstraintsFromJson(json);
}

enum Permission {
  access;

  static Permission fromString(String permission) =>
      Permission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );

  String localize(AppLocalizations l10n) => switch (this) {
        Permission.access => l10n.snapPermissionExecuteLabel, // FIXME: wrong string
      };
}
