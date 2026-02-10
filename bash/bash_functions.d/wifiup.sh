# ~/.bash_functions.d/wifiup.sh
# Wi-Fi connect function
wifiup() {
    # Only root can bring up Wi-Fi
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "\e[38;5;210mPlease run this as root\e[0m"
        return 1
    fi

    # Detect wireless interface (first one up)
    local iface
    iface=$(ip link | awk -F: '/wlan|wl/ {print $2; exit}' | tr -d ' ')
    [ -z "$iface" ] && { echo -e "\e[38;5;210mNo wireless interface found\e[0m"; return 1; }

    # Check if already connected
    if iwconfig "$iface" 2>/dev/null | grep -q "ESSID:\".*\""; then
        echo -e "\e[38;5;114m$iface is already connected\e[0m"
        return 0
    fi

    # Default wpa_supplicant config
    local conf=${1:-/etc/wpa_supplicant.conf}

    # Start wpa_supplicant in background
    echo -e "\e[38;5;116mStarting wpa_supplicant on $iface...\e[0m"
    wpa_supplicant -B -i "$iface" -c "$conf" || { echo -e "\e[38;5;210mFailed to start wpa_supplicant\e[0m"; return 1; }

    # Start dhcpcd to get IP
    echo -e "\e[38;5;116mRunning dhcpcd on $iface...\e[0m"
    dhcpcd "$iface" || { echo -e "\e[38;5;210mFailed to get IP\e[0m"; return 1; }

    # Confirm connection
    local ssid
    ssid=$(iwgetid -r 2>/dev/null)
    if [ -n "$ssid" ]; then
        echo -e "\e[38;5;114mConnected to Wi-Fi: $ssid\e[0m"
    else
        echo -e "\e[38;5;210mCould not detect SSID\e[0m"
    fi
}
