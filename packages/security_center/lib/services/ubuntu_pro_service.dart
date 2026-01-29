import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

part 'ubuntu_pro_service.freezed.dart';
part 'ubuntu_pro_service.g.dart';

@freezed
class UbuntuProData with _$UbuntuProData {
  factory UbuntuProData({
    required bool attached,
  }) = _UbuntuProData;
}

class UbuntuProManagerService {
  final DBusClient _dbusClient = DBusClient.system();
  late final StreamSubscription<DBusSignal> _propertiesChangedSignal;
  late final DBusRemoteObjectManager _manager;
  UbuntuProData data = UbuntuProData(attached: false);

  late final StreamController<UbuntuProData> stream;

  Future<void> init() async {
    stream = StreamController.broadcast();
    _manager = DBusRemoteObjectManager(
      _dbusClient,
      name: 'com.canonical.UbuntuAdvantage',
      path: DBusObjectPath('/com/canonical/UbuntuAdvantage/Manager'),
    );

    _propertiesChangedSignal =
        _manager.propertiesChanged.listen(_onPropertiesChanged);

    final attached = await _manager.getProperty(
      'com.canonical.UbuntuAdvantage.Manager',
      'Attached',
    );
    data = UbuntuProData(attached: attached.asBoolean());
    stream.add(data);
  }

  Future<void> dispose() async {
    await _propertiesChangedSignal.cancel();
  }

  Future<void> _onPropertiesChanged(DBusSignal signal) async {
    if (signal.path.value != '/com/canonical/UbuntuAdvantage/Manager') return;

    final attached =
        signal.values[1].asStringVariantDict()['Attached']?.asBoolean();
    if (attached != null) {
      data = data.copyWith(attached: attached);
    }
    stream.add(data);
  }

  Future<void> attach(String token) async {
    try {
      await _manager.callMethod(
        'com.canonical.UbuntuAdvantage.Manager',
        'Attach',
        [DBusString(token)],
      );
    } on DBusMethodResponseException catch (error, stackTrace) {
      // TODO: do something with error
    }
  }

  Future<void> detach() async {
    try {
      await _manager.callMethod(
        'com.canonical.UbuntuAdvantage.Manager',
        'Detach',
        [],
      );
    } on DBusMethodResponseException catch (error, stackTrace) {
      // TODO: do something with error
    }
  }
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
  static const defaultEtcPath = '/etc/ubuntu-advantage';
  static const defaultConfigFile = 'uaclient.conf';
  static const v1MagicAttach = '/v1/magic-attach';

  late final String _apiBase = _getAPIBase();

  Future<MagicAttachResponse> newToken() async {
    final uri = Uri.parse(_apiBase).replace(path: v1MagicAttach);
    final response = await http.post(uri);

    if (response.statusCode >= 300) {
      throw HttpException(
        'Magic attach got response code ${response.statusCode}: ${response.body}',
      );
    }

    final jsonBody = jsonDecode(response.body);
    return MagicAttachResponse.fromJson(jsonBody as Map<String, dynamic>);
  }

  Future<MagicAttachResponse> getContractToken(String token) async {
    final uri = Uri.parse(_apiBase).replace(path: v1MagicAttach);
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
    final configFile = File(_getConfigPath()).readAsLinesSync();
    for (final line in configFile) {
      if (line.trim().startsWith('contract_url: ')) {
        final contractURL = line.replaceFirst('contract_url:', '').trim();
        if (contractURL.isNotEmpty) {
          return contractURL;
        }
      }
    }

    return '';
  }

  String _getConfigPath() {
    final configPath = Platform.environment['UA_CONFIG_FILE'];
    if (configPath != null) {
      return configPath;
    }

    return path.join(defaultEtcPath, defaultConfigFile);
  }
}
