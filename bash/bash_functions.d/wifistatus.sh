# ~/.bash_functions.d/wifistatus.sh
# Show Wi-Fi status
wifistatus() {
    local BLUE='\e[38;5;117m'
    local CYAN='\e[38;5;159m'
    local RED='\e[38;5;210m'
    local GREEN='\e[38;5;114m'
    local NC='\e[0m'

    local iface
    iface=$(/sbin/ip link | awk -F: '/wlan|wl/ {print $2; exit}' | tr -d ' ')

    if [ -z "$iface" ]; then
        echo -e "${RED}No wireless interface found${NC}"
        return 1
    fi

    local ssid
    ssid=$(/sbin/iwgetid -r 2>/dev/null)

    if [ -n "$ssid" ]; then
        echo -e "${GREEN}Wi-Fi:${NC} ${CYAN}$ssid${NC} (${BLUE}$iface${NC})"
        /sbin/ip -brief addr show "$iface" | awk '{print "IP: "$3}'
    else
        echo -e "${RED}Wi-Fi:${NC} disconnected (${BLUE}$iface${NC})"
    fi
}
