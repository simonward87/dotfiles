alias df='df -h'
alias dtfs='cd $DOTFILES && clear && ll'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gll='git log --stat -n 1'
alias grep='grep --color=auto'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias ip='ipconfig getifaddr en0'
alias la='ls -oAFhG'
alias ll='ls -oFhG'
alias study='cd $HOME/Study && clear && ll'
alias temp='nvim $HOME/Study/notes/temp'
alias trail='<<<${(F)path}'
alias work='cd $HOME/Work && clear && ll'

if exists brew; then
    alias activate='source $(find . -type f -name activate)' # single quotes mandatory else command substitution executes when sourced
    alias awk=gawk
    alias bbd='brew bundle dump --force'
    alias bbl='brew bundle list --all | less'
    alias cat=gcat
    alias d=docker
    alias k=kubectl
    alias la='gls -AFho --color --group-directories-first'
    alias ll='gls -Fho --color --group-directories-first'
    alias ls=gls
    alias sed=gsed
    alias tree="tree -a -C -F -I '.git|vendor' --gitignore"
    alias vi=nvim
    alias vim=nvim
fi

if exists n; then
    alias rm=trash
fi
