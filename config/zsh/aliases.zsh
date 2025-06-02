alias conf='nvim $HOME/.config/nvim'
alias df='df -h'
alias dtfs='nvim $HOME/.dotfiles'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gll='git log --stat -n 1'
alias grep='grep --color=auto'
alias hist='fc -l -t "$HISTTIMEFORMAT"' # display formatted command history
alias htop='htop -C'
alias ip='ipconfig getifaddr en0'
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
    alias la='gls -AFho --color --group-directories-first'
    alias ll='gls -Fho --color --group-directories-first'
    alias ls=gls
    alias sed=gsed
    alias tree="tree -a -C -F -I '.git|vendor' --gitignore"
    alias vi=nvim
    alias vim=nvim
fi
