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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        const Divider(),
        const PatternOptions(),
        const Permissions(),
        const LifespanToggle(),
        const ActionButtonRow(),
        const Footer(),
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
                .map((p) => p.localize(l10n))
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

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context).securityCenterInfo);
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

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ActionButton(action: Action.allow),
        const ActionButton(action: Action.deny),
      ].withSpacing(16),
    );
  }
}

class ActionButton extends ConsumerWidget {
  const ActionButton({required this.action, super.key});

  final Action action;

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
                  .saveAndContinue(action: action);
              if (response is PromptReplyResponseSuccess) {
                if (context.mounted) {
                  await YaruWindow.of(context).close();
                }
              }
            }
          : null,
      child: Text(action.localize(l10n)),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioButtonList<PatternOption>(
          title: l10n.promptAccessTitle(model.details.metaData.snapName),
          options: [
            ...model.details.patternOptions,
            PatternOption(
              homePatternType: HomePatternType.customPath,
              pathPattern: '',
            ),
          ],
          optionTitle: (option) => option.homePatternType.localize(l10n),
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
