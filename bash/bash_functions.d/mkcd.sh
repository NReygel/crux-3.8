# ~/.bash_functions.d/mkcd.sh
# Make a directory and cd into it
mkcd() {
    if [ -z "$1" ]; then
        echo -e "\e[38;5;210mUsage:\e[0m mkcd <directory>"
        return 1
    fi

    mkdir -p "$1" && cd "$1" || {
        echo -e "\e[38;5;210mFailed to create or enter:\e[0m $1"
        return 1
    }

    echo -e "\e[38;5;114mCreated and entered directory:\e[0m $1"
}
