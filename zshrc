echo "Hello from .zshrc"

# Variables
## Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="gruvbox-dark"

## Switch off OSX gatekeeper
export HOMEBREW_CASK_OPTS="--no-quarantine"

## Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# ZSH Options
 
# Aliases
alias exa='exa -laFh --git'
alias ls='exa -laFh --git'
alias k=kubectl

# Prompt Customization
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Add Locations to $PATH Variable

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ZSH Plugins

# Other
source <(kubectl completion zsh)
complete -F __start_kubectl k
