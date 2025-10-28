import 'dart:async';
import 'dart:io';

import 'package:security_center/app_permissions/rules_providers.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

final _log = Logger('snapd_app_permissions_service');

typedef PromptingInfo = ({bool isEnabled, bool isSupported});

class SnapdAppPermissionsService implements AppPermissionsService {
  SnapdAppPermissionsService(this._snapd);
  final SnapdService _snapd;
  late final StreamController<AppPermissionsServiceStatus> _statusController;
  AppPermissionsServiceStatus? _lastStatus;

  static const _retryDelay = Duration(milliseconds: 200);

  void _emitStatus(AppPermissionsServiceStatus status) {
    _log.debug('Emitting status: $status');
    if (_statusController.isClosed) return;
    _statusController.add(status);
    _lastStatus = status;
  }

  @override
  Future<void> init() async {
    _statusController = StreamController<AppPermissionsServiceStatus>.broadcast(
      onListen: () {
        _updateStatus();
        _longPollingLoop();
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _statusController.close();
  }

  @override
  Stream<AppPermissionsServiceStatus> get status =>
      _statusController.stream.distinct();

  Future<void> _longPollingLoop() async {
    Exception? lastError;
    PromptingInfo? lastPromptingInfo;

    while (!_statusController.isClosed) {
      try {
        final promptingInfo = await _getPromptingInfo();
        if (lastError != null || promptingInfo != lastPromptingInfo) {
          await _updateStatus();
          lastError = null;
          lastPromptingInfo = promptingInfo;
        }
        final notices = await _snapd.getNotices(
          types: [
            promptingInfo.isSupported
                ? SnapdNoticeType.interfacesRequestsRuleUpdate
                : SnapdNoticeType.warning,
          ],
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

  Future<PromptingInfo> _getPromptingInfo() async {
    final systemInfo = await _snapd
        .systemInfo()
        .then(
          (systemInfo) => systemInfo.features?['apparmor-prompting']
              as Map<String, dynamic>?,
        )
        .onError((e, __) {
      _log.error('Error while fetching system info: $e');
      return null;
    });

    final isSupported = systemInfo?['supported'] as bool? ?? false;
    final isEnabled = systemInfo?['enabled'] as bool? ?? false;

    return (isSupported: isSupported, isEnabled: isEnabled);
  }

  Future<void> _updateStatus() async {
    while (true) {
      try {
        // Check if snapd responds to notices. It might happen that
        // system-info already sends a reply, but snapd is not ready for
        // long-polling yet.
        await _snapd.getNotices(after: DateTime.now(), timeout: '10ms');

        final promptingInfo = await _getPromptingInfo();
        if (promptingInfo.isSupported && promptingInfo.isEnabled) {
          final rules = await _snapd.getRules().onError(
            (e, __) {
              _log.error('Error while fetching rules: $e');
              return [];
            },
            test: (e) => e is HttpException,
          );
          _emitStatus(AppPermissionsServiceStatus.enabled(rules));
        } else {
          if (promptingInfo.isSupported) {
            _emitStatus(AppPermissionsServiceStatus.disabled());
          } else {
            _emitStatus(AppPermissionsServiceStatus.unavailable());
          }
        }
        break;
      } on SnapdException catch (e) {
        _log.debug('Error while updating status: $e');
        if (_lastStatus is AppPermissionsServiceStatusEnabled ||
            _lastStatus is AppPermissionsServiceStatusDisabled) {
          _emitStatus(AppPermissionsServiceStatus.waitingForSnapd());
        }
        await Future.delayed(_retryDelay);
      }
    }
  }

  @override
  Future<void> addRule(SnapdRuleMask rule) => _snapd.addRule(rule);

  @override
  Future<void> removeRule(String id) => _snapd.removeRule(id);

  @override
  Future<void> patchRule(String id, Map<String, dynamic> constraints) =>
      _snapd.patchRule(id, constraints);

  @override
  Future<void> removeAllRules({
    required String snap,
    String? interface,
  }) =>
      _snapd.removeRules(
        snap,
        interface: interface,
      );

  Future<void> _guard(
    Future<String> Function() action,
    AppPermissionsServiceStatus Function(double progress) progressState,
  ) async {
    _emitStatus(AppPermissionsServiceStatusWaitingForAuth());
    try {
      final changeId = await action();
      _emitStatus(progressState(0.0));
      _log.debug('Change ID: $changeId');
      await for (final change in _snapd.watchChange(changeId)) {
        _log.debug('Change: $change');
        if (change.ready) {
          break;
        } else if (change.err != null) {
          _log.error(
            'Snapd change $changeId completed with an error: ${change.err}',
          );
          _emitStatus(AppPermissionsServiceStatus.error(change.err!));
          break;
        }
        _emitStatus(progressState(change.progress));
      }
      await _updateStatus();
    } on SnapdException catch (e) {
      if (e.kind == 'auth-cancelled') {
        await _updateStatus();
      } else {
        _log.error('Error: $e');
        _emitStatus(AppPermissionsServiceStatus.error(e));
      }
    }
  }

  @override
  Future<void> enable() => _guard(
        _snapd.enablePrompting,
        AppPermissionsServiceStatus.enabling,
      );
  @override
  Future<void> disable() => _guard(
        _snapd.disablePrompting,
        AppPermissionsServiceStatus.disabling,
      );

  @override
  Future<List<String>> getSnapsWithInterface(String interface) async {
    try {
      final connections = await _snapd.getConnections(interface: interface);
      return connections.plugs
          .where((plug) => plug.interface == interface)
          .map((plug) => plug.snap)
          .toSet()
          .toList();
    } on Exception catch (e) {
      _log.error('Error while fetching snaps with interface $interface: $e');
      return [];
    }
  }
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
