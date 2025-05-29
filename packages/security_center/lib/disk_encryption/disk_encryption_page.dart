import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/widgets/scrollable_page.dart';

class DiskEncryptionPage extends ConsumerWidget {
  const DiskEncryptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: provider goes here!
    return _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      children: [
        Text("foo"),
        const SizedBox(height: 12),
        Text("bar"),
        const SizedBox(height: 24),
      ],
    );
  }
}
