import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/feature_service.dart';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:security_center/ubuntu_pro/attach_dialog.dart';
import 'package:security_center/ubuntu_pro/compliance_page.dart';
import 'package:security_center/ubuntu_pro/detach_dialog.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/security_center_list_tile.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

class UbuntuProPage extends ConsumerWidget {
  const UbuntuProPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final featureService = tryGetService<FeatureService>();

    return ScrollablePage(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/Ubuntu-tag.svg',
                height: 68,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.ubuntuProPageTitle,
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        if (featureService?.supportsProControl ?? true)
          _UbuntuProBody()
        else
          Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 410),
                child: MarkdownText(
                  l10n.ubuntuProDisabled(
                    l10n.ubuntuProLearnMore.link(kUbuntuProLink),
                  ),
                  alignment: WrapAlignment.center,
                ),
              ),
              const SizedBox(height: 24),
              YaruBorderContainer(
                padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                child: Center(
                  child: ListTile(
                    leading: const Icon(YaruIcons.edit_clear, size: 24),
                    title: Text(l10n.ubuntuProNotSupportedSnapd),
                    subtitle: Text(l10n.ubuntuProNotSupportedSnapdDetails),
                  ),
                ),
              ),
            ],
          ),
      ].separatedBy(const SizedBox(height: 24)),
    );
  }
}

class _UbuntuProBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final navigator = Navigator.of(context);
    final provider = ref.watch(ubuntuProStatusProvider);

    return Column(
      children: [
        const _UbuntuProAvailability(),
        if (provider.whenOrNull(data: (data) => data.available) ?? false) ...[
          const _ESMSection(),
          const _LivepatchSection(),
          TileList(
            children: [
              SecurityCenterListTile(
                title: l10n.ubuntuProCompliance,
                trailing: Icon(YaruIcons.pan_end),
                onTap: () {
                  navigator.push(
                    MaterialPageRoute(
                      builder: (_) => ComplianceHardeningPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          if (provider.whenOrNull(data: (data) => data.attached) ?? false)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const DetachDialog(),
                );
              },
              child: Text(l10n.ubuntuProDisablePro),
            ),
        ],
      ].separatedBy(const SizedBox(height: 24)),
    );
  }
}

class _UbuntuProAvailability extends ConsumerWidget {
  const _UbuntuProAvailability();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final provider = ref.watch(ubuntuProStatusProvider);

    return provider.whenOrNull(data: (data) => data.available) ?? false
        ? const _UbuntuProStatus()
        : Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 410),
                child: MarkdownText(
                  l10n.ubuntuProDisabled(
                    l10n.ubuntuProLearnMore.link(kUbuntuProLink),
                  ),
                  alignment: WrapAlignment.center,
                ),
              ),
              const SizedBox(height: 24),
              YaruBorderContainer(
                padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                child: Center(
                  child: ListTile(
                    leading: const Icon(YaruIcons.edit_clear, size: 24),
                    title: Text(l10n.ubuntuProNotSupported),
                    subtitle: Text(l10n.ubuntuProNotSupportedDetails),
                  ),
                ),
              ),
            ],
          );
  }
}

class _UbuntuProStatus extends ConsumerWidget {
  const _UbuntuProStatus();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final provider = ref.watch(ubuntuProStatusProvider);

    return provider.whenOrNull(data: (data) => data.attached) ?? false
        ? Column(
            children: [
              const SizedBox(height: 24),
              TileList(
                children: [
                  SecurityCenterListTile(
                    leading: const Icon(YaruIcons.checkmark, size: 24),
                    title: l10n.ubuntuProEnabled,
                  ),
                ],
              ),
            ],
          )
        : Column(
            children: [
              MarkdownText(
                l10n.ubuntuProDisabled(
                  l10n.ubuntuProLearnMore.link(kUbuntuProLink),
                ),
                alignment: WrapAlignment.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const AttachDialog(),
                ),
                child: Text(l10n.ubuntuProEnablePro),
              ),
              const SizedBox(height: 24),
            ],
          );
  }
}

class _ESMSection extends ConsumerWidget {
  const _ESMSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();

    final proProvider = ref.watch(ubuntuProStatusProvider);
    final esmAppProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeatureType.esmApps));
    final esmInfraProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeatureType.esmInfra));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.ubuntuProESMTitle,
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(l10n.ubuntuProESMDescription),
        TileList(
          children: [
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: esmInfraProvider.enabled,
              onChanged: esmInfraProvider.canToggle
                  ? (value) => ref
                      .read(
                        ubuntuProFeatureModelProvider(
                          UbuntuProFeatureType.esmInfra,
                        ).notifier,
                      )
                      .toggleFeature(value)
                  : null,
              title: _LoadingText(
                text: l10n.ubuntuProESMMainTitle,
                isLoading:
                    esmInfraProvider.state is UbuntuProFeatureStateLoading,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.ubuntuProESMMainDescription(
                      proProvider.whenOrNull(
                            data: (data) => data.eolDate?.year,
                          ) ??
                          now.year,
                    ),
                  ),
                  if (esmInfraProvider.state is UbuntuProFeatureStateError)
                    Text(
                      esmInfraProvider.enabled
                          ? l10n.ubuntuProFeatureDisableError
                          : l10n.ubuntuProFeatureEnableError,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: esmAppProvider.enabled,
              onChanged: esmAppProvider.canToggle
                  ? (value) => ref
                      .read(
                        ubuntuProFeatureModelProvider(
                          UbuntuProFeatureType.esmApps,
                        ).notifier,
                      )
                      .toggleFeature(value)
                  : null,
              title: _LoadingText(
                text: l10n.ubuntuProESMUniverseTitle,
                isLoading: esmAppProvider.state is UbuntuProFeatureStateLoading,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.ubuntuProESMUniverseDescription(
                      proProvider.whenOrNull(
                            data: (data) => data.eolDate?.year,
                          ) ??
                          now.year,
                    ),
                  ),
                  if (esmAppProvider.state is UbuntuProFeatureStateError)
                    Text(
                      esmAppProvider.enabled
                          ? l10n.ubuntuProFeatureDisableError
                          : l10n.ubuntuProFeatureEnableError,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ].separatedBy(const SizedBox(height: 12)),
    );
  }
}

class _LivepatchSection extends ConsumerWidget {
  const _LivepatchSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final livepatchProvider = ref
        .watch(ubuntuProFeatureModelProvider(UbuntuProFeatureType.livepatch));
    final statusIconProvider = ref.watch(gSettingsUpdateNotifierModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.ubuntuProLivepatchTitle,
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        TileList(
          children: [
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: livepatchProvider.enabled,
              onChanged: livepatchProvider.canToggle
                  ? (value) => ref
                      .read(
                        ubuntuProFeatureModelProvider(
                          UbuntuProFeatureType.livepatch,
                        ).notifier,
                      )
                      .toggleFeature(value)
                  : null,
              title: _LoadingText(
                text: l10n.ubuntuProLivepatchEnableTitle,
                isLoading:
                    livepatchProvider.state is UbuntuProFeatureStateLoading,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.ubuntuProLivepatchEnableDescription),
                  if (livepatchProvider.state is UbuntuProFeatureStateError)
                    Text(
                      livepatchProvider.enabled
                          ? l10n.ubuntuProFeatureDisableError
                          : l10n.ubuntuProFeatureEnableError,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
            YaruSwitchListTile(
              value: statusIconProvider.whenOrNull(
                    data: (data) => data.showStatusIcon,
                  ) ??
                  false,
              onChanged:
                  livepatchProvider.enabled && livepatchProvider.canToggle
                      ? (value) => ref
                          .read(gSettingsUpdateNotifierModelProvider.notifier)
                          .toggleStatusIcon(value)
                      : null,
              title: Text(l10n.ubuntuProLivepatchShowTitle),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
            ),
          ],
        ),
      ].separatedBy(const SizedBox(height: 12)),
    );
  }
}

class _LoadingText extends StatelessWidget {
  const _LoadingText({required this.text, required this.isLoading});

  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(text),
        if (isLoading) ...[
          const SizedBox(width: 8),
          SizedBox.square(
            dimension: theme.textTheme.bodyMedium?.fontSize,
            child: const YaruCircularProgressIndicator(strokeWidth: 2),
          ),
        ],
      ],
    );
  }
}
