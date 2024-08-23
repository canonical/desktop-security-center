import 'dart:async';

import 'package:security_center/services/app_permissions_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('snapd_app_permissions_service');

class SnapdAppPermissionsService implements AppPermissionsService {
  SnapdAppPermissionsService(this._client);
  final SnapdClient _client;
  late final StreamController<AppPermissionsServiceStatus> _statusController;

  static const _retryDelay = Duration(milliseconds: 200);

  @override
  Future<void> init() async {
    _statusController = StreamController<AppPermissionsServiceStatus>.broadcast(
      onListen: _longPollingLoop,
    );
    await _updateStatus();
  }

  @override
  Future<void> dispose() async {
    await _statusController.close();
  }

  @override
  Stream<AppPermissionsServiceStatus> get status => _statusController.stream;

  Future<void> _longPollingLoop() async {
    Exception? lastError;
    while (!_statusController.isClosed) {
      try {
        if (lastError != null) {
          await _updateStatus();
          lastError = null;
        }
        final notices = await _client.getNotices(
          types: [SnapdNoticeType.interfacesRequestsRuleUpdate],
          after: DateTime.now(),
          timeout: '10s',
        );
        if (notices.isNotEmpty) {
          await _updateStatus();
        }
      } on Exception catch (e) {
        _log.debug('Error while long-polling notices: $e');
        lastError = e;
        await Future.delayed(_retryDelay);
      }
    }
  }

  Future<void> _updateStatus() async {
    final isEnabled = await _client
        .systemInfo()
        .then(
          (systemInfo) =>
              systemInfo.features?['apparmor-prompting']?['enabled'] as bool? ??
              false,
        )
        .onError((e, __) {
      _log.debug('Error while checking if prompting is enabled: $e');
      return false;
    });
    while (true) {
      try {
        if (!isEnabled) {
          await _client.getNotices(after: DateTime.now(), timeout: '10ms');
          _statusController.add(AppPermissionsServiceStatus.disabled());
        } else {
          final rules = await _client.getRules();
          _statusController.add(AppPermissionsServiceStatus.enabled(rules));
        }
        break;
      } on SnapdException catch (e) {
        _log.debug('Error while updating status: $e');
        await Future.delayed(_retryDelay);
      }
    }
  }

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

  Future<void> _guard(
    Future<String> Function() action,
    AppPermissionsServiceStatus Function(double progress) progressState,
  ) async {
    _statusController.add(AppPermissionsServiceStatusWaitingForAuth());
    try {
      final changeId = await action();
      _statusController.add(progressState(0.0));
      _log.debug('Change ID: $changeId');
      await for (final change in _client.watchChange(changeId)) {
        _log.debug('Change: $change');
        if (change.ready) {
          break;
        } else if (change.err != null) {
          _statusController.add(AppPermissionsServiceStatus.error(change.err!));
          break;
        }
        _statusController.add(progressState(change.progress));
      }
      await _updateStatus();
    } on SnapdException catch (e) {
      _log.error('Error: $e');
      _statusController.add(AppPermissionsServiceStatus.error(e));
    }
  }

  @override
  Future<void> enable() => _guard(
        _client.enablePrompting,
        AppPermissionsServiceStatus.enabling,
      );
  @override
  Future<void> disable() => _guard(
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
