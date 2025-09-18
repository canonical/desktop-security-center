import 'package:flutter/widgets.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

enum SnapdInterface {
  home,
  camera;

  static SnapdInterface fromString(String? name) => switch (name) {
        'home' => home,
        'camera' => camera,
        _ => throw ArgumentError('Unknown interface: $name'),
      };

  String localizedTitle(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageTitle,
        camera => l10n.cameraInterfacePageTitle,
      };
  String localizedDescription(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageDescription,
        camera => l10n.cameraInterfacePageDescription,
      };

  IconData get icon => switch (this) {
        home => YaruIcons.folder,
        camera => YaruIcons.camera_photo,
      };
}
