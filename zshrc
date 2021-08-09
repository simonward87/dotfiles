#echo "Hello from .zshrc"

# Variables
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"

## Switch off OSX gatekeeper
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

## change default command from cat to bat
export NULLCMD=bat

## Loads nvm and nvm bash_completion
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


## Loads zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# ZSH Options
## Case-insensitive globbing
setopt NO_CASE_GLOB
## Automatic CD
setopt AUTO_CD
## Correction
setopt CORRECT
setopt CORRECT_ALL
 
# Aliases
alias bbd='brew bundle dump --force --describe'
alias dtfs='cd $DOTFILES; vim .'
alias exa='exa -laFh --git -s type'
alias gs='git status'
alias k=kubectl
alias ls='exa'
# alias ls='ls -lAFGh'
alias rm=trash
alias trail='<<<${(F)path}'

# Prompt Customization
# PROMPT='
# %1~ %L %# '
# RPROMPT='%*'
PROMPT='
%(?..%F{red}[%?]%f )%1~ %# '


# Add Locations to $path Array
## Remove duplicates
typeset -U path

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ZSH Plugins
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

# The two lines below setup kubectl completion
# Run them after enabling Kubernetes
source <(kubectl completion zsh)
complete -F __start_kubectl k
