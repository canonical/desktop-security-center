import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter/material.dart' hide MetaData;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.mocks.dart';

extension WidgetTesterX on WidgetTester {
  BuildContext get context => element(find.byType(Scaffold).first);

  Future<void> pumpApp(WidgetBuilder builder) async {
    // The intended minimum size of the window.
    view.physicalSize = (const Size(760, 690)) * view.devicePixelRatio;
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

PromptDetails mockPromptDetailsHome({
  String? promptId,
  String? snapName,
  String? publisher,
  String? updatedAt,
  String? requestedPath,
  List<Permission>? requestedPermissions,
  List<Permission>? availablePermissions,
  List<MoreOption>? moreOptions,
}) =>
    PromptDetails.home(
      metaData: MetaData(
        promptId: promptId ?? '',
        snapName: snapName ?? '',
        publisher: publisher ?? '',
        updatedAt: updatedAt ?? '',
      ),
      requestedPath: requestedPath ?? '',
      requestedPermissions: requestedPermissions ?? [],
      availablePermissions: availablePermissions ?? [],
      moreOptions: moreOptions ?? [],
    );

PromptDetails registerMockPromptDetails({
  required PromptDetails promptDetails,
}) {
  registerMockService<PromptDetails>(promptDetails);
  addTearDown(() => unregisterService<PromptDetails>());
  return promptDetails;
}

@GenerateMocks([AppArmorPromptingClient])
AppArmorPromptingClient registerMockAppArmorPromptingClient({
  required PromptDetails promptDetails,
  PromptReplyResponse? replyResponse,
}) {
  provideDummy<PromptDetails>(mockPromptDetailsHome());
  provideDummy<PromptReplyResponse>(PromptReplyResponse.unknown(message: ''));
  final client = MockAppArmorPromptingClient();
  when(client.getCurrentPrompt()).thenAnswer((_) async => promptDetails);
  when(client.replyToPrompt(any)).thenAnswer(
    (_) async => replyResponse ?? PromptReplyResponse.unknown(message: ''),
  );

  registerMockService<AppArmorPromptingClient>(client);
  addTearDown(() => unregisterService<AppArmorPromptingClient>());
  return client;
}
