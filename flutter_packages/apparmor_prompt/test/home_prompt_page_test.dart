import 'package:apparmor_prompt/prompt_page.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.dart';

void main() {
  testWidgets('display prompt details', (tester) async {
    final container = createContainer();
    registerMockService<PromptDetails>(
      PromptDetails.home(
        metaData: MetaData(
          promptId: 'promptId',
          snapName: 'firefox',
          publisher: 'Mozilla',
          updatedAt: '2024-01-01',
        ),
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
      ),
    );
    addTearDown(unregisterService<PromptDetails>);
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
}
