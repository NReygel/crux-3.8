# File: ~/.bash_functions
#
# Interactive helper functions for Bash.
# This file must remain silent on load.

########################################
# mkcd — create directory and enter it #
########################################
mkcd() {
    [[ -z $1 ]] && return 1
    mkdir -p -- "$1" && cd -- "$1"
}

########################################
# up — go up N directories (default 1) #
########################################
up() {
    local n=${1:-1}
    while (( n-- > 0 )); do
        cd .. || return
    done
}

########################################
# extract — extract common archives    #
########################################
extract() {
    [[ -f $1 ]] || { echo "extract: file not found" >&2; return 1; }

    case "

#########################################################################
# mkal — Function to add the last executed command as a permanent alias #
#########################################################################
mkal() {
    # Ensure color variables exist (fallback to empty)
    : "${PASTEL_RED:=}" "${PASTEL_GREEN:=}" "${PASTEL_PURPLE:=}" "${PASTEL_YELLOW:=}"
    : "${PASTEL_CYAN:=}" "${PASTEL_ORANGE:=}" "${PASTEL_GREY:=}" "${RESET:=}"

    # Usage
    if [ -z "$1" ]; then
        echo "${PASTEL_RED}Usage:${RESET} mkal <alias_name>"
        return 1
    fi

    local alias_name="$1"

    # Create ~/.bash_aliases if missing
    if [ ! -f ~/.bash_aliases ]; then
        echo "${PASTEL_RED}File ~/.bash_aliases not found:${PASTEL_GREEN} creating with headers.${RESET}"
        {
            echo "#!/bin/bash"
            echo "# File name: bash_aliases"
            echo "# File created: $(date +'%d/%m/%Y')"
            echo "# User@Host: $(whoami)@$(hostname)"
            echo ""
        } >> ~/.bash_aliases
    fi

    # Check if alias already exists
    if grep -qE "^alias ${alias_name}=" ~/.bash_aliases; then
        echo "${PASTEL_YELLOW}Alias '${alias_name}' already exists in ~/.bash_aliases.${RESET}"
        return 1
    fi

    # Get last command (excluding mkal itself)
    local last_command
    last_command=$(history -p '!!')
    last_command=$(echo "$last_command" | sed 's/^[[:space:]]*[0-9][[:space:]]*//; s/^[[:space:]]*//')

    # Choose pastel color for fun effect (cycle through green, cyan, purple)
    local colors=("${PASTEL_GREEN}" "${PASTEL_CYAN}" "${PASTEL_PURPLE}")
    local color="${colors[$((RANDOM % ${#colors[@]}))]}"

    # Append alias
    echo "alias $alias_name='$last_command'" >> ~/.bash_aliases
    echo "Alias '${color}$alias_name${RESET}' added for command: ${PASTEL_YELLOW}$last_command${RESET}"

    # Source aliases immediately
    source ~/.bash_aliases
    echo "New alias available in current and future sessions."
}
