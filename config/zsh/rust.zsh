if exists rustup; then
    export CARGO_HOME="$HOME/.cargo"
    export PATH="$PATH:$CARGO_HOME/bin"
    export RUSTUP_HOME="$HOME/.rustup"
fi
