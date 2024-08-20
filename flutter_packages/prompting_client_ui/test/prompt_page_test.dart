import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prompting_client_ui/home/home_prompt_page.dart';
import 'package:prompting_client_ui/prompt_page.dart';

import 'test_utils.dart';

void main() {
  testWidgets('display home prompt', (tester) async {
    final container = createContainer();
    registerMockPromptDetails(
      promptDetails: mockPromptDetailsHome(
        requestedPath: '/home/ubuntu/Documents/foo.txt',
      ),
    );
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const PromptPage(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(HomePromptPage), findsOneWidget);
  });
}
