import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/constants.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';

class AttachDialog extends StatelessWidget {
  const AttachDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const _AttachDialogContent()),
    );
  }
}

class _AttachDialogContent extends StatelessWidget {
  const _AttachDialogContent();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProEnablePro),
        onClose: Navigator.of(context, rootNavigator: true).pop,
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        constraints: BoxConstraints(maxWidth: kDialogWidth),
        child: ScrollablePage(
          padding: const EdgeInsets.all(kPageSectionGap),
          children: [
            YaruBorderContainer(
              child: Column(
                children: [
                  YaruListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _MagicLinkDialog(),
                      ),
                    ),
                    titleText: l10n.ubuntuProEnableMagic,
                    subtitle: Text(l10n.ubuntuProEnableMagicSubtitle),
                    trailing: Icon(YaruIcons.go_next),
                  ),
                  const Divider(),
                  YaruListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const _TokenDialog(),
                      ),
                    ),
                    titleText: l10n.ubuntuProEnableToken,
                    subtitle: MarkdownText(
                      l10n.ubuntuProEnableTokenSubtitle(
                        'ubuntu.com/pro/dashboard',
                      ),
                    ),
                    trailing: Icon(YaruIcons.go_next),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MagicLinkDialog extends ConsumerWidget {
  const _MagicLinkDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final magicAttachProvider = ref.watch(magicAttachModelProvider);

    return AlertDialog(
      title: YaruDialogTitleBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: Navigator.of(context).canPop(),
              child: YaruBackButton(
                style: YaruBackButtonStyle.rounded,
                onPressed: Navigator.of(context).pop,
              ),
            ),
            Flexible(child: Center(child: Text(l10n.ubuntuProEnableMagic))),
          ],
        ),
        onClose: Navigator.of(context, rootNavigator: true).pop,
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actions: magicAttachProvider.whenOrNull(
        data: (data) => data.validContract
            ? [
                ElevatedButton(
                  onPressed: () {
                    ref.read(ubuntuProPageModelProvider.notifier).attach(
                          data.response.contractToken!,
                        );
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(l10n.ubuntuProEnable),
                ),
              ]
            : null,
      ),
      content: Container(
        constraints: const BoxConstraints(maxWidth: kDialogWidth),
        child: ScrollablePage(
          padding: const EdgeInsets.all(kPageSectionGap),
          children: [
            Text(l10n.ubuntuProMagicPrompt),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: magicAttachProvider.whenOrNull(
                        data: (data) => data.validContract
                            ? null
                            : () => launchUrlString(
                                  getUbuntuProMagicLink(data.response.userCode),
                                ),
                      ),
                      child: magicAttachProvider.when(
                        data: (data) =>
                            Text(l10n.ubuntuProMagicContinueInBrowser),
                        error: (error, _) => Text(error.toString()),
                        loading: () => SizedBox.square(
                          dimension: theme.textTheme.bodyMedium?.fontSize,
                          child: YaruCircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: magicAttachProvider.whenOrNull(
                            data: (data) => data.validContract,
                          ) ??
                          false,
                      child: Icon(
                        YaruIcons.ok,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (magicAttachProvider.asData?.value.validContract == false)
              MarkdownText(
                selectable: true,
                l10n.ubuntuProMagicDescription(
                  'ubuntu.com/pro/attach'.link(
                    getUbuntuProMagicLink(
                      magicAttachProvider.asData!.value.response.userCode,
                    ),
                  ),
                  magicAttachProvider.asData!.value.response.userCode.bold(),
                ),
              ),
          ].separatedBy(const SizedBox(height: kPageSubsectionGap)),
        ),
      ),
    );
  }
}

class _TokenDialog extends ConsumerStatefulWidget {
  const _TokenDialog();

  @override
  ConsumerState<_TokenDialog> createState() => _TokenDialogState();
}

class _TokenDialogState extends ConsumerState<_TokenDialog> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final provider = ref.watch(ubuntuProAttachModelProvider);

    return AlertDialog(
      title: YaruDialogTitleBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: Navigator.of(context).canPop(),
              child: YaruBackButton(
                style: YaruBackButtonStyle.rounded,
                onPressed: Navigator.of(context).pop,
              ),
            ),
            Flexible(child: Center(child: Text(l10n.ubuntuProEnableToken))),
          ],
        ),
        onClose: Navigator.of(context, rootNavigator: true).pop,
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actions: [
        ElevatedButton(
          onPressed: !provider.validToken
              ? null
              : () {
                  ref
                      .read(ubuntuProPageModelProvider.notifier)
                      .attach(provider.token);
                  Navigator.of(context, rootNavigator: true).pop();
                },
          child: Text(l10n.ubuntuProEnable),
        ),
      ],
      content: Container(
        constraints: const BoxConstraints(maxWidth: kDialogWidth),
        child: ScrollablePage(
          padding: const EdgeInsets.all(kPageSectionGap),
          children: [
            MarkdownText(
              l10n.ubuntuProTokenPrompt(
                'ubuntu.com/pro/dashboard'.link(kUbuntuProDashboardLink),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: l10n.ubuntuProTokenLabel,
              ),
              onChanged: (value) => ref
                  .read(ubuntuProAttachModelProvider.notifier)
                  .setToken(value),
            ),
          ].separatedBy(const SizedBox(height: kPageSubsectionGap)),
        ),
      ),
    );
  }
}
