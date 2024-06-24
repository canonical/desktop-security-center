import 'dart:convert';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'prompt_data_model.freezed.dart';
part 'prompt_data_model.g.dart';

enum PermissionChoice { requested, parentDir, customPath }

enum AccessPolicy { allow, deny }

enum Permission { read, write, execute }

// Technically there is also a 'timespan' variant of this enum (on the
// snapd side) but it isn't something that we are currently supporting
// through the prompt UI.
enum Lifespan { single, session, forever }

@freezed
class PromptDetails with _$PromptDetails {
  factory PromptDetails({
    required String snapName,
    required String requestedPath,
    required String parentDirectory,
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
    required String customPath,
    PermissionChoice? permissionChoice,
    AccessPolicy? accessPolicy,
    Lifespan? lifespan,
    String? previousErrorMessage,
  }) = _PromptData;

  PromptData._();

  String get permissionsAsString =>
      details.requestedPermissions.map((p) => p.name).join('/');
}

@freezed
class PromptReply with _$PromptReply {
  factory PromptReply({
    required AccessPolicy action,
    required Lifespan lifespan,
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
    final details = getService<PromptDetails>();

    return PromptData(
      details: details,
      withMoreOptions: false,
      permissionChoice: PermissionChoice.requested,
      accessPolicy: AccessPolicy.allow,
      lifespan: Lifespan.forever,
      permissions: details.requestedPermissions,
      customPath: details.parentDirectory,
    );
  }

  PromptReply buildReply() {
    final pathPattern = switch (state.permissionChoice!) {
      PermissionChoice.requested => state.details.requestedPath,
      PermissionChoice.parentDir => state.details.parentDirectory,
      PermissionChoice.customPath => state.customPath,
    };

    return PromptReply(
      action: state.accessPolicy!,
      lifespan: state.lifespan!,
      pathPattern: pathPattern,
      permissions: state.permissions,
    );
  }

  void toggleMoreOptions() =>
      state = state.copyWith(withMoreOptions: !state.withMoreOptions);

  void setPermissionChoice(PermissionChoice? p) =>
      state = state.copyWith(permissionChoice: p);

  void setCustomPath(String path) => state = state.copyWith(customPath: path);

  void setAccessPolicy(AccessPolicy? a) =>
      state = state.copyWith(accessPolicy: a);

  void setLifespan(Lifespan? l) => state = state.copyWith(lifespan: l);

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
    stdout.writeln(jsonEncode(reply));
    exit(0);
  }

  void saveAndContinue() => _writeReplyAndExit(buildReply());

  void allowAlways() => _writeReplyAndExit(
        PromptReply(
          action: AccessPolicy.allow,
          lifespan: Lifespan.forever,
          pathPattern: state.details.requestedPath,
          permissions: state.details.requestedPermissions,
        ),
      );

  void denyOnce() => _writeReplyAndExit(
        PromptReply(
          action: AccessPolicy.deny,
          lifespan: Lifespan.single,
          pathPattern: state.details.requestedPath,
          permissions: state.details.requestedPermissions,
        ),
      );
}
