# ~/.bash_functions.d/wifidown.sh
# Bring Wi-Fi down cleanly
wifidown() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "\e[38;5;210mPlease run as root (sudo wifidown)\e[0m"
        return 1
    fi

    local iface
    iface=$(/sbin/ip link | awk -F: '/wlan|wl/ {print $2; exit}' | tr -d ' ')

    if [ -z "$iface" ]; then
        echo -e "\e[38;5;210mNo wireless interface found\e[0m"
        return 1
    fi

    echo -e "\e[38;5;116mStopping dhcpcd on $iface...\e[0m"
    /sbin/dhcpcd -k "$iface" 2>/dev/null

    echo -e "\e[38;5;116mStopping wpa_supplicant on $iface...\e[0m"
    killall wpa_supplicant 2>/dev/null

    /sbin/ip link set "$iface" down

    echo -e "\e[38;5;114mWi-Fi disabled on $iface\e[0m"
}
