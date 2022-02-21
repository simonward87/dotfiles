# MacOS Dotfiles

I learned a ton about
[dotfiles, command line use, Homebrew, zsh, git, macOS and more with the course **_Dotfiles from Start to Finish-ish_**](http://dotfiles.eieio.xyz/)
by [@EIEIOxyz](https://twitter.com/EIEIOxyz/), and you can too!

## Restore Instructions

1. `xcode-select --install` (required for Git and Homebrew)
2. Clone dotfiles repo. Use `https` and switch to `ssh` later

```sh
git clone https://github.com/simonward87/dotfiles.git ~/.dotfiles
```

3. `cd ~/.dotfiles`
4. Check [Brewfile](Brewfile) and audit software to be installed
5. [`./install`](install)
6. Restart computer
7. Login to Google Drive (and multifactor authentication)
8. Login to Mac App store so `brew mas` will work correctly
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

---

## Study Notes

### Commands

```zsh
# show location of executable
$ which <executable>

$ ls -lA # reveal files without dir and parent dir info
$ ls -lAF # as above, with trailing / on dirs as a visual aid
$ ls -lAFh # as above, with human-readable file size info

# 'command substitution' allows the output of an expression to be passed as an argument to the outer function:
$ ls $(which http)
```

- The stuff we type into the command line is called _standard input_ (or
  `STDIN`)
- `EOF`s are delimiters, similar to `"` or `'`. They can actually be any string
  you want, but `EOF` is the convention
- `>` redirects output to something other than `STDOUT`, and **overwrites** it
- `>>` redirects output to something other than `STDOUT`,and **appends** it
- Both will create the file if it doesn't exist
- `<` redirects **input** — in other words, instead of manually entering input,
  it can be drawn from a file:

```zsh
$ pbcopy < ~/.ssh/id_rsa.pub
```

### Environment Variables

- `$USERNAME`: current user
- `$HOST`: current host
- `$0`: current process
- `$PS1`: primary prompt
- `$PROMPT`: same as above
- `$$`: PID (process ID)
- `$?`: exit code of the previously issued command

The command `set` without any arguments can be used to view **all** environment
variables — the stdout from `set` can then be filtered and sorted as required.

| Unix Exit Codes                                                                               |
| :-------------------------------------------------------------------------------------------- |
| [More info on exit codes](https://shapeshed.com/unix-exit-codes/#what-exit-code-should-i-use) |

### Aliases

We have overwritten the default `ls` command with an alias to the more
informative `ls -lAFh`. This is done in `~/.zshrc`:

```zsh
alias ls='ls -lAFh'
```

If the original `ls` command is required, it can be run using `command ls`, and
this will work the same way for other aliases that will be set up.

| Note:                                                                                                                                                                                                                                |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `zshrc` is sourced when a **new** interactive shell is started. `zshenv` is sourced on **all** invocations of the shell, allowing it to be referenced by scripts.                                                                    |
| While zsh is now the default interactive shell on MacOS, for some reason the default shell is `sh`. Although, on further inspection, `sh` just symlinks to the `bash` executable. We will likely switch the default to be zsh later. |

### Shebangs

A word from combining 'hash' and 'bang' (another word used for `!`), the
_shebang_ tells your computer what programme to use when executing the script
below.

### Git

```zsh
$ git config --global user.name # outputs the variable
$ git config --global user.name "John Smith" # updates the variable
```

```zsh
# Output current branch:
$ git branch

# Create a new branch and switch to that branch:
$ git checkout -b <branch>

# Set upstream branch and push to remote repo:
$ git push -u <remote> <branch>
```

### Symlinks

Initially we set up manual symbolic links (or symlinks), using `ln -s`, and
passing both the path to the source file as well as where we want to link it to.
This works as expected, but we can do better. In the next section, we will use
[dotbot to automate this process](https://github.com/anishathalye/dotbot).

```zsh
$ ln -s /path/to/original /path/to/link
```

### Homebrew

```zsh
# Search for a package:
$ brew search <package>

# Package details:
$ brew info <package>

# export installed packages to Brewfile
$ brew bundle dump --force --describe # alias 'bbd' in .zshrc

# Remove stale lock files and outdated downloads
$ brew cleanup --prune=all

# See a packages dependencies
$ brew deps <package-name>

# See all dependencies
$ brew deps --installed

# See what depends on a package
$ brew uses <package-name> --installed

# Remove unused dependencies
$ brew autoremove
```

### Useful Packages Installed During Course

- [httpie](https://httpie.io/docs/cli): Command-line HTTP and API testing client
- [bat](https://github.com/sharkdp/bat#how-to-use): `cat` clone with syntax
  highlighting
