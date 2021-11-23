#!/usr/bin/env zsh

echo -e "\n<<< Starting Node Packages Setup >>>\n"

# TODO:
# - setup conditionals for NVM
# - setup conditionals for node

# if exists nvm; then
#   echo "nvm exists, skipping install"
# else
#   echo "nvm doesn't exist, continuing with install"
#   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

#   # Set up vars, load nvm and nvm bash completion
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# fi

# TODO: Keep an eye out for native M1 support
# for nvm installed with Homebrew. The solution
# above works, but the version number is hardcoded
# in, so not very future-proof.

# if exists node; then
#   echo "node exists, skipping install"
# else
#   echo "node doesn't exist, continuing with install"
#   # Install and activate latest stable node and npm
#   nvm install node --latest-npm
#   nvm use node
# fi
if exists node; then
  # Install Global NPM Packages
  npm i -g firebase-tools
  npm i -g http-server
  npm i -g json-server
  npm i -g neovim
  npm i -g prettier
  npm i -g surge
  npm i -g trash-cli
  npm i -g typescript
  npm i -g vls
  npm i -g @vue/cli

  # Language servers
  npm i -g dockerfile-language-server-nodejs # docker
  npm i -g eslint_d                          # eslint daemon
  npm i -g svelte-language-server            # svelte
  npm i -g typescript-language-server        # typescript
  npm i -g @tailwindcss/language-server      # tailwind css
  npm i -g vim-language-server               # vimscript
  npm i -g vls                               # vue
  npm i -g vscode-langservers-extracted      # css, json & html

  echo "Global NPM Packages Installed:"
  npm list --global --depth=0
else
  echo "node doesn't exist, install node before trying to install packages!"
fi
