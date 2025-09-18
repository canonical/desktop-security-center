import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapd/snapd.dart';
import 'package:yaru/yaru.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({required this.snapIcon, this.size = 32, super.key});

  final AsyncValue<SnapIcon?> snapIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final placeholder = YaruPlaceholderIcon(size: Size.square(size));
    return switch (snapIcon) {
      AsyncValue(:final value, hasValue: true) => value != null
          ? SizedBox.square(dimension: size, child: Image.memory(value.bytes))
          : placeholder,
      AsyncValue(hasError: true) => placeholder,
      _ => SizedBox.square(dimension: size),
    };
  }
}
