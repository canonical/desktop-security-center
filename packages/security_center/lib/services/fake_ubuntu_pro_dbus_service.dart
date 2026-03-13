import 'dart:async';
import 'package:security_center/services/ubuntu_pro_dbus_service.dart';

/// Mock implementation of [UbuntuProFeatureService].
class FakeUbuntuProFeatureService implements UbuntuProFeatureService {
  final Map<UbuntuProFeatureType, UbuntuProFeature> _featureMap = {};
  late final StreamController<UbuntuProFeatureType> _stream;

  @override
  Stream<UbuntuProFeatureType> get stream => _stream.stream;

  @override
  Future<void> init() async {
    _stream = StreamController.broadcast();

    _featureMap.addAll(
      {
        UbuntuProFeatureType.esmApps: UbuntuProFeature(
          type: UbuntuProFeatureType.esmApps,
          path: '/com/canonical/UbuntuAdvantage/Services/esm_2dapps',
          name: 'esm-apps',
          entitled: true,
          status: 'enabled',
        ),
        UbuntuProFeatureType.esmInfra: UbuntuProFeature(
          type: UbuntuProFeatureType.esmInfra,
          path: '/com/canonical/UbuntuAdvantage/Services/esm_2dinfra',
          name: 'esm-infra',
          entitled: true,
          status: 'enabled',
        ),
        UbuntuProFeatureType.livepatch: UbuntuProFeature(
          type: UbuntuProFeatureType.livepatch,
          path: '/com/canonical/UbuntuAdvantage/Services/livepatch',
          name: 'livepatch',
          entitled: true,
          status: 'enabled',
        ),
        UbuntuProFeatureType.usg: UbuntuProFeature(
          type: UbuntuProFeatureType.usg,
          path: '/com/canonical/UbuntuAdvantage/Services/usg',
          name: 'usg',
          entitled: true,
          status: 'enabled',
        ),
        // fips is set as 'disabled' initially to be able to see the fips flow
        // since it's a one-way operation
        UbuntuProFeatureType.fips: UbuntuProFeature(
          type: UbuntuProFeatureType.fips,
          path: '/com/canonical/UbuntuAdvantage/Services/fips',
          name: 'fips',
          entitled: true,
          status: 'disabled',
        ),
        UbuntuProFeatureType.fipsUpdates: UbuntuProFeature(
          type: UbuntuProFeatureType.fipsUpdates,
          path: '/com/canonical/UbuntuAdvantage/Services/fips_2dupdates',
          name: 'fips-updates',
          entitled: true,
          status: 'disabled',
        ),
      },
    );

    for (final feature in _featureMap.values) {
      _stream.add(feature.type!);
    }
  }

  @override
  Future<void> dispose() async {
    await _stream.close();
  }

  @override
  Future<void> disableFeature(UbuntuProFeatureType feature) async {
    final featureData = getFeature(feature);
    if (_featureMap[feature] != null && featureData != null) {
      _featureMap[feature] = _featureMap[feature]!.copyWith(status: 'disabled');
      _stream.add(feature);
    }
  }

  @override
  Future<void> enableFeature(UbuntuProFeatureType feature) async {
    final featureData = getFeature(feature);
    if (_featureMap[feature] != null && featureData != null) {
      _featureMap[feature] = _featureMap[feature]!.copyWith(status: 'enabled');
      _stream.add(feature);
    }
  }

  @override
  UbuntuProFeature? getFeature(UbuntuProFeatureType feature) {
    return _featureMap[feature];
  }

  @override
  bool isEnabled(UbuntuProFeatureType feature) =>
      getFeature(feature)?.enabled ?? false;
}

/// Mock implementation of [UbuntuProManagerService].
class FakeUbuntuProManagerService implements UbuntuProManagerService {
  late final StreamController<UbuntuProManagerData> _stream;
  UbuntuProManagerData _data = UbuntuProManagerData(attached: false);

  @override
  Stream<UbuntuProManagerData> get stream => _stream.stream;

  @override
  UbuntuProManagerData get data => _data;

  @override
  Future<void> init() async {
    _stream = StreamController.broadcast();
    _data = UbuntuProManagerData(
      attached: true,
      available: true,
      eolDate: DateTime.now().add(Duration(days: 10)),
    );
    _stream.add(_data);
  }

  @override
  Future<void> dispose() async {
    await _stream.close();
  }

  @override
  Future<void> attach(String token) async {
    _stream.add(_data.copyWith(attached: true));
  }

  @override
  Future<void> detach() async {
    _stream.add(_data.copyWith(attached: false));
  }
}
