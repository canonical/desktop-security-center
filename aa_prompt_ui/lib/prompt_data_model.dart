import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prompt_data_model.freezed.dart';
part 'prompt_data_model.g.dart';

enum PermissionChoice { home, parentDir, customPath }

enum AccessPolicy { allow, deny }

enum Permission { read, write, execute }

enum Duration { once, untilLogout, always } // timespan?

@freezed
class PromptData with _$PromptData {
  factory PromptData({
    required String snapName,
    required String requestedPath,
    required List<Permission> requestedPermissions,
    required List<Permission> availablePermissions,
    required bool withMoreOptions,
    required List<Permission> permissions,
    PermissionChoice? permissionChoice,
    AccessPolicy? accessPolicy,
    Duration? duration,
    String? previousErrorMessage,
  }) = _PromptData;

  PromptData._();

  String get stringPerms => requestedPermissions.map((p) => p.name).join('/');
}

@riverpod
class PromptDataModel extends _$PromptDataModel {
  @override
  PromptData build() {
    // FIXME: should come from stdin
    const snapName = 'test-snap';
    const requestedPath = '/home/foo/bar.txt';
    final requestedPermissions = [
      Permission.read,
      Permission.write,
    ];
    final availablePermissions = [
      Permission.read,
      Permission.write,
      // Permission.execute,
    ];

    return PromptData(
      snapName: snapName,
      requestedPath: requestedPath,
      requestedPermissions: requestedPermissions,
      availablePermissions: availablePermissions,
      // Defaults for the ui state
      withMoreOptions: false,
      permissionChoice: PermissionChoice.parentDir,
      accessPolicy: AccessPolicy.allow,
      duration: Duration.always,
      permissions: requestedPermissions,
    );
  }

  void toggleMoreOptions() =>
      state = state.copyWith(withMoreOptions: !state.withMoreOptions);

  void setPermissionChoice(PermissionChoice? p) =>
      state = state.copyWith(permissionChoice: p);

  void setAccessPolicy(AccessPolicy? a) =>
      state = state.copyWith(accessPolicy: a);

  void setDuration(Duration? d) => state = state.copyWith(duration: d);

  void togglePerm(Permission p) {
    if (!state.availablePermissions.contains(p)) {
      throw ArgumentError('$p is not an available permission');
    }

    final permissions = [...state.permissions];

    if (permissions.contains(p)) {
      permissions.remove(p);
    } else {
      permissions.add(p);
    }

    state = state.copyWith(permissions: permissions);
  }

  void saveAndContinue() {}

  void allowAlways() {}

  void denyOnce() {}
}
