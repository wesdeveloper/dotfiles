# Path to your oh-my-zsh installation.
export ZSH="/home/weslopes/.oh-my-zsh"

# Theme
ZSH_THEME="arrow"

# Plugins
plugins=(
  git
  tmux
  zsh-nvm
  dotenv
  zsh-autosuggestions
  kubectl
)
source $ZSH/oh-my-zsh.sh

alias awsauth="source ~/codebase/aws-sts-assumerole/assumerole"

alias vpn="sudo openvpn --config ~/openvpn-client/client.ovpn --setenv PATH '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' --script-security 2 --up ~/openvpn-client/update-resolv-conf --down ~/openvpn-client/update-resolv-conf --down-pre"
export DENO_INSTALL="/home/weslopes/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIRnvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PROJECTS_DIR="/home/weslopes/codebase"
export GOROOT=/usr/local/go
export GOPATH=$HOME/codebase
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/weslopes/codebase/edu-ai-notifier/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/weslopes/codebase/edu-ai-notifier/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/weslopes/codebase/edu-ai-notifier/node_modules/tabtab/.completions/sls.zsh ]] && . /home/weslopes/codebase/edu-ai-notifier/node_modules/tabtab/.completions/sls.zsh

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"

export NVM_DIR="/home/weslopes/.nvm"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# auto load tmux in a session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

TranslateWheelToCursor=off
DisableWheelToCursorByCtrl=off
eval "$(starship init zsh)"
