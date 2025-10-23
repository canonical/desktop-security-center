# Adding support for new interfaces

This document aims to provide a brief overview on adding new app permission interfaces to the `desktop-security-center`

## Add definitions for the new permission interface

Create a new file `lib/app_permissions/<new-interface>_interface.dart`. This file will be used to model the constraints of the interface being added. You will need to:
- Create a `@freezed` annotated `<new-interface>RuleConstraints` class with a permissions map
- Create an enum to model the permissions available to the interface, with appropriate `fromString()` and `localize()` methods.

## Register the interface in the base interface enum

Update `lib/app_permissions/snapd_interface.dart` to register your new interface in the system. This file defines all available snapd interfaces and their metadata. You will need to:
- Add the new interface to the `SnapdInterface` enum
- Add a case to `fromString()` for deserialization
- Add cases to `localizedTitle()` and `localizedDescription()` for display strings
- Add icon mapping in the icon getter

## Extend the service layer with new interface support

Update the service interfaces and implementations to support managing rules for the new interface in `lib/services/app_permissions_service.dart`. These changes enable creating, querying, and removing rules. You will need to:
- Add method signatures to the abstract `AppPermissionsService` class
- Implement the methods in `SnapdAppPermissionsService` using the snapd API
- Implement fake versions in `FakeAppPermissionsService` for testing

## Create Riverpod providers for state management

Update `lib/app_permissions/rules_providers.dart` to add state management for the new interface. This file contains all the Riverpod providers that fetch and manage rules.

Implementation details will vary by interface needs, but generally you'll need to:
- Update `interfaceSnapCounts()` and `snapRuleCounts()` to account for the new interface
- Create a new `Riverpod` provider for the interface that can preform necessary actions (removing rules, adding new rules etc.)
- Create a new `<new-interface>RuleFragment` - a simplified model that breaks down complex rules into individual permission entries for easier UI display and management 

## Add localized strings for the interface

Update `lib/l10n/app_en.arb` to add all user-facing strings for the new interface. The localization system will automatically generate code for these strings.

Note: After updating `app_en.arb`, run the `melos gen-l10n` code generation command to update all language files and generate the Dart localization code.

## Build the UI for managing interface rules

Create or update UI pages to display and manage rules for the new interface. The exact implementation depends on your interface's complexity, but you will generally be making edits to the `app_rules_page.dart` and `snaps_page.dart` files.

The UI should integrate with the `Riverpod` providers created in the previous step and follow the existing patterns used by other interfaces (e.g., home interface).
