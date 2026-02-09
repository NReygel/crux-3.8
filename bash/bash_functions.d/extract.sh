# ~/.bash_functions.d/extract.sh
# Extract archives based on file extension
extract() {
    if [ -z "$1" ]; then
        echo -e "\e[38;5;210mUsage:\e[0m extract <file>"
        return 1
    fi

    local file="$1"

    if [ ! -f "$file" ]; then
        echo -e "\e[38;5;210mError:\e[0m '$file' does not exist"
        return 1
    fi

    case "$file" in
        *.tar.bz2)   tar xjf "$file" ;;
        *.tar.gz)    tar xzf "$file" ;;
        *.tar.xz)    tar xJf "$file" ;;
        *.tar)       tar xf "$file"  ;;
        *.zip)       unzip "$file"   ;;
        *.rar)       unrar x "$file" ;;
        *.7z)        7z x "$file"    ;;
        *)           echo -e "\e[38;5;210mCannot extract:\e[0m $file - unknown format" ;;
    esac

    if [ $? -eq 0 ]; then
        echo -e "\e[38;5;114mExtraction completed successfully:\e[0m $file"
    else
        echo -e "\e[38;5;210mExtraction failed:\e[0m $file"
    fi
}
