function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function hgrep() {
    fc -Dlim "*$@*" 1
}

function theme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        if grep -E "da(y|wn).theme" $HOME/.dotfiles/tmux.conf; then
            sed -i -E 's/da(y|wn).theme/dark.theme/' $HOME/.dotfiles/tmux.conf
            sed -i -E 's/k-da(y|wn)/k-dark/' $HOME/.config/nvim/lua/custom/init.lua
            sed -i -E 's/k\/da(y|wn)/k\/dark/' $HOME/.dotfiles/config/alacritty/alacritty.toml
        fi
    else
        if grep -E "d(us|ar)k.theme" $HOME/.dotfiles/tmux.conf; then
            sed -i -E 's/d(ar|us)k.theme/day.theme/' $HOME/.dotfiles/tmux.conf
            sed -i -E 's/k-d(ar|us)k/k-day/' $HOME/.config/nvim/lua/custom/init.lua
            sed -i -E 's/k\/d(ar|us)k/k\/day/' $HOME/.dotfiles/config/alacritty/alacritty.toml
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux source-file $HOME/.tmux.conf
        clear -x
    fi
}

# Enable theme
theme
