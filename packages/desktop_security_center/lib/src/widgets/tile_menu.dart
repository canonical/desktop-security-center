import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';

class TileMenu extends StatelessWidget {
  const TileMenu({required this.tiles, super.key});

  final List<Tile> tiles;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final tile in tiles)
            if (tile != tiles.last)
              Column(
                children: [
                  tile,
                  const Divider(),
                ],
              )
            else
              tile,
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    required this.label,
    required this.subLabel,
    required this.icon,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String label;
  final String subLabel;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(subLabel),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(YaruIcons.go_next),
          )
        ],
      ),
    );
  }
}
