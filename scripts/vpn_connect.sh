output=$(protonvpn connect)

if echo "$output" | grep -q "Connection failed"; then
    notify-send -u critical -i dialog-error "VPN Connection Status" "Failed to connect to VPN. Please check your network settings."
else
    region=$(echo "$output" | awk '{print $3 ":" $12}')
    
    if [ -z "$region" ]; then
        notify-send -u critical -i dialog-error "VPN Connection Status" "Failed to connect to VPN. Please check your connection settings."
    else
        notify-send -u normal -i network-wireless "VPN Connection Status" "Successfully connected to VPN. Region: $region"
    fi
fi

