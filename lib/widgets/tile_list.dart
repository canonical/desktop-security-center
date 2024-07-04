import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class TileList extends StatelessWidget {
  const TileList({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return YaruBorderContainer(
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < children.length; index++) ...[
            children[index],
            if (index < children.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Divider(),
              ),
          ],
        ],
      ),
    );
  }
}
