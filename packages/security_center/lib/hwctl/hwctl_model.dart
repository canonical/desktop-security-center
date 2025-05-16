import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hwctl_model.g.dart';

@riverpod
Future<(String, String)> hwctlData(Ref ref) async {
  final dir = Platform.environment['SNAP_DATA'] ??
      '/var/snap/desktop-security-center//current/';
  final output = await File(p.join(dir, 'hwctl-output.json'))
      .readAsString()
      .onError((_, __) => '<no output>');
  final error = await File(p.join(dir, 'hwctl-error.log'))
      .readAsString()
      .onError((_, __) => '<no error>');
  return (output, error);
}
