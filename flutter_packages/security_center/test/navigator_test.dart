import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/navigator.dart';
import 'package:security_center/routes.dart';

import 'test_utils.dart';

void main() {
  group('push snap permissions', () {
    final testCases = [
      (
        name: 'interface and snap',
        snap: 'firefox',
        interface: 'home',
        expectedRoute: Routes.appPermissions.route,
        expectedParamters: {'interface': 'home', 'snap': 'firefox'},
      ),
      (
        name: 'only interface',
        snap: null,
        interface: 'home',
        expectedRoute: Routes.appPermissions.route,
        expectedParamters: {'interface': 'home'},
      ),
      (
        name: 'only snap',
        snap: 'firefox',
        interface: null,
        expectedRoute: Routes.appPermissions.route,
        expectedParamters: {'snap': 'firefox'},
      ),
      (
        name: 'no parameters',
        snap: null,
        interface: null,
        expectedRoute: Routes.appPermissions.route,
        expectedParamters: <String, String>{},
      ),
    ];

    for (final testCase in testCases) {
      testWidgets(testCase.name, (tester) async {
        late final String generatedRoute;
        await tester.pumpWidget(
          MaterialApp(
            home: const Scaffold(),
            onGenerateRoute: (settings) {
              expect(settings.arguments, isNull);
              generatedRoute = settings.name!;
              return MaterialPageRoute(builder: (_) => Text(settings.name!));
            },
          ),
        );
        unawaited(
          Navigator.of(tester.context).pushSnapPermissions(
            interface: testCase.interface,
            snap: testCase.snap,
          ),
        );
        await tester.pump();

        expect(
          Uri(
            path: testCase.expectedRoute,
            queryParameters: testCase.expectedParamters,
          ),
          Uri.parse(generatedRoute),
        );
      });
    }
  });
  testWidgets('navigator observer', (tester) async {
    final container = createContainer();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Consumer(
          builder: (context, ref, _) {
            return MaterialApp(
              home: const Scaffold(),
              routes: {
                '/foo': (_) => const SizedBox(),
                '/bar': (_) => const SizedBox(),
              },
              navigatorObservers: [AppNavigatorObserver(ref)],
            );
          },
        ),
      ),
    );
    await tester.pump();

    // final navigator = container.read(appNavigatorProvider);
    // unawaited(navigator.currentState!.pushNamed(Routes.appPermissions.route));
    unawaited(Navigator.of(tester.context).pushNamed('/foo'));
    await tester.pump();

    expect(
      container.read(routeSettingsProvider),
      isA<RouteSettings>().having(
        (settings) => settings.name,
        'name',
        '/foo',
      ),
    );

    unawaited(Navigator.of(tester.context).pushNamed('/bar'));
    await tester.pump();

    expect(
      container.read(routeSettingsProvider),
      isA<RouteSettings>().having(
        (settings) => settings.name,
        'name',
        '/bar',
      ),
    );

    Navigator.of(tester.context).pop();
    await tester.pump();

    expect(
      container.read(routeSettingsProvider),
      isA<RouteSettings>().having(
        (settings) => settings.name,
        'name',
        '/foo',
      ),
    );

    unawaited(Navigator.of(tester.context).pushReplacementNamed('/bar'));
    await tester.pump();

    expect(
      container.read(routeSettingsProvider),
      isA<RouteSettings>().having(
        (settings) => settings.name,
        'name',
        '/bar',
      ),
    );
  });
}
