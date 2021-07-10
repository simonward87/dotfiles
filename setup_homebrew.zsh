#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install httpie
brew install bat
brew install ncdu
brew install nvm
brew install tmux
brew install tree
brew install vim

brew install --cask --no-quarantine google-chrome
brew install --cask --no-quarantine firefox
brew install --cask --no-quarantine alacritty
brew install --cask --no-quarantine karabiner-elements
brew install --cask --no-quarantine rectangle
brew install --cask --no-quarantine alfred
# brew install --cask --no-quarantine backblaze
# brew install --cask --no-quarantine pokerstars
# brew install --cask --no-quarantine docker
# brew install --cask --no-quarantine skype

# Investigate font installs
