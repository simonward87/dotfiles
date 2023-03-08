# .zshenv is for all shells
# It is always sourced

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

if type cargo &>/dev/null
then
    . "$HOME/.cargo/env"
fi
