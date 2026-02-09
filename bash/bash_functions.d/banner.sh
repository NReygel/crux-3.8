# ~/.bash_functions.d/banner.sh
# Functional pastel-blue Crux shell banner

banner() {
    [[ $- != *i* ]] && return  # Only interactive shells

    # Pastel colors
    local BLUE1='\e[38;5;117m'
    local BLUE2='\e[38;5;153m'
    local CYAN='\e[38;5;159m'
    local NC='\e[0m'  # Reset

    # Gather info
    local userhost="${USER}@$(hostname)"
    local cwd="$(pwd)"
    local lastlogin="$(last -n1 $USER | head -n1 | awk '{print $4,$5,$6,$7}')"
    local funcs
    funcs=$(ls ~/.bash_functions.d/*.sh 2>/dev/null | xargs -n1 basename | sed 's/^[0-9]\+-//; s/\.sh$//' | tr '\n' ' ')

    # Banner
    echo -e "${BLUE1}╭──────────────────────────────╮${NC}"
    echo -e "${BLUE2}│ ${CYAN}User: ${userhost}${BLUE2} │${NC}"
    echo -e "${BLUE2}│ ${CYAN}Dir:  ${cwd}${BLUE2} │${NC}"
    echo -e "${BLUE2}│ ${CYAN}Last login: ${lastlogin}${BLUE2} │${NC}"
    echo -e "${BLUE2}│ ${CYAN}Loaded functions: ${funcs}${BLUE2} │${NC}"
    echo -e "${BLUE1}╰──────────────────────────────╯${NC}"
    echo
}
