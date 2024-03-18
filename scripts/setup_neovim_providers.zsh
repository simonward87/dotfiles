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

if exists ~/.local/venvs/neovim/bin/python; then
  echo "Python venv already created"
else
  echo "Setting up python venv..."
    if [ ! -d "~/.local/venvs/neovim/bin/" ]; then
        mkdir -p "~/.local/venvs/neovim/bin/"
    fi
    python -m venv "~/.local/venvs/neovim"
fi

if ~/.local/venvs/neovim/bin/python -c "import pynvim" &> /dev/null; then
    echo "Already installed: pynvim"
else
    echo "Installing pynvim..."
    ~/.local/venvs/neovim/bin/python -m pip install pynvim
fi
