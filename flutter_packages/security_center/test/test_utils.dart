import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/rules_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.mocks.dart';

extension WidgetTesterX on WidgetTester {
  BuildContext get context => element(find.byType(Scaffold).first);

  Future<void> pumpApp(WidgetBuilder builder) async {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(body: Builder(builder: builder)),
      ),
    );
  }
}

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: [
      ...overrides,
    ],
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

@GenerateMocks([RulesService])
RulesService registerMockRulesService({List<SnapdRule> rules = const []}) {
  final service = MockRulesService();
  when(service.getRules()).thenAnswer((_) async => rules);

  registerMockService<RulesService>(service);
  addTearDown(unregisterService<RulesService>);
  return service;
}
