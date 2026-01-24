#!/bin/bash

powerprofilesctl | awk '/:$/ {gsub(/[:*]/,""); print $1}' | rofi -dmenu | xargs powerprofilesctl set

CURRENT_PROFILE="$(powerprofilesctl get)"
notify-send -u normal -i preferences-system-power "Profile Updated" "Current Profile: $CURRENT_PROFILE"
