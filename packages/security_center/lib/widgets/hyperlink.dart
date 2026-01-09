import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru/constants.dart';

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
    return _HyperlinkFocusBorder(
      url: url,
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
  }
}

class _HyperlinkFocusBorder extends StatefulWidget {
  const _HyperlinkFocusBorder({
    required this.url,
    required this.child,
  });

  final String url;
  final Widget child;

  @override
  State<_HyperlinkFocusBorder> createState() => _HyperlinkFocusBorderState();
}

class _HyperlinkFocusBorderState extends State<_HyperlinkFocusBorder> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const borderWidth = 2.0;

    return AnimatedContainer(
      duration: Durations.medium1,
      foregroundDecoration: BoxDecoration(
        border: _focused
            ? Border.all(
                strokeAlign: 3,
                color: theme.colorScheme.primary,
                width: borderWidth,
              )
            : null,
        borderRadius:
            const BorderRadius.all(Radius.circular(kYaruButtonRadius + 2)),
      ),
      child: InkWell(
        onTap: () => launchUrlString(widget.url),
        onFocusChange: (value) => setState(() => _focused = value),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        borderRadius:
            const BorderRadius.all(Radius.circular(kYaruButtonRadius + 2)),
        child: widget.child,
      ),
    );
  }
}
