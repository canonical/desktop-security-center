import 'package:flutter/material.dart' hide Action;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prompting_client/prompting_client.dart';
import 'package:prompting_client_ui/home/home_prompt_data_model.dart';
import 'package:prompting_client_ui/l10n.dart';
import 'package:prompting_client_ui/l10n_x.dart';
import 'package:prompting_client_ui/widgets/form_widgets.dart';
import 'package:prompting_client_ui/widgets/iterable_extensions.dart';
import 'package:prompting_client_ui/widgets/markdown_text.dart';
import 'package:yaru/yaru.dart';

class HomePromptPage extends ConsumerWidget {
  const HomePromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);

    return Column(
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
    );
  }
}

class InitialOptions extends ConsumerWidget {
  const InitialOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details =
        ref.watch(homePromptDataModelProvider.select((m) => m.details));
    // TODO: (sminez) re-enable once we have settled on what the initial options are
    // final notifier = ref.read(promptDataModelProvider.notifier);
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(
          l10n.homePromptBody(
            details.metaData.snapName.bold(),
            details.requestedPermissions
                .map((p) => p.localize(l10n))
                .join(', ')
                .bold(),
            details.requestedPath.bold(),
          ),
        ),
        const MetaDataDropdown(),
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

class MetaDataDropdown extends ConsumerWidget {
  const MetaDataDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final metaData = ref
        .watch(homePromptDataModelProvider.select((m) => m.details.metaData));

    String? updatedAt;
    if (metaData.updatedAt != null) {
      try {
        updatedAt = DateFormat.yMMMd().format(metaData.updatedAt!);
      } on ArgumentError catch (_) {
        // Fall back to English if the locale isn't valid
        updatedAt = DateFormat.yMMMd('en').format(metaData.updatedAt!);
      }
    }

    return YaruExpandable(
      expandButtonPosition: YaruExpandableButtonPosition.start,
      header: Text(l10n.homePromptMetaDataTitle),
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
                  if (metaData.publisher != null)
                    MarkdownText(
                      l10n.homePromptMetaDataPublishedBy(
                        metaData.publisher!.link(''),
                      ),
                    ),
                  if (updatedAt != null)
                    MarkdownText(
                      l10n.homePromptMetaDataLastUpdated(updatedAt).bold(),
                    ),
                  if (metaData.storeUrl != null)
                    MarkdownText(
                      l10n.homePromptMetaDataAppCenterLink
                          .link(metaData.storeUrl!),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MoreOptions extends ConsumerWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AccessToggle(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Permissions(),
            const LifespanToggle(),
            const ActionToggle(),
          ].withSpacing(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.securityCenterInfo),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: ref.watch(
                  homePromptDataModelProvider.select((m) => m.isValid),
                )
                    ? () async {
                        final response = await ref
                            .read(homePromptDataModelProvider.notifier)
                            .saveAndContinue();
                        if (response is PromptReplyResponseSuccess) {
                          if (context.mounted) {
                            await YaruWindow.of(context).close();
                          }
                        }
                      }
                    : null,
                child: Text(l10n.promptSaveAndContinue),
              ),
            ),
          ],
        ),
      ].withSpacing(20),
    );
  }
}

class LifespanToggle extends ConsumerWidget {
  const LifespanToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return RadioButtonList<Lifespan>(
      title: l10n.promptLifespanTitle,
      options: const [
        Lifespan.forever,
        Lifespan.session,
        Lifespan.single,
      ],
      optionTitle: (lifespan) => lifespan.localize(l10n),
      groupValue:
          ref.watch(homePromptDataModelProvider.select((m) => m.lifespan)),
      onChanged: ref.read(homePromptDataModelProvider.notifier).setLifespan,
      toggleable: true,
      direction: Axis.horizontal,
    );
  }
}

class ActionToggle extends ConsumerWidget {
  const ActionToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return RadioButtonList<Action>(
      title: l10n.promptActionTitle,
      options: Action.values,
      optionTitle: (action) => action.localize(l10n),
      groupValue:
          ref.watch(homePromptDataModelProvider.select((m) => m.action)),
      onChanged: ref.read(homePromptDataModelProvider.notifier).setAction,
      toggleable: true,
      direction: Axis.horizontal,
    );
  }
}

class AccessToggle extends ConsumerWidget {
  const AccessToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);
    final l10n = AppLocalizations.of(context);

    final pathOptions = [
      ...model.details.patternOptions,
      PatternOption(
        homePatternType: HomePatternType.customPath,
        pathPattern: '',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButtonList<int>(
          title: l10n.promptAccessTitle(model.details.metaData.snapName),
          options: Iterable.generate(pathOptions.length),
          optionTitle: (index) =>
              pathOptions[index].homePatternType.localize(l10n),
          optionSubtitle: (index) => pathOptions[index].pathPattern,
          groupValue: model.selectedPath,
          onChanged: notifier.setSelectedPath,
          toggleable: true,
        ),
        if (model.selectedPath == model.numPatternOptions) ...[
          TextFormField(
            initialValue: model.customPath,
            onChanged: notifier.setCustomPath,
            decoration: InputDecoration(
              errorText: model.errorMessage,
            ),
          ),
          Text(l10n.homePatternInfo),
        ],
      ],
    );
  }
}

class Permissions extends ConsumerWidget {
  const Permissions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPermissions =
        ref.watch(homePromptDataModelProvider.select((m) => m.permissions));
    final availablePermissions = ref.watch(
      homePromptDataModelProvider.select((m) => m.details.availablePermissions),
    );
    final l10n = AppLocalizations.of(context);

    return CheckButtonList<Permission>(
      title: l10n.homePromptPermissionsTitle,
      options: Permission.values,
      optionTitle: (option) => option.localize(l10n),
      hasOption: selectedPermissions.contains,
      isEnabled: availablePermissions.contains,
      toggleOption: ref.read(homePromptDataModelProvider.notifier).togglePerm,
    );
  }
}
