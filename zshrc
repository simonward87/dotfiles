# Variables
export DOTFILES="$HOME/.dotfiles"
export EDITOR="/opt/homebrew/bin/nvim"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
export NULLCMD=bat
export PATH="$PATH:$N_PREFIX/bin"
export ZPLUG_HOME=$(brew --prefix)/opt/zplug

# Options
setopt NO_CASE_GLOB # Case-insensitive globbing
setopt AUTO_CD # Automatic CD
setopt CORRECT # Correction
setopt CORRECT_ALL

# Aliases
alias bbd='brew bundle dump --force --describe'
alias dtfs='cd $DOTFILES; vim .'
alias gs='git status'
alias ga.='git add .'
alias gc='git commit'
alias gp='git push'
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls='gls -F --color --group-directories-first'
alias rm=trash
alias serve=http-server
alias study='cd $HOME/Study; clear; ll'
alias ts='tmux new -s "${PWD##*/}"'
alias trail='<<<${(F)path}'
alias vi=/opt/homebrew/bin/nvim
alias vim=/opt/homebrew/bin/nvim
alias work='cd $HOME/Work; clear; ll'

# Custom prompt
PROMPT='
%(?.%F{green}%m%f.%F{red}[%?] %m%f) %1~ %# '

# Remove $PATH duplicates
typeset -U path

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Plugins
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-history-substring-search'

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# Other
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

# K8s completion
source $DOTFILES/util/kubectl_completion.zsh
# Extend completion to work with k alias
compdef __start_kubectl k
