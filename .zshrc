export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM="$HOME/.config/oh-my-zsh"
ZSH_THEME="default"

CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UPDATE_PROMPT="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git gitignore)

source $ZSH/oh-my-zsh.sh

# User configuration

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ls
alias ls='ls -l --color=auto'
alias la='ls -a'

# gdb
alias gdb='gdb -q'
alias gdb-multiarch='gdb-multiarch -q'

# sudo
alias sudo='sudo -E'

# zsh
zstyle 'completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle 'completion:*' special-dirs true

# clangd
#export PATH="$HOME/sources/clangd/latest/bin:$PATH"

# deno
export DENO_INSTALL="/home/faku/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# VSCodium
alias code='codium'

# i3smartfocus
function i3smartfocus() {
    $(which python3) ${HOME}/.local/bin/i3smartfocus.py $1
}

# cargo
source "${HOME}/.cargo/env"

# zig
export PATH="/opt/zig:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
