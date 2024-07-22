import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'prompt_model.g.dart';

@riverpod
PromptDetails currentPrompt(CurrentPromptRef ref) =>
    getService<PromptDetails>();
