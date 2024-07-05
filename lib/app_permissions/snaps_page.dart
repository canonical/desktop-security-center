import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/interface_x.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class SnapsPage extends ConsumerWidget {
  const SnapsPage({required this.interface, super.key});

  final String interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapRuleCounts =
        ref.watch(snapRuleCountsProvider(interface: interface));
    return snapRuleCounts.when(
      data: (snapRuleCounts) =>
          _Body(snapRuleCounts: snapRuleCounts, interface: interface),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.snapRuleCounts, required this.interface});

  final Map<String, int> snapRuleCounts;
  final String interface;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tiles = snapRuleCounts.entries
        .map(
          (e) => ListTile(
            leading: const Icon(YaruIcons.placeholder_icon),
            title: Text(e.key),
            subtitle: Text(l10n.snapRulesCount(e.value)),
            trailing: const Icon(YaruIcons.pan_end),
            onTap: () => Navigator.of(context).pushSnapPermissions(
              interface: interface,
              snap: e.key,
            ),
          ),
        )
        .toList();
    return ScrollablePage(
      children: [
        Text(
          interface.localizeSnapdInterfaceTitle(l10n),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(interface.localizeSnapdInterfaceDescription(l10n)),
        const SizedBox(height: 24),
        TileList(children: tiles),
      ],
    );
  }
}
