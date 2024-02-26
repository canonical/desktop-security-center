import 'dart:io';

import 'package:desktop_security_center/src/generated/dsc.pb.dart';
import 'package:desktop_security_center/src/generated/dsc.pbgrpc.dart' as pb;
import 'package:desktop_security_center/src/generated/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';

class DscProClient {
  DscProClient(String serverUrl, int port) {
    final channel = ClientChannel(
      InternetAddress(serverUrl, type: InternetAddressType.unix),
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _proClient = pb.ProClient(channel);
  }

  late pb.ProClient _proClient;

  Future<bool> isMachineProAttached() async {
    final grpcResponse = await _proClient.isMachineProAttached(Empty());
    return grpcResponse.value;
  }

  Future<void> attachProMachine() async {
    await _proClient.attachProToMachine(AttachRequest());
  }

  /*  Future<void> detachProMachine() async {
    await _proClient.(Empty());
  } */

  Future<bool> isEsmAppsEnabled() async {
    final grpcResponse = await _proClient.isEsmAppsEnabled(Empty());
    return grpcResponse.value;
  }

  Future<void> enableEsmApps() async {
    await _proClient.enableEsmApps(Empty());
  }

  Future<void> disableEsmApps() async {
    await _proClient.disableEsmApps(Empty());
  }

  Future<bool> isEsmInfraEnabled() async {
    final grpcResponse = await _proClient.isEsmInfraEnabled(Empty());
    return grpcResponse.value;
  }

  Future<void> enableEsmInfra() async {
    await _proClient.enableInfra(Empty());
  }

  Future<void> disableEsmInfra() async {
    await _proClient.disableInfra(Empty());
  }

  Future<bool> isKernelLivePatchEnabled() async {
    final grpcResponse = await _proClient.isKernelLivePatchEnabled(Empty());
    return grpcResponse.value;
  }

  Future<void> enableKernelLivePatch() async {
    await _proClient.enableKernelLivePatch(Empty());
  }

  Future<void> disableKernelLivePatch() async {
    await _proClient.disableKernelLivePatch(Empty());
  }
}
