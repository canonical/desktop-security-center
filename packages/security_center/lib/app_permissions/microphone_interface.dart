import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';

export 'package:security_center/app_permissions/snapd_interface.dart'
    show PermissionConstraints;

part 'microphone_interface.freezed.dart';
part 'microphone_interface.g.dart';

/// Constraints for a microphone interface [SnapdRule].
@freezed
class MicrophoneRuleConstraints with _$MicrophoneRuleConstraints {
  const factory MicrophoneRuleConstraints({
    required Map<MicrophonePermission, PermissionConstraints> permissions,
  }) = _MicrophoneRuleConstraints;

  factory MicrophoneRuleConstraints.fromJson(Map<String, dynamic> json) =>
      _$MicrophoneRuleConstraintsFromJson(json);
}

enum MicrophonePermission {
  access;

  static MicrophonePermission fromString(String permission) =>
      MicrophonePermission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );

  String localize(AppLocalizations l10n) => switch (this) {
        MicrophonePermission.access => l10n.snapPermissionAccessLabel,
      };
}
