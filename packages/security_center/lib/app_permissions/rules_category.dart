import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/l10n.dart';

typedef SnapdRuleOutcomeAndLifetime = ({
  SnapdRequestOutcome outcome,
  SnapdRequestLifespan lifespan,
});

/// Defines the possible rule categories in the Security Center app,
/// representing the different combinations of permission outcomes and
/// lifespans for app rules.
///
/// These also correspond to the various actions that are available to the
/// user when managing app permissions, such as allowing or denying a permission
/// forever, for the session, temporarily, or always asking.
enum SnapdRuleAction {
  foreverAllowed,
  sessionAllowed,
  temporarilyAllowed,
  foreverDenied,
  sessionDenied,
  temporarilyDenied,
  askAlways;

  /// Indicates whether the rule (action) is configurable from the Security Center app.
  /// Some actions, such as session based rules or temporary rules, are only
  /// configurable via prompting-client
  bool get isConfigurableFromSecurityCenter => switch (this) {
        sessionAllowed || sessionDenied => false,
        temporarilyAllowed || temporarilyDenied => false,
        _ => true,
      };

  /// Returns a localized title for the menu action, using the provided
  /// [AppLocalizations].
  String localizedTitle(AppLocalizations l10n) => switch (this) {
        foreverAllowed => l10n.snapdRuleCategoryForeverAllowed,
        temporarilyAllowed => l10n.snapdRuleCategoryTemporarilyAllowed,
        foreverDenied => l10n.snapdRuleCategoryForeverDenied,
        temporarilyDenied => l10n.snapdRuleCategoryTemporarilyDenied,
        sessionAllowed => l10n.snapdRuleCategorySessionAllowed,
        sessionDenied => l10n.snapdRuleCategorySessionDenied,
        askAlways => l10n.snapdRuleCategoryAskAlways,
      };

  /// Creates an appropriate [SnapdRuleAction] instance from a snapd
  /// outcome and lifespan.
  static SnapdRuleAction fromOutcomeAndLifespan({
    required SnapdRequestOutcome outcome,
    required SnapdRequestLifespan lifespan,
  }) =>
      switch ((outcome, lifespan)) {
        (SnapdRequestOutcome.allow, SnapdRequestLifespan.forever) =>
          foreverAllowed,
        (SnapdRequestOutcome.allow, SnapdRequestLifespan.session) =>
          sessionAllowed,
        (SnapdRequestOutcome.deny, SnapdRequestLifespan.forever) =>
          foreverDenied,
        (SnapdRequestOutcome.deny, SnapdRequestLifespan.session) =>
          sessionDenied,
        (SnapdRequestOutcome.allow, SnapdRequestLifespan.single) => askAlways,
        (SnapdRequestOutcome.deny, SnapdRequestLifespan.single) => askAlways,
        (SnapdRequestOutcome.allow, SnapdRequestLifespan.timespan) =>
          temporarilyAllowed,
        (SnapdRequestOutcome.deny, SnapdRequestLifespan.timespan) =>
          temporarilyDenied,
      };

  /// Converts the [SnapdRuleAction] instance back to its corresponding snapd
  /// outcome and lifespan.
  ///
  /// Useful when updating the snapd rules based on user's selection.
  SnapdRuleOutcomeAndLifetime? toOutcomeAndLifespan() => switch (this) {
        foreverAllowed => (
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.forever
          ),
        foreverDenied => (
            outcome: SnapdRequestOutcome.deny,
            lifespan: SnapdRequestLifespan.forever
          ),
        temporarilyAllowed => (
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.timespan
          ),
        temporarilyDenied => (
            outcome: SnapdRequestOutcome.deny,
            lifespan: SnapdRequestLifespan.timespan
          ),
        sessionAllowed => (
            outcome: SnapdRequestOutcome.allow,
            lifespan: SnapdRequestLifespan.session
          ),
        sessionDenied => (
            outcome: SnapdRequestOutcome.deny,
            lifespan: SnapdRequestLifespan.session
          ),
        askAlways => null,
      };
}

extension SnapdHomeRuleFragmentCategoryFilter on List<SnapdHomeRuleFragment> {
  Iterable<SnapdHomeRuleFragment> filterByCategory(
    SnapdRuleAction category,
  ) =>
      switch (category) {
        SnapdRuleAction.sessionAllowed => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.allow &&
                rule.lifespan == SnapdRequestLifespan.session,
          ),
        SnapdRuleAction.foreverAllowed => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.allow &&
                rule.lifespan == SnapdRequestLifespan.forever,
          ),
        SnapdRuleAction.sessionDenied => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.deny &&
                rule.lifespan == SnapdRequestLifespan.session,
          ),
        SnapdRuleAction.foreverDenied => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.deny &&
                rule.lifespan == SnapdRequestLifespan.forever,
          ),
        SnapdRuleAction.temporarilyAllowed => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.allow &&
                rule.lifespan == SnapdRequestLifespan.timespan,
          ),
        SnapdRuleAction.temporarilyDenied => where(
            (rule) =>
                rule.outcome == SnapdRequestOutcome.deny &&
                rule.lifespan == SnapdRequestLifespan.timespan,
          ),
        SnapdRuleAction.askAlways => where(
            (rule) => rule.lifespan == SnapdRequestLifespan.single,
          ),
      };
}
