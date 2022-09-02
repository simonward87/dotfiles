# .zprofile is for 'login shells'
# It is sourced at login, before .zshrc

eval "$(/opt/homebrew/bin/brew shellenv)"

# Cargo completion and bin
source $HOME/.cargo/env
