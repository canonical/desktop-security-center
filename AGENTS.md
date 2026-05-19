# Commands

Melos monorepo using fvm for Flutter version management. All commands run from repo root.

First-time setup: `fvm install && dart pub global activate melos && melos bootstrap`

```bash
melos bootstrap          # install deps, link packages
melos build              # build all packages
melos test               # run all tests
melos generate           # regenerate freezed/json/riverpod/mockito code
melos gen-l10n           # regenerate localizations from ARB files
melos run format:exclude # format (excludes generated files)
melos integration_test   # run integration tests
```

Single test: `cd packages/security_center && fvm flutter test test/path/to/test.dart`

Run app locally: `cd packages/security_center && fvm flutter run --dry-run`

Analyze: `cd packages/security_center && fvm flutter analyze`

# Architecture

Flutter desktop app (Ubuntu Security Center) distributed as a snap. Single package at @packages/security_center. Uses Riverpod for state, Yaru for UI, `ubuntu_service` for service location.

`--dry-run` flag swaps real snapd/D-Bus services for fakes — no system dependencies needed for local dev.

# Code generation

Run `melos generate` after changing any `@freezed`, `@JsonSerializable`, `@riverpod`, or `@GenerateMocks` annotated code. Generated files: `*.freezed.dart`, `*.g.dart`, `*.mocks.dart`.

json_serializable is configured with `field_rename: kebab` — all JSON keys use kebab-case. See @packages/security_center/build.yaml.

# Linting

Uses `ubuntu_lints` — see @packages/security_center/analysis_options.yaml

# Snap packaging

Built via `snap/snapcraft.yaml`. To clean snap build state: `snapcraft clean`.
