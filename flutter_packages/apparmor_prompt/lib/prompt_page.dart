import 'package:apparmor_prompt/home/home_prompt_page.dart';
import 'package:apparmor_prompt/l10n.dart';
import 'package:apparmor_prompt/prompt_model.dart';
import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';

class PromptPage extends ConsumerWidget {
  const PromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(currentPromptProvider);
    return Scaffold(
      appBar: YaruWindowTitleBar(
        title: Text(AppLocalizations.of(context).promptTitle),
        isMaximizable: false,
        isMinimizable: false,
        isClosable: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: switch (prompt) {
            PromptDetailsHome() => const HomePromptPage(),
          },
        ),
      ),
    );
  }
}
