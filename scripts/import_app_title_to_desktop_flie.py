#!/usr/bin/env python3

import json
import re
from pathlib import Path


# Extract locale code from ARB file name
def extract_locale_from_arb_file(file_path):
    match = re.match(r'app_([a-z]{2}(?:_[A-Z]{2})?).arb$', file_path)
    return match.group(1) if match else None


# Get app titles from ARB files
def get_app_titles(title_variable: str) -> dict[str, str] | None:
    arb_dir = Path('packages/security_center/lib/l10n')

    if not arb_dir.exists() or not arb_dir.is_dir():
        print(f"Directory {arb_dir} does not exist.")
        return None

    # Load app titles from ARB files
    app_titles = {}

    for arb_file in arb_dir.glob('app_*.arb'):
        locale = extract_locale_from_arb_file(arb_file.name)
        if not locale:
            print(f"Could not extract locale from file name: {arb_file.name}")
            continue

        with arb_file.open('r', encoding='utf-8') as f:
            data = json.load(f)
            app_title = data.get(title_variable)
            if app_title:
                app_titles[locale] = app_title
                print(f' Found: {locale} = "{app_title}"')

    return app_titles


# Update desktop file with new app titles
def main():
    desktop_file = Path('snap/gui/desktop-security-center.desktop')

    if not desktop_file.exists():
        print(f"Desktop file {desktop_file} does not exist.")
        return None

    lines = desktop_file.read_text(encoding='utf-8').splitlines()

    new_lines = []

    # Build new file based on old without any Name translations
    for line in lines:
        if line.startswith('Name['):
            continue
        new_lines.append(line)

    app_titles = get_app_titles('appTitle')

    if app_titles is None:
        return 1

    # Add new Name translations
    for locale, title in app_titles.items():
        new_lines.append(f'Name[{locale}]={title}')

    # Write updated desktop file
    desktop_file.write_text('\n'.join(new_lines) + '\n', encoding='utf-8')
    print(f"Updated desktop file written to {desktop_file}")
    return 0


if __name__ == "__main__":
    exit(main())
