import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_category.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/widgets/app_icon.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class AppRulesPage extends ConsumerWidget {
  const AppRulesPage({required this.snap, required this.interface, super.key});

  final String snap;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model =
        ref.watch(snapRulesModelProvider(snap: snap, interface: interface));
    return model.when(
      data: (rules) => _Body(
        snap: snap,
        interface: interface,
        rules: rules,
      ),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.snap,
    required this.interface,
    required this.rules,
  });

  final String snap;
  final SnapdInterface interface;
  final List<SnapdRule> rules;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(
      snapRulesModelProvider(snap: snap, interface: interface).notifier,
    );
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return ScrollablePage(
      children: [
        Row(
          children: [
            AppIcon(iconUrl: ref.watch(snapIconUrlProvider(snap)).valueOrNull),
            const SizedBox(width: 10),
            Text(snap, style: textTheme.titleLarge),
          ],
        ),
        Text(interface.localizedDescription(l10n)),
        const SizedBox(height: 24),
        if (rules.isEmpty) ...[
          const TileList(
            children: [
              _EmptyRuleTile(),
            ],
          ),
          const SizedBox(height: 24),
        ],
        for (final category in SnapdRuleCategory.values)
          _RuleSection(
            title: category.localizedTitle(l10n),
            rules: rules.filterByCategory(category).toList(),
            onRemove: notifier.removeRule,
          ),
        ElevatedButton(
          onPressed: notifier.removeAll,
          child: Text(l10n.snapRulesRemoveAll),
        ),
      ],
    );
  }
}

class _RuleSection extends ConsumerWidget {
  const _RuleSection({
    required this.title,
    required this.rules,
    required this.onRemove,
  });

  final String title;
  final List<SnapdRule> rules;
  final void Function(String id) onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (rules.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        _RuleList(
          rules: rules,
          onRemove: onRemove,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _RuleList extends TileList {
  _RuleList({
    required List<SnapdRule> rules,
    required void Function(String id) onRemove,
  }) : super(
          children: rules
              .map(
                (rule) => RuleTile(
                  rule: rule,
                  onRemove: () => onRemove(rule.id),
                ),
              )
              .toList(),
        );
}

class RuleTile extends StatelessWidget {
  const RuleTile({required this.rule, required this.onRemove, super.key});
  final SnapdRule rule;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(rule.constraints.pathPattern ?? ''),
      subtitle: Text(rule.constraints.permissions?.join(', ') ?? ''),
      trailing: YaruIconButton(
        icon: const Icon(YaruIcons.window_close),
        onPressed: onRemove,
      ),
    );
  }
}

class _EmptyRuleTile extends StatelessWidget {
  const _EmptyRuleTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context).snapRulesPageEmptyTileLabel),
      enabled: false,
    );
  }
}
