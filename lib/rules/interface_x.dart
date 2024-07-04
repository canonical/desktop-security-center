import 'package:flutter/widgets.dart';
import 'package:security_center/l10n.dart';
import 'package:yaru/yaru.dart';

extension SnapdInterfaceX on String {
  String localizeSnapdInterfaceTitle(AppLocalizations l10n) => switch (this) {
        'home' => l10n.homeInterfacePageTitle,
        _ => 'Unknown interface: $this',
      };
  String localizeSnapdInterfaceDescription(AppLocalizations l10n) =>
      switch (this) {
        'home' => l10n.homeInterfacePageDescription,
        _ => 'Unknown interface: $this',
      };
  IconData get snapdInterfaceIcon => switch (this) {
        'home' => YaruIcons.folder,
        _ => YaruIcons.placeholder_icon,
      };
}
