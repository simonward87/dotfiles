#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# node versions are managed with `n`, which is in the Brewfile. See
# `zshenv` for the setting of the `N_PREFIX` variable, making it available
# below during the first install.
# see `zshrc` where `N_PREFIX/bin` is added to PATH

if exists $N_PREFIX/bin/node; then
  echo "Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n"
else
  echo "Installing Node & NPM with n..."
  n lts
fi

packages=(
    firebase-tools
    http-server
    json-server
    neovim
    prettier
    prettier-plugin-astro
    prettier-plugin-svelte
    prettier-plugin-tailwindcss
    surge
    trash-cli
    typescript
)

# install global packages
for package in ${packages[@]}
do
    npm install --global "$package"
done

echo "Global NPM packages installed:"
npm list --global --depth=0
