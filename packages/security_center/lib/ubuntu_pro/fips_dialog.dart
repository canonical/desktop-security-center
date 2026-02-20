import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class FIPSDialog extends ConsumerWidget {
  const FIPSDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final provider = ref.watch(fIPSModelProvider);

    if (provider.state is UbuntuProFeatureStateEnabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProComplianceFIPSTitle),
      ),
      titlePadding: EdgeInsets.zero,
      actions: [
        ElevatedButton(
          onPressed: provider.state is UbuntuProFeatureStateLoading
              ? null
              : () => ref.read(fIPSModelProvider.notifier).enable(),
          child: provider.state is UbuntuProFeatureStateLoading
              ? SizedBox.square(
                  dimension: theme.textTheme.bodyMedium?.fontSize,
                  child: YaruCircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text(l10n.ubuntuProEnable),
        ),
      ],
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YaruInfoBox(
              yaruInfoType: YaruInfoType.warning,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(l10n.ubuntuProComplianceFIPSDisclaimer),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.ubuntuProComplianceFIPSPrompt,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const _FIPSOptions(),
              ].separatedBy(const SizedBox(height: 12)),
            ),
          ].separatedBy(const SizedBox(height: 24)),
        ),
      ),
    );
  }
}

class _FIPSOptions extends ConsumerStatefulWidget {
  const _FIPSOptions();

  @override
  ConsumerState<_FIPSOptions> createState() => _FIPSOptionsState();
}

class _FIPSOptionsState extends ConsumerState<_FIPSOptions> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final fipsProvider = ref.watch(fIPSModelProvider);
    final fipsCanToggle = ref
        .watch(ubuntuProFeatureModelProvider(UbuntuProFeatureType.fips))
        .canToggle;
    final fipsUpdatesToggle = ref
        .watch(ubuntuProFeatureModelProvider(UbuntuProFeatureType.fipsUpdates))
        .canToggle;

    return TileList(
      children: [
        YaruRadioListTile(
          title: Text(l10n.ubuntuProComplianceFIPSUpdates),
          subtitle: Text(l10n.ubuntuProComplianceFIPSUpdatesDescription),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          value: FIPSType.fipsUpdates,
          groupValue: fipsProvider.type,
          onChanged: fipsUpdatesToggle
              ? (value) => ref
                  .read(fIPSModelProvider.notifier)
                  .setType(FIPSType.fipsUpdates)
              : null,
        ),
        YaruRadioListTile(
          title: Text(l10n.ubuntuProComplianceFIPSNoUpdates),
          subtitle: Text(
            l10n.ubuntuProComplianceFIPSNoUpdatesDescription,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          value: FIPSType.fips,
          groupValue: fipsProvider.type,
          onChanged: fipsCanToggle
              ? (value) =>
                  ref.read(fIPSModelProvider.notifier).setType(FIPSType.fips)
              : null,
        ),
      ],
    );
  }
}
