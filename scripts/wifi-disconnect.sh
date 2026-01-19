#!/bin/bash

output=$(nmcli device disconnect wlp8s0)
status_code=$?

if [ $status_code -ne 0 ]; then
    notify-send -u critical -i dialog-error "WiFi Status" "Failed to disconnect. Device not connected."
else
    if echo $output | grep -q "successfully disconnected"; then
        notify-send -u normal -i network-wireless "WiFi Status" "Device wlp8s0 disconnected."
    fi
fi

