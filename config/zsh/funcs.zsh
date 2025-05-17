function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function hgrep() {
    fc -Dlim "*$@*" 1
}

function theme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        if grep -E "da(y|wn).theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/da(y|wn).theme/dusk.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-da(y|wn)/k-dusk/' $NVIM_CONF/lua/$USER/init.lua
            sed -i -E 's/k\/da(y|wn)/k\/dusk/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    else
        if grep -E "d(us|ar)k.theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/d(ar|us)k.theme/dawn.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-d(ar|us)k/k-dawn/' $NVIM_CONF/lua/$USER/init.lua
            sed -i -E 's/k\/d(ar|us)k/k\/dawn/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux source-file $HOME/.tmux.conf
        clear -x
    fi
}

# Enable theme
theme
