#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# Shared configurations
[[ -f ~/.sharedrc ]] && . ~/.sharedrc

# Environment Variables
#if [ -d ~/.config/shell/bash/env.d ]; then
   for file in ~/.config/shell/bash/env.d/* ; do
      if [ -f "$file" ] ; then
	   echo "$file"
	   source "$file"
      fi
   done
#if

# Path
[[ -f ~/.config/shell/bash/path ]] && source ~/.config/shell/bash/path

# Aliases
#if [ -d ~/.config/shell/bash/alias.d ]; then
   for file in ~/.config/shell/bash/alias.d/* ; do
      if [ -f "$file" ] ; then
   	   echo "$file"
	   source "$file"
      fi
   done
#fi

# Functions
#if [ -d ~/.config/shell/bash/functions.d ]; then
   for file in ~/.config/shell/bash/functions.d/* ; do
      if [ -f "$file" ] ; then
	   echo "$file"
	   source "$file"
      fi
   done
#fi

clear
