import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class InterfacesPage extends ConsumerWidget {
  const InterfacesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptingStatusModelProvider);
    return model.when(
      data: (promptingStatus) => _Body(promptingStatus: promptingStatus),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.promptingStatus});

  final AppPermissionsServiceStatus promptingStatus;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ScrollablePage(
      children: [
        _PromptingSwitch(promptingStatus: promptingStatus),
        Text(l10n.interfacePageDescription),
        const _Links(),
        if (promptingStatus.isEnabled) ...[
          Text(
            l10n.interfacePageTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const _InterfaceList(),
        ],
        Text(l10n.snapPermissionsOtherDescription),
      ].separatedBy(const SizedBox(height: 24)),
    );
  }
}

enum _Link {
  learnMore,
  giveFeedback,
  reportIssues;

  String get url => switch (this) { _ => '' };
  String localize(AppLocalizations l10n) => switch (this) {
        learnMore => l10n.interfacePageLinkLearnMore,
        giveFeedback => l10n.interfacePageLinkGiveFeedback,
        reportIssues => l10n.interfacePageLinkReportIssues,
      };
}

class _Links extends StatelessWidget {
  const _Links();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _Link.values
          .map(
            (link) => MarkdownText(
              link.localize(AppLocalizations.of(context)).link(link.url),
            ),
          )
          .toList()
          .separatedBy(const SizedBox(width: 16)),
    );
  }
}

class _PromptingSwitch extends ConsumerWidget {
  const _PromptingSwitch({
    required this.promptingStatus,
  });

  final AppPermissionsServiceStatus promptingStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(promptingStatusModelProvider.notifier);
    final l10n = AppLocalizations.of(context);
    return YaruBorderContainer(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YaruSwitchListTile(
            title: Row(
              children: [
                Flexible(child: Text(l10n.snapPermissionsEnableTitle)),
                const SizedBox(width: 10),
                YaruInfoBadge(
                  title: Text(l10n.snapPermissionsExperimentalLabel),
                  yaruInfoType: YaruInfoType.information,
                ),
              ],
            ),
            value: promptingStatus.isEnabled || promptingStatus.isEnabling,
            onChanged: switch (promptingStatus) {
              AppPermissionsServiceStatusDisabled() ||
              AppPermissionsServiceStatusEnabled() =>
                (value) => value ? notifier.enable() : notifier.disable(),
              _ => null,
            },
          ),
          if (promptingStatus is AppPermissionsServiceStatusEnabling ||
              promptingStatus is AppPermissionsServiceStatusDisabling) ...[
            const Divider(),
            ListTile(
              title: Text(
                switch (promptingStatus) {
                  AppPermissionsServiceStatusDisabling() =>
                    l10n.snapPermissionsDisablingLabel,
                  AppPermissionsServiceStatusEnabling() =>
                    l10n.snapPermissionsEnablingLabel,
                  _ => '',
                },
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: const YaruLinearProgressIndicator(),
            ),
          ],
        ],
      ),
    );
  }
}

class _InterfaceList extends ConsumerWidget {
  const _InterfaceList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(interfaceSnapCountsProvider).when(
          data: (interfaceSnapCounts) {
            final l10n = AppLocalizations.of(context);
            final tiles = interfaceSnapCounts.entries
                .map(
                  (interfaceSnapCount) => ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Icon(interfaceSnapCount.key.icon, size: 48),
                    title: Text(interfaceSnapCount.key.localizedTitle(l10n)),
                    subtitle:
                        Text(l10n.interfaceSnapCount(interfaceSnapCount.value)),
                    trailing: const Icon(YaruIcons.pan_end),
                    onTap: () => Navigator.of(context)
                        .pushSnapPermissions(interface: interfaceSnapCount.key),
                  ),
                )
                .toList();
            return TileList(children: tiles);
          },
          error: (error, _) => ErrorWidget(error),
          loading: () => const Center(child: YaruCircularProgressIndicator()),
        );
  }
}
