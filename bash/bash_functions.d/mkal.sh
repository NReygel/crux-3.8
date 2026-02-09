# File: ~/.bash_functions.d/mkal.sh
#
# Add last executed command as a permanent alias
# Safe to source, uses pastel colors from ~/.bash_colors

# Prevent accidental execution
[ "$BASH_SOURCE" = "$0" ] && exit

# Ensure color variables exist
: "${PASTEL_RED:=}" "${PASTEL_GREEN:=}" "${PASTEL_PURPLE:=}" "${PASTEL_YELLOW:=}"
: "${PASTEL_CYAN:=}" "${PASTEL_ORANGE:=}" "${PASTEL_GREY:=}" "${RESET:=}"

mkal() {
    # Usage
    if [ -z "$1" ]; then
        echo "${PASTEL_RED}Usage:${RESET} mkal <alias_name>"
        return 1
    fi

    local alias_name="$1"

    # Create ~/.bash_aliases if missing
    if [ ! -f ~/.bash_aliases ]; then
        # Create file
        {
            echo "#!/bin/bash"
            echo "# File name: bash_aliases"
            echo "# File created: $(date +'%d/%m/%Y')"
            echo "# User@Host: $(whoami)@$(hostname)"
            echo ""
        } >> ~/.bash_aliases

        # Colorful header message
        echo "${PASTEL_RED}Creating new ~/.bash_aliases${RESET} ..."
        echo "${PASTEL_GREEN}File: ~/.bash_aliases${RESET}"
        echo "${PASTEL_CYAN}Created on: $(date +'%d/%m/%Y')${RESET}"
        echo "${PASTEL_PURPLE}User@Host: $(whoami)@$(hostname)${RESET}"
        echo "${PASTEL_YELLOW}Ready to add your first alias!${RESET}"
    fi

    # Check for duplicate alias
    if grep -qE "^alias ${alias_name}=" ~/.bash_aliases; then
        echo "${PASTEL_YELLOW}Alias '${alias_name}' already exists in ~/.bash_aliases.${RESET}"
        return 1
    fi

    # Get last command (excluding mkal itself)
    local last_command
    last_command=$(history -p '!!')
    last_command=$(echo "$last_command" | sed 's/^[[:space:]]*[0-9][[:space:]]*//; s/^[[:space:]]*//')

    # Choose pastel color for alias name
    local colors=("${PASTEL_GREEN}" "${PASTEL_CYAN}" "${PASTEL_PURPLE}")
    local color="${colors[$((RANDOM % ${#colors[@]}))]}"

    # Append alias to file
    echo "alias $alias_name='$last_command'" >> ~/.bash_aliases
    echo "Alias '${color}$alias_name${RESET}' added for command: ${PASTEL_YELLOW}$last_command${RESET}"

    # Source aliases immediately
    source ~/.bash_aliases
    echo "New alias available in current and future sessions."
}
