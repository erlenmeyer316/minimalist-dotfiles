#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
for file in ~/.config/bash/env.d/* ; do
   if [ -f "$file" ] ; then
	#echo "$file"
	source "$file"
   fi
done

# Path
source ~/.config/bash/path

# Aliases
for file in ~/.config/bash/alias.d/* ; do
   if [ -f "$file" ] ; then
	#echo "$file"
	source "$file"
   fi
done

# Functions
for file in ~/.config/bash/functions.d/* ; do
   if [ -f "$file" ] ; then
	#echo "$file"
	source "$file"
   fi
done


#source $XDG_CONFIG_HOME/bash/theme.d/dracula
#source $XDG_CONFIG_HOME/bash/prompt.d/prompt


# Start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi


