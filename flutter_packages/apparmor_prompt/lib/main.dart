import 'dart:io';

import 'package:apparmor_prompt/fake_apparmor_prompting_client.dart';
import 'package:apparmor_prompt/home/home_prompt_page.dart';
import 'package:apparmor_prompt/prompt_page.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:args/args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

const envVarSocketPath = 'AA_PROMPTING_CLIENT_SOCKET';
const envVarPort = 'AA_PROMPTING_CLIENT_PORT';

void main(List<String> args) async {
  // We specify path as an empty string in order to get ubuntu_logger to skip
  // setting up a file for logging
  Logger.setup(path: '', level: LogLevel.info);
  final log = Logger('apparmor_prompt');

  await YaruWindowTitleBar.ensureInitialized();

  final parser = ArgParser()
    ..addFlag(
      'dry-run',
      help: 'Use a fake apparmor prompting client',
    )
    ..addOption(
      'test-prompt',
      help: 'Path to a JSON file containing the test prompt',
      defaultsTo: 'lib/test_prompt_details.json',
    );

  final ArgResults argResults;
  try {
    argResults = parser.parse(args);
  } on FormatException catch (_) {
    stdout.writeln(parser.usage);
    exit(2);
  }

  if (argResults.flag('dry-run')) {
    final fileName = argResults['test-prompt'] as String;
    if (!File(fileName).existsSync()) {
      log.error('Test prompt file $fileName does not exist');
      exit(1);
    }
    registerService<AppArmorPromptingClient>(
      () => FakeApparmorPromptingClient.fromFile(fileName),
    );
  } else {
    final socketPath = Platform.environment[envVarSocketPath];
    if (socketPath == null) {
      log.error('$envVarSocketPath not set');
      exit(1);
    }
    final port = int.tryParse(Platform.environment[envVarPort] ?? '') ?? 443;
    registerService<AppArmorPromptingClient>(
      () => AppArmorPromptingClient(
        InternetAddress(socketPath, type: InternetAddressType.unix),
        port,
      ),
    );
  }

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
