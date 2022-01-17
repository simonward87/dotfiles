# Set Variables
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"

## Switch off OSX gatekeeper for homebrew installs
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

## change default command from cat to bat
export NULLCMD=bat

## Loads nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


## Loads zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# ZSH Options
setopt NO_CASE_GLOB # Case-insensitive globbing
setopt AUTO_CD # Automatic CD
setopt CORRECT # Correction
setopt CORRECT_ALL

# Aliases
alias bbd='brew bundle dump --force --describe'
alias dtfs='vim $DOTFILES'
alias exa='exa -laFh --git -s type'
alias gs='git status'
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias ls=exa
alias rm=trash
alias serve=http-server
alias trail='<<<${(F)path}'
alias vim=/opt/homebrew/bin/nvim
alias vi=/opt/homebrew/bin/nvim

# Prompt Customization
PROMPT='
%(?.%F{green}%m%f.%F{red}[%?] %m%f) %1~ %# '

# PROMPT='
# %(?..%F{red}[%?]%f )%1~ %# ' # Alternative

# Add Locations to $path Array
typeset -U path # Remove duplicates

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
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

# The two lines below setup kubectl completion
# Run them after enabling Kubernetes
source <(kubectl completion zsh)
complete -F __start_kubectl k
