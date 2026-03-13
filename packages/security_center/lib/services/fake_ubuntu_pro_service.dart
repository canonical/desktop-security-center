import 'dart:async';

import 'package:security_center/services/ubuntu_pro_service.dart';

class FakeMagicAttachService implements MagicAttachService {
  final Map<String, MagicAttachResponse> _tokens = {};

  @override
  Future<MagicAttachResponse> newToken() async {
    final response = MagicAttachResponse(
      expires: DateTime.now().add(Duration(minutes: 10)),
      expiresIn: 600,
      token: 'abc',
      userCode: 'def',
    );
    _tokens.addAll({'abc': response});
    return response;
  }

  @override
  Future<MagicAttachResponse> getContractToken(String token) async {
    final response = _tokens[token];

    if (response == null) {
      throw Exception('MagicAttachService did not call newToken first');
    }

    return response.copyWith(contractID: 'ghi', contractToken: 'jkl');
  }
}

class FakeGSettingsIconService implements GSettingsIconService {
  bool _statusIcon = true;
  late final StreamController<List<String>> _stream;

  @override
  Stream<List<String>> get stream => _stream.stream;

  @override
  void init() {
    _stream = StreamController.broadcast();
  }

  @override
  Future<void> dispose() async {
    await _stream.close();
  }

  @override
  Future<bool> getStatusIcon() async {
    return _statusIcon;
  }

  @override
  Future<void> toggleStatusIcon(bool value) async {
    _statusIcon = value;
    _stream.add(['show-livepatch-status-icon']);
  }
}
