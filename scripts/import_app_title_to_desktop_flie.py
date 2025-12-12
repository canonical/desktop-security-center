#!/usr/bin/env python3

import json
import os
import re
from pathlib import Path


# Load and validate environment variables
def load_env_config() -> tuple[Path, Path, str] | None:
    arb_dir_str = os.getenv('ARB_DIR')
    desktop_file_str = os.getenv('DESKTOP_FILE')
    name_variable = os.getenv('NAME_VARIABLE')

    # Fail fast if required environment variables are not set
    if not arb_dir_str:
        print("Error: ARB_DIR environment variable is required")
        return None
    if not desktop_file_str:
        print("Error: DESKTOP_FILE environment variable is required")
        return None
    if not name_variable:
        print("Error: NAME_VARIABLE environment variable is required")
        return None

    return Path(arb_dir_str), Path(desktop_file_str), name_variable


# Extract locale code from ARB file name
def extract_locale_from_arb_file(file_path):
    match = re.match(r'app_([a-z]{2}(?:_[A-Z]{2})?).arb$', file_path)
    return match.group(1) if match else None


# Get app titles from ARB files
def get_app_titles(arb_dir: Path, name_variable: str) -> dict[str, str] | None:

    if not arb_dir.exists() or not arb_dir.is_dir():
        print(f"Directory {arb_dir} does not exist.")
        return None

    # Load app titles from ARB files
    app_titles = {}

    for arb_file in sorted(arb_dir.glob('app_*.arb')):
        locale = extract_locale_from_arb_file(arb_file.name)
        if not locale:
            print(f"Could not extract locale from file name: {arb_file.name}")
            continue

        with arb_file.open('r', encoding='utf-8') as f:
            data = json.load(f)
            app_title = data.get(name_variable)
            if app_title:
                app_titles[locale] = app_title
                print(f' Found: {locale} = "{app_title}"')

    return app_titles


# Update desktop file with new app titles
def main():
    config = load_env_config()
    if config is None:
        return 1

    arb_dir, desktop_file, name_variable = config

    if not desktop_file.exists():
        print(f"Error: Desktop file {desktop_file} does not exist.")
        return 1

    lines = desktop_file.read_text(encoding='utf-8').splitlines()
    new_lines = []

    # Track if we are in the [Desktop Entry] section of the file
    in_desktop_entry = False

    # Track where in the [Desktop Entry] to insert the l10n Names
    insertion_index = None

    # Build new file based on old without any Name translations from [Desktop Entry]
    for line in lines:
        # See if we are in the [Desktop Entry] section
        if line.strip() == '[Desktop Entry]':
            in_desktop_entry = True
        elif line.strip().startswith('[') and line.strip().endswith(']'):
            # We've left the [Desktop Entry] section
            # If we haven't found an insertion point yet, set it to the end of [Desktop Entry]
            if in_desktop_entry and insertion_index is None:
                insertion_index = len(new_lines)
            in_desktop_entry = False

        # Skip existing Name[...] translations, they will be regenerated.
        if in_desktop_entry and line.startswith('Name['):
            continue

        # Anchor insertion point immediately after the Name= line for readability
        if in_desktop_entry and line.startswith('Name=') and insertion_index is None:
            insertion_index = len(new_lines) + 1

        new_lines.append(line)

    # If we're still in [Desktop Entry] at EOF (no other sections after it)
    # and haven't set insertion_index yet, set it to end of file
    if in_desktop_entry and insertion_index is None:
        insertion_index = len(new_lines)

    # We never found the [Desktop Entry], something is wrong with the file
    if insertion_index is None:
        print("Error: could not find [Desktop Entry] section in desktop file")
        return 1

    app_titles = get_app_titles(arb_dir, name_variable)

    if app_titles is None:
        print(f"Error: Failed to load app titles from {arb_dir}")
        return 1

    if not app_titles:
        print(f"Error: No app titles found in {arb_dir}")
        return 1

    # Add new Name translations at the insertion point
    for locale, title in app_titles.items():
        new_lines.insert(insertion_index, f'Name[{locale}]={title}')
        insertion_index += 1

    # Write updated desktop file
    desktop_file.write_text('\n'.join(new_lines) + '\n', encoding='utf-8')
    print(f"Updated desktop file written to {desktop_file}")
    return 0


if __name__ == "__main__":
    exit(main())
