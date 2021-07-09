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

brew install --cask google-chrome
brew install --cask firefox
brew install --cask alacritty
brew install --cask karabiner-elements
brew install --cask rectangle
# brew install --cask backblaze
# brew install --cask pokerstars
# brew install --cask docker
# brew install --cask skype

# Investigate font installs
