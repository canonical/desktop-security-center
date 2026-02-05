import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:yaru/yaru.dart';

part 'snapd_interface.freezed.dart';
part 'snapd_interface.g.dart';

enum SnapdInterface {
  home,
  camera,
  microphone;

  static SnapdInterface fromString(String? name) => switch (name) {
        'home' => home,
        'camera' => camera,
        'microphone' => microphone,
        _ => throw ArgumentError('Unknown interface: $name'),
      };

  String localizedTitle(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageTitle,
        camera => l10n.cameraInterfacePageTitle,
        microphone => l10n.microphoneInterfacePageTitle,
      };
  String localizedDescription(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageDescription,
        camera => l10n.cameraInterfacePageDescription,
        microphone => l10n.microphoneInterfacePageDescription,
      };

  IconData get icon => switch (this) {
        home => YaruIcons.folder,
        camera => YaruIcons.camera_photo,
        microphone => YaruIcons.microphone
      };
}

/// Permission level constraints for a [SnapdRule].
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
