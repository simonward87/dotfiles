#!/usr/bin/env zsh

echo "\n<<< Starting Neovim Provider Setup >>>\n"

packages=(
    Neovim::Ext
    App::cpanminus
)

for package in ${packages[@]}
do
    if perldoc -l "$package" &> /dev/null; then
      echo "Already installed: $package"
    else
      echo "Installing $package..."
      cpanm -n "$package"
    fi
done

if gem list -ie neovim &> /dev/null; then
  echo "Already installed: neovim ruby gem"
else
  echo "Installing neovim gem..."
  gem install neovim
fi
