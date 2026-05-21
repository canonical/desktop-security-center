import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/widgets/yaru_popup_menu_item.dart';

import '../test_utils.dart';

void main() {
  testWidgets('autofocus lets keyboard activate the menu item', (tester) async {
    int? selected;

    await tester.pumpApp(
      (_) => Center(
        child: PopupMenuButton<int>(
          itemBuilder: (_) => const [
            YaruPopupMenuItem<int>(
              value: 1,
              autofocus: true,
              child: Text('First'),
            ),
            YaruPopupMenuItem<int>(
              value: 2,
              child: Text('Second'),
            ),
          ],
          onSelected: (value) => selected = value,
          child: const Text('Open'),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();

    expect(selected, 1);
  });
}
