# MacOS Dotfiles

I learned a ton about
[dotfiles, command line use, Homebrew, zsh, git, macOS and more with the course **_Dotfiles from Start to Finish-ish_**](http://dotfiles.eieio.xyz/)
by [@EIEIOxyz](https://twitter.com/EIEIOxyz/), and you can too!

## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and
   Homebrew)
2. We'll start with `https` and switch to `ssh` later

```sh
git clone https://github.com/simonward87/dotfiles.git ~/.dotfiles
```

3. `cd ~/.dotfiles`
4. Check [Brewfile](Brewfile) and audit software to be installed, adjust if
   required.
5. [`./install`](install)
6. Restart computer.
7. Login to Google Drive (and multifactor authentication) and allow files to
   sync.
8. Enable Kubernetes (if required) in Docker preferences
9. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh),
   add to GitHub, and switch remotes.

```zsh
# Generate SSH key in default location (~/.ssh/config)
ssh-keygen -t ed25519 -C "39803787+simonward87@users.noreply.github.com"

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Create config file with necessary settings
<< EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF

# Add private key to ssh-agent
ssh-add -K ~/.ssh/id_ed25519

# Copy public key and add to github.com > Settings > SSH and GPG keys
pbcopy < ~/.ssh/id_ed25519.pub

# Test SSH connection, then verify fingerprint and username
# https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
ssh -T git@github.com

# Switch from HTTPS to SSH
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
