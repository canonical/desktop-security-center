import 'package:snapd/snapd.dart';

class SnapdService extends SnapdClient {
  Stream<SnapdChange> watchChange(
    String id, {
    Duration interval = const Duration(milliseconds: 100),
  }) =>
      Stream.periodic(interval, (_) => getChange(id))
          .asyncMap((response) async => response)
          .distinct();
}
