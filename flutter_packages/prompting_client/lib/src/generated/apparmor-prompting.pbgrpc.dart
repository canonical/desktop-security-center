//
//  Generated code. Do not modify.
//  source: apparmor-prompting.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'apparmor-prompting.pb.dart' as $1;
import 'google/protobuf/empty.pb.dart' as $0;
import 'google/protobuf/wrappers.pb.dart' as $2;

export 'apparmor-prompting.pb.dart';

@$pb.GrpcServiceName('apparmor_prompting.AppArmorPrompting')
class AppArmorPromptingClient extends $grpc.Client {
  static final _$getCurrentPrompt = $grpc.ClientMethod<$0.Empty, $1.GetCurrentPromptResponse>(
      '/apparmor_prompting.AppArmorPrompting/GetCurrentPrompt',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetCurrentPromptResponse.fromBuffer(value));
  static final _$replyToPrompt = $grpc.ClientMethod<$1.PromptReply, $1.PromptReplyResponse>(
      '/apparmor_prompting.AppArmorPrompting/ReplyToPrompt',
      ($1.PromptReply value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PromptReplyResponse.fromBuffer(value));
  static final _$resolveHomePatternType = $grpc.ClientMethod<$2.StringValue, $1.ResolveHomePatternTypeResponse>(
      '/apparmor_prompting.AppArmorPrompting/ResolveHomePatternType',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ResolveHomePatternTypeResponse.fromBuffer(value));

  AppArmorPromptingClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetCurrentPromptResponse> getCurrentPrompt($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCurrentPrompt, request, options: options);
  }

  $grpc.ResponseFuture<$1.PromptReplyResponse> replyToPrompt($1.PromptReply request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replyToPrompt, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResolveHomePatternTypeResponse> resolveHomePatternType($2.StringValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resolveHomePatternType, request, options: options);
  }
}

@$pb.GrpcServiceName('apparmor_prompting.AppArmorPrompting')
abstract class AppArmorPromptingServiceBase extends $grpc.Service {
  $core.String get $name => 'apparmor_prompting.AppArmorPrompting';

  AppArmorPromptingServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetCurrentPromptResponse>(
        'GetCurrentPrompt',
        getCurrentPrompt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetCurrentPromptResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PromptReply, $1.PromptReplyResponse>(
        'ReplyToPrompt',
        replyToPrompt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PromptReply.fromBuffer(value),
        ($1.PromptReplyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.ResolveHomePatternTypeResponse>(
        'ResolveHomePatternType',
        resolveHomePatternType_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.ResolveHomePatternTypeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetCurrentPromptResponse> getCurrentPrompt_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getCurrentPrompt(call, await request);
  }

  $async.Future<$1.PromptReplyResponse> replyToPrompt_Pre($grpc.ServiceCall call, $async.Future<$1.PromptReply> request) async {
    return replyToPrompt(call, await request);
  }

  $async.Future<$1.ResolveHomePatternTypeResponse> resolveHomePatternType_Pre($grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return resolveHomePatternType(call, await request);
  }

  $async.Future<$1.GetCurrentPromptResponse> getCurrentPrompt($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.PromptReplyResponse> replyToPrompt($grpc.ServiceCall call, $1.PromptReply request);
  $async.Future<$1.ResolveHomePatternTypeResponse> resolveHomePatternType($grpc.ServiceCall call, $2.StringValue request);
}
