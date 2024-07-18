import 'package:apparmor_prompt/home/home_prompt_data_model.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';

const title = 'Security Notification';

TextSpan boldText(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(fontWeight: FontWeight.bold),
  );
}

extension WidgetIterableExtension on Iterable<Widget> {
  List<Widget> withSpacing(double spacing) {
    return expand((item) sync* {
      yield SizedBox(width: spacing, height: spacing);
      yield item;
    }).skip(1).toList();
  }
}

class HomePromptPage extends ConsumerWidget {
  const HomePromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);

    return Scaffold(
      appBar: const YaruWindowTitleBar(
        title: Text(title),
        isMaximizable: false,
        isMinimizable: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InitialOptions(),
              if (model.withMoreOptions) ...[
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                const MoreOptions(),
              ],
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
    final model = ref.watch(homePromptDataModelProvider);
    // TODO: (sminez) re-enable once we have settled on what the initial options are
    // final notifier = ref.read(promptDataModelProvider.notifier);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: 'Allow ',
            children: [
              boldText(model.details.metaData.snapName),
              const TextSpan(text: ' to have '),
              boldText(model.permissions.map((p) => p.name).join(', ')),
              const TextSpan(text: ' access to '),
              boldText(model.details.requestedPath),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Published by ',
                          children: [
                            TextSpan(
                              text: model.details.metaData.publisher,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Last updated on ',
                          children: [
                            TextSpan(
                              text: model.details.metaData.updatedAt,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (model.details.metaData.storeUrl != null) ...[
                        InkWell(
                          onTap: () =>
                              launchUrlString(model.details.metaData.storeUrl!),
                          child: Text.rich(
                            TextSpan(
                              text: 'Visit App Center page',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        // TODO: (sminez) re-enable once we have settled on what the initial options are
        // Row(
        //   children: [
        //     for (var i = 0; i < notifier.numInitialOptions; i++)
        //       OutlinedButton(
        //         onPressed: model.withMoreOptions
        //             ? null
        //             : () => notifier.replyWithInitialOption(i),
        //         child: Text(model.details.initialOptions[i].buttonText),
        //       ),
        //     OutlinedButton(
        //       onPressed: notifier.toggleMoreOptions,
        //       child: Text(
        //         model.withMoreOptions ? 'Less options...' : 'More options...',
        //       ),
        //     ),
        //   ].withSpacing(10),
        // ),
      ],
    );
  }
}

class MoreOptions extends ConsumerWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homePromptDataModelProvider.notifier);
    final model = ref.watch(homePromptDataModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AccessToggle(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ActionToggle(),
            const LifespanToggle(),
            const Permissions(),
          ].withSpacing(20),
        ),
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
                onPressed: model.isValid ? notifier.saveAndContinue : null,
                child: const Text('Save and continue'),
              ),
            ),
          ],
        ),
      ].withSpacing(20),
    );
  }
}

class AccessToggle extends ConsumerWidget {
  const AccessToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          boldText('Set access for ${model.details.metaData.snapName} to:'),
        ),
        const SizedBox(height: 10),
        for (var i = 0; i <= model.numMoreOptions; i++)
          PathChoiceRadio(index: i),
        if (model.selectedPath == model.numMoreOptions) ...[
          TextFormField(
            initialValue: model.customPath,
            onChanged: notifier.setCustomPath,
            decoration: InputDecoration(
              errorText: model.errorMessage,
            ),
          ),
          const Text('<Learn about path patterns>'),
        ],
      ],
    );
  }
}

class PathChoiceRadio extends ConsumerWidget {
  const PathChoiceRadio({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);
    final color = Theme.of(context).hintColor;
    final (patternType, pathPattern) = index < model.numMoreOptions
        ? model.moreOptionPath(index)
        : (HomePatternType.customPath, null);

    return YaruRadioButton<int>(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Text(patternType.name),
          if (pathPattern != null) ...[
            Text.rich(
              TextSpan(
                text: pathPattern,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: color),
              ),
            ),
          ],
          const SizedBox(height: 2),
        ],
      ),
      value: index,
      groupValue: model.selectedPath,
      onChanged: notifier.setSelectedPath,
      toggleable: true,
    );
  }
}

class ActionToggle extends ConsumerWidget {
  const ActionToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Access Policy')),
        const SizedBox(height: 10),
        const PolicyRadio(
          title: 'Allow',
          policy: Action.allow,
        ),
        const PolicyRadio(
          title: 'Deny',
          policy: Action.deny,
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
  final Action policy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);

    return YaruRadioButton<Action>(
      title: Text(title),
      value: policy,
      groupValue: model.action,
      onChanged: notifier.setAction,
      toggleable: true,
    );
  }
}

class LifespanToggle extends ConsumerWidget {
  const LifespanToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(boldText('Duration')),
        const SizedBox(height: 10),
        const LifespanRadio(
          title: 'Always',
          lifespan: Lifespan.forever,
        ),
        const LifespanRadio(
          title: 'Until logout',
          lifespan: Lifespan.session,
        ),
        const LifespanRadio(
          title: 'Once',
          lifespan: Lifespan.single,
        ),
      ],
    );
  }
}

class LifespanRadio extends ConsumerWidget {
  const LifespanRadio({
    required this.title,
    required this.lifespan,
    super.key,
  });

  final String title;
  final Lifespan lifespan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);

    return YaruRadioButton<Lifespan>(
      title: Text(title),
      value: lifespan,
      groupValue: model.lifespan,
      onChanged: notifier.setLifespan,
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
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);

    return YaruCheckButton(
      title: Text(title),
      value: model.permissions.contains(permission),
      tristate: true,
      onChanged: model.details.availablePermissions.contains(permission)
          ? (_) => notifier.togglePerm(permission)
          : null,
    );
  }
}
