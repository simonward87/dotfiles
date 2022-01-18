#!/usr/bin/env zsh

echo -e "\n<<< Starting Node Setup >>>\n"

# Node versions are managed with `n`, which is in the Brewfile.
# See `zshenv` for the setting of the `N_PREFIX` variable,
# making it available below during the first install.
# See `zshrc` where `N_PREFIX/bin` is added to PATH

if exists $N_PREFIX/bin/node; then
  echo "Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n"
else
  echo "Intalled Node & NPM with n..."
  n lts
fi

# Install Global NPM Packages
npm i -g firebase-tools
npm i -g http-server
npm i -g json-server
npm i -g neovim
npm i -g prettier
npm i -g prettier-plugin-svelte
npm i -g surge
npm i -g trash-cli
npm i -g typescript

# Language servers
npm i -g dockerfile-language-server-nodejs # docker
npm i -g eslint_d                          # eslint daemon
npm i -g svelte-language-server            # svelte
npm i -g typescript-language-server        # typescript
npm i -g vscode-langservers-extracted      # css, json & html
npm i -g yaml-language-server              # yaml

echo "Global NPM Packages Installed:"
npm list --global --depth=0
