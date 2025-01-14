import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';

part 'home_interface.freezed.dart';
part 'home_interface.g.dart';

/// Constraints for a home interface [SnapdRule].
@freezed
class HomeRuleConstraints with _$HomeRuleConstraints {
  const factory HomeRuleConstraints({
    required String pathPattern,
    required Map<Permission, PermissionConstraints> permissions,
  }) = _HomeRuleConstraints;

  factory HomeRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$HomeRuleConstraintsFromJson(json);
}

/// Permission level constraints for a home interface [SnapdRule].
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

@freezed
class OldHomeRuleConstraints with _$OldHomeRuleConstraints {
  const factory OldHomeRuleConstraints({
    required String pathPattern,
    required List<String> permissions,
  }) = _OldHomeRuleConstraints;

  factory OldHomeRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$OldHomeRuleConstraintsFromJson(json);
}

enum Permission {
  read,
  write,
  execute;

  static Permission fromString(String permission) =>
      Permission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );

  String localize(AppLocalizations l10n) => switch (this) {
        Permission.read => l10n.snapPermissionReadLabel,
        Permission.write => l10n.snapPermissionWriteLabel,
        Permission.execute => l10n.snapPermissionExecuteLabel,
      };
}
