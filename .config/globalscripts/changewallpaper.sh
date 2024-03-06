#!/bin/bash

# Define the folder containing the pictures
PICTURE_FOLDER="$HOME/Pictures/Wallpapers"

# Check if the folder exists
if [ ! -d "$PICTURE_FOLDER" ]; then
    echo "Error: Picture folder not found."
    exit 1
fi

# Get the list of picture files in the folder
PICTURE_FILES=("$PICTURE_FOLDER"/*)

# Check if there are any picture files
if [ ${#PICTURE_FILES[@]} -eq 0 ]; then
    echo "Error: No pictures found in the folder."
    exit 1
fi

# Get the index of the last displayed picture

LAST_INDEX_FILE="$PICTURE_FOLDER/.last_index"

if [ -f "$LAST_INDEX_FILE" ]; then
    LAST_INDEX=$(cat "$LAST_INDEX_FILE")
else
    LAST_INDEX=0
fi

# Calculate the index of the next picture
NEXT_INDEX=$(( (LAST_INDEX + 1) % ${#PICTURE_FILES[@]} ))

# Get the next picture file
NEXT_PICTURE="${PICTURE_FILES[$NEXT_INDEX]}"

swww img "$NEXT_PICTURE" -t grow --transition-pos top-left --transition-fps 90

cp "$NEXT_PICTURE" $PICTURE_FOLDER/.current.png

wal -c
wal -t -s -n -q -e -i $HOME/Pictures/Wallpapers/.current.png

HIHGLIGHT_COLOR=$(cat ~/.cache/wal/sequences | sed -n 's/.*4;3;#\([0-9A-Fa-f]\+\).*/\1/p')
echo $HIHGLIGHT_COLOR

$HOME/.config/globalscripts/updateHighlightcolor.sh $HIHGLIGHT_COLOR $HOME/.config/eww/eww.css $HOME/.config/swaync/style.css

# Save the index of the displayed picture for the next execution
echo "$NEXT_INDEX" > "$LAST_INDEX_FILE"
