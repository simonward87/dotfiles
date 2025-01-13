function mkcd() {
  mkdir -p "$@" && cd "$_";
}

function hgrep() {
    fc -Dlim "*$@*" 1
}

function theme () {
    if defaults read -g AppleInterfaceStyle &>/dev/null; then
        if grep -E "da(y|wn).theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/dawn.theme/dusk.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/day.theme/dark.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-dawn/k-dusk/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k-day/k-dark/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k\/dawn/k\/dusk/' $DOTFILES/config/alacritty/alacritty.toml
            sed -i -E 's/k\/day/k\/dark/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    else
        if grep -E "d(us|ar)k.theme" $DOTFILES/tmux.conf; then
            sed -i -E 's/dusk.theme/dawn.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/dark.theme/day.theme/' $DOTFILES/tmux.conf
            sed -i -E 's/k-dusk/k-dawn/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k-dark/k-day/' $NVIM_CONF/lua/$USER/colorscheme.lua
            sed -i -E 's/k\/dusk/k\/dawn/' $DOTFILES/config/alacritty/alacritty.toml
            sed -i -E 's/k\/dark/k\/day/' $DOTFILES/config/alacritty/alacritty.toml
        fi
    fi

    if [ -n "$TMUX" ]; then
        tmux source-file $HOME/.tmux.conf
        clear -x
    fi
}

# Enable theme
theme
