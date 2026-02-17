import 'dart:io';

import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:security_center/services/feature_service.dart';

void main() {
  group('TPM/FDE availability', () {
    for (final testCase in [
      (
        name: 'outside snap confinment, no TPM/FDE',
        exitCode: 1,
        stdout: '',
        stderr:
            'error: snapctl: cannot invoke snapctl operation commands (here "system-mode") from outside of a snap',
        ubuntuDataEncExists: false,
        expectedResult: false,
      ),
      (
        name: 'TPM/FDE detected by snapctl',
        exitCode: 0,
        stdout: '''system-mode: install
seed-loaded: true
factory: true
storage-encrypted: managed
''',
        stderr: '',
        ubuntuDataEncExists: false,
        expectedResult: true,
      ),
      (
        name:
            'fallback to checking for ubuntu-data-enc if snapctl result is negative',
        exitCode: 0,
        stdout: '''system-mode: install
seed-loaded: true
factory: true
''',
        stderr: '',
        ubuntuDataEncExists: true,
        expectedResult: true,
      ),
      (
        name: 'no TPM/FDE',
        exitCode: 0,
        stdout: '''system-mode: install
seed-loaded: true
factory: true
''',
        stderr: '',
        ubuntuDataEncExists: false,
        expectedResult: false,
      ),
    ]) {
      test(testCase.name, () {
        final mockFs = MemoryFileSystem.test();
        if (testCase.ubuntuDataEncExists) {
          mockFs
              .file('/dev/disk/by-label/ubuntu-data-enc')
              .createSync(recursive: true);
        }

        final mockProcess = MockSyncProcess();
        when(mockProcess.runSync(any, any)).thenReturn(
          ProcessResult(
            1234,
            testCase.exitCode,
            testCase.stdout,
            testCase.stderr,
          ),
        );

        final service = FeatureService(
          isDryRun: false,
          fs: mockFs,
          runProcess: mockProcess.runSync,
        );

        expect(
          service.isDiskEncryptionAvailable,
          equals(testCase.expectedResult),
        );
        verify(mockProcess.runSync(any, any)).called(1);

        // Ensure result is cached and `snapctl` isn't run again
        expect(
          service.isDiskEncryptionAvailable,
          equals(testCase.expectedResult),
        );
        verifyNever(mockProcess.runSync(any, any));
      });
    }
  });

  group('Snapd version', () {
    for (final testCase in [
      (
        name: 'snapd version < 2.75, no microphone interface',
        snapdVersion: '2.74',
        isDryRun: false,
        expectedResult: false,
      ),
      (
        name: 'snapd version == 2.75, microphone interface supported',
        snapdVersion: '2.75',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version > 2.75, microphone interface supported',
        snapdVersion: '2.76',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version with v prefix, microphone interface supported',
        snapdVersion: 'v2.75',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version with v prefix, no microphone interface supported',
        snapdVersion: 'v2.74',
        isDryRun: false,
        expectedResult: false,
      ),
      (
        name: 'snapd version with dev hash suffix',
        snapdVersion: '2.75+g137.7313916',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version 2.74.1',
        snapdVersion: '2.74.1',
        isDryRun: false,
        expectedResult: false,
      ),
      (
        name: 'snapd version 2.75.0',
        snapdVersion: '2.75.0',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version 2.75.1',
        snapdVersion: '2.75.1',
        isDryRun: false,
        expectedResult: true,
      ),
      (
        name: 'snapd version null, no microphone interface',
        snapdVersion: null,
        isDryRun: false,
        expectedResult: false,
      ),
      (
        name: 'dry run mode always returns true',
        snapdVersion: '2.74',
        isDryRun: true,
        expectedResult: true,
      ),
      (
        name: 'dry run mode with null version returns true',
        snapdVersion: null,
        isDryRun: true,
        expectedResult: true,
      ),
    ]) {
      test(testCase.name, () {
        final service = FeatureService(
          isDryRun: testCase.isDryRun,
          snapdVersion: testCase.snapdVersion,
        );

        expect(
          service.supportsMicrophone,
          equals(testCase.expectedResult),
        );
      });
    }
  });
}

abstract class _SyncProcess {
  ProcessResult runSync(String? executable, List<String>? arguments);
}

class MockSyncProcess extends Mock implements _SyncProcess {
  @override
  ProcessResult runSync(String? executable, List<String>? arguments) =>
      super.noSuchMethod(
        Invocation.method(#run, [executable, arguments]),
        returnValue: ProcessResult(0, 0, '', ''),
      ) as ProcessResult;
}
