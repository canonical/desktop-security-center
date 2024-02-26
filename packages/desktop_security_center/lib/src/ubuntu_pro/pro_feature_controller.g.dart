// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_feature_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFeatureEnabledHash() => r'f5d0bf9890313d82bc7b9fa51e8cc3554fed4aff';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [isFeatureEnabled].
@ProviderFor(isFeatureEnabled)
const isFeatureEnabledProvider = IsFeatureEnabledFamily();

/// See also [isFeatureEnabled].
class IsFeatureEnabledFamily extends Family<bool> {
  /// See also [isFeatureEnabled].
  const IsFeatureEnabledFamily();

  /// See also [isFeatureEnabled].
  IsFeatureEnabledProvider call(
    ProFeature feature,
  ) {
    return IsFeatureEnabledProvider(
      feature,
    );
  }

  @override
  IsFeatureEnabledProvider getProviderOverride(
    covariant IsFeatureEnabledProvider provider,
  ) {
    return call(
      provider.feature,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFeatureEnabledProvider';
}

/// See also [isFeatureEnabled].
class IsFeatureEnabledProvider extends AutoDisposeProvider<bool> {
  /// See also [isFeatureEnabled].
  IsFeatureEnabledProvider(
    ProFeature feature,
  ) : this._internal(
          (ref) => isFeatureEnabled(
            ref as IsFeatureEnabledRef,
            feature,
          ),
          from: isFeatureEnabledProvider,
          name: r'isFeatureEnabledProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFeatureEnabledHash,
          dependencies: IsFeatureEnabledFamily._dependencies,
          allTransitiveDependencies:
              IsFeatureEnabledFamily._allTransitiveDependencies,
          feature: feature,
        );

  IsFeatureEnabledProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.feature,
  }) : super.internal();

  final ProFeature feature;

  @override
  Override overrideWith(
    bool Function(IsFeatureEnabledRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFeatureEnabledProvider._internal(
        (ref) => create(ref as IsFeatureEnabledRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        feature: feature,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFeatureEnabledProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFeatureEnabledProvider && other.feature == feature;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, feature.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFeatureEnabledRef on AutoDisposeProviderRef<bool> {
  /// The parameter `feature` of this provider.
  ProFeature get feature;
}

class _IsFeatureEnabledProviderElement extends AutoDisposeProviderElement<bool>
    with IsFeatureEnabledRef {
  _IsFeatureEnabledProviderElement(super.provider);

  @override
  ProFeature get feature => (origin as IsFeatureEnabledProvider).feature;
}

String _$proFeatureControllerHash() =>
    r'15cefecca01391e1b96031756917ab06f6410b28';

/// See also [ProFeatureController].
@ProviderFor(ProFeatureController)
final proFeatureControllerProvider = AutoDisposeAsyncNotifierProvider<
    ProFeatureController, Map<ProFeature, bool>>.internal(
  ProFeatureController.new,
  name: r'proFeatureControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$proFeatureControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProFeatureController
    = AutoDisposeAsyncNotifier<Map<ProFeature, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
