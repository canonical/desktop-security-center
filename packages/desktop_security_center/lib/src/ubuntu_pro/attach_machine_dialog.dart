import 'package:desktop_security_center/src/config.dart';
import 'package:desktop_security_center/src/spacing.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';

class AttachMachineDialog extends StatelessWidget {
  const AttachMachineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Text(
                    l10n.attachThisMachine,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                ),
                color: Theme.of(context).dialogBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: kLargePadding),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: l10n.proDialogMagicAttach,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: l10n.proDialogMagicAttachLinkLabel,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrlString(
                                      '${kProMagicAttachLink}SN1FV2');
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: YaruColors.of(context).link,
                                      decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: kDefaultPadding, bottom: kLargePadding),
                      child: Row(
                        children: [
                          Text(
                            'SN1FV2',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 30),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              launchUrlString('${kProMagicAttachLink}SN1FV2');
                            },
                            child: Text(l10n.proDialogOpenInBrowser),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      l10n.proDialogAddTokenManually,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: l10n.proDialogTokenPlaceholder,
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: l10n.proDialogTokenDesc,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: l10n.proDialogTokenLinkLabel,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrlString(kProUbuntuProLink);
                                },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: YaruColors.of(context).link,
                                      decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: kLargePadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(l10n.proDialogCancel),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(l10n.proDialogAttach),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
