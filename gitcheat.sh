#!/bin/bash
# Git + Codeberg Interactive Cheatsheet (80x24 terminal)
# Menu-driven: choose chapter to view

# Colors
BOLDWHITE="\033[1;97m"
LIGHTBLUE="\033[1;94m"
CYAN="\033[1;96m"
RESET="\033[0m"

# Function to print a section
print_section() {
    clear
    echo -e "${BOLDWHITE}==================================================${RESET}"
    echo -e "${BOLDWHITE}  $1${RESET}"
    echo -e "${BOLDWHITE}==================================================${RESET}"
    echo -e "$2"
    echo -e "\n${BOLDWHITE}Press Enter to return to menu...${RESET}"
    read
}

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
git
