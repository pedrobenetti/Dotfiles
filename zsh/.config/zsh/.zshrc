# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export PATH=$PATH:/usr/bin/pyhton3
export PATH=$PATH:/home/pedro/.local/bin
export PATH=$PATH:~/.local/bin/pip3:~/.local/bin/pip3.10
export PATH=$PATH:~/.asdf/installs/python/3.10.9/bin
export PATH=$PATH:~/.asdf/installs/rust/1.79.0/bin
export PATH=$PATH:/home/mestrinari/.local/bin
export PATH=$PATH:~/.fzf/bin
export PATH=$PATH:~/LSP/jdtls/bin
export PATH=$PATH:~/LSP/lua_ls/bin
export PATH=$PATH:~/.config/composer/vendor/bin


export QT_QPA_PLATFORMTHEME=qt5ct

# .NET Variables
export PATH=$PATH:/home/mestrinari/.dotnet/tools
export PATH=$PATH:/opt/mssql-tools18/bin
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Terminal
#export TERM="rxvt-unicode-256color"

##Sources
source "$XDG_CONFIG_HOME/zsh/aliases"
source "$DOTFILES/zsh/.config/zsh/scripts.sh"

source $XDG_CONFIG_HOME/zsh/external/bd.zsh
source $XDG_CONFIG_HOME/zsh/external/zsh-autosuggestions/zsh-autosuggestions.zsh
source $XDG_CONFIG_HOME/zsh/external/completion.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Sources for ASDF
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
. ~/.asdf/plugins/java/set-java-home.zsh



##ZSH Modifiers
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

##Autocomplete hidden files 
_comp_options+=(globdots)

##Autoloads content of the external folder
fpath=($ZDOTDIR/external $fpath)

##Autoloads
#Completion system
autoload -Uz compinit; compinit
#Custom ZSH prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup
#Changes cursor between visual and insert mode
autoload -Uz cursor_mode && cursor_mode
#Editing commands with Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


##Folder History - usage: d -> number
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


##Vi mode
bindkey -v
export KEYTIMEOUT=1
#Vi keys
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#bindkey -r '^l'
#bindkey -r '^g'
#bindkey -s '^g' 'clear\n'


##FZF config 
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#eval "$(starship init zsh)"
