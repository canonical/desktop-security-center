import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Hyperlink extends StatelessWidget {
  const Hyperlink({
    required this.text,
    required this.url,
    super.key,
  });

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: () => launchUrlString(url),
            focusColor:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            hoverColor:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
