# MacOS Dotfiles

## Restore Instructions

1. `xcode-select --install` (required for Git and Homebrew)
2. Clone dotfiles repo. Use `https` and switch to `ssh` later

```sh
git clone --recurse-submodules --remote-submodules --jobs=8 https://github.com/simonward87/dotfiles.git ~/.dotfiles
```

3. `cd ~/.dotfiles`
4. Check [Brewfile](Brewfile) and audit software to be installed
5. [`./install`](install)
6. Restart computer
7. Login to Google Drive (and multi-factor authentication)
8. Login to Mac App store so `brew mas` will work correctly
9. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to GitHub, and switch remotes.

```zsh
# generate SSH key in default location (~/.ssh/config)
ssh-keygen -t ed25519 -C "39803787+simonward87@users.noreply.github.com"

# start the ssh-agent
eval "$(ssh-agent -s)"

# create config file with necessary settings
<< EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF

# add private key to ssh-agent
ssh-add -K ~/.ssh/id_ed25519

# copy public key and add to github.com > Settings > SSH and GPG keys
pbcopy < ~/.ssh/id_ed25519.pub

# test SSH connection, then verify fingerprint and username
# https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
ssh -T git@github.com

# switch from HTTPS to SSH
git remote set-url origin git@github.com:simonward87/dotfiles.git
```

### Preferences

- Display resolution
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
  - Enable three-finger swipe between workspaces
- Changed default Shell to ZSH

## Learning About Dotfiles

I learned a ton about [dotfiles, command line use, Homebrew, zsh, git, MacOS and more with the course **_Dotfiles from Start to Finish-ish_**](http://dotfiles.eieio.xyz/) by [@EIEIOxyz](https://twitter.com/EIEIOxyz/). I wholeheartedly recommend the course, it is very informative. [My study notes](./study_notes.md) are included in this repository, for those interested in looking through them – you may find something helpful.
