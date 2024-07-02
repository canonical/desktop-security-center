import 'package:apparmor_prompt/prompt_data_model.dart';
import 'package:apparmor_prompt/prompt_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.dart';

void main() {
  testWidgets('display prompt details', (tester) async {
    final container = createContainer();
    registerMockService(
      PromptDetails(
        snapName: 'firefox',
        requestedPath: '/home/ubuntu/Downloads/file.txt',
        requestedPermissions: [Permission.read],
        availablePermissions: [
          Permission.read,
          Permission.write,
          Permission.execute,
        ],
        initialOptions: [
          InitialOption(
            buttonText: 'Allow always',
            reply: PromptReply(
              action: AccessPolicy.allow,
              lifespan: Lifespan.forever,
              pathPattern: '/home/ubuntu/Downloads/file.txt',
              permissions: [Permission.read],
            ),
          ),
        ],
        moreOptions: [
          MoreOption(
            description: 'Parent directory',
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
  });
}
