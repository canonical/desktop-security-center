import 'package:collection/collection.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:security_center/services/snapd_service.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'snap_metadata_providers.g.dart';

final _log = Logger('snap_metadata_providers');

typedef LocalSnapData = List<Snap>;

@Riverpod(keepAlive: true)
String? snapIconUrl(Ref ref, String snapName) => getService<LocalSnapData>()
    .firstWhereOrNull((snap) => snap.name == snapName)
    ?.media
    .where((m) => m.type == 'icon')
    .firstOrNull
    ?.url;

@Riverpod(keepAlive: true)
Future<SnapIcon?> snapIcon(Ref ref, String snapName) async {
  try {
    return await getService<SnapdService>().getSnapIcon(snapName);
  } on SnapdException catch (e) {
    _log.error('could not fetch snap icon for $snapName: $e');
    return null;
  }
}

@Riverpod(keepAlive: true)
String snapTitleOrName(Ref ref, String snapName) =>
    getService<LocalSnapData>()
        .firstWhereOrNull((snap) => snap.name == snapName)
        ?.title ??
    snapName;
