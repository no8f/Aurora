#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <brightness|volume> <value>"
    exit 1
fi

# Check if the first argument is either 'brightness' or 'volume'
if [ "$1" != "brightness" ] && [ "$1" != "volume" ]; then
    echo "Invalid argument: $1. Should be 'brightness' or 'volume'."
    exit 1
fi

# Set brightness or volume based on the first argument
if [ "$1" == "brightness" ]; then
    brightnessctl set $2
    CURRENT_BRIGHTNESS=$(brightnessctl g)
    CURRENT_BRIGHTNESS=${( bc -l <<< 'CURRENT_BRIGHTNESS / 255 * 100' )}
    CURRENT_BRIGHTNESS=${CURRENT_BRIGHTNESS%%.*}
    echo $CURRENT_BRIGHTNESS
    dunstify -r 12 --icon=$HOME/.icons/Fluent/32/status/weather-clear.svg -h int:value:$CURRENT_BRIGHTNESS "Brightness"

elif [ "$1" == "volume" ]; then
    amixer -D pulse sset Master $2
    notify-send -i /home/nof/.icons/Fluent/scalable/apps/volume-knob.svg -h int:value:60 "Volume"
fi

