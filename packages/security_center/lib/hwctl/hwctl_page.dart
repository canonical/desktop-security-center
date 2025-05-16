import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/hwctl/hwctl_model.dart';
import 'package:yaru/yaru.dart';

class HwctlPage extends ConsumerWidget {
  const HwctlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(hwctlDataProvider).when(
          data: (data) => Column(
            children: [
              Text(data.$1),
              Text(data.$2),
            ],
          ),
          error: (error, _) => ErrorWidget(error),
          loading: () => const Center(child: YaruCircularProgressIndicator()),
        );
  }
}
