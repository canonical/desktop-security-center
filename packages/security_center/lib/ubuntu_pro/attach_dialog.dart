import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';

class AttachDialog extends StatelessWidget {
  const AttachDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(l10n.ubuntuProEnablePro),
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YaruBorderContainer(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    onTap: () => Navigator.of(context).push(
                      DialogRoute(
                        context: context,
                        builder: (context) => _MagicLinkDialog(),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.ubuntuProEnableMagic),
                        YaruIconButton(icon: Icon(Icons.chevron_right)),
                      ],
                    ),
                    subtitle: Text(l10n.ubuntuProEnableMagicSubtitle),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    onTap: () => Navigator.of(context).push(
                      DialogRoute(
                        context: context,
                        builder: (context) => _TokenDialog(),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.ubuntuProEnableToken),
                        YaruIconButton(icon: Icon(Icons.chevron_right)),
                      ],
                    ),
                    subtitle: MarkdownText(
                      l10n.ubuntuProEnableTokenSubtitle(
                        'ubuntu.com/pro/dashboard'
                            .link('https://ubuntu.com/pro/dashboard'),
                      ),
                    ),
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

class _MagicLinkDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final code = 'ABCDEF'; // TODO: implement magic attach

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Row(
          children: [
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
            const Spacer(),
            Text(l10n.ubuntuProEnableMagic),
            const Spacer(),
          ],
        ),
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.ubuntuProMagicPrompt),
            OutlinedButton(
              onPressed: () => launchUrlString(
                'https://ubuntu.com/pro/attach?magic-attach-code=$code',
              ),
              child: Text(l10n.ubuntuProMagicContinueInBrowser),
            ),
            MarkdownText(
              l10n.ubuntuProMagicDescription(
                'ubuntu.com/pro/attach'.link('https://ubuntu.com/pro/attach'),
                code,
              ),
            )
          ].separatedBy(const SizedBox(height: 24)),
        ),
      ),
    );
  }
}

class _TokenDialog extends ConsumerStatefulWidget {
  @override
  ConsumerState<_TokenDialog> createState() => _TokenDialogState();
}

class _TokenDialogState extends ConsumerState<_TokenDialog> {
  final textController = TextEditingController();
  bool canInput = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final ubuntuProProvider = ref.watch(ubuntuProModelProvider);

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Row(
          children: [
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
            const Spacer(),
            Text(l10n.ubuntuProEnableToken),
            const Spacer(),
          ],
        ),
      ),
      titlePadding: EdgeInsets.zero,
      actions: [
        ElevatedButton(
          onPressed: canInput
              ? () async {
                  setState(() {
                    canInput = false;
                  });
                  await ref
                      .read(ubuntuProModelProvider.notifier)
                      .attach(textController.text);
                  setState(() {
                    canInput = true;
                  });
                }
              : null,
          child: ubuntuProProvider.whenOrNull(
                loading: () => SizedBox.square(
                  dimension: theme.textTheme.bodyMedium?.fontSize,
                  child: CircularProgressIndicator(),
                ),
              ) ??
              Text(l10n.ubuntuProEnable),
        ),
      ],
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MarkdownText(
              l10n.ubuntuProTokenPrompt(
                'ubuntu.com/pro/dashboard'
                    .link('https://ubuntu.com/pro/dashboard'),
              ),
            ),
            TextField(
              enabled: canInput,
              decoration: InputDecoration(
                labelText: l10n.ubuntuProTokenLabel,
                errorMaxLines: 2,
                errorText: ubuntuProProvider.whenOrNull(
                  error: (error, stackTrace) => error.toString(),
                ),
              ),
              controller: textController,
            ),
          ].separatedBy(const SizedBox(height: 24)),
        ),
      ),
    );
  }
}
