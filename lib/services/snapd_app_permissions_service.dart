import 'dart:async';

import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('snapd_app_permissions_service');

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

  Stream<AppPermissionsServiceStatus> _guard(
    Future<String> Function() action,
    AppPermissionsServiceStatus Function(double progress) progressState,
  ) async* {
    yield AppPermissionsServiceStatusWaitingForAuth();
    try {
      final changeId = await action();
      yield progressState(0.0);
      _log.debug('Change ID: $changeId');
      await for (final change in _client.watchChange(changeId)) {
        _log.debug('Change: $change');
        if (change.ready) {
          break;
        } else if (change.err != null) {
          yield AppPermissionsServiceStatus.error(change.err!);
          break;
        }
        yield progressState(change.progress);
      }
    } on SnapdException catch (e) {
      _log.error('Error: $e');
      yield AppPermissionsServiceStatus.error(e);
    }
  }

  @override
  Stream<AppPermissionsServiceStatus> enable() => _guard(
        _client.enablePrompting,
        AppPermissionsServiceStatus.enabling,
      );
  @override
  Stream<AppPermissionsServiceStatus> disable() => _guard(
        _client.disablePrompting,
        AppPermissionsServiceStatus.disabling,
      );
}

extension on SnapdClient {
  Stream<SnapdChange> watchChange(
    String id, {
    Duration interval = const Duration(milliseconds: 100),
  }) =>
      Stream.periodic(interval, (_) => getChange(id))
          .asyncMap((response) async => response)
          .distinct();
}

extension on SnapdChange {
  double get progress {
    var done = 0.0;
    var total = 0.0;
    for (final task in tasks) {
      done += task.progress.done;
      total += task.progress.total;
    }

    return total != 0 ? done / total : 0;
  }
}
