#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions are managed with `nvm`, which is in the Brewfile.

# Make sure the nvm function is available for the following commands
source $(brew --prefix nvm)/nvm.sh

# Install and activate latest stable node and npm
nvm install node --latest-npm
nvm use node
