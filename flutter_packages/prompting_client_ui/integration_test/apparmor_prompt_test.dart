import 'package:flutter/material.dart' hide Action;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:prompting_client/prompting_client.dart';
import 'package:prompting_client_ui/fake_prompting_client.dart';
import 'package:prompting_client_ui/l10n_x.dart';
import 'package:prompting_client_ui/main.dart' as app;
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test/test_utils.dart';

void main() {
  tearDown(resetAllServices);
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  YaruTestWindow.ensureInitialized();

  testWidgets('UI dry-run', (tester) async {
    await app.main(['--dry-run']);
    await tester.pumpAndSettle();

    final fakeApparmorPromptingClient =
        getService<PromptingClient>() as FakeApparmorPromptingClient;
    fakeApparmorPromptingClient.onReply = (reply) => expect(
          reply,
          PromptReply.home(
            promptId: 'promptId',
            action: Action.deny,
            lifespan: Lifespan.session,
            pathPattern: '/home/ubuntu/**/',
            permissions: {
              Permission.write,
              Permission.execute,
            },
          ),
        );

    // Expand metadata section
    await tester.tap(find.text(tester.l10n.homePromptMetaDataTitle));
    await tester.pumpAndSettle();
    expect(
      find.text(tester.l10n.homePromptMetaDataPublishedBy('Mozilla')),
      findsOneWidget,
    );

    // Select 'custom prompt' to reveal text field
    await tester
        .tap(find.text(HomePatternType.customPath.localize(tester.l10n)));
    await tester.pumpAndSettle();

    // Enter custom path
    await tester.enterText(find.byType(TextField), '/home/ubuntu/**/');

    // Show more options
    await tester.tap(find.text(tester.l10n.homePromptMoreOptionsLabel));
    await tester.pumpAndSettle();

    // Select lifespan
    await tester.tap(find.text(Lifespan.session.localize(tester.l10n)));

    // De-select 'read' permission, select 'execute' permission
    await tester.tap(find.text(Permission.read.localize(tester.l10n)));
    await tester.tap(find.text(Permission.execute.localize(tester.l10n)));

    // Deny the request
    await tester.tap(find.text(Action.deny.localize(tester.l10n)));
    await tester.pumpAndSettle();
  });
}
