import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/l10n/app_localizations.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';
import 'package:security_center/widgets/iterable_extensions.dart';
import 'package:security_center/widgets/markdown_text.dart';
import 'package:security_center/widgets/scrollable_page.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';

const _kDialogWidth = 500.0;

class AttachDialog extends StatelessWidget {
  const AttachDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (_) => _AttachDialogContent()),
    );
  }
}

class _AttachDialogContent extends StatelessWidget {
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
      content: SizedBox(
        width: _kDialogWidth,
        child: ScrollablePage(
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
                      MaterialPageRoute(
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
                      MaterialPageRoute(
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
                        'ubuntu.com/pro/dashboard',
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

class _MagicLinkDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final magicAttachProvider = ref.watch(magicAttachModelProvider);

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
        onClose: Navigator.of(context, rootNavigator: true).pop,
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actions: magicAttachProvider.whenOrNull(
        data: (data) => data.validContract
            ? [
                ElevatedButton(
                  onPressed: () =>
                      ref.read(magicAttachModelProvider.notifier).attach(),
                  child: Text(l10n.ubuntuProEnable),
                ),
              ]
            : null,
      ),
      content: SizedBox(
        width: _kDialogWidth,
        child: ScrollablePage(
          children: [
            Text(l10n.ubuntuProMagicPrompt),
            Column(
              children: [
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: magicAttachProvider.whenOrNull(
                        data: (data) => data.validContract
                            ? null
                            : () => launchUrlString(
                                  'https://ubuntu.com/pro/attach?magic-attach-code=${data.response.userCode}',
                                ),
                      ),
                      child: magicAttachProvider.when(
                        data: (data) =>
                            Text(l10n.ubuntuProMagicContinueInBrowser),
                        error: (error, _) => Text(error.toString()),
                        loading: () => SizedBox.square(
                          dimension: theme.textTheme.bodyMedium?.fontSize,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
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
                if (magicAttachProvider.asData?.value.state
                    is UbuntuProAttachStateError) ...[
                  SizedBox(height: 8),
                  Text(
                    l10n.ubuntuProEnableTokenError,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ],
            ),
            if (magicAttachProvider.asData?.value.validContract == false)
              MarkdownText(
                l10n.ubuntuProMagicDescription(
                  'ubuntu.com/pro/attach'.link(
                    'https://ubuntu.com/pro/attach?magic-attach-code=${magicAttachProvider.asData!.value.response.userCode}',
                  ),
                  magicAttachProvider.asData!.value.response.userCode.bold(),
                ),
              ),
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
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final ubuntuProProvider = ref.watch(ubuntuProModelProvider);

    if (ubuntuProProvider.state is UbuntuProAttachStateSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

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
        onClose: Navigator.of(context, rootNavigator: true).pop,
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actions: [
        ElevatedButton(
          onPressed: ubuntuProProvider.validToken &&
                  ubuntuProProvider.state is! UbuntuProAttachStateLoading
              ? () => ref.read(ubuntuProModelProvider.notifier).attach()
              : null,
          child: Text(l10n.ubuntuProEnable),
        ),
      ],
      content: SizedBox(
        width: _kDialogWidth,
        child: ScrollablePage(
          children: [
            MarkdownText(
              l10n.ubuntuProTokenPrompt(
                'ubuntu.com/pro/dashboard'
                    .link('https://ubuntu.com/pro/dashboard'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: l10n.ubuntuProTokenLabel,
                errorText: ubuntuProProvider.state is UbuntuProAttachStateError
                    ? l10n.ubuntuProEnableTokenError
                    : null,
              ),
              onChanged: (value) =>
                  ref.read(ubuntuProModelProvider.notifier).setToken(value),
            ),
          ].separatedBy(const SizedBox(height: 24)),
        ),
      ),
    );
  }
}
