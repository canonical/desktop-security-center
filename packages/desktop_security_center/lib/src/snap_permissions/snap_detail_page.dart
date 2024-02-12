import 'package:desktop_security_center/src/spacing.dart';
import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SnapDetailPage extends StatelessWidget {
  const SnapDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YaruWindowTitleBar(
        leading: GestureDetector(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
            child: const Icon(YaruIcons.go_previous)),
        title: const Text('Default Snap'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kLargePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Placeholder(
                    fallbackHeight: kLargePadding,
                    fallbackWidth: kLargePadding,
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Text(
                    'Default Snap',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const Text(
                  'Manage the rules for Microsoft Teams’ access to the Home folder.'),
              ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.error,
                      ),
                    ),
                onPressed: () {},
                child: const Text('Remove all rules'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
