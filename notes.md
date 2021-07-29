# Dotfiles Course

## Useful Snippets

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

- The stuff we type into the command line is called _standard input_ (or `STDIN`)
- `EOF`s are delimiters, similar to `"` or `'`. They can actually be any string you want, but `EOF` is the convention
- `>` redirects output to something other than `STDOUT`, and **overwrites** it
- `>>` redirects output to something other than `STDOUT`,and **appends** it
- Both will create the file if it doesn't exist

### Environment Variables

- `$USERNAME`: current user
- `$HOST`: current host
- `$0`: current process
- `$PS1`: primary prompt
- `$PROMPT`: same as above
- `$$`: PID (process ID)
- `$?`: exit code of the previously issued command

| Unix Exit Codes                                                                               |
| :-------------------------------------------------------------------------------------------- |
| [More info on exit codes](https://shapeshed.com/unix-exit-codes/#what-exit-code-should-i-use) |

## Aliases

We have overwritten the default `ls` command with an alias to the more useful `ls -lAFh`. This is done in `~/.zshrc`:

```zsh
alias ls='ls -lAFh'
```

If the original `ls` command is required, it can be run using `command ls`, and this will work the same way for other aliases that will be set up.

| Note:                                                                                                                                                                                                                                |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `zshrc` is sourced when a new **interactive** shell is started. `zshenv` is sourced on **all invocations** of the shell, allowing it to be referenced by scripts.                                                                    |
| While zsh is now the default interactive shell on MacOS, for some reason the default shell is `sh`. Although, on further inspection, `sh` just symlinks to the `bash` executable. We will likely switch the default to be zsh later. |

## Shebangs

A word from combining 'hash' and 'bang' (another word used for `!`), the _shebang_ tells your computer what programme to use when it encounters this line.

## Git

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

## Symlinks

Initially, we set up a symbolic link (or symlink) manually, using the `ln -s` command, and passing both the path to the source file as well as where we want to link it to. This works as expected, but we can do better. In the next section, we will use [dotbot to automate this process](https://github.com/anishathalye/dotbot).

```zsh
$ ln -s /path/to/original /path/to/link
```

### Dotbot

## Homebrew

```zsh
# Search for a package:
$ brew search <package>

# Detail a package:
$ brew info <package>

# export installed packages to Brewfile
$ brew bundle dump --force --describe # alias 'bbd' in .zshrc

# Remove stale lock files and outdated downloads
$ brew cleanup --prune=all

# Remove unused dependencies
$ brew autoremove
```

### Useful Packages Installed During Course

- `httpie`: simplified `curl` clone
- `bat`: `cat` clone with syntax highlighting
