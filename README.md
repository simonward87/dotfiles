# Dotfiles

I'm learning a ton about [dotfiles, command line use, Homebrew, zsh, git, macOS and more with the course **_Dotfiles from Start to Finish-ish_**](http://dotfiles.eieio.xyz/) by [@EIEIOxyz](https://twitter.com/EIEIOxyz/), and you can too!

## TODO

- Terminal preferences
- Displays settings
  - Set resolution preferences
- Dock preferences
  - Remove recently used apps
  - Turn off trash confirmation
- Mission Control preferences
  - Don't rearrange spaces
- Finder preferences
  - Show path bar
  - Sidebar favourites
- Finder show path bar
- Trackpad settings
  - Enable tap to click
  - Enable three-finger swipe between workspaces
- Git (config and SSH)
- Enable Kubernetes in Docker preferences
- Changed default Shell to ZSH
- Share this repo with a million people

## M1 MacBook Air Install Issues

- [`/usr/local` is for Intel binaries, `/opt/homebrew` for ARM](https://docs.brew.sh/Installation)
- `zsh` installed through Homebrew currently runs inside Rosetta rather than natively
- Issues with using the Homebrew install of nvm, updated the install script to use the `curl` install as a temporary fix
- The scripts failed the first time around as the settings in `zshrc`, `zprofile` and `zshenv` can't be sourced until the symlinks have been set up for them. These problems were solved by closing the terminal and running the script again
