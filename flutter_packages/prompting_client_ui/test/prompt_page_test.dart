import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prompting_client_ui/home/home_prompt_page.dart';
import 'package:prompting_client_ui/prompt_page.dart';

import 'test_utils.dart';

void main() {
  testWidgets('display home prompt', (tester) async {
    final container = createContainer();
    registerMockPromptDetails(promptDetails: mockPromptDetailsHome());
    await tester.pumpApp(
      (_) => UncontrolledProviderScope(
        container: container,
        child: const PromptPage(),
      ),
    );
    expect(find.byType(HomePromptPage), findsOneWidget);
  });
}
