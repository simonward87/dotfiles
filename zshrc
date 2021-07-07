# Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Test Script
echo "Hello from .zshrc"

# Variables

# ZSH Options
 
# Aliases
alias ls='ls -lAFh'

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
