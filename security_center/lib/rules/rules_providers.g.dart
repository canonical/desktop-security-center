// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rulesHash() => r'bc0c488ce2f7db66aef1f2c7d89f1945b4fb1d06';

/// See also [rules].
@ProviderFor(rules)
final rulesProvider = AutoDisposeFutureProvider<List<SnapdRule>>.internal(
  rules,
  name: r'rulesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RulesRef = AutoDisposeFutureProviderRef<List<SnapdRule>>;
String _$interfacesHash() => r'225ec62e741ef79124f4b74ba7c6517a395bb734';

/// See also [interfaces].
@ProviderFor(interfaces)
final interfacesProvider = AutoDisposeFutureProvider<List<String>>.internal(
  interfaces,
  name: r'interfacesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$interfacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InterfacesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$snapRuleCountsHash() => r'0510929f960c44c93c62966aed48d5ee4645830c';

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

/// See also [snapRuleCounts].
@ProviderFor(snapRuleCounts)
const snapRuleCountsProvider = SnapRuleCountsFamily();

/// See also [snapRuleCounts].
class SnapRuleCountsFamily extends Family<AsyncValue<Map<String, int>>> {
  /// See also [snapRuleCounts].
  const SnapRuleCountsFamily();

  /// See also [snapRuleCounts].
  SnapRuleCountsProvider call({
    required String interface,
  }) {
    return SnapRuleCountsProvider(
      interface: interface,
    );
  }

  @override
  SnapRuleCountsProvider getProviderOverride(
    covariant SnapRuleCountsProvider provider,
  ) {
    return call(
      interface: provider.interface,
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
  String? get name => r'snapRuleCountsProvider';
}

/// See also [snapRuleCounts].
class SnapRuleCountsProvider
    extends AutoDisposeFutureProvider<Map<String, int>> {
  /// See also [snapRuleCounts].
  SnapRuleCountsProvider({
    required String interface,
  }) : this._internal(
          (ref) => snapRuleCounts(
            ref as SnapRuleCountsRef,
            interface: interface,
          ),
          from: snapRuleCountsProvider,
          name: r'snapRuleCountsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snapRuleCountsHash,
          dependencies: SnapRuleCountsFamily._dependencies,
          allTransitiveDependencies:
              SnapRuleCountsFamily._allTransitiveDependencies,
          interface: interface,
        );

  SnapRuleCountsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.interface,
  }) : super.internal();

  final String interface;

  @override
  Override overrideWith(
    FutureOr<Map<String, int>> Function(SnapRuleCountsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SnapRuleCountsProvider._internal(
        (ref) => create(ref as SnapRuleCountsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        interface: interface,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, int>> createElement() {
    return _SnapRuleCountsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SnapRuleCountsProvider && other.interface == interface;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, interface.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SnapRuleCountsRef on AutoDisposeFutureProviderRef<Map<String, int>> {
  /// The parameter `interface` of this provider.
  String get interface;
}

class _SnapRuleCountsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, int>>
    with SnapRuleCountsRef {
  _SnapRuleCountsProviderElement(super.provider);

  @override
  String get interface => (origin as SnapRuleCountsProvider).interface;
}

String _$snapRulesModelHash() => r'b2f4e321fb387c869bc5f93f527c3b4b2d5b886b';

abstract class _$SnapRulesModel
    extends BuildlessAutoDisposeAsyncNotifier<List<SnapdRule>> {
  late final String snap;
  late final String interface;

  FutureOr<List<SnapdRule>> build({
    required String snap,
    required String interface,
  });
}

/// See also [SnapRulesModel].
@ProviderFor(SnapRulesModel)
const snapRulesModelProvider = SnapRulesModelFamily();

/// See also [SnapRulesModel].
class SnapRulesModelFamily extends Family<AsyncValue<List<SnapdRule>>> {
  /// See also [SnapRulesModel].
  const SnapRulesModelFamily();

  /// See also [SnapRulesModel].
  SnapRulesModelProvider call({
    required String snap,
    required String interface,
  }) {
    return SnapRulesModelProvider(
      snap: snap,
      interface: interface,
    );
  }

  @override
  SnapRulesModelProvider getProviderOverride(
    covariant SnapRulesModelProvider provider,
  ) {
    return call(
      snap: provider.snap,
      interface: provider.interface,
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
  String? get name => r'snapRulesModelProvider';
}

/// See also [SnapRulesModel].
class SnapRulesModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SnapRulesModel, List<SnapdRule>> {
  /// See also [SnapRulesModel].
  SnapRulesModelProvider({
    required String snap,
    required String interface,
  }) : this._internal(
          () => SnapRulesModel()
            ..snap = snap
            ..interface = interface,
          from: snapRulesModelProvider,
          name: r'snapRulesModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snapRulesModelHash,
          dependencies: SnapRulesModelFamily._dependencies,
          allTransitiveDependencies:
              SnapRulesModelFamily._allTransitiveDependencies,
          snap: snap,
          interface: interface,
        );

  SnapRulesModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.snap,
    required this.interface,
  }) : super.internal();

  final String snap;
  final String interface;

  @override
  FutureOr<List<SnapdRule>> runNotifierBuild(
    covariant SnapRulesModel notifier,
  ) {
    return notifier.build(
      snap: snap,
      interface: interface,
    );
  }

  @override
  Override overrideWith(SnapRulesModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SnapRulesModelProvider._internal(
        () => create()
          ..snap = snap
          ..interface = interface,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        snap: snap,
        interface: interface,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SnapRulesModel, List<SnapdRule>>
      createElement() {
    return _SnapRulesModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SnapRulesModelProvider &&
        other.snap == snap &&
        other.interface == interface;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, snap.hashCode);
    hash = _SystemHash.combine(hash, interface.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SnapRulesModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<SnapdRule>> {
  /// The parameter `snap` of this provider.
  String get snap;

  /// The parameter `interface` of this provider.
  String get interface;
}

class _SnapRulesModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SnapRulesModel,
        List<SnapdRule>> with SnapRulesModelRef {
  _SnapRulesModelProviderElement(super.provider);

  @override
  String get snap => (origin as SnapRulesModelProvider).snap;
  @override
  String get interface => (origin as SnapRulesModelProvider).interface;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
