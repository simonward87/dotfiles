# Completions
fpath=(~/.zsh $fpath ~/.zfunc)

if exists brew; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
compinit -u

if exists brew; then
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc" # shell completion
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc" # add to $PATH
fi

if exists fzf; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

if exists kubectl; then
    source <(kubectl completion zsh)
    compdef __start_kubectl k # completion with k alias
fi

# Custom bindings
bindkey '^N' autosuggest-accept  # ctrl+n
bindkey '^T' autosuggest-toggle  # ctrl+t
bindkey '^Y' autosuggest-execute # ctrl+y
