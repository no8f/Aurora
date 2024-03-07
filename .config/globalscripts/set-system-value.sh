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
    CURRENT_BRIGHTNESS=$(brightnessctl -m | cut -d, -f4 | sed 's/%//')
    notify-send -t 800 -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$CURRENT_BRIGHTNESS -i $HOME/.icons/Fluent/32/status/weather-clear.svg "$CURRENT_BRIGHTNESS"  

elif [ "$1" == "volume" ]; then
    amixer -D pulse sset Master $2
    CURRENT_VOLUME=$(amixer get Master | awk '$0~/%/{print $5}' | tr -d '[]%')
    notify-send -t 800 -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$CURRENT_VOLUME -i $HOME/.icons/Fluent/scalable/apps/applications-multimedia.svg ""  
fi

