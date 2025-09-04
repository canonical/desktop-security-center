import 'dart:io';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as p;
import 'package:security_center/app_permissions/snap_metadata_providers.dart';
import 'package:security_center/disk_encryption/disk_encryption_providers.dart';
import 'package:security_center/l10n.dart';
import 'package:security_center/services/app_permissions_service.dart';
import 'package:security_center/services/disk_encryption_service.dart';
import 'package:security_center/services/feature_service.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'test_utils.mocks.dart';

part 'test_utils.freezed.dart';

extension WidgetTesterX on WidgetTester {
  BuildContext get context => element(find.byType(Scaffold).first);
  AppLocalizations get l10n => AppLocalizations.of(context);

  Future<void> pumpApp(WidgetBuilder builder) async {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(body: Builder(builder: builder)),
        localizationsDelegates: localizationsDelegates,
      ),
    );
  }

  Future<void> pumpAppWithProviders(
    WidgetBuilder builder,
    ProviderContainer container,
  ) {
    return pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(body: Builder(builder: builder)),
          localizationsDelegates: localizationsDelegates,
        ),
      ),
    );
  }
}

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: [...overrides],
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

@GenerateMocks([AppPermissionsService])
AppPermissionsService registerMockAppPermissionsService({
  List<SnapdRule> rules = const [],
  bool enabled = true,
}) {
  final service = MockAppPermissionsService();
  when(service.status).thenAnswer(
    (_) => Stream.value(
      enabled
          ? AppPermissionsServiceStatus.enabled(rules)
          : AppPermissionsServiceStatus.disabled(),
    ),
  );

  registerMockService<AppPermissionsService>(service);
  addTearDown(unregisterService<AppPermissionsService>);
  return service;
}

LocalSnapData registerMockLocalSnapData({List<Snap> snaps = const []}) {
  registerServiceInstance<LocalSnapData>(snaps);
  addTearDown(unregisterService<LocalSnapData>);
  return snaps;
}

Override filePickerOverride(Uri? uri) {
  return filePickerProvider.overrideWithValue(({
    required context,
    required title,
    defaultFileName,
    filters = const [],
  }) async {
    return uri;
  });
}

Override fileSystemOverride(MemoryFileSystem fs) {
  return fileSystemProvider.overrideWithValue(fs);
}

Override processRunnerOverride(Map<String, String> mountByPath) {
  Future<ProcessResult> fakeRun(String exe, List<String> args) async {
    final path = args.last;
    if (mountByPath.containsKey(path) ||
        mountByPath.containsKey(p.join(path, p.basename(path)))) {
      return ProcessResult(0, 0, '${mountByPath[path]}\n', '');
    }
    return ProcessResult(1, 1, '', 'error');
  }

  return processRunnerProvider.overrideWithValue(fakeRun);
}

@GenerateMocks([DiskEncryptionService])
DiskEncryptionService registerMockDiskEncryptionService({
  bool checkRecoveryKey = true,
  bool checkError = false,
  bool authCancelled = false,
  bool replaceError = false,
  bool generateError = false,
  bool changePinPassphraseError = false,
  bool entropyCheckError = false,
  AuthMode authMode = AuthMode.pin,
  EntropyResponse Function(String)? entropyResponseBuilder,
  bool enumerateKeySlots404Error = false,
  bool enumerateKeySlots403Error = false,
  bool enumerateKeySlotsFailure = false,
  bool missingRecoveryKeySlot = false,
  bool missingDefaultKeySlot = false,
  bool missingDefaultFallbackKeySlot = false,
  bool invalidTpmPlatformName = false,
  bool authModeMismatch = false,
}) {
  final service = MockDiskEncryptionService();

  when(service.enumerateKeySlots()).thenAnswer((_) async {
    if (enumerateKeySlots404Error) {
      throw SnapdException(
        message: '',
        kind: '',
        statusCode: 404,
      );
    }
    if (enumerateKeySlots403Error) {
      throw SnapdException(
        message: '',
        kind: '',
        statusCode: 403,
      );
    }
    if (enumerateKeySlotsFailure) {
      throw SnapdException(message: '');
    }

    final platformName = invalidTpmPlatformName ? 'not-tpm2' : 'tpm2';
    final keySlotAuthMode = SnapdSystemVolumeAuthMode.values.firstWhere(
      (mode) => mode.name == authMode.name,
      orElse: () => SnapdSystemVolumeAuthMode.pin,
    );

    final keyslots = <String, SnapdSystemVolumeKeySlot>{};

    if (!missingRecoveryKeySlot) {
      keyslots['default-recovery'] = SnapdSystemVolumeKeySlot(
        type: SnapdSystemVolumeKeySlotType.platform,
        roles: ['foo'],
        platformName: platformName,
      );
    }

    if (!missingDefaultKeySlot) {
      keyslots['default'] = SnapdSystemVolumeKeySlot(
        type: SnapdSystemVolumeKeySlotType.platform,
        roles: ['foo'],
        platformName: platformName,
        authMode: keySlotAuthMode,
      );
    }

    if (!missingDefaultFallbackKeySlot) {
      keyslots['default-fallback'] = SnapdSystemVolumeKeySlot(
        type: SnapdSystemVolumeKeySlotType.platform,
        roles: ['foo'],
        platformName: platformName,
        authMode: authModeMismatch ? null : keySlotAuthMode,
      );
    }

    return SnapdSystemVolumesResponse(
      byContainerRole: {
        'system-data': SnapdSystemVolume(
          volumeName: 'system-data',
          name: 'system-data',
          encrypted: true,
          keyslots: keyslots,
        ),
      },
    );
  });
  when(service.generateRecoveryKey()).thenAnswer((_) async {
    if (generateError) {
      throw Exception('Mock generate recovery key error');
    }
    return SnapdGenerateRecoveryKeyResponse(
      recoveryKey: 'mock-recovery-key',
      keyId: 'mock-id',
    );
  });
  when(service.replaceRecoveryKey(any)).thenAnswer((_) async {
    if (replaceError) {
      throw Exception('Mock replace recovery key error');
    }
  });
  when(service.checkRecoveryKey(any)).thenAnswer((_) async {
    if (checkError) {
      throw Exception('Mock check recovery key error');
    }
    if (authCancelled) {
      throw SnapdException(
        message: 'Mock auth cancelled',
        kind: 'auth-cancelled',
      );
    }
    if (!checkRecoveryKey) {
      throw Exception('Recovery key does not work');
    }
    return;
  });
  when(service.changePinPassphrase(any, any, any)).thenAnswer((_) async {
    if (changePinPassphraseError) {
      throw Exception('Mock change PIN/passphrase error');
    }
  });
  when(service.pinPassphraseEntropyCheck(any, any))
      .thenAnswer((invocation) async {
    if (entropyCheckError) {
      throw Exception('Mock entropy check error');
    }
    final newPass = invocation.positionalArguments[1] as String;
    if (entropyResponseBuilder != null) {
      return entropyResponseBuilder(newPass);
    }
    final snapdResponse = SnapdEntropyResponse(
      entropyBits: newPass.length,
      minEntropyBits: 4,
      optimalEntropyBits: 6,
    );
    return EntropyResponse.fromSnapdEntropyResponse(snapdResponse);
  });
  registerMockService<DiskEncryptionService>(service);
  addTearDown(unregisterService<DiskEncryptionService>);
  return service;
}

@GenerateMocks([SnapdService])
SnapdService registerMockSnapdService({
  List<NoticesEvent> noticesEvents = const [],
  List<SnapdRule> rules = const [],
  bool promptingEnabled = true,
  bool promptingSupported = true,
  String changeId = '',
  List<SnapdChange> changes = const [],
  bool authCancelled = false,
}) {
  final client = MockSnapdService();

  when(
    client.getNotices(
      types: anyNamed('types'),
      after: anyNamed('after'),
      timeout: anyNamed('timeout'),
    ),
  ).thenAnswer((_) async {
    if (noticesEvents.isEmpty) {
      return [];
    } else {
      final event = noticesEvents.removeAt(0);
      return switch (event) {
        NoticesEventSuccess(notices: final notices) => notices,
        NoticesEventError(error: final error) => throw error,
      };
    }
  });

  when(client.systemInfo()).thenAnswer(
    (_) async => SnapdSystemInfoResponse(
      refresh: SnapdSystemRefreshInfo(next: DateTime(1970)),
      features: {
        'apparmor-prompting': {
          'enabled': promptingEnabled,
          'supported': promptingSupported,
        },
      },
    ),
  );

  when(client.getRules()).thenAnswer((_) async => rules);

  Future<String> toggleReply(Invocation _) async {
    if (authCancelled) {
      throw SnapdException(
        message: 'cancelled',
        kind: 'auth-cancelled',
        status: 'Forbidden',
        statusCode: 403,
      );
    }
    return changeId;
  }

  when(client.enablePrompting()).thenAnswer(toggleReply);
  when(client.disablePrompting()).thenAnswer(toggleReply);

  when(
    client.watchChange(changeId),
  ).thenAnswer((_) => Stream.fromIterable(changes));

  registerServiceInstance<SnapdService>(client);
  addTearDown(unregisterService<SnapdService>);
  return client;
}

@GenerateMocks([FeatureService])
FeatureService registerMockFeatureService({
  bool isDiskEncryptionAvailable = true,
  bool isDryRun = false,
}) {
  final service = MockFeatureService();
  when(service.isDiskEncryptionAvailable).thenReturn(isDiskEncryptionAvailable);
  when(service.isDryRun).thenReturn(isDryRun);

  registerMockService<FeatureService>(service);
  addTearDown(unregisterService<FeatureService>);
  return service;
}

@freezed
sealed class NoticesEvent with _$NoticesEvent {
  factory NoticesEvent.success(List<SnapdNotice> notices) = NoticesEventSuccess;
  factory NoticesEvent.error(Object error) = NoticesEventError;
}
