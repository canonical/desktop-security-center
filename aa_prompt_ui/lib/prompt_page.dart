import 'package:aa_prompt_ui/prompt_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

const title = 'Security Notification';

TextSpan boldText(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}

class PromptPage extends ConsumerWidget {
  const PromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);

    return Scaffold(
      appBar: const YaruWindowTitleBar(
        title: Text(title),
        isMaximizable: false,
        isMinimizable: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: YaruPlaceholderIcon(size: Size(60, 60)),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InitialOptions(),
                    if (model.withMoreOptions) const MoreOptions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitialOptions extends ConsumerWidget {
  const InitialOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);
    final notifier = ref.read(promptDataModelProvider.notifier);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: 'Allow ',
            children: [
              boldText(model.snapName),
              const TextSpan(text: ' to have '),
              boldText(model.stringPerms),
              const TextSpan(text: ' access to '),
              boldText(model.requestedPath),
              const TextSpan(text: '?'),
            ],
          ),
        ),
        YaruExpandable(
          expandButtonPosition: YaruExpandableButtonPosition.start,
          header: const Text('About this app'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: theme.cardColor,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Published by \$PUBLISHER'),
                      Text('Last updated on \$LAST_UPDATED'),
                      Text('<Visit App Center page>'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: model.withMoreOptions ? null : notifier.allowAlways,
              child: const Text('Allow always'),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: model.withMoreOptions ? null : notifier.denyOnce,
              child: const Text('Deny once'),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: notifier.toggleMoreOptions,
              child: Text(
                model.withMoreOptions ? 'Less options...' : 'More options...',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MoreOptions extends ConsumerWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(promptDataModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const AccessToggle(),
        const SizedBox(height: 20),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccessPolicyToggle(),
            SizedBox(width: 20),
            DurationToggle(),
            SizedBox(width: 20),
            Permissions(),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You can always change these permissions in the <Security Center>.',
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: notifier.saveAndContinue,
                child: const Text('Save and continue'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AccessToggle extends ConsumerWidget {
  const AccessToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Set access for ${model.snapName} to:')),
        const SizedBox(height: 10),
        const PermissionChoiceRadio(
          title: 'Everthing in the Home folder',
          permissionChoice: PermissionChoice.home,
        ),
        const PermissionChoiceRadio(
          title: 'Everthing in <PARENT_DIR>',
          permissionChoice: PermissionChoice.parentDir,
        ),
        const PermissionChoiceRadio(
          title: 'Custom path pattern',
          permissionChoice: PermissionChoice.customPath,
        ),
        if (model.permissionChoice == PermissionChoice.customPath) ...[
          const TextField(),
          const Text('<Learn about path patterns>'),
        ],
      ],
    );
  }
}

class PermissionChoiceRadio extends ConsumerWidget {
  const PermissionChoiceRadio({
    required this.title,
    required this.permissionChoice,
    super.key,
  });

  final String title;
  final PermissionChoice permissionChoice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);
    final notifier = ref.read(promptDataModelProvider.notifier);

    return YaruRadioButton<PermissionChoice>(
      title: Text(title),
      value: permissionChoice,
      groupValue: model.permissionChoice,
      onChanged: notifier.setPermissionChoice,
      toggleable: true,
    );
  }
}

class AccessPolicyToggle extends ConsumerWidget {
  const AccessPolicyToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Access Policy')),
        const SizedBox(height: 10),
        const PolicyRadio(
          title: 'Allow',
          policy: AccessPolicy.allow,
        ),
        const PolicyRadio(
          title: 'Deny',
          policy: AccessPolicy.deny,
        ),
      ],
    );
  }
}

class PolicyRadio extends ConsumerWidget {
  const PolicyRadio({
    required this.title,
    required this.policy,
    super.key,
  });

  final String title;
  final AccessPolicy policy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);
    final notifier = ref.read(promptDataModelProvider.notifier);

    return YaruRadioButton<AccessPolicy>(
      title: Text(title),
      value: policy,
      groupValue: model.accessPolicy,
      onChanged: notifier.setAccessPolicy,
      toggleable: true,
    );
  }
}

class DurationToggle extends ConsumerWidget {
  const DurationToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Duration')),
        const SizedBox(height: 10),
        const DurationRadio(
          title: 'Always',
          duration: Duration.always,
        ),
        const DurationRadio(
          title: 'Until logout',
          duration: Duration.untilLogout,
        ),
        const DurationRadio(
          title: 'Once',
          duration: Duration.once,
        ),
      ],
    );
  }
}

class DurationRadio extends ConsumerWidget {
  const DurationRadio({
    required this.title,
    required this.duration,
    super.key,
  });

  final String title;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);
    final notifier = ref.read(promptDataModelProvider.notifier);

    return YaruRadioButton<Duration>(
      title: Text(title),
      value: duration,
      groupValue: model.duration,
      onChanged: notifier.setDuration,
      toggleable: true,
    );
  }
}

class Permissions extends ConsumerWidget {
  const Permissions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Permissions')),
        const SizedBox(height: 10),
        const PermissionCheckButton(
          title: 'Read',
          permission: Permission.read,
        ),
        const PermissionCheckButton(
          title: 'Write',
          permission: Permission.write,
        ),
        const PermissionCheckButton(
          title: 'Execute',
          permission: Permission.execute,
        ),
      ],
    );
  }
}

class PermissionCheckButton extends ConsumerWidget {
  const PermissionCheckButton({
    required this.title,
    required this.permission,
    super.key,
  });

  final String title;
  final Permission permission;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptDataModelProvider);
    final notifier = ref.read(promptDataModelProvider.notifier);

    return YaruCheckButton(
      title: Text(title),
      value: model.permissions.contains(permission),
      tristate: true,
      onChanged: model.availablePermissions.contains(permission)
          ? (v) => notifier.togglePerm(permission)
          : null,
    );
  }
}
