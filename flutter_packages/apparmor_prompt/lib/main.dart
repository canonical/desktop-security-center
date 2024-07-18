import 'package:apparmor_prompt/fake_apparmor_prompting_client.dart';
import 'package:apparmor_prompt/home/home_prompt_page.dart';
import 'package:apparmor_prompt/prompt_page.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

void main(List<String> args) async {
  // We specify path as an empty string in order to get ubuntu_logger to skip
  // setting up a file for logging
  Logger.setup(path: '', level: LogLevel.info);

  await YaruWindowTitleBar.ensureInitialized();
  registerService<AppArmorPromptingClient>(
    () => FakeApparmorPromptingClient.fromFile('lib/test_prompt_details.json'),
  );
  final currentPrompt =
      await getService<AppArmorPromptingClient>().getCurrentPrompt();
  registerServiceInstance<PromptDetails>(currentPrompt);
  runApp(const ProviderScope(child: PromptDialog()));
}

class PromptDialog extends StatelessWidget {
  const PromptDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
        title: title,
        theme: yaru.theme,
        darkTheme: yaru.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const PromptPage(),
      ),
    );
  }
}
