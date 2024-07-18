import 'dart:convert';
import 'dart:io';

import 'package:apparmor_prompting_client/apparmor_prompting_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('fake_apparmor_prompting_client');

class FakeApparmorPromptingClient implements AppArmorPromptingClient {
  FakeApparmorPromptingClient({required this.currentPrompt});
  factory FakeApparmorPromptingClient.fromFile(String path) {
    final currentPrompt = PromptDetails.fromJson(
      jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>,
    );
    return FakeApparmorPromptingClient(currentPrompt: currentPrompt);
  }
  final PromptDetails currentPrompt;

  @override
  Future<PromptDetails> getCurrentPrompt() async => currentPrompt;

  @override
  Future<PromptReplyResponse> replyToPrompt(PromptReply reply) async {
    _log.info('replyToPrompt: $reply');
    final validPattern = RegExp(r'^/([^\[\]]|\\[\[\]])*$');
    if (!validPattern.hasMatch(reply.pathPattern)) {
      _log.info('invalid pattern');
      return PromptReplyResponse.unknown(message: 'invalid pattern');
    }
    _log.info('valid pattern');
    return PromptReplyResponse.success();
  }

  @override
  Future<HomePatternType> resolveHomePatternType(String pattern) {
    throw UnimplementedError();
  }
}
