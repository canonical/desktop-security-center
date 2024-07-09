import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';
import 'package:security_center/security_center_app.dart';
import 'package:yaru/yaru.dart';

import 'test_utils.dart';

void main() {
  group('app routes', () {
    for (final route in Routes.values) {
      testWidgets('route ${route.route}', (tester) async {
        final container = createContainer();
        await tester.pumpApp(
          (_) => UncontrolledProviderScope(
            container: container,
            child: const SecurityCenterApp(),
          ),
        );
        await tester.pump();

        final navigator = container.read(appNavigatorProvider);
        unawaited(navigator.currentState!.pushNamed(route.route));
        await tester.pump();

        expect(
          find.descendant(
            of: find.byType(YaruWindowTitleBar),
            matching: find.text(route.title(tester.l10n)),
          ),
          findsOneWidget,
        );
      });
    }
  });
}
