# File: ~/.bash_functions.d/00-template.sh
#
# Template for adding interactive Bash functions
# Copy and rename this file for each new function
# This file is safe to source; nothing runs on its own
# Use pastel colors from ~/.bash_colors for messages

# Prevent accidental execution
[ "$BASH_SOURCE" = "$0" ] && exit

# Ensure color variables exist (fallback to empty)
: "${PASTEL_RED:=}" "${PASTEL_GREEN:=}" "${PASTEL_PURPLE:=}" "${PASTEL_YELLOW:=}"
: "${PASTEL_CYAN:=}" "${PASTEL_ORANGE:=}" "${PASTEL_GREY:=}" "${RESET:=}"

# Example function: myfunc
myfunc() {
    # Usage check
    if [ -z "$1" ]; then
        echo "${PASTEL_RED}Usage:${RESET} myfunc <arg>"
        return 1
    fi

    local arg="$1"

    # Main logic here
    # Replace this with actual functionality
    echo "${PASTEL_GREEN}You passed argument:${RESET} ${PASTEL_CYAN}$arg${RESET}"

    # Optional: return meaningful exit code
    return 0
}

# End of template
