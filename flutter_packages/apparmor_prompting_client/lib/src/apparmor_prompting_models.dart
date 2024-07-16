import 'package:freezed_annotation/freezed_annotation.dart';

part 'apparmor_prompting_models.freezed.dart';

enum Action { allow, deny }

enum HomePatternType {
  customPath,
  topLevelDirectory,
  homeDirectory,
  matchingFileExtension,
  archiveFiles,
  audioFiles,
  documentFiles,
  imageFiles,
  videoFiles,
}

// Technically there is also a 'timespan' variant of this enum (on the
// snapd side) but it isn't something that we are currently supporting
// through the prompt UI.
enum Lifespan { single, session, forever }

enum Permission { read, write, execute }

@freezed
class MetaData with _$MetaData {
  factory MetaData({
    required String promptId,
    required String snapName,
    required String publisher,
    required String updatedAt,
  }) = _MetaData;
}

@freezed
class MoreOption with _$MoreOption {
  factory MoreOption({
    required HomePatternType homePatternType,
    required String pathPattern,
  }) = _MoreOption;
}

@freezed
sealed class PromptDetails with _$PromptDetails {
  factory PromptDetails.home({
    required MetaData metaData,
    required String requestedPath,
    required List<Permission> requestedPermissions,
    required List<Permission> availablePermissions,
    required List<MoreOption> moreOptions,
  }) = PromptDetailsHome;
}

@freezed
sealed class PromptReply with _$PromptReply {
  factory PromptReply.home({
    required String promptId,
    required Action action,
    required Lifespan lifespan,
    required String pathPattern,
    required List<Permission> permissions,
  }) = PromptReplyHome;
}

@freezed
sealed class PromptReplyResponse with _$PromptReplyResponse {
  factory PromptReplyResponse.success() = PromptReplyResponseSuccess;
  factory PromptReplyResponse.unknown({required String message}) =
      PromptReplyResponseUnknown;
}
