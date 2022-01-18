#!/usr/bin/env zsh

echo -e "\n<<< Starting Homebrew Setup >>>\n"

if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# TODO: Keep an eye out for a different '--no-quarantine' solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

brew bundle --verbose

echo "Enter superuser (sudo) password to accept Xcode license"
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch

# This works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"
