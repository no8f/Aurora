#!/bin/bash

# New color value
new_color="$1"

# Path to your CSS file
css_files=("$@")

# Perform the replacement

for ((i = 1; i <= ${#css_files[@]}; i++)); do
  sed -i "s/@define-color primary-color #\([0-9A-Fa-f]\+\);/@define-color primary-color #$new_color;/" "${css_files[$i]}"
done

killall swaync
$(swaync) &

echo "Color value replaced successfully."

