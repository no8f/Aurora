#!/bin/bash

$(swww init) &

$($HOME/.config/eww/launch_bar init) &

$(nm-applet) &

$(swaync) &

$(hypridle) &

$(/usr/lib/polkit-kde-authentication-agent-1) &

$(dropbox) &
