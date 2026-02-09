# File: ~/.bash_aliases
#
# Aliases for interactive use only.
# Keep this file silent — no output on load.

### Safety ###
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

### ls ###
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

### cd shortcuts ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

### grep ###
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### coreutils ###
alias df='df -h'
alias du='du -h'
alias free='free -h'

### CRUX ###
alias ports='cd /usr/ports'
alias llports='ls /usr/ports'

### history ###
alias h='history'
alias hg='history | grep'
