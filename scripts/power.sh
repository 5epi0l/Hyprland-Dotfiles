#!/bin/bash

choice=$(printf "⏻ Shutdown\n Reboot\n Suspend\n󰍃 Logout" | rofi -dmenu -prompt "Power")

case "$choice" in
  "⏻ Shutdown") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  " Suspend") systemctl suspend ;;
  "󰍃 Logout") /opt/scripts/lock.sh ;;
esac
