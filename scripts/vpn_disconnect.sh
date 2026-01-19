#!/bin/bash

disc=$(protonvpn disconnect)

if [ -z "$disc" ]; then
    notify-send -u normal -i network-wireless "VPN Connection Status" "VPN successfully disconnected"
fi
