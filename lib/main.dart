import 'package:args/args.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/security_center_app.dart';
import 'package:security_center/services/snapd_rules_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

void main(List<String> args) async {
  await YaruWindowTitleBar.ensureInitialized();

  final argResult = (ArgParser()..addFlag('dry-run')).parse(args);

  if (kDebugMode || argResult.flag('dry-run')) {
    registerService<RulesService>(FakeRulesService.defaultRules);
  } else {
    registerService<RulesService>(() => SnapdRulesService(SnapdClient()));
  }
  runApp(const ProviderScope(child: SecurityCenterApp()));
}
