#!/bin/bash

EWW="$HOME/clones/eww/target/release/eww -c $HOME/.config/eww/"

TYPE="$1"

FILE="$HOME/.cache/eww_popup_${TYPE}.lock"

if [[ ! -f "$FILE" ]]; then
  sleep 0.1
  ${EWW} open ${TYPE}
  touch ${FILE}
else
  sleep 0.2
  ${EWW} close ${TYPE}
  rm ${FILE}
fi
