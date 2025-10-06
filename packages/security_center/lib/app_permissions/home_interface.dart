import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';

part 'home_interface.freezed.dart';
part 'home_interface.g.dart';

/// Constraints for a home interface [SnapdRule].
@freezed
class HomeRuleConstraints with _$HomeRuleConstraints {
  const factory HomeRuleConstraints({
    required String pathPattern,
    required Map<HomePermission, PermissionConstraints> permissions,
  }) = _HomeRuleConstraints;

  factory HomeRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$HomeRuleConstraintsFromJson(json);
}

@freezed
class OldHomeRuleConstraints with _$OldHomeRuleConstraints {
  const factory OldHomeRuleConstraints({
    required String pathPattern,
    required List<String> permissions,
  }) = _OldHomeRuleConstraints;

  factory OldHomeRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$OldHomeRuleConstraintsFromJson(json);
}

enum HomePermission {
  read,
  write,
  execute;

  static HomePermission fromString(String permission) =>
      HomePermission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );

  String localize(AppLocalizations l10n) => switch (this) {
        HomePermission.read => l10n.snapPermissionReadLabel,
        HomePermission.write => l10n.snapPermissionWriteLabel,
        HomePermission.execute => l10n.snapPermissionExecuteLabel,
      };
}
