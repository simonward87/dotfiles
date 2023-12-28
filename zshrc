# .zshrc is for 'interactive shells'
# it is sourced each time a new terminal session is launched

# variables
export DOTFILES="$HOME/.dotfiles"
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # command history ignore list
export HISTSIZE=100000 # max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # add time-stamp to command history
export NVIM_CONFIG="$DOTFILES/config/nvim"

if exists brew; then
    export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
    export PSQL_EDITOR=$EDITOR
    export VISUAL=$EDITOR

    export GOBIN="$(go env GOPATH)/bin"
    export GOPATH="$(go env GOPATH)"
    export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
    export HOMEBREW_NO_ENV_HINTS=1
    export PGDATA="$(find $HOMEBREW_PREFIX/var -type d -maxdepth 1 -iname 'postgresql*')" # changes dynamically with version
    export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
    export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"

    export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"
    export PATH="$(find $HOMEBREW_PREFIX/opt -type l -iname 'postgresql*')/bin:$PATH" # changes dynamically with version
    export PATH="$PATH:$GOBIN"
    export PATH="$PATH:$N_PREFIX/bin"
    export PATH="$PATH:$HOME/Work/bin"
    export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS"

    # unalias run-help
    autoload run-help
    HELPDIR=$(command brew --prefix)/share/zsh/help
    alias help=run-help

    alias bbd='brew bundle dump --force'
    alias bbl='brew bundle list --all | less'
    alias tree="tree -a -C -F -I '.git|vendor' --gitignore"
    alias vi=$EDITOR
    alias vim=$EDITOR
else
    export EDITOR=/usr/bin/vi
    export PSQL_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

if exists rustup; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
    export RUSTUP_HOME="$HOME/.rustup"
fi

# header files for cs50
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH="/usr/local/lib"

# use regular zsh history search binding in tmux
bindkey '^R' history-incremental-search-backward

# options (https://zsh.sourceforge.io/Doc/Release/Options.html)
setopt AUTO_CD # auto cd when a command is a directory name
setopt CD_SILENT # never print directory when cd -
setopt CORRECT # try to correct command spelling
setopt CORRECT_ALL # try to correct argument spelling
setopt EXTENDED_HISTORY # save command timestamps
setopt HIST_IGNORE_DUPS # don't add duplicate commands to history
setopt HIST_EXPIRE_DUPS_FIRST # remove oldest duplicates first when trimming
setopt HIST_NO_STORE # remove history command from list when invoked
setopt NO_CASE_GLOB # case-insensitive glob
unsetopt BEEP

# aliases
alias cat=gcat
alias df='df -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias gll='git log --stat -n 1'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls='gls -1F --color --group-directories-first'
alias rm=trash
alias sed=gsed
alias serve=http-server
alias trail='<<<${(F)path}'

# fast travel
alias dtfs='cd $DOTFILES && ll'
alias conf='nvim $DOTFILES/tmux.conf $NVIM_CONFIG/lua/$USER/colorscheme.lua $DOTFILES/config/alacritty/alacritty.yml'
alias study='cd $HOME/Study && clear && ls'
alias temp='nvim $HOME/Study/notes/temp'
alias work='cd $HOME/Work && clear && ls'

if defaults read -g AppleInterfaceStyle &>/dev/null; then
    export CLR_COMMENT="#91A2B0"
    export CLR_ERROR="#ff9aa0"
else
    export CLR_COMMENT="#6B6A64"
    export CLR_ERROR="#c1002f"
fi

# custom prompt
if [ -n "$TMUX" ]; then
    # hostname removed as displayed in tmux status line
    PROMPT="%(?..%F{$CLR_ERROR}[%?] %f)%2~ %# "
else
    PROMPT="%(?.%F{$CLR_COMMENT}%m%f.%F{$CLR_ERROR}[%?]%f %F{$CLR_COMMENT}%m%f) %2~ %# "
fi

# prepend new-line to prompt
precmd() $funcstack[1]() echo

# git prompt integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats "%F{$CLR_COMMENT} %b%f" # '%F{245}%r (%b)%f'
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

function tmx () {
    # -d to allow the rest of the function to run
    tmux new-session -d -s "${PWD##*/}" -n "Source" nvim .
    # -d to prevent current window from changing
    tmux new-window -d -n Server
    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
    tmux attach-session -d -t "${PWD##*/}"
}

function theme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        if grep "driftLight" $DOTFILES/tmux.conf; then
            sed -i -E 's/driftLighter/driftDark/' $DOTFILES/tmux.conf
            sed -i -E 's/drift-lighter/drift-dark/' $NVIM_CONFIG/lua/$USER/colorscheme.lua
            sed -i -E 's/drift-lighter/drift-dark/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    else
        if grep "driftDark" $DOTFILES/tmux.conf; then
            sed -i -E 's/driftDark/driftLighter/' $DOTFILES/tmux.conf
            sed -i -E 's/drift-dark/drift-lighter/' $NVIM_CONFIG/lua/$USER/colorscheme.lua
            sed -i -E 's/drift-dark/drift-lighter/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux source-file $HOME/.tmux.conf
        clear -x
    fi
}

# setup theme
theme

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

# command completion bindings
bindkey '^N' autosuggest-accept  # ctrl+n
bindkey '^T' autosuggest-toggle  # ctrl+t
bindkey '^Y' autosuggest-execute # ctrl+y

# k8s completion
source $DOTFILES/util/kubectl_completion
compdef __start_kubectl k # completion with k alias

# heroku completion
if exists brew; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

# direnv hook
eval "$(direnv hook zsh)"
