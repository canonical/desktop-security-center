import 'dart:convert';
import 'dart:io';
import 'package:apparmor_prompt/prompt_data_model.dart';
import 'package:apparmor_prompt/prompt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

void main(List<String> args) async {
  if (args.length != 1) {
    stdout.writeln('expected prompt details on stdin');
    exit(1);
  }

  PromptDetails details;

  try {
    final json = jsonDecode(args[0]) as Map<String, dynamic>;
    details = PromptDetails.fromJson(json);
  } on TypeError catch (e) {
    stdout.writeln('malformed JSON input: $e');
    exit(1);
  } on Exception catch (e) {
    stdout.writeln('unable to parse command line args: $e');
    exit(1);
  }

  await YaruWindowTitleBar.ensureInitialized();
  registerService<PromptDetails>(() => details);

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
