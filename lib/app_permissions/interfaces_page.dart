import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class InterfacesPage extends ConsumerWidget {
  const InterfacesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(promptingEnabledProvider);
    return model.when(
      data: (promptingEnabled) => _Body(promptingEnabled: promptingEnabled),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.promptingEnabled});

  final bool promptingEnabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ScrollablePage(
      children: [
        _PromptingSwitch(promptingEnabled: promptingEnabled),
        const SizedBox(height: 16),
        if (promptingEnabled) ...[
          const _InterfaceList(),
          const SizedBox(height: 16),
        ],
        Text(l10n.snapPermissionsOtherDescription),
      ],
    );
  }
}

class _PromptingSwitch extends ConsumerWidget {
  const _PromptingSwitch({
    required this.promptingEnabled,
  });

  final bool promptingEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(promptingEnabledProvider.notifier);
    final l10n = AppLocalizations.of(context);
    return YaruBorderContainer(
      child: YaruSwitchListTile(
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
        subtitle: Text(l10n.snapPermissionsEnableWarning),
        value: promptingEnabled,
        onChanged: (value) => value ? notifier.enable() : notifier.disable(),
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
