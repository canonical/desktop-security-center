import 'package:apparmor_prompt/prompt_page.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';

void main() {
  final testDetails = mockPromptDetailsHome(
    promptId: 'promptId',
    snapName: 'firefox',
    publisher: 'Mozilla',
    updatedAt: '2024-01-01',
    requestedPath: '/home/ubuntu/Downloads/file.txt',
    requestedPermissions: [Permission.read],
    availablePermissions: [
      Permission.read,
      Permission.write,
      Permission.execute,
    ],
    moreOptions: [
      MoreOption(
        homePatternType: HomePatternType.topLevelDirectory,
        pathPattern: '/home/ubuntu/Downloads/**',
      ),
    ],
  );
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('display prompt details', (tester) async {
    final container = createContainer();
    registerMockPromptDetails(
      promptDetails: testDetails,
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const PromptPage(),
      ),
    );

    expect(
      find.text(
        'Allow firefox to have read access to /home/ubuntu/Downloads/file.txt?',
      ),
      findsOneWidget,
    );

    expect(find.text('Published by Mozilla'), findsOneWidget);
  });

  testWidgets('submit prompt reply', (tester) async {
    final container = createContainer();
    registerMockPromptDetails(
      promptDetails: testDetails,
    );
    final client = registerMockAppArmorPromptingClient(
      promptDetails: testDetails,
      replyResponse: PromptReplyResponse.success(),
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const PromptPage(),
      ),
    );

    await tester.tap(find.text(HomePatternType.customPath.name));
    await tester.tap(find.text('Deny'));
    await tester.tap(find.text('Until logout'));
    await tester.tap(find.text('Write'));

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(find.text('Save and continue'));
    await tester.pumpAndSettle();

    verify(
      client.replyToPrompt(
        PromptReply.home(
          promptId: 'promptId',
          action: Action.deny,
          lifespan: Lifespan.session,
          pathPattern: '/home/ubuntu/Downloads/file.txt',
          permissions: [Permission.read, Permission.write],
        ),
      ),
    ).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('show custom path error', (tester) async {
    final container = createContainer();
    registerMockPromptDetails(
      promptDetails: testDetails,
    );
    registerMockAppArmorPromptingClient(
      promptDetails: testDetails,
      replyResponse: PromptReplyResponse.unknown(message: 'error message'),
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const PromptPage(),
      ),
    );

    await tester.tap(find.text(HomePatternType.customPath.name));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'invalid path');
    await tester.tap(find.text('Save and continue'));
    await tester.pumpAndSettle();

    expect(find.text('error message'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'another path');
    await tester.pumpAndSettle();

    expect(find.text('error message'), findsNothing);
  });
}
