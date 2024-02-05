import 'package:desktop_security_center/src/config.dart';
import 'package:desktop_security_center/src/spacing.dart';
import 'package:desktop_security_center/src/ubuntu_pro/attach_machine_dialog.dart';
import 'package:desktop_security_center/src/widgets/feature_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';

class UbuntuProPage extends ConsumerStatefulWidget {
  const UbuntuProPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return const UbuntuProPage();
  }

  static ({IconData iconData, String label}) pageDetail(BuildContext context) =>
      (
        iconData: YaruIcons.ubuntu_logo_simple,
        label: AppLocalizations.of(context).ubuntuPro,
      );

  @override
  ConsumerState<UbuntuProPage> createState() => _UbuntuProPageState();
}

class _UbuntuProPageState extends ConsumerState<UbuntuProPage> {
  bool isProEnabled = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kLargePadding),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/ubuntu_pro.svg',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kLargePadding),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isProEnabled ? YaruIcons.error : YaruIcons.ok,
                        color: isProEnabled
                            ? YaruColors.of(context).error
                            : YaruColors.of(context).success,
                      ),
                      const SizedBox(width: 10),
                      Text(isProEnabled
                          ? l10n.ubuntuProDisabled
                          : l10n.ubuntuProEnabled),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(l10n.getUbuntuPro),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AttachMachineDialog(),
                        );
                      },
                      child: Text(l10n.attachThisMachine),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                Text(
                  l10n.ubuntuProFreeDesc,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: kLargePadding * 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.esmLabel,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                l10n.esmDesc,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: FeatureSwitch(
              titleLabel: l10n.proEsmMainPackages,
              descriptionLabel: l10n.proEsmMainPackagesDesc,
              switchValue: false,
              onChanged: () {},
            ),
          ),
          FeatureSwitch(
            titleLabel: l10n.proEsmUniversePackages,
            descriptionLabel: l10n.proEsmUniversePackagesDesc,
            switchValue: false,
            onChanged: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kLargePadding),
            child: Divider(),
          ),
          FeatureSwitch(
            titleLabel: l10n.proKernelLivepatchLabel,
            descriptionLabel: l10n.proKernelLivepatchDesc,
            switchValue: false,
            onChanged: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (_) {},
                ),
                Expanded(
                  child: Text(l10n.proShowLivepatchStatusInTopBar),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kLargePadding),
            child: Divider(),
          ),
          Text(
            l10n.proComplianceAndHardening,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 238, 229, 0.5),
                border: Border.all(color: const Color.fromRGBO(199, 90, 0, 1)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(
                    YaruIcons.warning,
                    //TODO: Add colors to YaruColor
                    color: Color.fromRGBO(199, 90, 0, 1),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.proComplianceAndHardeningWarning,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          FeatureSwitch(
            titleLabel: l10n.proUsg,
            descriptionLabel: l10n.proUsgDesc,
            switchValue: false,
            descriptionLinkLabel: l10n.proUsgDocumentation,
            descriptionLinkUrl: kUsgDocumentationLink,
            onChanged: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: FeatureSwitch(
              titleLabel: l10n.proFips,
              descriptionLabel: l10n.proFipsDesc,
              switchValue: false,
              descriptionLinkLabel: l10n.proFipsDocumentation,
              descriptionLinkUrl: kFipsDocumentationLink,
              onChanged: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding, bottom: kLargePadding),
            child: OutlinedButton(
              onPressed: () {},
              child: Text(l10n.proDisablePro),
            ),
          ),
        ]),
      ),
    );
  }
}
