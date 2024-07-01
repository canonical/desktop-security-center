import 'dart:convert';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'prompt_data_model.freezed.dart';
part 'prompt_data_model.g.dart';

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
    required List<Permission> requestedPermissions,
    required List<Permission> availablePermissions,
    required List<InitialOption> initialOptions,
    required List<MoreOption> moreOptions,
    String? previousErrorMessage,
  }) = _PromptDetails;

  factory PromptDetails.fromJson(Map<String, dynamic> json) =>
      _$PromptDetailsFromJson(json);
}

@freezed
class InitialOption with _$InitialOption {
  factory InitialOption({
    required String buttonText,
    required PromptReply reply,
  }) = _InitialOption;

  factory InitialOption.fromJson(Map<String, dynamic> json) =>
      _$InitialOptionFromJson(json);
}

@freezed
class MoreOption with _$MoreOption {
  factory MoreOption({
    required String description,
    required String pathPattern,
  }) = _MoreOption;

  factory MoreOption.fromJson(Map<String, dynamic> json) =>
      _$MoreOptionFromJson(json);
}

@freezed
class PromptData with _$PromptData {
  factory PromptData({
    required PromptDetails details,
    required bool withMoreOptions,
    required List<Permission> permissions,
    required String customPath,
    int? selectedPath,
    AccessPolicy? accessPolicy,
    Lifespan? lifespan,
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
    final inErrorState = details.previousErrorMessage != null;

    return PromptData(
      details: details,
      // forcing for now while we are iterating on what options we provice
      // withMoreOptions: inErrorState,
      withMoreOptions: true,
      selectedPath: inErrorState ? details.initialOptions.length : 0,
      accessPolicy: AccessPolicy.allow,
      lifespan: Lifespan.forever,
      permissions: details.requestedPermissions,
      customPath: details.requestedPath,
    );
  }

  PromptReply buildReply() {
    return PromptReply(
      action: state.accessPolicy!,
      lifespan: state.lifespan!,
      pathPattern: pathPattern,
      permissions: state.permissions,
    );
  }

  String get pathPattern {
    if (state.selectedPath! == numMoreOptions) {
      return state.customPath;
    } else {
      return state.details.moreOptions[state.selectedPath!].pathPattern;
    }
  }

  int get numInitialOptions => state.details.initialOptions.length;
  int get numMoreOptions => state.details.moreOptions.length;

  String moreOptionPath(int index) {
    final opt = state.details.moreOptions[index];
    return '${opt.description} (${opt.pathPattern})';
  }

  void toggleMoreOptions() =>
      state = state.copyWith(withMoreOptions: !state.withMoreOptions);

  void setSelectedPath(int? i) => state = state.copyWith(selectedPath: i);

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

  void replyWithInitialOption(int i) =>
      _writeReplyAndExit(state.details.initialOptions[i].reply);
}
