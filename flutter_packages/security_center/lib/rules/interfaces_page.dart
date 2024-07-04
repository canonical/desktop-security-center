import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/rules/interface_x.dart';
import 'package:security_center/rules/rules_providers.dart';
import 'package:security_center/rules/snaps_page.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:security_center/widgets/tile_list.dart';
import 'package:yaru/yaru.dart';

class InterfacesPage extends ConsumerWidget {
  const InterfacesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(interfacesProvider);
    return model.when(
      data: (interfaces) => _Body(interfaces: interfaces),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.interfaces});

  final List<String> interfaces;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tiles = interfaces
        .map(
          (interface) => ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Icon(interface.snapdInterfaceIcon, size: 48),
            title: Text(interface.localizeSnapdInterfaceTitle(l10n)),
            trailing: const Icon(YaruIcons.pan_end),
            onTap: () => Navigator.of(context).push(
              SnapsPage.route(interface: interface),
            ),
          ),
        )
        .toList();
    return ScrollablePage(
      children: [
        YaruBorderContainer(
          child: YaruSwitchListTile(
            title: Row(
              children: [
                Text(l10n.snapPermissionsEnableTitle),
                const SizedBox(width: 10),
                YaruInfoBadge(
                  title: Text(l10n.snapPermissionsExperimentalLabel),
                  yaruInfoType: YaruInfoType.information,
                ),
              ],
            ),
            subtitle: Text(l10n.snapPermissionsEnableWarning),
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 16),
        TileList(children: tiles),
        const SizedBox(height: 16),
        Text(l10n.snapPermissionsOtherDescription),
      ],
    );
  }
}
