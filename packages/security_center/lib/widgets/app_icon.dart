import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:yaru/yaru.dart';

final _log = Logger('app_icon');

class AppIcon extends StatelessWidget {
  const AppIcon({required this.snapIcon, this.size = 32, super.key});

  final AsyncValue<SnapIcon?> snapIcon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final placeholder = YaruPlaceholderIcon(size: Size.square(size));
    return switch (snapIcon) {
      AsyncValue(:final value, hasValue: true) => value != null
          ? SizedBox.square(
              dimension: size,
              child: switch (value.contentType) {
                'image/svg+xml' => ScalableImageWidget(
                    si: ScalableImage.fromSvgString(
                      utf8.decode(value.bytes),
                      warnF: _log.debug,
                    ),
                  ),
                _ => Image.memory(
                    value.bytes,
                    errorBuilder: (_, e, __) {
                      _log.error('Error decoding snap icon: $e');
                      return SizedBox.shrink();
                    },
                  )
              },
            )
          : placeholder,
      AsyncValue(hasError: true) => placeholder,
      _ => SizedBox.square(dimension: size),
    };
  }
}
