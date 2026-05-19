# CLAUDE.md — Services

## Service pattern

Every feature service follows the same structure:

1. **Abstract class** defining the interface: `{FeatureName}Service`
2. **Real implementation** prefixed with `Snapd`: `Snapd{FeatureName}Service`
3. **Fake implementation** prefixed with `Fake`: `Fake{FeatureName}Service`

## Registration

Services are registered at startup in @packages/security_center/lib/main.dart using `ubuntu_service`:

```dart
// Lazy factory with lifecycle
registerService<AppPermissionsService>(
  () => SnapdAppPermissionsService(getService<SnapdService>())..init(),
  dispose: (service) => service.dispose(),
);

// Pre-built instance
registerServiceInstance<FeatureService>(featureService);

// Retrieval
getService<AppPermissionsService>()
```

The `--dry-run` flag conditionally registers fake implementations instead of real ones.

## Lifecycle

Services that manage ongoing state use `init()` / `dispose()` with `StreamController`:
- `init()` creates the stream controller and starts listeners
- `dispose()` closes controllers and cancels subscriptions
- Both are wired into the `registerService` call via the factory and `dispose:` parameter

Stateless services (e.g., `DiskEncryptionService`) skip lifecycle — just return `Future<T>` from methods.

## Feature gating

`FeatureService` gates capabilities based on snapd version (semver comparison via `pub_semver`) and system state. In dry-run mode all features return `true`.
