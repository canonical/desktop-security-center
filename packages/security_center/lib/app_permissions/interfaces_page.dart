import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/hyperlink.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/security_center_list_tile.dart';
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
        ...[
          _PromptingSwitch(promptingStatus: promptingStatus),
          Text(l10n.interfacePageDescription),
          const _Links(),
        ].separatedBy(const SizedBox(height: 8)),
        if (promptingStatus.isEnabled) ...[
          const SizedBox(height: 32),
          ...[
            Text(
              l10n.interfacePageTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const _InterfaceList(),
            Text(l10n.snapPermissionsOtherDescription),
          ].separatedBy(const SizedBox(height: 8)),
        ],
      ],
    );
  }
}

enum _Link {
  learnMore,
  giveFeedback,
  reportIssues;

  String get url => switch (this) {
        learnMore =>
          'https://discourse.ubuntu.com/t/ubuntu-desktop-s-24-10-dev-cycle-part-5-introducing-permissions-prompting/47963',
        giveFeedback =>
          'https://t.maze.co/266411709?guerilla=true&source=securitycenter',
        reportIssues =>
          'https://github.com/canonical/desktop-security-center/issues/new/choose',
      };
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
            (link) => Hyperlink(
              text: link.localize(AppLocalizations.of(context)),
              url: link.url,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YaruSwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    l10n.snapPermissionsEnableTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
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
                  (interfaceSnapCount) => SecurityCenterListTile(
                    leading: Icon(interfaceSnapCount.key.icon, size: 32),
                    title: interfaceSnapCount.key.localizedTitle(l10n),
                    subtitle: Text(
                      interfaceSnapCount.value > 0
                          ? l10n.interfaceSnapCount(interfaceSnapCount.value)
                          : (interfaceSnapCount.key == SnapdInterface.camera
                              ? l10n.cameraRulesPageEmptyTileLabel
                              : l10n.snapRulesPageEmptyTileLabel),
                    ),
                    trailing: const Icon(YaruIcons.pan_end),
                    onTap: () => Navigator.of(context).pushSnapPermissions(
                      interface: interfaceSnapCount.key,
                    ),
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
