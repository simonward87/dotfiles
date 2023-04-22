# .zshrc is for 'interactive shells'
# It is sourced each time a new terminal session is launched

# Variables
export DOTFILES="$HOME/.dotfiles"
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # Command history ignore list
export HISTSIZE=100000 # Max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # Add time-stamp to command history
export NULLCMD=bat
export NVIM_CONFIG="$DOTFILES/config/nvim/lua/user"

if exists brew; then
    export EDITOR="$HOMEBREW_PREFIX/bin/nvim"
    export GOBIN="$(go env GOPATH)/bin"
    export GOPATH="$(go env GOPATH)"
    export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
    export HOMEBREW_NO_ENV_HINTS=1
    export PATH="$PATH:$GOBIN:$N_PREFIX/bin:$HOME/Study/bin"
    export PGDATA="$HOMEBREW_PREFIX/var/postgres"
    export PSQL_EDITOR="$HOMEBREW_PREFIX/bin/nvim"
    export VISUAL=$EDITOR
    export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"

    alias bbd='brew bundle dump --force --describe'
    alias bbl='brew bundle list --all'
    alias vi="$HOMEBREW_PREFIX/bin/nvim"
    alias vim="$HOMEBREW_PREFIX/bin/nvim"
else
    export EDITOR=/usr/bin/vi
    export VISUAL=$EDITOR
fi

if exists rustup; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
    export RUSTUP_HOME="$HOME/.rustup"
fi

# Header files for CS50
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH=/usr/local/lib

# Use regular Zsh history search binding in Tmux
bindkey '^R' history-incremental-search-backward

# Options (man zshoptions)
setopt NO_CASE_GLOB # Case-insensitive glob
setopt AUTO_CD # Auto CD when a command is a directory name
setopt CD_SILENT # Never print directory when CD -
setopt CORRECT # Try to correct command spelling
setopt CORRECT_ALL # Try to correct argument spelling
setopt EXTENDED_HISTORY # Save command timestamps
setopt HIST_EXPIRE_DUPS_FIRST # Remove oldest duplicates first when trimming
setopt HIST_NO_STORE # Remove history command from list when invoked
unsetopt BEEP

# Aliases
alias df='df -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias gll='git log --stat -n 1'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # Display formatted command history
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls='gls -1F --color --group-directories-first'
alias rm=trash
alias serve=http-server
alias trail='<<<${(F)path}'

# Fast travel
alias dtfs='cd $DOTFILES && nvim .'
alias conf='nvim $DOTFILES/tmux.conf $NVIM_CONFIG/colorscheme.lua $DOTFILES/config/alacritty/alacritty.yml'
alias study='cd $HOME/Study && clear && ls'
alias work='cd $HOME/Work && clear && ls'

if defaults read -g AppleInterfaceStyle &>/dev/null; then
    export CLR_COMMENT="#798d9e"
    export CLR_ERROR="#ff9aa0"
else
    export CLR_COMMENT="#767676"
    export CLR_ERROR="#c1002f"
fi

# Custom prompt
if [ -n "$TMUX" ]; then
    # Hostname removed as displayed in tmux status line
    PROMPT="%(?..%F{$CLR_ERROR}[%?] %f)%2~ %# "
else
    PROMPT="%(?.%F{$CLR_COMMENT}%m%f.%F{$CLR_ERROR}[%?]%f %F{$CLR_COMMENT}%m%f) %2~ %# "
fi

# Prepend new-line to prompt
precmd() $funcstack[1]() echo

# Git prompt integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats "%F{$CLR_COMMENT} %b%f" # '%F{245}%r (%b)%f'
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

function tmx () {
    # -d to allow the rest of the function to run
    tmux new-session -d -s "${PWD##*/}" -n "Source" nvim .
    # -d to prevent current window from changing
    tmux new-window -d -n Server
    # -d to detach any other client (which there shouldn't be,
    # Since you just created the session).
    tmux attach-session -d -t "${PWD##*/}"
}

# TODO: Uses three almost identical copies of alacritty config, find a
#       better way to do this. Maybe create a file from a common config
#       file and seperate dark / light theme config files
# TODO: find a way to update PROMPT colours without resourcing zshrc and
#       infinite looping
function theme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        # Dark mode
        if grep "driftLight" $DOTFILES/tmux.conf; then
            sed -i '' -E 's/driftLight/driftDark/g' $DOTFILES/tmux.conf
            sed -i '' -E 's/drift-light/drift-dark/g' $NVIM_CONFIG/colorscheme.lua
            cp $DOTFILES/config/alacritty/dark.yml $DOTFILES/config/alacritty/alacritty.yml

            if [ -n "$TMUX" ]; then
                tmux source-file ~/.tmux.conf &>/dev/null
            fi
        fi
    else
        # Light mode
        if grep "driftDark" $DOTFILES/tmux.conf; then
            sed -i '' -E 's/driftDark/driftLight/g' $DOTFILES/tmux.conf
            sed -i '' -E 's/drift-dark/drift-light/g' $NVIM_CONFIG/colorscheme.lua
            cp $DOTFILES/config/alacritty/light.yml $DOTFILES/config/alacritty/alacritty.yml

            if [ -n "$TMUX" ]; then
                tmux source-file ~/.tmux.conf &>/dev/null
            fi
        fi
    fi
}

# Setup theme
theme

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
source $DOTFILES/util/kubectl_completion
# Extend completion to work with k alias
compdef __start_kubectl k

# Heroku completion
if exists brew; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi
