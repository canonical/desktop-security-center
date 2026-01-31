import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:security_center/ubuntu_pro/fips_dialog.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class ComplianceHardeningPage extends ConsumerWidget {
  const ComplianceHardeningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final usgProvider =
        ref.watch(ubuntuProFeatureModelProvider(UbuntuProFeature.usg));
    final fipsProvider = ref.watch(fIPSModelProvider);

    return ScrollablePage(
      children: [
        YaruInfoBox(
          yaruInfoType: YaruInfoType.warning,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(l10n.ubuntuProComplianceDisclaimer),
          ),
        ),
        TileList(
          children: [
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: usgProvider?.data.enabled ?? false,
              onChanged: usgProvider?.canToggle ?? false
                  ? (value) => ref
                      .read(
                        ubuntuProFeatureModelProvider(
                          UbuntuProFeature.usg,
                        ).notifier,
                      )
                      .toggleFeature(value)
                  : null,
              title: _LoadingText(
                text: l10n.ubuntuProComplianceUSGTitle,
                isLoading: usgProvider?.state is UbuntuProFeatureStateLoading,
              ),
              subtitle: Text(l10n.ubuntuProComplianceUSGDescription),
            ),
            YaruSwitchListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              value: fipsProvider.enabled,
              onChanged: fipsProvider.canEnable
                  ? (_) => showDialog(
                        context: context,
                        builder: (_) => const FIPSDialog(),
                      )
                  : null,
              title: Text(l10n.ubuntuProComplianceFIPSTitle),
              subtitle: Text(l10n.ubuntuProComplianceFIPSDescription),
            ),
          ],
        ),
        MarkdownText(
          l10n.ubuntuProComplianceDocumentation
              .link('https://ubuntu.com/security/certifications/docs'),
        ),
      ].separatedBy(const SizedBox(height: 24)),
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
