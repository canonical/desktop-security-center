import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'snap_metadata_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Snap>> snaps(SnapsRef ref) => getService<SnapdClient>().getSnaps();

@Riverpod(keepAlive: true)
Future<String?> snapIconUrl(SnapIconUrlRef ref, String snapName) =>
    ref.watch(snapsProvider.future).then(
          (snaps) => snaps
              .firstWhereOrNull((snap) => snap.name == snapName)
              ?.media
              .where((m) => m.type == 'icon')
              .firstOrNull
              ?.url,
        );
