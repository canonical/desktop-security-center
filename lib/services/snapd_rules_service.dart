import 'package:security_center/services/rules_service.dart';
import 'package:snapd/snapd.dart';

class SnapdRulesService implements RulesService {
  SnapdRulesService(this._client);
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
