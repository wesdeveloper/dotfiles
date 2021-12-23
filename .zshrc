# Path to your oh-my-zsh installation.
export ZSH="/home/weslopes/.oh-my-zsh"

# Theme
ZSH_THEME="arrow"

# Plugins
plugins=(
  git
  tmux
  zsh-nvm
  docker
  docker-compose
  zsh-autosuggestions
  kubectl
  zsh-fzf-history-search
  zsh-z
)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIRnvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# change to only show username
DEFAULT_USER="$(whoami)"

# only show current dir
prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

#### ALIAS ###
# ide script
alias ide="~/./ide.sh"
# Map vi and vim to nvim
alias vi="nvim"
alias vim="nvim"
alias lc='colorls -lA --sd'
alias ls="colorls -A"           # short, multi-line
alias nf="neofetch"
alias lg="lazygit"
alias rg="ranger"
alias jd="node --inspect-brk ./node_modules/.bin/jest -t "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"

export NVM_DIR="/home/weslopes/.nvm"
export PATH="$(nvm which default):$PATH"
export PATH=/usr/local/share/npm/bin:$PATH

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# auto load tmux in a session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux at -t default || tmux new -s default
fi

TranslateWheelToCursor=off
DisableWheelToCursorByCtrl=off

eval "$(starship init zsh)"
