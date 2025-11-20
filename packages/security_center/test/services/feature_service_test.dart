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
