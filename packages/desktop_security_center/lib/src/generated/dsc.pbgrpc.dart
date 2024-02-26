//
//  Generated code. Do not modify.
//  source: dsc.proto
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

import 'dsc.pb.dart' as $1;
import 'google/protobuf/empty.pb.dart' as $0;
import 'google/protobuf/wrappers.pb.dart' as $2;

export 'dsc.pb.dart';

@$pb.GrpcServiceName('Hardware')
class HardwareClient extends $grpc.Client {
  static final _$isSecureBootEnabled = $grpc.ClientMethod<$0.Empty, $1.IsSecureBootEnabledResponse>(
      '/Hardware/IsSecureBootEnabled',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.IsSecureBootEnabledResponse.fromBuffer(value));

  HardwareClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.IsSecureBootEnabledResponse> isSecureBootEnabled($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isSecureBootEnabled, request, options: options);
  }
}

@$pb.GrpcServiceName('Hardware')
abstract class HardwareServiceBase extends $grpc.Service {
  $core.String get $name => 'Hardware';

  HardwareServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.IsSecureBootEnabledResponse>(
        'IsSecureBootEnabled',
        isSecureBootEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.IsSecureBootEnabledResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.IsSecureBootEnabledResponse> isSecureBootEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isSecureBootEnabled(call, await request);
  }

  $async.Future<$1.IsSecureBootEnabledResponse> isSecureBootEnabled($grpc.ServiceCall call, $0.Empty request);
}
@$pb.GrpcServiceName('Pro')
class ProClient extends $grpc.Client {
  static final _$isMachineProAttached = $grpc.ClientMethod<$0.Empty, $2.BoolValue>(
      '/Pro/IsMachineProAttached',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.BoolValue.fromBuffer(value));
  static final _$isEsmInfraEnabled = $grpc.ClientMethod<$0.Empty, $2.BoolValue>(
      '/Pro/IsEsmInfraEnabled',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.BoolValue.fromBuffer(value));
  static final _$isEsmAppsEnabled = $grpc.ClientMethod<$0.Empty, $2.BoolValue>(
      '/Pro/IsEsmAppsEnabled',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.BoolValue.fromBuffer(value));
  static final _$isKernelLivePatchEnabled = $grpc.ClientMethod<$0.Empty, $2.BoolValue>(
      '/Pro/IsKernelLivePatchEnabled',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.BoolValue.fromBuffer(value));
  static final _$initiateProMagicFlow = $grpc.ClientMethod<$0.Empty, $1.InitiateResponse>(
      '/Pro/InitiateProMagicFlow',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.InitiateResponse.fromBuffer(value));
  static final _$waitProMagicFlow = $grpc.ClientMethod<$0.Empty, $1.WaitResponse>(
      '/Pro/WaitProMagicFlow',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.WaitResponse.fromBuffer(value));
  static final _$attachProToMachine = $grpc.ClientMethod<$1.AttachRequest, $0.Empty>(
      '/Pro/AttachProToMachine',
      ($1.AttachRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$enableInfra = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/EnableInfra',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$disableInfra = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/DisableInfra',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$enableEsmApps = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/EnableEsmApps',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$disableEsmApps = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/DisableEsmApps',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$enableKernelLivePatch = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/EnableKernelLivePatch',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$disableKernelLivePatch = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/Pro/DisableKernelLivePatch',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  ProClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.BoolValue> isMachineProAttached($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isMachineProAttached, request, options: options);
  }

  $grpc.ResponseFuture<$2.BoolValue> isEsmInfraEnabled($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isEsmInfraEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$2.BoolValue> isEsmAppsEnabled($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isEsmAppsEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$2.BoolValue> isKernelLivePatchEnabled($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isKernelLivePatchEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$1.InitiateResponse> initiateProMagicFlow($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initiateProMagicFlow, request, options: options);
  }

  $grpc.ResponseFuture<$1.WaitResponse> waitProMagicFlow($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$waitProMagicFlow, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> attachProToMachine($1.AttachRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$attachProToMachine, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> enableInfra($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableInfra, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> disableInfra($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disableInfra, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> enableEsmApps($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableEsmApps, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> disableEsmApps($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disableEsmApps, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> enableKernelLivePatch($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableKernelLivePatch, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> disableKernelLivePatch($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disableKernelLivePatch, request, options: options);
  }
}

@$pb.GrpcServiceName('Pro')
abstract class ProServiceBase extends $grpc.Service {
  $core.String get $name => 'Pro';

  ProServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $2.BoolValue>(
        'IsMachineProAttached',
        isMachineProAttached_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($2.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $2.BoolValue>(
        'IsEsmInfraEnabled',
        isEsmInfraEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($2.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $2.BoolValue>(
        'IsEsmAppsEnabled',
        isEsmAppsEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($2.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $2.BoolValue>(
        'IsKernelLivePatchEnabled',
        isKernelLivePatchEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($2.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.InitiateResponse>(
        'InitiateProMagicFlow',
        initiateProMagicFlow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.InitiateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.WaitResponse>(
        'WaitProMagicFlow',
        waitProMagicFlow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.WaitResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AttachRequest, $0.Empty>(
        'AttachProToMachine',
        attachProToMachine_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AttachRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'EnableInfra',
        enableInfra_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'DisableInfra',
        disableInfra_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'EnableEsmApps',
        enableEsmApps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'DisableEsmApps',
        disableEsmApps_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'EnableKernelLivePatch',
        enableKernelLivePatch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'DisableKernelLivePatch',
        disableKernelLivePatch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$2.BoolValue> isMachineProAttached_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isMachineProAttached(call, await request);
  }

  $async.Future<$2.BoolValue> isEsmInfraEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isEsmInfraEnabled(call, await request);
  }

  $async.Future<$2.BoolValue> isEsmAppsEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isEsmAppsEnabled(call, await request);
  }

  $async.Future<$2.BoolValue> isKernelLivePatchEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return isKernelLivePatchEnabled(call, await request);
  }

  $async.Future<$1.InitiateResponse> initiateProMagicFlow_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return initiateProMagicFlow(call, await request);
  }

  $async.Future<$1.WaitResponse> waitProMagicFlow_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return waitProMagicFlow(call, await request);
  }

  $async.Future<$0.Empty> attachProToMachine_Pre($grpc.ServiceCall call, $async.Future<$1.AttachRequest> request) async {
    return attachProToMachine(call, await request);
  }

  $async.Future<$0.Empty> enableInfra_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return enableInfra(call, await request);
  }

  $async.Future<$0.Empty> disableInfra_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return disableInfra(call, await request);
  }

  $async.Future<$0.Empty> enableEsmApps_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return enableEsmApps(call, await request);
  }

  $async.Future<$0.Empty> disableEsmApps_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return disableEsmApps(call, await request);
  }

  $async.Future<$0.Empty> enableKernelLivePatch_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return enableKernelLivePatch(call, await request);
  }

  $async.Future<$0.Empty> disableKernelLivePatch_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return disableKernelLivePatch(call, await request);
  }

  $async.Future<$2.BoolValue> isMachineProAttached($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$2.BoolValue> isEsmInfraEnabled($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$2.BoolValue> isEsmAppsEnabled($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$2.BoolValue> isKernelLivePatchEnabled($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.InitiateResponse> initiateProMagicFlow($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.WaitResponse> waitProMagicFlow($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> attachProToMachine($grpc.ServiceCall call, $1.AttachRequest request);
  $async.Future<$0.Empty> enableInfra($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> disableInfra($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> enableEsmApps($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> disableEsmApps($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> enableKernelLivePatch($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> disableKernelLivePatch($grpc.ServiceCall call, $0.Empty request);
}
