#echo "Hello from .zshrc"

# Variables
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"

## Switch off OSX gatekeeper
export HOMEBREW_CASK_OPTS="--no-quarantine"

## change default command from cat to bat
export NULLCMD=bat

## Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# ZSH Options
 
# Aliases
alias bbd='brew bundle dump --force --describe'
alias exa='exa -laFh --git -s type'
alias k=kubectl
# alias ls='ls -lAFGh'
alias ls='exa -laFh --git -s type'
alias man=batman
alias rm=trash
alias trail='<<<${(F)path}'

# Prompt Customization
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Add Locations to $path Array
## Remove duplicates
typeset -U path

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ZSH Plugins

# Other
source <(kubectl completion zsh)
complete -F __start_kubectl k
