# Dotfiles

I'm learning about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz)

## TODO

- Terminal preferences
- Displays settings
  - Set resolution preferences
- Dock preferences
  - Remove recently used apps
  - Turn off trash confirmation
- Mission Control preferences
  - Don't rearrange spaces
- Finder show path bar
- Trackpad settings
  - Enable tap to click
  - Enable three-finger swipe between workspaces
- Git (config and SSH)
- Enable Kubernetes in Docker preferences
- _Changed Shell to ZSH_ **now default**

## M1 MacBook Air Install Issues

- [`/usr/local` is for Intel binaries, `/opt/homebrew` for ARM](https://docs.brew.sh/Installation)
- `zsh` installed through Homebrew currently runs inside Rosetta rather than natively
- Issues with using the Homebrew install of nvm, updated the install script to use the `curl` install as a temporary fix
- The scripts failed the first time around as the settings in `zshrc`, `zprofile` and `zshenv` can't be sourced until the symlinks have been set up for them. These problems were solved by closing the terminal and running the script again
