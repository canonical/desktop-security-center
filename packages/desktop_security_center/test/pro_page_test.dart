import 'package:desktop_security_center/src/ubuntu_pro/pro_client.dart';
import 'package:desktop_security_center/src/ubuntu_pro/pro_feature_controller.dart';
import 'package:desktop_security_center/src/ubuntu_pro/pro_provider.dart';
import 'package:desktop_security_center/src/ubuntu_pro/ubuntu_pro_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'pro_page_test.mocks.dart';
import 'test_utils.dart';

@GenerateMocks([DscProClient])
void main() {
  late DscProClient mockProClient;

  setUp(() {
    mockProClient = MockDscProClient();
  });

  testWidgets('Pro ESM Main package switch toggle', (tester) async {
    final container =
        makeContainer([proClientProvider.overrideWith((ref) => mockProClient)]);

    when(mockProClient.isMachineProAttached()).thenAnswer((_) async => true);
    when(mockProClient.isEsmAppsEnabled()).thenAnswer((_) async => true);
    when(mockProClient.isEsmInfraEnabled()).thenAnswer((_) async => true);
    when(mockProClient.isKernelLivePatchEnabled())
        .thenAnswer((_) async => true);
    when(mockProClient.disableEsmApps()).thenAnswer((_) async {});

    await tester.pumpApp(
      (_) => RiverpodTestableWidget(
        container: container,
        child: const UbuntuProPage(),
      ),
    );

    final esmSwitch = find.byKey(const ValueKey(ProFeature.esmApps));

    expect(esmSwitch, findsOneWidget);

    final yaruSwitch =
        find.descendant(of: esmSwitch, matching: find.byType(YaruSwitch));
    expect(yaruSwitch, findsOneWidget);

    await expectLater(
      (await container
          .read(proFeatureControllerProvider.future))[ProFeature.esmApps],
      true,
    );
  });

  testWidgets('Pro ESM Universe switch toggle', (tester) async {
    final container =
        makeContainer([proClientProvider.overrideWith((ref) => mockProClient)]);

    when(mockProClient.isMachineProAttached()).thenAnswer((_) async => true);
    when(mockProClient.isEsmAppsEnabled()).thenAnswer((_) async => true);
    when(mockProClient.isEsmInfraEnabled()).thenAnswer((_) async => true);
    when(mockProClient.isKernelLivePatchEnabled())
        .thenAnswer((_) async => true);
    when(mockProClient.disableEsmInfra()).thenAnswer((_) async {});

    await tester.pumpApp(
      (_) => RiverpodTestableWidget(
        container: container,
        child: const UbuntuProPage(),
      ),
    );

    final esmInfraSwitch = find.byKey(const ValueKey(ProFeature.esmInfra));

    expect(esmInfraSwitch, findsOneWidget);

    final yaruSwitch =
        find.descendant(of: esmInfraSwitch, matching: find.byType(YaruSwitch));
    expect(yaruSwitch, findsOneWidget);

    await expectLater(
      (await container
          .read(proFeatureControllerProvider.future))[ProFeature.esmInfra],
      true,
    );
  });

  testWidgets('Open/close Modal', (tester) async {
    await tester.pumpApp((_) => const UbuntuProPage());
    find.text('Expanded Security Maintenance (ESM)');
  });
}
