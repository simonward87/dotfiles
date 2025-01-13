if [ -n "$ZPLUG_HOME" ]; then
    source $ZPLUG_HOME/init.zsh

    zplug 'le0me55i/zsh-extract'
    zplug 'plugins/git', from:oh-my-zsh
    zplug 'zsh-users/zsh-autosuggestions'
    zplug 'zsh-users/zsh-completions'
    zplug 'zsh-users/zsh-history-substring-search'
    zplug 'zsh-users/zsh-syntax-highlighting', defer:2

    if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
        echo; zplug install
      fi
    fi

    zplug load

    # Prompt integration with git
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    RPROMPT=\$vcs_info_msg_0_
    zstyle ':vcs_info:git:*' formats "%F{$CLR_COMMENT} %b%f" # '%F{245}%r (%b)%f'
    zstyle ':vcs_info:*' enable git
fi
