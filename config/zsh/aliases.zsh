alias gll='git log --stat -n 1'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ipl='ipconfig getifaddr en0' # local IP address
alias ipg='curl -s https://myip.wtf/text' # global IP address
alias la='ls -oAFhG'
alias ll='ls -oFhG'
alias scripts="[ -e package.json ] && jq '.scripts?' < package.json"
alias tmp='nvim $HOME/Study/notes/tmp'
alias trail='<<<${(F)path}'

if exists brew; then
    alias activate='source $(find . -type f -name activate)' # single quotes mandatory else command substitution executes when sourced
    alias awk=gawk
    alias bbd='brew bundle dump --force'
    alias bbl='brew bundle list --all | less'
    alias cat=gcat
    alias d=docker
    alias k=kubectl
    alias la='gls -AFgho --color --group-directories-first --time-style=+%d/%m/%Y'
    alias ll='gls -Fgho --color --group-directories-first --time-style=+%d/%m/%Y'
    alias rm='rm -i'
    alias sed=gsed
    alias tree="tree -a -C -F -I '.git|vendor' --gitignore"
    alias vi=nvim
    alias vim=nvim

    # Remove the default of run-help being aliased to man
    unalias run-help 2>/dev/null
    # Use zsh's run-help, which will display information for zsh builtins.
    autoload run-help
    HELPDIR=$(command brew --prefix)/share/zsh/help
    alias help=run-help
fi
