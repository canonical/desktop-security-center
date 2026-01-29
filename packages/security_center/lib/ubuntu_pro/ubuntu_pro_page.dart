import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/routes.dart';
import 'package:security_center/ubuntu_pro/attach_dialog.dart';
import 'package:security_center/ubuntu_pro/detatch_dialog.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/security_center_list_tile.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class UbuntuProPage extends ConsumerWidget {
  const UbuntuProPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final navigator = Navigator.of(context);

    final availabilityProvider = ref.watch(ubuntuProAvailabilityModelProvider);

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
        _UbuntuProAvailability(),
        if (availabilityProvider.value != null &&
            availabilityProvider.value!.available) ...[
          _ESMSection(),
          _LivepatchSection(),
          TileList(
            children: [
              SecurityCenterListTile(
                title: l10n.ubuntuProCompliance,
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  navigator.pushNamed(Routes.compliance.route);
                },
              ),
            ],
          ),
          ref.watch(ubuntuProModelProvider).attached
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: YaruColors.red,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const DetachDialog(),
                    );
                  },
                  child: Text(l10n.ubuntuProDisablePro),
                )
              : SizedBox.shrink(),
        ],
      ].separatedBy(const SizedBox(height: 24)),
    );
  }
}

class _UbuntuProAvailability extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return ref.watch(ubuntuProAvailabilityModelProvider).when(
          data: (data) => data.available
              ? _UbuntuProStatus()
              : Column(
                  children: [
                    MarkdownText(
                      l10n.ubuntuProDisabled(
                        l10n.ubuntuProLearnMore.link('https://ubuntu.com/pro'),
                      ),
                      alignment: WrapAlignment.center,
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
                ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: YaruCircularProgressIndicator()),
        );
  }
}

class _UbuntuProStatus extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return ref.watch(ubuntuProModelProvider).attached
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
                  l10n.ubuntuProLearnMore.link('https://ubuntu.com/pro'),
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final esmAppProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.esmApps));
    final esmInfraProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.esmInfra));

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
              value: esmInfraProvider.whenOrNull(
                    data: (data) => data != null && data.enabled,
                  ) ??
                  false,
              onChanged: esmInfraProvider.whenOrNull(
                data: (data) => data != null && data.entitled
                    ? (value) => ref
                        .read(
                          ubuntuProFeatureModelProvider(
                            UbuntuProFeature.esmInfra,
                          ).notifier,
                        )
                        .toggleFeature(value)
                    : null,
              ),
              title: _LoadingText(
                text: l10n.ubuntuProESMMainTitle,
                isLoading: esmInfraProvider.isLoading,
              ),
              subtitle: Text(l10n.ubuntuProESMMainDescription),
            ),
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: esmAppProvider.whenOrNull(
                    data: (data) => data != null && data.enabled,
                  ) ??
                  false,
              onChanged: esmAppProvider.whenOrNull(
                data: (data) => data != null && data.entitled
                    ? (value) => ref
                        .read(
                          ubuntuProFeatureModelProvider(
                            UbuntuProFeature.esmApps,
                          ).notifier,
                        )
                        .toggleFeature(value)
                    : null,
              ),
              title: _LoadingText(
                text: l10n.ubuntuProESMUniverseTitle,
                isLoading: esmAppProvider.isLoading,
              ),
              subtitle: Text(l10n.ubuntuProESMUniverseDescription),
            ),
          ],
        )
      ].separatedBy(const SizedBox(height: 12)),
    );
  }
}

class _LivepatchSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final livepatchProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.livepatch));
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
              value: livepatchProvider.whenOrNull(
                    data: (data) => data != null && data.enabled,
                  ) ??
                  false,
              onChanged: livepatchProvider.whenOrNull(
                data: (data) => data != null && data.entitled
                    ? (value) => ref
                        .read(
                          ubuntuProFeatureModelProvider(
                            UbuntuProFeature.livepatch,
                          ).notifier,
                        )
                        .toggleFeature(value)
                    : null,
              ),
              title: _LoadingText(
                text: l10n.ubuntuProLivepatchEnableTitle,
                isLoading: livepatchProvider.isLoading,
              ),
              subtitle: Text(l10n.ubuntuProLivepatchEnableDescription),
            ),
            YaruSwitchListTile(
              value: statusIconProvider.whenOrNull(
                    data: (data) => data.showStatusIcon,
                  ) ??
                  false,
              onChanged: (value) => ref
                  .read(gSettingsUpdateNotifierModelProvider.notifier)
                  .toggleStatusIcon(value),
              title: Text(l10n.ubuntuProLivepatchShowTitle),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
            ),
          ],
        )
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
            child: CircularProgressIndicator(),
          ),
        ],
      ],
    );
  }
}
