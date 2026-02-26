import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsettings/gsettings.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

part 'ubuntu_pro_service.freezed.dart';
part 'ubuntu_pro_service.g.dart';

const kUbuntuProLink = 'https://ubuntu.com/pro';
const kUbuntuProDashboardLink = 'https://ubuntu.com/pro/dashboard';
const kUbuntuContractsUrl = 'https://contracts.canonical.com';

String getUbuntuProMagicLink(String userCode) {
  return 'https://ubuntu.com/pro/attach?magic-attach-code=$userCode';
}

@freezed
class MagicAttachResponse with _$MagicAttachResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory MagicAttachResponse({
    required DateTime expires,
    required int expiresIn,
    required String token,
    required String userCode,
    String? contractID,
    String? contractToken,
  }) = _MagicAttachResponse;

  factory MagicAttachResponse.fromJson(Map<String, dynamic> json) =>
      _$MagicAttachResponseFromJson(json);
}

class MagicAttachService {
  MagicAttachService({
    String defaultEtcPath = '/etc/ubuntu-advantage',
    String defaultConfigFile = 'uaclient.conf',
    String v1MagicAttach = '/v1/magic-attach',
    @visibleForTesting FileSystem? fs,
  })  : _defaultEtcPath = defaultEtcPath,
        _defaultConfigFile = defaultConfigFile,
        _v1MagicAttach = v1MagicAttach,
        _fs = fs ?? LocalFileSystem();

  final FileSystem _fs;
  final String _defaultEtcPath;
  final String _defaultConfigFile;
  final String _v1MagicAttach;

  late final String _apiBase = _getAPIBase();

  /// Generate a new token and user code for the user to magic attach Pro.
  Future<MagicAttachResponse> newToken() async {
    final uri = Uri.parse(_apiBase).replace(path: _v1MagicAttach);
    final response = await http.post(uri);

    if (response.statusCode >= 300) {
      throw HttpException(
        'Magic attach got response code ${response.statusCode}: ${response.body}',
      );
    }

    final jsonBody = jsonDecode(response.body);
    return MagicAttachResponse.fromJson(jsonBody as Map<String, dynamic>);
  }

  /// Query for a potential contract from a previously generated token.
  Future<MagicAttachResponse> getContractToken(String token) async {
    final uri = Uri.parse(_apiBase).replace(path: _v1MagicAttach);
    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode >= 300) {
      throw HttpException(
        'Magic attach got response code ${response.statusCode}: ${response.body}',
      );
    }

    final jsonBody = jsonDecode(response.body);
    return MagicAttachResponse.fromJson(jsonBody as Map<String, dynamic>);
  }

  String _getAPIBase() {
    final configFile = _fs.file(_getConfigPath()).readAsLinesSync();
    for (final line in configFile) {
      if (line.trim().startsWith('contract_url: ')) {
        final contractURL = line.replaceFirst('contract_url:', '').trim();
        if (contractURL.isNotEmpty) {
          return contractURL;
        }
      }
    }

    return kUbuntuContractsUrl;
  }

  String _getConfigPath() {
    final configPath = Platform.environment['UA_CONFIG_FILE'];
    if (configPath != null) {
      return configPath;
    }

    return path.join(_defaultEtcPath, _defaultConfigFile);
  }
}

class GSettingsIconService {
  GSettingsIconService({GSettings? settingsClient})
      : _settingsClient =
            settingsClient ?? GSettings('com.ubuntu.update-notifier');

  final GSettings _settingsClient;
  late final StreamController<List<String>> _stream;
  Stream<List<String>> get stream => _stream.stream;

  late final StreamSubscription<List<String>> _streamSubscription;

  void init() {
    _stream = StreamController.broadcast();
    _streamSubscription =
        _settingsClient.keysChanged.listen((data) => _stream.add(data));
  }

  Future<void> dispose() async {
    await _stream.close();
    await _streamSubscription.cancel();
  }

  Future<bool> getStatusIcon() async {
    final showStatusIcon =
        await _settingsClient.get('show-livepatch-status-icon');
    return showStatusIcon.asBoolean();
  }

  Future<void> toggleStatusIcon(bool value) async {
    await _settingsClient.set('show-livepatch-status-icon', DBusBoolean(value));
  }
}
