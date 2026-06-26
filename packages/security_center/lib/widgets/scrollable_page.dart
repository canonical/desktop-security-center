import 'package:flutter/material.dart';

const kPagePadding = 30.0;

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({
    required this.children,
    this.padding,
    this.controller,
    super.key,
  });

  final List<Widget> children;

  final EdgeInsetsGeometry? padding;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(kPagePadding),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 574),
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
