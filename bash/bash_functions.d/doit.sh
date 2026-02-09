# ~/.bash_functions.d/doit.sh
# Function to re-run the previous command with sudo
doit() {
    # Get the last command from history (excluding this function call)
    local last_cmd
    last_cmd=$(history -p '!!')

    # Remove leading history numbers and whitespace
    last_cmd=$(echo "$last_cmd" | sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//')

    if [ -z "$last_cmd" ]; then
        echo -e "\e[38;5;210mNothing to execute\e[0m"
        return 1
    fi

    # Show the command in pastel cyan
    echo -e "\e[38;5;116mRunning with sudo:\e[0m $last_cmd"

    # Execute the command with sudo
    sudo $last_cmd

    ### Optional: print success/failure
    # if [ $? -eq 0 ]; then
    #     echo -e "\e[38;5;114mCommand completed successfully!\e[0m"
    # else
    #     echo -e "\e[38;5;210mCommand failed!\e[0m"
    # fi
}
