#!/bin/bash

apps="$@"

# Function to check if a file contains Electron-specific information
check_electron_app() {
  for app in $apps; do
    desktop_file="/usr/share/applications/${app}.desktop"
    if [ "$desktop_file" == "$1" ]; then
      return 0
    else
      return 1
    fi
  done
}

# Function to modify the Exec line in a .desktop file
modify_desktop_entry() {
  sed -i "s/^\(Exec=.*\)$/\1 $2/" "$3"
}

# Directory containing .desktop files
desktop_dir="/usr/share/applications"

# Arguments to append to Electron apps
extra_args="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto"

# Loop through .desktop files
for desktop_file in "$desktop_dir"/*.desktop; do
  if [ -f "$desktop_file" ]; then
    if check_electron_app "$desktop_file"; then
      modify_desktop_entry "$(grep -E '^Exec=' "$desktop_file" | cut -d '=' -f2-)" "$extra_args" "$desktop_file"
      echo "Modified: $desktop_file"
    fi
  fi
done

