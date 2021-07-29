# Right now this file breaks things when trying to set up
# on an M1 Mac. For more details, see m1-notes.md
#
#
#!/usr/bin/env zsh

echo -e "\n<<< Starting ZSH Setup >>>\n"

# Installation unnecessary; it's in the Brewfile.

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq "$HOMEBREW_PREFIX/bin/zsh" '/etc/shells'; then
  echo "$HOMEBREW_PREFIX/bin/zsh already exists in /etc/shells"
else
  echo "Enter superuser (sudo) password to edit /etc/shells"
  echo "$HOMEBREW_PREFIX/bin/zsh" | sudo tee -a '/etc/shells' >/dev/null
fi


if [ "$SHELL" = "$HOMEBREW_PREFIX/bin/zsh" ]; then
  echo "\$SHELL is already $HOMEBREW_PREFIX/bin/zsh"
else
  echo "Enter user password to change login shell"
  chsh -s "$HOMEBREW_PREFIX/bin/zsh"
fi


if sh --version | grep -q zsh; then
  echo '/private/var/select/sh already linked to /bin/zsh'
else
  echo "Enter superuser (sudo) password to symlink sh to zsh"
  # Looked cute, might delete later, idk
  sudo ln -sfv /bin/zsh /private/var/select/sh

  # I'd like for this to work instead.
  # sudo ln -sfv /opt/homebrew/bin/zsh /private/var/select/sh
fi

echo -e '\033[1m\n<<< Restart shell to ensure everything is correctly sourced >>>\n\033[0m'
