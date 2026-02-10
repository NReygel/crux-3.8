#!/bin/bash
# Git + Codeberg Interactive Cheatsheet - Compact Pager Mode
# Terminal-safe, fits 80x24, no scrolling required

# Colors
BOLDWHITE="\033[1;97m"
LIGHTBLUE="\033[1;94m"
CYAN="\033[1;96m"
RESET="\033[0m"

# Maximum content lines per section (header + lines + footer)
MAX_LINES=20

# Sections content
sections=(
"1. Cloning a repository
${LIGHTBLUE}git clone git@codeberg.org:YOUR_USERNAME/repo-name.git${RESET}
${CYAN}# SSH (recommended)
${LIGHTBLUE}git clone https://codeberg.org/YOUR_USERNAME/repo-name.git${RESET}
${CYAN}# HTTPS alternative"

"2. Check or update remotes
${LIGHTBLUE}git remote -v
git remote set-url origin git@codeberg.org:YOUR_USERNAME/repo-name.git"

"3. Basic workflow
${LIGHTBLUE}git status
git add file.txt       # stage single file
git add .              # stage all changes
git commit -m \"Message\"
git push origin main
git pull origin main"

"4. Branching
${LIGHTBLUE}git checkout -b new-branch   # create branch
git checkout main            # switch branch
git push -u origin new-branch"

"5. Viewing commits
${LIGHTBLUE}git log
git log --oneline --graph --all"

"6. Merging
${LIGHTBLUE}git checkout main
git merge new-branch"

"7. Deleting branches
${LIGHTBLUE}git branch -d old-branch            # local
git push origin --delete old-branch       # remote"

"8. Tags
${LIGHTBLUE}git tag
git tag v1.0
git push origin v1.0"

"9. Undoing changes
${LIGHTBLUE}git checkout -- file.txt       # discard changes
git reset file.txt                 # unstage changes
git reset --soft HEAD~1            # undo last commit but keep changes"

"10. Checking differences
${LIGHTBLUE}git diff                     # working directory
git diff --staged                  # staged changes"

"11. Useful shortcuts
${LIGHTBLUE}git branch                  # local branch
git branch -a                     # local + remote
git remote get-url origin         # show remote URL
git stash                         # stash changes temporarily
git stash apply                   # reapply stash"

"12. SSH tips for Codeberg
${LIGHTBLUE}ssh -T git@codeberg.org
${CYAN}# Use SSH URLs to avoid typing passwords"
)

# Function to display a section compactly
display_section() {
    local index=$1
    clear
    local header="${sections[$index]%%$'\n'*}"
    local body="${sections[$index]#*$'\n'}"

    # Wrap lines to ~76 chars to fit 80x24 terminal
    echo -e "${BOLDWHITE}==================================================${RESET}"
    echo -e "${BOLDWHITE}  $header${RESET}"
    echo -e "${BOLDWHITE}==================================================${RESET}"

    # Use fold to wrap lines within 76 characters
    echo -e "$body" | fold -s -w 76

    echo -e "\n${CYAN}[n] Next  [p] Previous  [m] Menu  [q] Quit${RESET}"
}

# Main menu loop
current=0
while true; do
    clear
    echo -e "${BOLDWHITE}==================================================${RESET}"
    echo -e "${BOLDWHITE}            Git + Codeberg Cheatsheet${RESET}"
    echo -e "${BOLDWHITE}==================================================${RESET}\n"

    # Show compact menu (header only)
    for i in {0..11}; do
        echo -e "${LIGHTBLUE}$((i+1))) ${sections[$i]%%$'\n'*}${RESET}"
    done

    echo -e "\n${CYAN}Select chapter (1-12) or q to quit:${RESET} "
    read -r choice

    if [[ "$choice" =~ ^[1-9]$|^1[0-2]$ ]]; then
        current=$((choice-1))
        while true; do
            display_section "$current"
            read -r nav
            case "$nav" in
                n|N)
                    current=$(((current+1)%12))
                    ;;
                p|P)
                    current=$(((current+11)%12))
                    ;;
                m|M)
                    break
                    ;;
                q|Q)
                    clear
                    echo -e "${BOLDWHITE}Bye!${RESET}"
                    exit 0
                    ;;
                *)
                    # ignore invalid input
                    ;;
            esac
        done
    elif [[ "$choice" =~ ^[qQ]$ ]]; then
        clear
        echo -e "${BOLDWHITE}Bye!${RESET}"
        exit 0
    else
        echo -e "${CYAN}Invalid choice. Press Enter to continue.${RESET}"
        read
    fi
done
