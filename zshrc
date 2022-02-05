# Set Variables
export DOTFILES="$HOME/.dotfiles"
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
export NULLCMD=bat
# export NVM_DIR="$HOME/.nvm"
#     [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
#     [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
export ZPLUG_HOME=$(brew --prefix)/opt/zplug

# ZSH Options
setopt NO_CASE_GLOB # Case-insensitive globbing
setopt AUTO_CD # Automatic CD
setopt CORRECT # Correction
setopt CORRECT_ALL

# Aliases
alias bbd='brew bundle dump --force --describe'
alias dtfs='cd $DOTFILES; vim .'
alias exa='exa -laFh --git -s type'
alias gs='git status'
alias ga.='git add .'
alias gc='git commit'
alias gp='git push'
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
%(?..%F{red}[%?]%f )%1~ %# ' # Alternative

# PROMPT='
# %(?.%F{green}%m%f.%F{red}[%?] %m%f) %1~ %# '

# Add Locations to $path Array
export PATH="$PATH:$N_PREFIX/bin"

typeset -U path # Remove duplicates

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# ZSH Plugins
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

# kubectl completion - if check only works if running
# k8s via Docker desktop
if (pgrep -f Docker.app > /dev/null 2>&1); then
  # Extend shell completion to work with k alias:
  compdef __start_kubectl k
  source <(kubectl completion zsh)
fi
