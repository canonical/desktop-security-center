import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  });

  final String titleLabel;
  final String descriptionLabel;
  final bool switchValue;
  final VoidCallback onChanged;
  final String? descriptionLinkLabel;
  final String? descriptionLinkUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleLabel,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
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
                                        decoration: TextDecoration.underline,
                                      ),
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
              value: false,
              onChanged: (_) {},
            ),
          ],
        ),
      ],
    );
  }
}
