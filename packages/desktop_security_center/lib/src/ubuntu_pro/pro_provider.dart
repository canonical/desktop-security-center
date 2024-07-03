import 'package:desktop_security_center/src/config.dart';
import 'package:desktop_security_center/src/ubuntu_pro/pro_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pro_provider.g.dart';

@riverpod
DscProClient proClient(ProClientRef ref) {
  return DscProClient(url, port);
}

enum ProFeature {
  esmApps,
  esmInfra,
  kernelLivePatch,
  isMachineAttached;

  const ProFeature();
}
