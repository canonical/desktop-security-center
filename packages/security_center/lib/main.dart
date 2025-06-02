import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/security_center_app.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/services/fake_app_permissions_service.dart';
import 'package:security_center/services/fake_disk_encryption_service.dart';
import 'package:security_center/services/snapd_app_permissions_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

Future<void> main(List<String> args) async {
  await YaruWindowTitleBar.ensureInitialized();
  Logger.setup(path: '');

  final parser = ArgParser()
    ..addFlag('dry-run', help: 'Use a fake rules service instead of snapd')
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

  registerService<SnapdService>(SnapdService.new);

  registerService<DiskEncryptionService>(
      () => FakeDiskEncryptionService.fromFile(
            'integration_test/assets/test_containers.json',
          ));

  final snapMetadata = await getService<SnapdService>().getSnaps();
  registerServiceInstance<LocalSnapData>(snapMetadata);

  if (argResults.flag('dry-run')) {
    registerService<AppPermissionsService>(
      () =>
          FakeAppPermissionsService.fromFile(argResults['test-rules'] as String)
            ..init(),
      dispose: (service) => service.dispose(),
    );
  } else {
    registerService<AppPermissionsService>(
      () => SnapdAppPermissionsService(getService<SnapdService>())..init(),
      dispose: (service) => service.dispose(),
    );
  }
  runApp(const ProviderScope(child: SecurityCenterApp()));
}
