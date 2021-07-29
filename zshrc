#echo "Hello from .zshrc"

# Variables
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"

## Switch off OSX gatekeeper
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

## change default command from cat to bat
export NULLCMD=bat

## Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH Options
 
# Aliases
alias bbd='brew bundle dump --force --describe'
alias exa='exa -laFh --git -s type'
alias k=kubectl
# alias ls='ls -lAFGh'
alias ls='exa -laFh --git -s type'
alias rm=trash
alias trail='<<<${(F)path}'

# M1 mac specific config for homebrew and vim
# if [[ "$CPUTYPE" == "arm64" ]]; then
#   export PATH="$NVM_BIN:/opt/homebrew/bin:$PATH"
#   export EDITOR=/opt/homebrew/bin/vim
#   alias oldbrew=/usr/local/bin/brew
# else
#   export PATH="$NVM_BIN:/usr/local/bin:$PATH"
#   export EDITOR="/usr/local/bin/vim"
# fi

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

# The two lines below setup kubectl completion
# Run them after enabling Kubernetes

# source <(kubectl completion zsh)
# complete -F __start_kubectl k
