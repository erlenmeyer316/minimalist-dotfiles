
#!/usr/bin/env zsh
#
# ~/.zshrc
#

# Settings
[[ -f ~/.config/shell/zsh/.zsh_settings ]] && . ~/.config/shell/zsh/.zsh_settings

#Prompt
[[ -f ~/.config/shell/zsh/.zsh_prompt ]] && . ~/.config/shell/zsh/.zsh_prompt

# Shared configurations
[[ -f ~/.config/shell/shared/.sharedrc ]] && . ~/.config/shell/shared/.sharedrc

# Path
#[[ -f ~/.config/shell/bash/path ]] && source ~/.config/shell/bash/path

# Environment Variables
#if [ -d ~/.config/shell/bash/env.d ]; then
#   for file in ~/.config/shell/bash/env.d/* ; do
#      if [ -f "$file" ]; then
#	  #echo "Sourcing ${file}"
#          source "$file"
#      fi
#   done
#fi

# Functions
if [ -d ~/.config/shell/zsh/function.d ]; then
   for file in ~/.config/shell/zsh/function.d/* ; do
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

