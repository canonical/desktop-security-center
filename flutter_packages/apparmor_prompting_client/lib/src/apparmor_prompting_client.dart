import 'dart:io';

import 'package:apparmor_prompting_client/src/apparmor_prompting_models.dart';
import 'package:apparmor_prompting_client/src/generated/apparmor-prompting.pbgrpc.dart'
    as pb;
import 'package:apparmor_prompting_client/src/generated/google/protobuf/empty.pb.dart';
import 'package:apparmor_prompting_client/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc/grpc.dart';

class AppArmorPromptingClient {
  AppArmorPromptingClient(InternetAddress host, [int port = 443])
      : _client = pb.AppArmorPromptingClient(
          ClientChannel(
            host,
            port: port,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          ),
        );

  @visibleForTesting
  AppArmorPromptingClient.withClient(this._client);

  final pb.AppArmorPromptingClient _client;

  Future<PromptDetails> getCurrentPrompt() => _client
      .getCurrentPrompt(Empty())
      .then(PrompteDetailsConversion.fromProto);

  Future<PromptReplyResponse> replyToPrompt(PromptReply reply) => _client
      .replyToPrompt(reply.toProto())
      .then(PromptReplyResponseConversion.fromProto);

  Future<HomePatternType> resolveHomePatternType(String pattern) =>
      _client.resolveHomePatternType(StringValue(value: pattern)).then(
            (response) =>
                HomePatternTypeConversion.fromProto(response.homePatternType),
          );
}

extension ActionConversion on Action {
  pb.Action toProto() => switch (this) {
        Action.allow => pb.Action.ALLOW,
        Action.deny => pb.Action.DENY,
      };
}

extension HomePatternTypeConversion on HomePatternType {
  static HomePatternType fromProto(pb.HomePatternType homePatternType) =>
      switch (homePatternType) {
        pb.HomePatternType.REQUESTED_DIRECTORY =>
          HomePatternType.requestedDirectory,
        pb.HomePatternType.REQUESTED_FILE => HomePatternType.requestedFile,
        pb.HomePatternType.TOP_LEVEL_DIRECTORY =>
          HomePatternType.topLevelDirectory,
        pb.HomePatternType.HOME_DIRECTORY => HomePatternType.homeDirectory,
        pb.HomePatternType.MATCHING_FILE_EXTENSION =>
          HomePatternType.matchingFileExtension,
        pb.HomePatternType.ARCHIVE_FILES => HomePatternType.archiveFiles,
        pb.HomePatternType.AUDIO_FILES => HomePatternType.audioFiles,
        pb.HomePatternType.DOCUMENT_FILES => HomePatternType.documentFiles,
        pb.HomePatternType.IMAGE_FILES => HomePatternType.imageFiles,
        pb.HomePatternType.VIDEO_FILES => HomePatternType.videoFiles,
        _ => throw ArgumentError('Unknown home pattern type: $homePatternType'),
      };
}

extension LifespanConversion on Lifespan {
  pb.Lifespan toProto() => switch (this) {
        Lifespan.single => pb.Lifespan.SINGLE,
        Lifespan.session => pb.Lifespan.SESSION,
        Lifespan.forever => pb.Lifespan.FOREVER,
      };
}

extension MetaDataConversion on MetaData {
  static MetaData fromProto(pb.MetaData metaData) => MetaData(
        promptId: metaData.promptId,
        snapName: metaData.snapName,
        storeUrl: metaData.storeUrl,
        publisher: metaData.publisher,
        updatedAt: metaData.updatedAt,
      );
}

extension MoreOptionConversion on MoreOption {
  static MoreOption fromProto(pb.HomePrompt_MoreOption moreOption) =>
      MoreOption(
        homePatternType:
            HomePatternTypeConversion.fromProto(moreOption.homePatternType),
        pathPattern: moreOption.pathPattern,
      );
}

extension PermissionConversion on Permission {
  static Permission fromString(String permission) =>
      Permission.values.firstWhere(
        (e) => e.name == permission,
        orElse: () => throw ArgumentError('Unknown permission: $permission'),
      );
}

extension PrompteDetailsConversion on PromptDetails {
  static PromptDetails fromProto(pb.GetCurrentPromptResponse response) =>
      switch (response.whichPrompt()) {
        pb.GetCurrentPromptResponse_Prompt.homePrompt => PromptDetails.home(
            metaData:
                MetaDataConversion.fromProto(response.homePrompt.metaData),
            requestedPath: response.homePrompt.requestedPath,
            requestedPermissions: response.homePrompt.requestedPermissions
                .map(PermissionConversion.fromString)
                .toList(),
            availablePermissions: response.homePrompt.availablePermissions
                .map(PermissionConversion.fromString)
                .toList(),
            moreOptions: response.homePrompt.moreOptions
                .map(MoreOptionConversion.fromProto)
                .toList(),
          ),
        _ =>
          throw ArgumentError('Unknown prompt type: ${response.whichPrompt()}'),
      };
}

extension PromptReplyConversion on PromptReply {
  pb.PromptReply toProto() => switch (this) {
        PromptReplyHome() => pb.PromptReply(
            promptId: promptId,
            action: action.toProto(),
            lifespan: lifespan.toProto(),
            homePromptReply: pb.HomePromptReply(
              pathPattern: pathPattern,
              permissions: permissions.map((e) => e.name).toList(),
            ),
          ),
      };
}

extension PromptReplyResponseConversion on PromptReplyResponse {
  static PromptReplyResponse fromProto(pb.PromptReplyResponse response) =>
      switch (response.promptReplyType) {
        pb.PromptReplyResponse_PromptReplyType.SUCCESS =>
          PromptReplyResponse.success(),
        pb.PromptReplyResponse_PromptReplyType.UNKNOWN =>
          PromptReplyResponse.unknown(message: response.message),
        _ => throw ArgumentError('Unknown prompt reply type: $response'),
      };
}
