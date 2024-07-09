import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';
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
    final tiles = rules
        .map(
          (rule) => ListTile(
            leading: Text(rule.id),
            title: _Rule(rule: rule),
            onTap: () => notifier.removeRule(rule.id),
          ),
        )
        .toList();
    return ScrollablePage(
      children: [
        Row(
          children: [
            const Icon(YaruIcons.placeholder_icon),
            const SizedBox(width: 10),
            Text(snap, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        Text(interface.localizedDescription(l10n)),
        const SizedBox(height: 24),
        TileList(children: tiles),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: notifier.removeAll,
          child: Text(l10n.snapRulesRemoveAll),
        ),
      ],
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule({required this.rule});

  final SnapdRule rule;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Path pattern: ${rule.constraints.pathPattern}'),
        Text('Permissions: ${rule.constraints.permissions?.join(', ')}'),
        Text('Outcome: ${rule.outcome.name}'),
        Text('Lifespan: ${rule.lifespan.name}'),
      ],
    );
  }
}
