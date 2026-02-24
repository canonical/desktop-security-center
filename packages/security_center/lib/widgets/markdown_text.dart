import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MarkdownText extends StatelessWidget {
  const MarkdownText(
    this.data, {
    this.alignment,
    this.selectable = false,
    super.key,
  });

  final String data;

  final WrapAlignment? alignment;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context);

    return MarkdownBody(
      data: data,
      selectable: selectable,
      styleSheet: MarkdownStyleSheet(
        textAlign: alignment ?? WrapAlignment.start,
        p: textStyle.style,
        a: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTapLink: (text, href, title) {
        if (href != null) {
          launchUrlString(href);
        }
      },
    );
  }
}

extension MarkdownX on String {
  String bold() => '**$this**';
  String link(String url) => '[$this]($url)';
}
