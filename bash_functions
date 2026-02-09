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
