# .zshrc is for 'interactive shells'
# it is sourced each time a new terminal session is launched

# Variables
export DOTFILES="$HOME/.dotfiles"
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # command history ignore list
export HISTSIZE=100000 # max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # add time-stamp to command history
export NVIM_CONF="$DOTFILES/config/nvim"

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

    export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"
    export PATH="$(find $HOMEBREW_PREFIX/opt -type l -iname 'postgresql*')/bin:$PATH" # changes dynamically with version
    export PATH="$N_PREFIX/bin:$PATH"
    export PATH="$PATH:$GOBIN"
    export PATH="$PATH:$HOME/Work/bin"
    export PATH="$PATH:/Applications/Alacritty.app/Contents/MacOS"

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

# CS50 header files
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH="/usr/local/lib"

# Enable zsh history search binding in tmux
bindkey '^R' history-incremental-search-backward

# Options (https://zsh.sourceforge.io/Doc/Release/Options.html)
setopt APPEND_HISTORY # sessions append to history file, rather than replace it
setopt AUTO_CD # auto cd when a command is a directory name
setopt CD_SILENT # never print directory when cd -
setopt CORRECT # command spelling correction
setopt EXTENDED_HISTORY # save command timestamps
setopt HIST_EXPIRE_DUPS_FIRST # remove oldest duplicates first when trimming
setopt HIST_IGNORE_DUPS # don't add duplicate commands to history
setopt HIST_NO_STORE # remove history command from list when invoked
setopt NO_CASE_GLOB # case-insensitive glob
unsetopt BEEP # beep on error
unsetopt CORRECT_ALL # argument spelling correction

# Aliases
alias awk=gawk
alias cat=gcat
alias df='df -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gll='git log --stat -n 1'
alias grep='grep --color=auto'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ip='ipconfig getifaddr en0'
alias k=kubectl
alias la='gls -AFho --color --group-directories-first'
alias ll='gls -Fho --color --group-directories-first'
alias ls=gls
alias rm=trash
alias sed=gsed
alias trail='<<<${(F)path}'

# Fast travel
alias dtfs='cd $DOTFILES && clear && ll'
alias study='cd $HOME/Study && clear && ll'
alias temp='nvim $HOME/Study/notes/temp'
alias work='cd $HOME/Work && clear && ll'

if defaults read -g AppleInterfaceStyle &>/dev/null; then
    export CLR_COMMENT="#91a2b0"
    export CLR_ERROR="#ff9aa0"
else
    export CLR_COMMENT="#6b6a64"
    export CLR_ERROR="#c1002f"
fi

# Custom prompt
if [ -n "$TMUX" ]; then
    # hostname removed as displayed in tmux status line
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

function setTheme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        if grep -E "da(y|wn).theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/dawn.theme/dusk.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/day.theme/dark.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-dawn/k-dusk/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k-day/k-dark/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k\/dawn/k\/dusk/' $DOTFILES/config/alacritty/alacritty.toml
            sed -i -E 's/k\/day/k\/dark/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    else
        if grep -E "d(us|ar)k.theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/dusk.theme/dawn.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/dark.theme/day.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-dusk/k-dawn/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k-dark/k-day/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k\/dusk/k\/dawn/' $DOTFILES/config/alacritty/alacritty.toml
            sed -i -E 's/k\/dark/k\/day/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux source-file $HOME/.tmux.conf
        clear -x
    fi
}

# Enable theme
setTheme

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

# Completions
fpath=(~/.zsh $fpath ~/.zfunc)
autoload -Uz compinit
compinit -u

# Command completion bindings
bindkey '^N' autosuggest-accept  # ctrl+n
bindkey '^T' autosuggest-toggle  # ctrl+t
bindkey '^Y' autosuggest-execute # ctrl+y

# K8s completion
source $DOTFILES/util/kubectl_completion
compdef __start_kubectl k # completion with k alias

# Heroku completion
if exists brew; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

# Fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GCP tools
source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc" # shell completion
source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc" # add to $PATH

# Direnv hook
eval "$(direnv hook zsh)"
