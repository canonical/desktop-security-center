import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/rules/rules_providers.dart';
import 'package:security_center/services/rules_service.dart';
import 'package:yaru/yaru.dart';

class SnapRulesPage extends ConsumerWidget {
  const SnapRulesPage({required this.snap, required this.interface, super.key});

  final String snap;
  final String interface;

  static Route<void> route({required String snap, required String interface}) {
    return MaterialPageRoute<void>(
      builder: (_) => SnapRulesPage(snap: snap, interface: interface),
    );
  }

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
  final String interface;
  final List<SnapdRule> rules;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(
      snapRulesModelProvider(snap: snap, interface: interface).notifier,
    );
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YaruBackButton(),
          Text(
            'Rules for $snap',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: rules.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(rules[index].id),
                  title: _Rule(rule: rules[index]),
                  onTap: () => notifier.removeRule(rules[index].id),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: notifier.removeAll,
            child: const Text('Remove all'),
          ),
        ],
      ),
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
