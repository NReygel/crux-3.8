# ~/.bash_functions.d/pathsize.sh
# Show the largest files/folders in the current directory
pathsize() {
    local count=${1:-10}  # Number of entries to show, default 10
    local dir=${2:-.}     # Directory to check, default current

    if [ ! -d "$dir" ]; then
        echo -e "\e[38;5;210mError:\e[0m '$dir' is not a directory."
        return 1
    fi

    echo -e "\e[38;5;116mLargest $count items in '$dir':\e[0m"
    du -sh "$dir"/* 2>/dev/null | sort -h | tail -n "$count" | while read -r size name; do
        echo -e "\e[38;5;189m$size\e[0m  \e[38;5;229m$name\e[0m"
    done
}
