import 'package:collection/collection.dart';
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
    final showMoreOptions = ref.watch(
      homePromptDataModelProvider.select((m) => m.showMoreOptions),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        const Divider(),
        const PatternOptions(),
        const Permissions(),
        if (showMoreOptions) const LifespanToggle(),
        const ActionButtonRow(),
      ].withSpacing(20),
    );
  }
}

class Header extends ConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details =
        ref.watch(homePromptDataModelProvider.select((m) => m.details));
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(
          l10n.homePromptBody(
            details.metaData.snapName.bold(),
            details.requestedPermissions
                .map((p) => p.localize(l10n).toLowerCase())
                .join(', ')
                .bold(),
            details.requestedPath.bold(),
          ),
        ),
        const MetaDataDropdown(),
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

class ActionButtonRow extends ConsumerWidget {
  const ActionButtonRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showMoreOptions = ref.watch(
      homePromptDataModelProvider.select((m) => m.showMoreOptions),
    );
    final buttons = showMoreOptions
        ? const [
            ActionButton(action: Action.allow),
            ActionButton(action: Action.deny),
          ]
        : const [
            ActionButton(action: Action.allow, lifespan: Lifespan.forever),
            ActionButton(action: Action.deny, lifespan: Lifespan.single),
            MoreOptionsButton(),
          ];
    return Row(children: buttons.withSpacing(16));
  }
}

class ActionButton extends ConsumerWidget {
  const ActionButton({required this.action, this.lifespan, super.key});

  final Action action;
  final Lifespan? lifespan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return OutlinedButton(
      onPressed: ref.watch(
        homePromptDataModelProvider.select((m) => m.isValid),
      )
          ? () async {
              final response = await ref
                  .read(homePromptDataModelProvider.notifier)
                  .saveAndContinue(action: action, lifespan: lifespan);
              if (response is PromptReplyResponseSuccess) {
                if (context.mounted) {
                  await YaruWindow.of(context).close();
                }
              } else if (response is PromptReplyResponsePromptNotFound) {
                // FIXME: really this needs to display an error to the user and then close
                // but we need to at make sure that the UI doesn't hang as an initial step
                if (context.mounted) {
                  await YaruWindow.of(context).close();
                }
              }
            }
          : null,
      child: Text(
        switch ((action, lifespan)) {
          (final action, null) => action.localize(l10n),
          (Action.allow, Lifespan.forever) =>
            l10n.promptActionOptionAllowAlways,
          (Action.deny, Lifespan.single) => l10n.promptActionOptionDenyOnce,
          (final action, final Lifespan lifespan) =>
            '${action.localize(l10n)} (${lifespan.name})',
        },
      ),
    );
  }
}

class MoreOptionsButton extends ConsumerWidget {
  const MoreOptionsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed:
          ref.read(homePromptDataModelProvider.notifier).toggleMoreOptions,
      child: Text(AppLocalizations.of(context).homePromptMoreOptionsLabel),
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
      direction: Axis.horizontal,
    );
  }
}

class PatternOptions extends ConsumerWidget {
  const PatternOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homePromptDataModelProvider);
    final notifier = ref.read(homePromptDataModelProvider.notifier);
    final l10n = AppLocalizations.of(context);

    final patternOptions = model.showMoreOptions
        ? model.details.patternOptions
        : model.details.patternOptions.where((option) => option.showInitially);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButtonList<PatternOption>(
          title: model.showMoreOptions
              ? l10n
                  .promptAccessMoreOptionsTitle(model.details.metaData.snapName)
              : l10n.promptAccessTitle(
                  model.details.metaData.snapName,
                  model.details.requestedPermissions
                      .map((p) => p.localize(l10n).toLowerCase())
                      .join(', '),
                ),
          options: [
            ...patternOptions,
            PatternOption(
              homePatternType: HomePatternType.customPath,
              pathPattern: '',
            ),
          ],
          optionTitle: (option) => option.homePatternType.localize(
            l10n,
            model.topLevelDir,
          ),
          optionSubtitle: (option) => option.pathPattern,
          groupValue: model.patternOption,
          onChanged: notifier.setPatternOption,
        ),
        if (model.patternOption.homePatternType ==
            HomePatternType.customPath) ...[
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
    final showMoreOptions = ref.watch(
      homePromptDataModelProvider.select((m) => m.showMoreOptions),
    );
    final selectedPermissions =
        ref.watch(homePromptDataModelProvider.select((m) => m.permissions));
    final details = ref.watch(
      homePromptDataModelProvider.select((m) => m.details),
    );
    final notifier = ref.read(homePromptDataModelProvider.notifier);
    final l10n = AppLocalizations.of(context);

    if (showMoreOptions) {
      return CheckButtonList<Permission>(
        title: l10n.homePromptPermissionsTitle,
        options: details.availablePermissions,
        optionTitle: (option) => option.localize(l10n),
        hasOption: selectedPermissions.contains,
        isEnabled: (option) => !details.requestedPermissions.contains(option),
        toggleOption: notifier.togglePermission,
        direction: Axis.horizontal,
      );
    } else {
      return CheckButtonList<Permission>(
        options: details.initialPermissions
            .whereNot(details.requestedPermissions.contains),
        optionTitle: (option) => 'Also give ${option.localize(l10n)} access',
        hasOption: selectedPermissions.contains,
        toggleOption: notifier.togglePermission,
      );
    }
  }
}
