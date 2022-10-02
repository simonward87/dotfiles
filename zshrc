# .zshrc is for 'interactive shells'
# It is sourced each time a new terminal session is launched

# Variables
export CARGO_HOME="$HOME/.cargo"
export DOTFILES="$HOME/.dotfiles"
export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # command history ignore list
export HISTSIZE=100000 # max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # add time-stamp to command history
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
export HOMEBREW_NO_ENV_HINTS=1
export NULLCMD=bat
export PGDATA="$HOMEBREW_PREFIX/var/postgres"
export RUSTUP_HOME="$HOME/.rustup"
export VISUAL="$EDITOR"
export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"

export PATH="$PATH:$N_PREFIX/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$HOME/Study/bin"

# cs50 header files
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH=/usr/local/lib

# use regular zsh history search binding in tmux
bindkey '^R' history-incremental-search-backward

# Options (man zshoptions)
setopt NO_CASE_GLOB # case-insensitive globbing
setopt AUTO_CD # auto CD when a command is a directory name
setopt CD_SILENT # Never print directory when CD -
setopt CORRECT # try to correct command spelling
setopt CORRECT_ALL # try to correct argument spelling
setopt EXTENDED_HISTORY # save command timestamps
setopt HIST_EXPIRE_DUPS_FIRST # remove oldest duplicates first when trimming
setopt HIST_NO_STORE # remove history command from list when invoked
unsetopt BEEP

# Aliases
alias bbd='brew bundle dump --force --describe'
alias df='df -h'
alias dtfs='cd $DOTFILES && nvim .'
alias dtfv='cd $DOTFILES'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls='gls -F --color --group-directories-first'
alias lx='gls -oXBFh --color --group-directories-first'
alias pi='ssh pi'
alias rm=trash
alias serve=http-server
alias study='cd $HOME/Study && clear && ll'
# alias ts='tmux new -s "${PWD##*/}" -n Source'
alias trail='<<<${(F)path}'
alias vi="$HOMEBREW_PREFIX/bin/nvim"
alias vim="$HOMEBREW_PREFIX/bin/nvim"
alias work='cd $HOME/Work && clear && ll'

# Custom prompts — simplified when running inside tmux
if [ -n "$TMUX" ]; then
    PROMPT=$'\n'"%(?..%F{red}[%?] %f)%2~ %# "
else
    PROMPT=$'\n'"%(?.%F{245}%m%f.%F{red}[%?]%f %F{245}%m%f) %2~ %# "
fi

# Git prompt integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{245}(%b) %r%f'
zstyle ':vcs_info:*' enable git

# Remove $PATH duplicates
typeset -U path

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function hgrep() {
    fc -Dlim "*$@*" 1
}

# Plugins
source $ZPLUG_HOME/init.zsh

zplug 'le0me55i/zsh-extract'
zplug 'plugins/git', from:oh-my-zsh
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
fpath=(~/.zsh $fpath ~/.zfunc)
autoload -Uz compinit
compinit -u

# Case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# K8s completion
source $DOTFILES/util/kubectl_completion.zsh
# Extend completion to work with k alias
compdef __start_kubectl k

# Heroku completion
if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi
