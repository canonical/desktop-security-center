import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';

class SnapdAppPermissionsService implements AppPermissionsService {
  SnapdAppPermissionsService(this._client);
  final SnapdClient _client;

  @override
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  }) =>
      _client.getRules(
        snap: snap,
        interface: interface,
      );

  @override
  Future<void> removeRule(String id) => _client.removeRule(id);

  @override
  Future<void> removeAllRules({
    required String snap,
    String? interface,
  }) =>
      _client.removeRules(
        snap,
        interface: interface,
      );

  @override
  Future<bool> isEnabled() => _client.systemInfo().then(
        (systemInfo) =>
            systemInfo.features!['apparmor-prompting']!['enabled'] as bool,
      );

  @override
  Future<void> enable() => _client.enablePrompting().then(_client.waitChange);

  @override
  Future<void> disable() => _client.disablePrompting().then(_client.waitChange);
}

extension on SnapdClient {
  Future<void> waitChange(
    String id, {
    Duration interval = const Duration(milliseconds: 100),
  }) =>
      Stream.periodic(interval, (_) => getChange(id))
          .asyncMap((response) async => response)
          .distinct()
          .firstWhere((change) => change.ready);
}
