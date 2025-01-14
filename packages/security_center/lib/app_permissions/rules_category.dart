import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/l10n.dart';

enum SnapdRuleCategory {
  foreverAllowed,
  sessionAllowed,
  sessionDenied,
  foreverDenied;

  String localizedTitle(AppLocalizations l10n) => switch (this) {
        sessionAllowed => l10n.snapdRuleCategorySessionAllowed,
        foreverAllowed => l10n.snapdRuleCategoryForeverAllowed,
        sessionDenied => l10n.snapdRuleCategorySessionDenied,
        foreverDenied => l10n.snapdRuleCategoryForeverDenied,
      };
}

extension SnapdHomeRuleFragmentCategoryFilter on List<SnapdHomeRuleFragment> {
  Iterable<SnapdHomeRuleFragment> filterByCategory(
    SnapdRuleCategory category,
  ) =>
      switch (category) {
        SnapdRuleCategory.sessionAllowed => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.allow &&
                rule.lifespan == SnapdRequestLifespan.session,
          ),
        SnapdRuleCategory.foreverAllowed => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.allow &&
                rule.lifespan == SnapdRequestLifespan.forever,
          ),
        SnapdRuleCategory.sessionDenied => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.deny &&
                rule.lifespan == SnapdRequestLifespan.session,
          ),
        SnapdRuleCategory.foreverDenied => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.deny &&
                rule.lifespan == SnapdRequestLifespan.forever,
          ),
      };
}
