# .zshrc is for 'interactive shells'
# it is sourced each time a new terminal session is launched

# variables
export CARGO_HOME="$HOME/.cargo"
export DOTFILES="$HOME/.dotfiles"
export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
export GOBIN="$(go env GOPATH)/bin"
export GOPATH="$(go env GOPATH)"
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # command history ignore list
export HISTSIZE=100000 # max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # add time-stamp to command history
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
export HOMEBREW_NO_ENV_HINTS=1
export NULLCMD=bat
export NVIM_CONFIG="$DOTFILES/config/nvim/lua/user"
export PGDATA="$HOMEBREW_PREFIX/var/postgres"
export RUSTUP_HOME="$HOME/.rustup"
export VISUAL="$EDITOR"
export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"

# custom path
export PATH="$PATH:$N_PREFIX/bin"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$HOME/Study/bin"

# header files for CS50
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH=/usr/local/lib

# use regular Zsh history search binding in Tmux
bindkey '^R' history-incremental-search-backward

# options (man zshoptions)
setopt NO_CASE_GLOB # case-insensitive glob
setopt AUTO_CD # auto CD when a command is a directory name
setopt CD_SILENT # never print directory when CD -
setopt CORRECT # try to correct command spelling
setopt CORRECT_ALL # try to correct argument spelling
setopt EXTENDED_HISTORY # save command timestamps
setopt HIST_EXPIRE_DUPS_FIRST # remove oldest duplicates first when trimming
setopt HIST_NO_STORE # remove history command from list when invoked
unsetopt BEEP

# aliases
alias bbd='brew bundle dump --force --describe'
alias bbl='brew bundle list --all'
alias df='df -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls='gls -1F --color --group-directories-first'
alias rm=trash
alias serve=http-server
alias trail='<<<${(F)path}'
alias vi="$HOMEBREW_PREFIX/bin/nvim"
alias vim="$HOMEBREW_PREFIX/bin/nvim"

# fast travel
alias dtfs='cd $DOTFILES && nvim .'
alias dtfv='cd $DOTFILES'
alias study='cd $HOME/Study && clear && ls'
alias work='cd $HOME/Work && clear && ls'

# custom prompt
if [ -n "$TMUX" ]; then
    # hostname removed as displayed in tmux status line
    PROMPT="%(?..%F{red}[%?] %f)%2~ %# "
else
    PROMPT="%(?.%F{245}%m%f.%F{red}[%?]%f %F{245}%m%f) %2~ %# "
fi

# prepend new-line to prompt
precmd() $funcstack[1]() echo

# git prompt integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{245}(%b) %r%f'
zstyle ':vcs_info:*' enable git

# remove $PATH duplicates
typeset -U path

# functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function hgrep() {
    fc -Dlim "*$@*" 1
}

# plugins
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

# other
fpath=(~/.zsh $fpath ~/.zfunc)
autoload -Uz compinit
compinit -u

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# k8s completion
source $DOTFILES/util/kubectl_completion.zsh
# extend completion to work with k alias
compdef __start_kubectl k

# heroku completion
if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi
