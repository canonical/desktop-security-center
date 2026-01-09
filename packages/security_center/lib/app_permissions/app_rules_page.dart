import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/home_interface.dart';
import 'package:security_center/app_permissions/rules_category.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/widgets/app_icon.dart';
import 'package:security_center/widgets/empty_rules_tile.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/security_center_list_tile.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class AppRulesPage extends ConsumerWidget {
  const AppRulesPage({required this.snap, required this.interface, super.key});

  final String snap;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (interface) {
      SnapdInterface.home => ref
          .watch(snapHomeRulesModelProvider(snap: snap))
          .when(
            data: (ruleFragments) => _HomeBody(
              snap: snap,
              ruleFragments: ruleFragments,
            ),
            error: (error, _) => ErrorWidget(error),
            loading: () => const Center(child: YaruCircularProgressIndicator()),
          ),
      SnapdInterface.camera => const SizedBox.shrink(),
    };
  }
}

class _HomeBody extends ConsumerWidget {
  const _HomeBody({
    required this.snap,
    required this.ruleFragments,
  });

  final String snap;
  final List<SnapdHomeRuleFragment> ruleFragments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(snapHomeRulesModelProvider(snap: snap).notifier);
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return ScrollablePage(
      children: [
        Row(
          children: [
            AppIcon(snapIcon: ref.watch(snapIconProvider(snap))),
            const SizedBox(width: 10),
            Text(
              ref.watch(snapTitleOrNameProvider(snap)),
              style: textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          l10n.snapRulesPageDescription(
            SnapdInterface.home.localizedTitle(l10n),
            snap,
          ),
        ),
        const SizedBox(height: 24),
        if (ruleFragments.isEmpty) ...[
          const TileList(
            children: [
              EmptyRulesTile(),
            ],
          ),
          const SizedBox(height: 24),
        ],
        for (final category in SnapdRuleCategory.values)
          _HomeRuleSection(
            title: category.localizedTitle(l10n),
            ruleFragments: ruleFragments.filterByCategory(category).toList(),
            onRemoveRule: notifier.removeRule,
            onRemovePerms: notifier.removePermissions,
          ),
        if (ruleFragments.isNotEmpty)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: notifier.removeAll,
            child: Text(l10n.snapRulesRemoveAll),
          ),
      ],
    );
  }
}

class _HomeRuleSection extends ConsumerWidget {
  const _HomeRuleSection({
    required this.title,
    required this.ruleFragments,
    required this.onRemoveRule,
    required this.onRemovePerms,
  });

  final String title;
  final List<SnapdHomeRuleFragment> ruleFragments;
  final void Function(String id) onRemoveRule;
  final void Function(String id, List<HomePermission> perms) onRemovePerms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ruleFragments.isEmpty) {
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
          ruleFragments: ruleFragments,
          onRemoveRule: onRemoveRule,
          onRemovePerms: onRemovePerms,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _RuleList extends TileList {
  _RuleList({
    required List<SnapdHomeRuleFragment> ruleFragments,
    required void Function(String id) onRemoveRule,
    required void Function(String id, List<HomePermission> perms) onRemovePerms,
  }) : super(
          children: ruleFragments
              .map(
                (ruleFragment) => RuleTile(
                  ruleFragment: ruleFragment,
                  onRemove: () => ruleFragment.deleteRuleOnRemoval
                      ? onRemoveRule(ruleFragment.ruleId)
                      : onRemovePerms(
                          ruleFragment.ruleId,
                          ruleFragment.permissions,
                        ),
                ),
              )
              .toList(),
        );
}

class RuleTile extends StatelessWidget {
  const RuleTile({
    required this.ruleFragment,
    required this.onRemove,
    super.key,
  });

  final SnapdHomeRuleFragment ruleFragment;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SecurityCenterListTile(
      title: ruleFragment.pathPattern,
      subtitle: Text(
        ruleFragment.permissions
            .map((permission) => permission.localize(l10n))
            .join(', '),
      ),
      trailing: YaruIconButton(
        icon: const Icon(YaruIcons.window_close),
        onPressed: onRemove,
      ),
    );
  }
}
