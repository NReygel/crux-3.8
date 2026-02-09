# File : .bashrc
#
# This file is sourced by all *interactive* bash shells on startup

# Test for an interactive shell.  There is no need to set anything
# past this point if it isn't
# Short but less readable version: [[ $- != *i* ]] && return
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

### Source aliases, functions, colors if present ###
for f in ~/.bash_aliases ~/.bash_functions ~/.bash_colors; do
    [[ -f $f ]] && . "$f"
done

### History handling ###
# Bigger, persistent history
HISTSIZE=5000
HISTFILESIZE=10000
HISTFILE=~/.bash_history
# Append to history file, don't overwrite
shopt -s histappend
# Group multi-line commands into a single history entry
shopt -s cmdhist
# Save each command immediately (important for multiple terminals)
PROMPT_COMMAND='history -a; history -n'
# Ignore duplicates and trivial commands
HISTCONTROL=ignoreboth:erasedups
# Commands to ignore completely
HISTIGNORE='ls:ll:la:pwd:cd:cd -:exit:clear:history:*password*:*secret*:*token*'
# Store timestamps (ISO-like, readable)
HISTTIMEFORMAT='%F %T  '


### Prompt (PS1) ###
PS1='\u@\h:\w$( [[ $? != 0 ]] && echo " !")\$ '

### Navigation & shell behavior ###
# Auto-correct small typos
shopt -s cdspell
# Pushd/popd usability
shopt -s autocd
# Keep line wrapping correct after resize (especially on TTY)
shopt -s checkwinsize
# Make globbing safer, error instead of silently doing nothing
shopt -s failglob

