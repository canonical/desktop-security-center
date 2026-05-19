# CLAUDE.md — Feature pages & providers

## Page pattern

All pages are `ConsumerWidget`. Async state uses `.when()` for data/error/loading:

```dart
class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(myProvider).when(
      data: (data) => _Body(data: data),
      error: (error, _) => ErrorWidget(error),
      loading: () => const Center(child: YaruCircularProgressIndicator()),
    );
  }
}
```

- `ref.watch()` for reactive reads in build methods
- `ref.read(...notifier)` for one-shot calls in callbacks

## Services are NOT Riverpod providers

Services live in the `ubuntu_service` locator and are accessed via `getService<T>()` directly inside provider code. Do not wrap services as Riverpod providers — Riverpod manages derived/computed state, the service locator manages external dependencies.

```dart
@riverpod
class MyModel extends _$MyModel {
  Future<Data> build() async {
    final service = getService<MyService>(); // not a provider
    return service.getData();
  }
}
```

## Provider conventions

Providers use `riverpod_generator` annotations (`@riverpod`). Stateful providers that expose mutation methods use the class syntax (`extends _$ModelName`). Simple read-only providers use the function syntax.

Parameterized providers pass arguments via the `build` method (e.g., `build({required String snap, required SnapdInterface interface})`).

## Navigation

Sub-page navigation uses query parameters on route URIs. See @packages/security_center/lib/routes.dart for the route builder and @packages/security_center/lib/navigator.dart for the `pushSnapPermissions()` extension.

App permissions has a drill-down: InterfacesPage → SnapsPage → AppRulesPage, controlled by which query parameters are present. Other features use dialogs rather than sub-pages.
