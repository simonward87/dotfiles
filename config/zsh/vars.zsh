export CDPATH=$HOME/Work:$HOME/Study:..
export DOTFILES=$HOME/.dotfiles
export HISTORY_IGNORE='(pwd|id|uptime|resize|l[alsx]#( *)#|clear|hist[ory]#|cd ..)' # command history ignore list
export HISTSIZE=100000 # max number of cached commands
export HISTTIMEFORMAT="%Y-%m-%d %T " # add time-stamp to command history
export NVIM=$HOME/.dotfiles/config/nvim

if exists brew; then
    export EDITOR=$HOMEBREW_PREFIX/bin/nvim
    export GOBIN="$(go env GOPATH)/bin"
    export GOPATH="$(go env GOPATH)"
    export HOMEBREW_BUNDLE_FILE=$HOME/.dotfiles/Brewfile
    export HOMEBREW_NO_ENV_HINTS=1
    export PGDATA="$(find $HOMEBREW_PREFIX/var -type d -maxdepth 1 -iname 'postgresql*')" # changes dynamically with version
    export PSQL_EDITOR=$HOMEBREW_PREFIX/bin/nvim
    export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
    export VISUAL=$HOMEBREW_PREFIX/bin/nvim
    export ZPLUG_HOME="$(brew --prefix zplug)"

    export PATH="$(brew --prefix rustup)/bin:$PATH"
    export PATH="$(brew --prefix gawk)/libexec/gnubin:$PATH"
    export PATH="$(brew --prefix make)/libexec/gnubin:$PATH"
    export PATH="$(find $HOMEBREW_PREFIX/opt -type l -iname 'postgresql*')/bin:$PATH" # changes dynamically with version
    export PATH=$N_PREFIX/bin:$PATH
    export PATH=$PATH:$GOBIN
    export PATH=$PATH:$HOME/Work/bin
    export PATH=$PATH:/Applications/Alacritty.app/Contents/MacOS
else
    export EDITOR=/usr/bin/vi
    export PSQL_EDITOR=/usr/bin/vi
    export VISUAL=/usr/bin/vi
fi
