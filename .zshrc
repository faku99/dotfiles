export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM="$HOME/.config/oh-my-zsh"
ZSH_THEME="default"

CASE_SENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UPDATE_PROMPT="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git gitignore)

source $ZSH/oh-my-zsh.sh

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

# VSCodium
alias code='codium'

# zsh
zstyle 'completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle 'completion:*' special-dirs true

# Tell Firefox to use wayland instead of xwayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

# Add flatpak folders to XDG_DATA_DIRS
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source .sigi script on work desktop
if [ $(hostname) = "lel-debian" ]; then
    source "${HOME}/tandem/sigi/.sigi"
fi

# Deno
export DENO_INSTALL="${HOME}/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"