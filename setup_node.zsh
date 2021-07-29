#!/usr/bin/env zsh

echo -e "\n<<< Starting Node Setup >>>\n"

# TODO:
# - setup conditionals for NVM
# - setup conditionals for node

if exists nvm; then
  echo "nvm exists, skipping install"
else
  echo "nvm doesn't exist, continuing with install"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

  # Set up vars, load nvm and nvm bash completion
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# TODO: Keep an eye out for native M1 support
# for nvm installed with Homebrew. The solution
# above works, but the version number is hardcoded
# in, so not very future-proof.

# Install and activate latest stable node and npm
nvm install node --latest-npm
nvm use node

# Install Global NPM Packages
npm i -g firebase-tools
npm i -g typescript
npm i -g json-server
npm i -g http-server
npm i -g trash-cli

echo "Global NPM Packages Installed:"
npm list --global --depth=0
