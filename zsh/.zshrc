# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Modern CLI tool aliases
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias lt='eza --tree --icons'
alias cat='bat'

# fzf shell integration
source <(fzf --zsh)
