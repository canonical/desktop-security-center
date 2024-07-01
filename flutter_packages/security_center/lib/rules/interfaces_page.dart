import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/rules/rules_providers.dart';
import 'package:security_center/rules/snaps_page.dart';
import 'package:yaru/yaru.dart';

class InterfacesPage extends ConsumerWidget {
  const InterfacesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(interfacesProvider);
    return model.when(
      data: (interfaces) => _Body(interfaces: interfaces),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.interfaces});

  final List<String> interfaces;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Interfaces', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: interfaces.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(interfaces[index]),
                  onTap: () => Navigator.of(context).push(
                    SnapsPage.route(interface: interfaces[index]),
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
