import 'dart:convert';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prompt_data_model.freezed.dart';
part 'prompt_data_model.g.dart';

enum PermissionChoice { home, parentDir, customPath }

enum AccessPolicy { allow, deny }

enum Permission { read, write, execute }

enum Duration { once, untilLogout, always } // timespan?

@freezed
class PromptDetails with _$PromptDetails {
  factory PromptDetails({
    required String snapName,
    required String requestedPath,
    required List<Permission> requestedPermissions,
    required List<Permission> availablePermissions,
  }) = _PromptDetails;

  factory PromptDetails.fromJson(Map<String, dynamic> json) =>
      _$PromptDetailsFromJson(json);
}

@freezed
class PromptData with _$PromptData {
  factory PromptData({
    required PromptDetails details,
    required bool withMoreOptions,
    required List<Permission> permissions,
    PermissionChoice? permissionChoice,
    AccessPolicy? accessPolicy,
    Duration? duration,
    String? previousErrorMessage,
  }) = _PromptData;

  PromptData._();

  String get stringPerms =>
      details.requestedPermissions.map((p) => p.name).join('/');
}

@freezed
class PromptReply with _$PromptReply {
  factory PromptReply({
    required AccessPolicy action,
    required Duration lifespan,
    required String pathPattern,
    required List<Permission> permissions,
  }) = _PromptReply;

  factory PromptReply.fromJson(Map<String, dynamic> json) =>
      _$PromptReplyFromJson(json);
}

@riverpod
class PromptDataModel extends _$PromptDataModel {
  @override
  PromptData build() {
    final details = PromptDetails(
      snapName: 'test-snap',
      requestedPath: '/home/foo/bar.txt',
      requestedPermissions: [
        Permission.read,
        Permission.write,
      ],
      availablePermissions: [
        Permission.read,
        Permission.write,
        // Permission.execute,
      ],
    );

    return PromptData(
      details: details,
      withMoreOptions: false,
      permissionChoice: PermissionChoice.parentDir,
      accessPolicy: AccessPolicy.allow,
      duration: Duration.always,
      permissions: details.requestedPermissions,
    );
  }

  PromptReply buildReply() {
    final pathPattern = state.details.requestedPath;

    if (state.withMoreOptions &&
        state.permissionChoice == PermissionChoice.customPath) {
      throw StateError('Custom paths not implemented yet');
    }

    return PromptReply(
      action: state.accessPolicy!,
      lifespan: state.duration!,
      pathPattern: pathPattern,
      permissions: state.permissions,
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
    if (!state.details.availablePermissions.contains(p)) {
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

  void _writeReplyAndExit(PromptReply reply) {
    final s = jsonEncode(reply);
    stdout.writeln(s);
    exit(0);
  }

  void saveAndContinue() => _writeReplyAndExit(buildReply());

  void allowAlways() => _writeReplyAndExit(
        PromptReply(
          action: AccessPolicy.allow,
          lifespan: Duration.always,
          pathPattern: state.details.requestedPath,
          permissions: state.details.requestedPermissions,
        ),
      );

  void denyOnce() => _writeReplyAndExit(
        PromptReply(
          action: AccessPolicy.deny,
          lifespan: Duration.once,
          pathPattern: state.details.requestedPath,
          permissions: state.details.requestedPermissions,
        ),
      );
}
