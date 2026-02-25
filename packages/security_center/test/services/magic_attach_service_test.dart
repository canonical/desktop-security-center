import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/services/ubuntu_pro_service.dart';

import '../utils/ubuntu_pro_utils.dart';

void main() {
  group('magic attach', () {
    final testCases = <({
      String name,
      bool expireToken,
      String wantToken,
      String wantContractToken,
    })>[
      (
        name: 'success',
        expireToken: false,
        wantToken: 'foo',
        wantContractToken: 'contractToken',
      ),
      (
        name: 'expired token',
        expireToken: true,
        wantToken: 'foo',
        wantContractToken: '',
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final fs = mockProFilesystem(
          osRelease: osReleaseLTS,
          ubuntuCsv: ubuntuCsv,
          uaclientConf: mockUaclientConf,
        );
        await mockMagicAttachServer(
          token: testCase.wantToken,
          contractToken: testCase.wantContractToken,
          expireToken: testCase.expireToken,
        );
        final service = MagicAttachService(
          fs: fs,
        );

        final token = await service.newToken();
        expect(token.token, equals(testCase.wantToken));
        expect(token.contractToken, isNull);
        expect(token.contractID, isNull);

        if (testCase.expireToken) {
          await expectLater(
            () => service.getContractToken(token.token),
            throwsA(isA<HttpException>()),
          );
        } else {
          final contractToken = await service.getContractToken(token.token);
          expect(contractToken.token, equals(testCase.wantToken));
          expect(
            contractToken.contractToken,
            equals(testCase.wantContractToken),
          );
        }
      });
    }
  });
}
