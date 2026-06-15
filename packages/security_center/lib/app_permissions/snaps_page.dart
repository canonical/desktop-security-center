import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_category.dart';
import 'package:security_center/app_permissions/rules_popup_menu.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/app_icon.dart';
import 'package:security_center/widgets/empty_rules_tile.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:yaru/yaru.dart';

final _log = Logger('snapd_app_permissions_service');

class SnapsPage extends ConsumerWidget {
  const SnapsPage({required this.interface, super.key});

  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapRuleCounts =
        ref.watch(snapRuleCountsProvider(interface: interface));
    return snapRuleCounts.when(
      data: (snapRuleCounts) =>
          _Body(snapRuleCounts: snapRuleCounts, interface: interface),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
      skipLoadingOnReload: true,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.snapRuleCounts, required this.interface});

  final Map<String, int> snapRuleCounts;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (interface) {
      SnapdInterface.home => _HomeInterfaceBody(
          snapRuleCounts: snapRuleCounts,
          interface: interface,
        ),
      SnapdInterface.camera => _CameraInterfaceBody(
          snapRuleCounts: snapRuleCounts,
          interface: interface,
        ),
      SnapdInterface.microphone => _MicrophoneInterfaceBody(
          snapRuleCounts: snapRuleCounts,
          interface: interface,
        ),
    };
  }
}

class _HomeInterfaceBody extends ConsumerWidget {
  const _HomeInterfaceBody({
    required this.snapRuleCounts,
    required this.interface,
  });

  final Map<String, int> snapRuleCounts;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = snapRuleCounts.entries
        .map(
          (e) => _HomeInterfaceAppTile(
            snapName: e.key,
            ruleCount: e.value,
            onTap: () => Navigator.of(context).pushSnapPermissions(
              interface: interface,
              snap: e.key,
            ),
          ),
        )
        .toList();
    return ScrollablePage(
      children: [
        YaruTileList(
          children:
              tiles.isEmpty ? [EmptyRulesTile(interface: interface)] : tiles,
        ),
      ],
    );
  }
}

class _CameraInterfaceBody extends ConsumerWidget {
  const _CameraInterfaceBody({
    required this.snapRuleCounts,
    required this.interface,
  });

  final Map<String, int> snapRuleCounts;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final appTiles = snapRuleCounts.entries
        .map(
          (e) => _CameraInterfaceAppTile(
            snapName: e.key,
          ),
        )
        .toList();

    return ScrollablePage(
      children: [
        YaruTileList(
          children: appTiles.isEmpty
              ? [EmptyRulesTile(interface: interface)]
              : appTiles,
        ),
        if (appTiles.isNotEmpty) ...[
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () async {
              for (final snapName in snapRuleCounts.keys) {
                final notifier = ref.read(
                  snapCameraRulesModelProvider(snap: snapName).notifier,
                );
                await notifier.removeAll();
              }
            },
            child: Text(l10n.snapRulesResetAllPermissions),
          ),
        ],
      ],
    );
  }
}

class _MicrophoneInterfaceBody extends ConsumerWidget {
  const _MicrophoneInterfaceBody({
    required this.snapRuleCounts,
    required this.interface,
  });

  final Map<String, int> snapRuleCounts;
  final SnapdInterface interface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final appTiles = snapRuleCounts.entries
        .map(
          (e) => _MicrophoneInterfaceAppTile(
            snapName: e.key,
          ),
        )
        .toList();

    return ScrollablePage(
      children: [
        YaruTileList(
          children: appTiles.isEmpty
              ? [EmptyRulesTile(interface: interface)]
              : appTiles,
        ),
        if (appTiles.isNotEmpty) ...[
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () async {
              for (final snapName in snapRuleCounts.keys) {
                final notifier = ref.read(
                  snapMicrophoneRulesModelProvider(snap: snapName).notifier,
                );
                await notifier.removeAll();
              }
            },
            child: Text(l10n.snapRulesResetAllPermissions),
          ),
        ],
      ],
    );
  }
}

class _HomeInterfaceAppTile extends ConsumerWidget {
  const _HomeInterfaceAppTile({
    required this.snapName,
    required this.ruleCount,
    required this.onTap,
  });

  final String snapName;
  final int ruleCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return YaruListTile(
      leading: AppIcon(
        snapIcon: ref.watch(snapIconProvider(snapName)),
      ),
      titleText: ref.watch(snapTitleOrNameProvider(snapName)),
      subtitle: Text(l10n.snapRulesCount(ruleCount)),
      trailing: const Icon(YaruIcons.go_next),
      onTap: onTap,
    );
  }
}

class _CameraInterfaceAppTile extends ConsumerWidget {
  const _CameraInterfaceAppTile({
    required this.snapName,
  });

  final String snapName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier =
        ref.read(snapCameraRulesModelProvider(snap: snapName).notifier);
    final cameraRules = ref.watch(snapCameraRulesModelProvider(snap: snapName));

    final activeAction = cameraRules.when(
      data: (rules) {
        if (rules.isEmpty) return SnapdRuleAction.askAlways;

        if (rules.length > 1) {
          _log.warning(
            'Snap $snapName has ${rules.length} camera rules, expected 0 or 1',
          );
          return SnapdRuleAction.askAlways;
        }

        final rule = rules.first;
        return SnapdRuleAction.fromOutcomeAndLifespan(
          outcome: rule.outcome,
          lifespan: rule.lifespan,
        );
      },
      loading: () => SnapdRuleAction.askAlways,
      error: (error, _) {
        _log.error('Failed to load camera rules for snap $snapName: $error');
        return SnapdRuleAction.askAlways;
      },
      skipLoadingOnReload: true,
    );

    return YaruListTile(
      leading: AppIcon(
        snapIcon: ref.watch(snapIconProvider(snapName)),
      ),
      titleText: ref.watch(snapTitleOrNameProvider(snapName)),
      trailing: PermissionRulePopupMenu(
        selectedAction: activeAction,
        onSelected: (value) async {
          final updatedRuleInfo = value.toOutcomeAndLifespan();
          await notifier.removeAll();

          if (updatedRuleInfo != null) {
            await notifier.createAccessRule(
              outcome: updatedRuleInfo.outcome,
              lifespan: updatedRuleInfo.lifespan,
            );
          }
        },
      ),
    );
  }
}

class _MicrophoneInterfaceAppTile extends ConsumerWidget {
  const _MicrophoneInterfaceAppTile({
    required this.snapName,
  });

  final String snapName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier =
        ref.read(snapMicrophoneRulesModelProvider(snap: snapName).notifier);
    final microphoneRules =
        ref.watch(snapMicrophoneRulesModelProvider(snap: snapName));

    final activeAction = microphoneRules.when(
      data: (rules) {
        if (rules.isEmpty) return SnapdRuleAction.askAlways;

        if (rules.length > 1) {
          _log.warning(
            'Snap $snapName has ${rules.length} microphone rules, expected 0 or 1',
          );
          return SnapdRuleAction.askAlways;
        }

        final rule = rules.first;
        return SnapdRuleAction.fromOutcomeAndLifespan(
          outcome: rule.outcome,
          lifespan: rule.lifespan,
        );
      },
      loading: () => SnapdRuleAction.askAlways,
      error: (error, _) {
        _log.error(
          'Failed to load microphone rules for snap $snapName: $error',
        );
        return SnapdRuleAction.askAlways;
      },
      skipLoadingOnReload: true,
    );

    return YaruListTile(
      leading: AppIcon(
        snapIcon: ref.watch(snapIconProvider(snapName)),
      ),
      titleText: ref.watch(snapTitleOrNameProvider(snapName)),
      trailing: PermissionRulePopupMenu(
        selectedAction: activeAction,
        onSelected: (value) async {
          final updatedRuleInfo = value.toOutcomeAndLifespan();
          await notifier.removeAll();

          if (updatedRuleInfo != null) {
            await notifier.createAccessRule(
              outcome: updatedRuleInfo.outcome,
              lifespan: updatedRuleInfo.lifespan,
            );
          }
        },
      ),
    );
  }
}
