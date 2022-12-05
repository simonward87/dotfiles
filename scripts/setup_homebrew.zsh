#!/usr/bin/env zsh

echo -e "\n<<< Starting Homebrew Setup >>>\n"

if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ensure n is installed before doing brew bundle, else a seperate copy of
# node will be installed as it is a dependency of various packages
brew install n
n lts

# TODO: Look out for a different '--no-quarantine' solution. Currently,
# you can't do `brew bundle --no-quarantine` as an option — instead,
# it is exported as an environment variable in zshenv
# https://github.com/Homebrew/homebrew-bundle/issues/474

brew bundle --verbose

# this works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"
