import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';

class SnapdAppPermissionsService implements AppPermissionsService {
  SnapdAppPermissionsService(this._client);
  final SnapdClient _client;

  @override
  Future<List<SnapdRule>> getRules({
    String? snap,
    String? interface,
  }) async =>
      _client.getRules(
        snap: snap,
        interface: interface,
      );

  @override
  Future<void> removeRule(String id) async {
    await _client.removeRule(id);
  }

  @override
  Future<void> removeAllRules({required String snap, String? interface}) async {
    await _client.removeRules(
      snap,
      interface: interface,
    );
  }
}
