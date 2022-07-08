# Putting these environment variables here (instead of in 
# zshrc) makes them available to Homebrew for the first 
# install

export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"


function exists() {
  # `command -v` is similar to `which`
  # https://stackoverflow.com/a/677212/1341838
  command -v $1 >/dev/null 2>&1
  
  # More explicitly written:
  # command -v $1 1>/dev/null 2>/dev/null
}

function tmx () {
    # -d to allow the rest of the function to run
    tmux new-session -d -s "${PWD##*/}" -n "Source" nvim .
    # -d to prevent current window from changing
    tmux new-window -d -n Server
    # -d to detach any other client (which there shouldn't be,
    # since you just created the session).
    tmux attach-session -d -t "${PWD##*/}"
}

if type cargo &>/dev/null
then
    . "$HOME/.cargo/env"
fi
