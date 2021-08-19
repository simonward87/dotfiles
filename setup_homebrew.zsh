#!/usr/bin/env zsh

echo -e "\n<<< Starting Homebrew Setup >>>\n"

if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ "-z ${NVM_DIR}" ] && [ "$(command ls -A $NVM_DIR/versions/node)" ]; then
  echo "nvm exists, skipping install"
else
  echo "nvm doesn't exist, continuing with install"

  arch -arm64 brew install nvm

  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

if exists node; then
  echo "node exists, skipping install"
else
  echo "node doesn't exist, continuing with install"

  nvm install node --latest-npm
fi


# TODO: Keep an eye out for a different '--no-quarantine' solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

# HOMEBREW_CASK_OPTS is exported in `zshenv` with
# `--no-quarantine` and `--no-binaries` options,
# which makes them available to Homebrew for the
# first install (before our `zshrc` is sourced).

brew bundle --verbose

# This works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"
