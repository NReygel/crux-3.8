# File : .bashrc
#
# This file is sourced by all *interactive* bash shells on startup

# Test for an interactive shell.  There is no need to set anything
# past this point if it isn't
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Source .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Source .bash_functions if it exists
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# Source .bash_colors if it exists
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Put your fun stuff here.
export EDITOR=vim
