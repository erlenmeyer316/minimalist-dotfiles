# Where user-specific configurations should be written (analogous to /etc).
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
# Where user-specific data files should be written (analogous to /usr/share).
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
# Where user-specific non-essential (cached) data should be written (analogous to /var/cache).
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
# Where user-specific state files should be written (analogous to /var/lib).
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

# editors
export EDITOR="nvim"
export VISUAL="nvim"

# zsh config directory
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
# zsh maximum events for zsh internal history
export HISTSIZE=1000000
# zsh maximum events in zsh history file
export SAVEHIST=1000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# zsh key timeout
export KEYTIMEOUT=1
export SHELL_SESSIONS_DISABLE=1

export STARSHIP_CONFIG="${STARSHIP_CONFIG:=$XDG_CONFIG_HOME/starship/starship.toml}"
# Misc
export DOTFILES="${DOTFILES:=$XDG_CONFIG_HOME/dotfiles}"
export WORKSPACE="${WORKSPACE:=$XDG_CONFIG_HOME/Workspace}"

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export NNN_TRASH=1            # use trash-cli
export NNN_FIFO=/tmp/nnn.fifo # temporary buffer for the previews
export NNN_OPTS="dHeE"        # d for details, H to show hidden files, e to open in visual editor
export LC_COLLATE="C"         # hidden files on top
export NNN_PLUG='p:preview-tui'
export SPLIT='v' # to split Kitty vertically
export PAGER="less -R"


export WORKSPACE="${HOME}/Workspace"
#export NNN_BMS="$HOME;$HOME/Downloads;$HOME/Documents;$HOME/Desktop;$HOME/dotfiles"
