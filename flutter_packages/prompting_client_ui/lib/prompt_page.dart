import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:measure_size_builder/measure_size_builder.dart';
import 'package:prompting_client/prompting_client.dart';
import 'package:prompting_client_ui/home/home_prompt_page.dart';
import 'package:prompting_client_ui/l10n.dart';
import 'package:prompting_client_ui/prompt_model.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

class PromptPage extends ConsumerWidget {
  const PromptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(currentPromptProvider);
    // TODO: need to set up a provider for getting this using windowManager
    const titleBarHeight = 46.0;

    return Scaffold(
      appBar: YaruWindowTitleBar(
        title: Text(AppLocalizations.of(context).promptTitle),
        isMaximizable: false,
        isMinimizable: false,
        isClosable: false,
      ),
      body: SingleChildScrollView(
        child: MeasureSizeBuilder(
          builder: (context, size) {
            if (size.width > 0) {
              windowManager.setSize(
                Size(
                  size.width,
                  size.height + titleBarHeight,
                ),
              );
            }

            return SizeChangedLayoutNotifier(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: switch (prompt) {
                  PromptDetailsHome() => const HomePromptPage(),
                },
              ),
          },
        ),
      ),
    );
  }
}
