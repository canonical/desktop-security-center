import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/app_permissions/snapd_interface.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/widgets/app_icon.dart';
import 'package:security_center/widgets/empty_rules_tile.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
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
    final l10n = AppLocalizations.of(context);
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
        Text(
          interface.localizedTitle(l10n),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Text(interface.localizedDescription(l10n)),
        const SizedBox(height: 24),
        TileList(
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
        Text(
          interface.localizedTitle(l10n),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Text(interface.localizedDescription(l10n)),
        const SizedBox(height: 24),
        TileList(
          children: appTiles.isEmpty
              ? [EmptyRulesTile(interface: interface)]
              : appTiles,
        ),
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
    return ListTile(
      leading: AppIcon(
        snapIcon: ref.watch(snapIconProvider(snapName)),
      ),
      title: Text(ref.watch(snapTitleOrNameProvider(snapName))),
      subtitle: Text(l10n.snapRulesCount(ruleCount)),
      trailing: const Icon(YaruIcons.pan_end),
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

    final hasAllowRule = cameraRules.when(
      data: (rules) =>
          rules.any((rule) => rule.outcome == SnapdRequestOutcome.allow),
      loading: () => false,
      error: (error, _) {
        _log.error('Failed to load camera rules for snap $snapName: $error');
        return false;
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: AppIcon(
          snapIcon: ref.watch(snapIconProvider(snapName)),
        ),
        title: Text(ref.watch(snapTitleOrNameProvider(snapName))),
        trailing: Switch(
          value: hasAllowRule,
          onChanged: (value) {
            if (value) {
              notifier.removeAll().then((_) => notifier.createAccessRule());
            } else {
              notifier.removeAll();
            }
          },
        ),
      ),
    );
  }
}
