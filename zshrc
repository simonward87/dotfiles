# .zshrc is for 'interactive' shells. It is sourced each time a new
# terminal session is started.

function () {
    local zsh_configs="$HOME/.config/zsh"

    # Variables are sourced first as other configs may depend on them
    source "$zsh_configs/vars.zsh"

    for file in $zsh_configs/*.zsh; do
        if [[ "$file" == "$zsh_configs/vars.zsh" ]]; then continue; fi

        source $file

        # if [[ $file =~ '^.*(cmp|zplug)\.zsh$' ]]; then
        #     # Scheduled as blocking and slow to initialise
        #     sched +3 "source $file" &>/dev/null || source $file
        # else
        #     source $file
        # fi
    done
}
