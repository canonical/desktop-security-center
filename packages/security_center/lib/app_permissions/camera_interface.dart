import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';

export 'package:security_center/app_permissions/snapd_interface.dart'
    show PermissionConstraints;

part 'camera_interface.freezed.dart';
part 'camera_interface.g.dart';

/// Constraints for a camera interface [SnapdRule].
@freezed
class CameraRuleConstraints with _$CameraRuleConstraints {
  const factory CameraRuleConstraints({
    required Map<CameraPermission, PermissionConstraints> permissions,
  }) = _CameraRuleConstraints;

  factory CameraRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$CameraRuleConstraintsFromJson(json);
}

enum CameraPermission {
  access;

  static CameraPermission fromString(String permission) =>
      CameraPermission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );

  String localize(AppLocalizations l10n) => switch (this) {
        CameraPermission.access => l10n.snapPermissionAccessLabel,
      };
}
