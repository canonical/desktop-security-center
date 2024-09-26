import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:security_center/widgets/xdg_cache_manager.dart';
import 'package:yaru/yaru.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({required this.iconUrl, this.size = 32, super.key});

  final String? iconUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final placeholder = YaruPlaceholderIcon(size: Size.square(size));
    return iconUrl?.isEmpty ?? true
        ? placeholder
        : SizedBox(
            height: size,
            width: size,
            child: CachedNetworkImage(
              cacheManager: XdgCacheManager(),
              fadeInDuration: const Duration(milliseconds: 100),
              fadeOutDuration: const Duration(milliseconds: 200),
              imageUrl: iconUrl!,
              imageBuilder: (_, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.fitHeight,
              ),
              placeholder: (_, __) => placeholder,
              errorWidget: (_, __, ___) => placeholder,
            ),
          );
  }
}
