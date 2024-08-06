import 'package:prompting_client/prompting_client.dart';
import 'package:prompting_client_ui/l10n.dart';

extension ActionL10n on Action {
  String localize(AppLocalizations l10n) => switch (this) {
        Action.allow => l10n.promptActionOptionAllow,
        Action.deny => l10n.promptActionOptionDeny,
      };
}

extension LifespanL10n on Lifespan {
  String localize(AppLocalizations l10n) => switch (this) {
        Lifespan.forever => l10n.promptLifespanOptionForever,
        Lifespan.session => l10n.promptLifespanOptionSession,
        Lifespan.single => l10n.promptLifespanOptionSingle,
      };
}

extension HomePatternTypeL10n on HomePatternType {
  String localize(AppLocalizations l10n, String topLevelDir) => switch (this) {
        HomePatternType.customPath => l10n.homePatternTypeCustomPath,
        HomePatternType.requestedDirectory =>
          l10n.homePatternTypeRequestedDirectory,
        HomePatternType.requestedFile => l10n.homePatternTypeRequestedFile,
        HomePatternType.topLevelDirectory =>
          l10n.homePatternTypeTopLevelDirectory(topLevelDir),
        HomePatternType.containingDirectory =>
          l10n.homePatternTypeContainingDirectory,
        HomePatternType.homeDirectory => l10n.homePatternTypeHomeDirectory,
        HomePatternType.matchingFileExtension =>
          l10n.homePatternTypeMatchingFileExtension,
      };
}

extension PermissionL10n on Permission {
  String localize(AppLocalizations l10n) => switch (this) {
        Permission.read => l10n.homePromptPermissionsRead,
        Permission.write => l10n.homePromptPermissionsWrite,
        Permission.execute => l10n.homePromptPermissionsExecute,
      };
}
