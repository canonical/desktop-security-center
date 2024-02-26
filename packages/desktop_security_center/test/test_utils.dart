import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterX on WidgetTester {
  BuildContext get context => element(find.byType(Scaffold).first);
  Future<void> pumpApp(WidgetBuilder builder) async {
    // The intended minimum size of the window.
    view.physicalSize =
        (const Size(800, 600) + const Offset(54, 54)) * view.devicePixelRatio;
    final ubuntuRegular = File('test/fonts/Ubuntu-Regular.ttf');
    final content = ByteData.view(
        Uint8List.fromList(ubuntuRegular.readAsBytesSync()).buffer);
    final fontLoader = FontLoader('UbuntuRegular')
      ..addFont(Future.value(content));
    await fontLoader.load();
    return pumpWidget(
      MaterialApp(
        theme: ThemeData(fontFamily: 'UbuntuRegular'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(body: Builder(builder: builder)),
      ),
    );
  }
}

ProviderContainer makeContainer(List<Override> overrides) {
  final container = ProviderContainer(overrides: overrides);
  addTearDown(container.dispose);
  return container;
}

class RiverpodTestableWidget extends StatelessWidget {
  const RiverpodTestableWidget(
      {required this.child, required this.container, super.key});

  final Widget child;
  final ProviderContainer container;

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(container: container, child: child);
  }
}
