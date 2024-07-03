import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/security_center_app.dart';
import 'package:security_center/services/fake_rules_service.dart';
import 'package:security_center/services/rules_service.dart';
import 'package:security_center/services/snapd_rules_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

Future<void> main(List<String> args) async {
  await YaruWindowTitleBar.ensureInitialized();

  final parser = ArgParser()
    ..addFlag(
      'dry-run',
      help: 'Use a fake rules service instead of snapd',
    )
    ..addOption(
      'test-rules',
      help: 'Path to a JSON file containing test rules',
      defaultsTo: 'integration_test/assets/test_rules.json',
    );

  final ArgResults argResults;
  try {
    argResults = parser.parse(args);
  } on FormatException catch (_) {
    stdout.writeln(parser.usage);
    exit(2);
  }

  if (kDebugMode || argResults.flag('dry-run')) {
    registerService<RulesService>(
      () => FakeRulesService.fromFile(argResults['test-rules'] as String),
    );
  } else {
    registerService<RulesService>(
      () => SnapdRulesService(
        SnapdClient(
          socketPath: Platform.environment.containsKey('SNAP_NAME')
              ? '/run/snapd-snap.socket'
              : '/run/snapd.socket',
        ),
      ),
    );
  }
  runApp(const ProviderScope(child: SecurityCenterApp()));
}
