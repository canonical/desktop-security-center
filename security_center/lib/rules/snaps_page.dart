import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/rules/rules_providers.dart';
import 'package:security_center/rules/snap_rules_page.dart';
import 'package:yaru/yaru.dart';

class SnapsPage extends ConsumerWidget {
  const SnapsPage({required this.interface, super.key});

  final String interface;

  static Route<void> route({required String interface}) {
    return MaterialPageRoute<void>(
      builder: (_) => SnapsPage(interface: interface),
    );
  }

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
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YaruBackButton(),
          Text('Snaps', style: Theme.of(context).textTheme.headlineSmall),
          Expanded(
            child: ListView.builder(
              itemCount: snapRuleCounts.length,
              itemBuilder: (context, index) {
                final snapCount = snapRuleCounts.entries.elementAt(index);
                return ListTile(
                  title: Text(snapCount.key),
                  subtitle: Text('${snapCount.value} rules'),
                  onTap: () => Navigator.of(context).push(
                    SnapRulesPage.route(
                      snap: snapCount.key,
                      interface: interface,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
