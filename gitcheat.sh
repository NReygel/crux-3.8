#!/bin/bash
# Git + Codeberg Cheatsheet (Terminal Poster)
# Run: ./gitcheat.sh
# Light Blue = commands, Cyan = notes, Bold White = headers/dividers

# Colors
BOLDWHITE="\033[1;97m"
LIGHTBLUE="\033[1;94m"
CYAN="\033[1;96m"
RESET="\033[0m"

print_section() {
    echo -e "${BOLDWHITE}==================================================${RESET}"
    echo -e "${BOLDWHITE}  $1${RESET}"
    echo -e "${BOLDWHITE}==================================================${RESET}"
}

print_command() {
    echo -e "${LIGHTBLUE}  $1${RESET}"
}

print_note() {
    echo -e "${CYAN}  $1${RESET}"
}

# Start poster
echo -e "\n${BOLDWHITE}       🎯 Git + Codeberg Terminal Cheatsheet 🎯${RESET}\n"

print_section "1. Cloning a repository"
print_command "git clone git@codeberg.org:YOUR_USERNAME/repo-name.git"
print_note "# SSH (recommended)"
print_command "git clone https://codeberg.org/YOUR_USERNAME/repo-name.git"
print_note "# HTTPS alternative"

print_section "2. Check or update remotes"
print_command "git remote -v"
print_command "git remote set-url origin git@codeberg.org:YOUR_USERNAME/repo-name.git"

print_section "3. Basic workflow"
print_command "git status"
print_command "git add file.txt    # stage a single file"
print_command "git add .           # stage all changes"
print_command "git commit -m \"Message\""
print_command "git push origin main"
print_command "git pull origin main"

print_section "4. Branching"
print_command "git checkout -b new-branch   # create branch"
print_command "git checkout main            # switch branch"
print_command "git push -u origin new-branch"

print_section "5. Viewing commits"
print_command "git log"
print_command "git log --oneline --graph --all"

print_section "6. Merging"
print_command "git checkout main"
print_command "git merge new-branch"

print_section "7. Deleting branches"
print_command "git branch -d old-branch            # local"
print_command "git push origin --delete old-branch  # remote"

print_section "8. Tags"
print_command "git tag"
print_command "git tag v1.0"
print_command "git push origin v1.0"

print_section "9. Undoing changes"
print_command "git checkout -- file.txt     # discard changes"
print_command "git reset file.txt           # unstage changes"
print_command "git reset --soft HEAD~1      # undo last commit but keep changes"

print_section "10. Checking differences"
print_command "git diff                    # working directory"
print_command "git diff --staged           # staged changes"

print_section "11. Useful shortcuts"
print_command "git branch                  # local branch"
print_command "git branch -a               # local + remote branches"
print_command "git remote get-url origin   # show remote URL"
print_command "git stash                    # stash changes temporarily"
print_command "git stash apply              # reapply stash"

print_section "12. SSH tips for Codeberg"
print_command "ssh -T git@codeberg.org"
print_note "# Use SSH URLs to avoid typing passwords"

echo -e "${BOLDWHITE}==================================================${RESET}"
echo -e "        ✅ End of Cheatsheet - Ready to use ✅\n"
