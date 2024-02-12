import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class FeatureSwitch extends StatelessWidget {
  const FeatureSwitch({
    required this.titleLabel,
    required this.descriptionLabel,
    required this.switchValue,
    required this.onChanged,
    super.key,
    this.descriptionLinkLabel,
    this.descriptionLinkUrl,
    this.isExperimental = false,
  });

  final String titleLabel;
  final String descriptionLabel;
  final bool switchValue;
  final VoidCallback onChanged;
  final String? descriptionLinkLabel;
  final String? descriptionLinkUrl;
  final bool isExperimental;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        titleLabel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      if (isExperimental)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: const Color.fromRGBO(36, 89, 143, 1)
                                .withOpacity(0.1),
                            border: Border.all(
                              color: const Color.fromRGBO(36, 89, 143, 1),
                            ),
                          ),
                          child: Text(
                            l10n.snapExperimental,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: descriptionLabel,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              if (descriptionLinkLabel != null &&
                                  descriptionLinkUrl != null)
                                TextSpan(
                                  text: descriptionLinkLabel,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrlString(descriptionLinkUrl!);
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
                    ],
                  ),
                ],
              ),
            ),
            YaruSwitch(
              value: switchValue,
              onChanged: (_) {
                onChanged.call();
              },
            ),
          ],
        ),
      ],
    );
  }
}
