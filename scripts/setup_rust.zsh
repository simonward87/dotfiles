#!/usr/bin/env zsh

echo "\n<<< Starting Rust Setup >>>\n"

if exists rustc; then
  echo "rustc exists, skipping install"
else
  echo "rustc doesn't exist, continuing with install"

  # requires rustup-init toolchain installer, normally already installed via brew
  rustup-init -y
  rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
  mkdir ~/.zfunc
  rustup completions zsh > ~/.zfunc/_rustup
fi

