import 'package:flutter_test/flutter_test.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_page.dart';
import 'package:security_center/ubuntu_pro/ubuntu_pro_providers.dart';

import '../test_utils.dart';
import '../utils/ubuntu_pro_utils.dart';

void main() {
  group('UbuntuProPageModel', () {
    testWidgets('initial state detached when service not attached',
        (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateDetached>(),
      );
    });

    testWidgets('initial state attached when service attached', (tester) async {
      registerMockUbuntuProManagerService();
      registerMockUbuntuProFeatureService();
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateAttached>(),
      );
    });

    testWidgets('attach success: detached -> attaching -> attached',
        (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateDetached>(),
      );

      final attachFuture = container
          .read(ubuntuProPageModelProvider.notifier)
          .attach(validToken);

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateAttaching>(),
      );

      await attachFuture;
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateAttached>(),
      );
    });

    testWidgets('attach failure: detached -> attaching -> error',
        (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      await container
          .read(ubuntuProPageModelProvider.notifier)
          .attach(invalidToken);
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateError>(),
      );
    });

    testWidgets('clearError resets to detached', (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      await container
          .read(ubuntuProPageModelProvider.notifier)
          .attach(invalidToken);
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateError>(),
      );

      container.read(ubuntuProPageModelProvider.notifier).clearError();
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateDetached>(),
      );
    });

    testWidgets('stream does not override attaching state mid-attach',
        (tester) async {
      registerMockUbuntuProManagerService(attached: false);
      registerMockUbuntuProFeatureService(featuresEntitled: false);
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      final attachFuture = container
          .read(ubuntuProPageModelProvider.notifier)
          .attach(validToken);

      // While the future is pending we should remain in attaching, not flip
      // to attached from a stream emission.
      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateAttaching>(),
      );

      await attachFuture;
      await tester.pumpAndSettle();

      expect(
        container.read(ubuntuProPageModelProvider),
        isA<UbuntuProPageStateAttached>(),
      );
    });

    testWidgets('detach error is swallowed and service handles state',
        (tester) async {
      registerMockUbuntuProManagerService(detachThrows: true);
      registerMockUbuntuProFeatureService();
      final container = createContainer();

      await tester.pumpAppWithProviders(
        (_) => const UbuntuProPage(),
        container,
      );
      await tester.pumpAndSettle();

      // Detach throwing should not propagate — the provider swallows the error.
      await expectLater(
        container.read(ubuntuProPageModelProvider.notifier).detach(),
        completes,
      );
    });
  });
}
