import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompting_models.freezed.dart';
part 'prompting_models.g.dart';

enum Action { allow, deny }

enum HomePatternType {
  customPath,
  requestedDirectory,
  requestedFile,
  topLevelDirectory,
  containingDirectory,
  homeDirectory,
  matchingFileExtension,
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
    DateTime? updatedAt,
    String? storeUrl,
    String? publisher,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}

@freezed
class MoreOption with _$MoreOption {
  factory MoreOption({
    required HomePatternType homePatternType,
    required String pathPattern,
  }) = _MoreOption;

  factory MoreOption.fromJson(Map<String, dynamic> json) =>
      _$MoreOptionFromJson(json);
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

  factory PromptDetails.fromJson(Map<String, dynamic> json) =>
      _$PromptDetailsFromJson(json);
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

  factory PromptReply.fromJson(Map<String, dynamic> json) =>
      _$PromptReplyFromJson(json);
}

@freezed
sealed class PromptReplyResponse with _$PromptReplyResponse {
  factory PromptReplyResponse.success() = PromptReplyResponseSuccess;
  factory PromptReplyResponse.promptNotFound({required String message}) =
      PromptReplyResponsePromptNotFound;
  factory PromptReplyResponse.unknown({required String message}) =
      PromptReplyResponseUnknown;
}
