import 'dart:async';

import 'package:apparmor_prompting_client/src/apparmor_prompting_client.dart';
import 'package:apparmor_prompting_client/src/apparmor_prompting_models.dart';
import 'package:apparmor_prompting_client/src/generated/apparmor-prompting.pbgrpc.dart'
    as pb;
import 'package:apparmor_prompting_client/src/generated/google/protobuf/empty.pb.dart';
import 'package:apparmor_prompting_client/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:protobuf/protobuf.dart';
import 'package:test/test.dart';

import 'apparmor_prompting_client_test.mocks.dart';

void main() {
  group('get current prompt', () {
    final mockResponse = pb.GetCurrentPromptResponse(
      homePrompt: pb.HomePrompt(
        metaData: pb.MetaData(
          promptId: 'promptId',
          snapName: 'snapName',
          storeUrl: 'storeUrl',
          publisher: 'publisher',
          updatedAt: 'updatedAt',
        ),
        requestedPath: '/home/user/Downloads/example.txt',
        requestedPermissions: ['read', 'write'],
        availablePermissions: ['read', 'write', 'execute'],
        moreOptions: [
          pb.HomePrompt_MoreOption(
            homePatternType: pb.HomePatternType.REQUESTED_DIRECTORY,
            pathPattern: '/home/user/Downloads/**',
          ),
        ],
      ),
    )..freeze();
    final testCases = [
      (
        name: 'valid home prompt',
        mockResponse: mockResponse,
        expectedDetails: PromptDetails.home(
          metaData: MetaData(
            promptId: 'promptId',
            snapName: 'snapName',
            storeUrl: 'storeUrl',
            publisher: 'publisher',
            updatedAt: 'updatedAt',
          ),
          requestedPath: '/home/user/Downloads/example.txt',
          requestedPermissions: [Permission.read, Permission.write],
          availablePermissions: [
            Permission.read,
            Permission.write,
            Permission.execute,
          ],
          moreOptions: [
            MoreOption(
              homePatternType: HomePatternType.customPath,
              pathPattern: '/home/user/Downloads/**',
            ),
          ],
        ),
        expectError: false,
      ),
      (
        name: 'invalid requested permission',
        mockResponse: mockResponse.rebuild(
          (r) => r.homePrompt = r.homePrompt.rebuild(
            (p) => p.requestedPermissions
              ..clear()
              ..add('invalid'),
          ),
        ),
        expectedDetails: null,
        expectError: true,
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final client = AppArmorPromptingClient.withClient(
          createMockClient(
            currentPromptResponse: testCase.mockResponse,
          ),
        );

        final promptDetailsFuture = client.getCurrentPrompt();
        if (testCase.expectError) {
          await expectLater(promptDetailsFuture, throwsArgumentError);
        } else {
          expect(await promptDetailsFuture, equals(testCase.expectedDetails));
        }
      });
    }
  });

  group('reply to prompt', () {
    final testCases = [
      (
        name: 'valid home prompt reply',
        promptReply: PromptReply.home(
          promptId: 'promptId',
          action: Action.allow,
          lifespan: Lifespan.session,
          pathPattern: '/home/user/Downloads/**',
          permissions: [Permission.read, Permission.write],
        ),
        mockResponse: pb.PromptReplyResponse(
          promptReplyType: pb.PromptReplyResponse_PromptReplyType.SUCCESS,
        ),
        expectedProto: pb.PromptReply(
          promptId: 'promptId',
          action: pb.Action.ALLOW,
          lifespan: pb.Lifespan.SESSION,
          homePromptReply: pb.HomePromptReply(
            pathPattern: '/home/user/Downloads/**',
            permissions: ['read', 'write'],
          ),
        ),
        expectedResponse: PromptReplyResponse.success(),
      ),
      (
        name: 'invalid home prompt reply',
        promptReply: PromptReply.home(
          promptId: 'promptId',
          action: Action.deny,
          lifespan: Lifespan.forever,
          pathPattern: '/home/user/Downloads/**',
          permissions: [Permission.read, Permission.write],
        ),
        mockResponse: pb.PromptReplyResponse(
          promptReplyType: pb.PromptReplyResponse_PromptReplyType.UNKNOWN,
          message: 'error message',
        ),
        expectedProto: pb.PromptReply(
          promptId: 'promptId',
          action: pb.Action.DENY,
          lifespan: pb.Lifespan.FOREVER,
          homePromptReply: pb.HomePromptReply(
            pathPattern: '/home/user/Downloads/**',
            permissions: ['read', 'write'],
          ),
        ),
        expectedResponse: PromptReplyResponse.unknown(message: 'error message'),
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final mockClient =
            createMockClient(promptReplyResponse: testCase.mockResponse);
        final client = AppArmorPromptingClient.withClient(mockClient);

        final response = await client.replyToPrompt(testCase.promptReply);
        verify(
          mockClient.replyToPrompt(testCase.expectedProto),
        ).called(1);
        expect(response, equals(testCase.expectedResponse));
      });
    }
  });

  group('resolve home pattern type', () {
    final testCases = [
      (
        name: 'home directory',
        pattern: '/home/user/**',
        mockResponse: pb.ResolveHomePatternTypeResponse(
          homePatternType: pb.HomePatternType.HOME_DIRECTORY,
        ),
        expectedType: HomePatternType.homeDirectory,
      ),
      (
        name: 'requested directory',
        pattern: '/home/user/directory/**',
        mockResponse: pb.ResolveHomePatternTypeResponse(
          homePatternType: pb.HomePatternType.REQUESTED_DIRECTORY,
        ),
        expectedType: HomePatternType.customPath,
      ),
      (
        name: 'requested file',
        pattern: '/home/user/file.txt',
        mockResponse: pb.ResolveHomePatternTypeResponse(
          homePatternType: pb.HomePatternType.REQUESTED_FILE,
        ),
        expectedType: HomePatternType.customPath,
      ),
    ];

    for (final testCase in testCases) {
      test(testCase.name, () async {
        final mockClient = createMockClient();
        when(
          mockClient
              .resolveHomePatternType(StringValue(value: testCase.pattern)),
        ).thenAnswer((_) => MockResponseFuture(testCase.mockResponse));
        final client = AppArmorPromptingClient.withClient(mockClient);

        final type = await client.resolveHomePatternType(testCase.pattern);
        expect(type, equals(testCase.expectedType));
      });
    }
  });
}

@GenerateMocks([pb.AppArmorPromptingClient])
pb.AppArmorPromptingClient createMockClient({
  pb.GetCurrentPromptResponse? currentPromptResponse,
  pb.PromptReplyResponse? promptReplyResponse,
}) {
  final mockClient = MockAppArmorPromptingClient();
  when(mockClient.getCurrentPrompt(Empty())).thenAnswer(
    (_) => MockResponseFuture(
      currentPromptResponse ?? pb.GetCurrentPromptResponse(),
    ),
  );
  when(mockClient.replyToPrompt(any)).thenAnswer(
    (_) => MockResponseFuture(promptReplyResponse ?? pb.PromptReplyResponse()),
  );
  return mockClient;
}

class MockResponseFuture<T> extends Mock implements ResponseFuture<T> {
  MockResponseFuture(this.value);
  final T value;

  @override
  Future<S> then<S>(FutureOr<S> Function(T) onValue, {Function? onError}) =>
      Future.value(value).then(
        onValue,
        onError: onError,
      );
}
