#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# Shared configurations
[[ -f ~/.sharedrc ]] && . ~/.sharedrc

# Environment Variables
if [ -d ~/.config/shell/bash/env.d ]; then
   for file in ~/.config/shell/bash/env.d/* ; do
      if [ -f "$file" ]; then
	  #echo "Sourcing ${file}"
          source "$file"
      fi
   done
fi

# Path
[[ -f ~/.config/shell/bash/path ]] && source ~/.config/shell/bash/path

# Functions
if [ -d ~/.config/shell/bash/function.d ]; then
   for file in ~/.config/shell/bash/function.d/* ; do
      if [ -f "$file" ]; then
	  #echo "Sourcing ${file}"
	  source "$file"
      fi
   done
fi

# Aliases
if [ -d ~/.config/shell/bash/alias.d ]; then
   for file in ~/.config/shell/bash/alias.d/* ; do
      if [ -f "$file" ]; then
	  #echo "Sourcing ${file}"
	  source "$file"
      fi
   done
fi

