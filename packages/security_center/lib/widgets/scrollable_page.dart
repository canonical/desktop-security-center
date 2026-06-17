import 'package:flutter/material.dart';

const kPagePadding = 30.0;

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({
    required this.children,
    this.padding,
    super.key,
  });

  final List<Widget> children;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 575),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(kPagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
