# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For user state files
export XDG_STATE_HOME="$HOME/.local/state"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Neovim as text editor
export EDITOR="nvim"
export VISUAL="nvim"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events for internal history
export HISTSIZE=10000

# Maximum events in file history
export SAVEHIST=10000

export DOTFILES="$HOME/Dotfiles"

# Changes Find to Ripgrep in FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# For downloads
export DOWNLOADS=$HOME/Downloads

# For screenshots
export SCREENSHOTS=$HOME/Pictures/.Screenshots

# For projects
export PROJECTS=$HOME/Desktop/Projects

# .NET Env
export DOTNET_ROOT=/sbin/dotnet
