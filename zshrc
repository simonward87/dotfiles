# .zshrc is for 'interactive' shells. It is sourced each time a new
# terminal session is started.

function () {
    local configs="$HOME/.config/zsh"

    # Variables are sourced first as they are a dependency for other configs
    source "$configs/vars.zsh"

    for file in $configs/*.zsh; do
        if [[ "$file" == "$configs/vars.zsh" ]]; then continue; fi
        source $file
    done
}
