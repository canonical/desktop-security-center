import 'package:flutter/widgets.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

enum SnapdInterface {
  home;

  static SnapdInterface fromString(String? name) => switch (name) {
        'home' => home,
        _ => throw ArgumentError('Unknown interface: $name'),
      };

  String localizedTitle(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageTitle,
      };
  String localizedDescription(AppLocalizations l10n) => switch (this) {
        home => l10n.homeInterfacePageDescription,
      };

  IconData get icon => switch (this) {
        home => YaruIcons.folder,
      };
}
