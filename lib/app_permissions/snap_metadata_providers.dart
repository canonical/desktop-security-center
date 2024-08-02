import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapd/snapd.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

part 'snap_metadata_providers.g.dart';

typedef LocalSnapData = List<Snap>;

@Riverpod(keepAlive: true)
String? snapIconUrl(SnapIconUrlRef ref, String snapName) =>
    getService<LocalSnapData>()
        .firstWhereOrNull((snap) => snap.name == snapName)
        ?.media
        .where((m) => m.type == 'icon')
        .firstOrNull
        ?.url;

@Riverpod(keepAlive: true)
String snapTitleOrName(SnapTitleOrNameRef ref, String snapName) =>
    getService<LocalSnapData>()
        .firstWhereOrNull((snap) => snap.name == snapName)
        ?.title ??
    snapName;
