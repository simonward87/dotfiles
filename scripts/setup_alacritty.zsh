#!/usr/bin/env zsh

echo "\n<<< Setting Alacritty terminfo >>>\n"

# to make sure alacritty works correctly, either the 'alacritty' or
# 'alacritty-direct' terminfo must be used:
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#post-build
if infocmp alacritty >/dev/null; then
  echo "Alacritty terminfo already setup"
else
  echo "Setting up terminfo"

  curl --silent https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info --output alacritty.info

  echo "Enter superuser (sudo) password to edit terminfo"
  sudo tic -xe alacritty,alacritty-direct alacritty.info

  rm alacritty.info
fi
