# Study Notes

## Commands

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

## Environment Variables

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

## Aliases

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

## Shebangs

A word from combining 'hash' and 'bang' (another word used for `!`), the
_shebang_ tells your computer what programme to use when executing the script
below.

## Git

```zsh
$ git config --global user.name # outputs the variable
$ git config --global user.name "John Smith" # updates the variable
```

```zsh
# output current branch:
$ git branch

# create a new branch and switch to that branch:
$ git checkout -b <branch>

# set upstream branch and push to remote repo:
$ git push -u <remote> <branch>
```

## Symlinks

Initially we set up manual symbolic links (or symlinks), using `ln -s`, and
passing both the path to the source file as well as where we want to link it to.
This works as expected, but we can do better. In the next section, we will use
[dotbot to automate this process](https://github.com/anishathalye/dotbot).

```zsh
$ ln -s /path/to/original /path/to/link
```

## Homebrew

```zsh
# search for a package:
$ brew search <package>

# package details:
$ brew info <package>

# export installed packages to Brewfile
$ brew bundle dump --force --describe # alias 'bbd' in .zshrc

# remove stale lock files and outdated downloads
$ brew cleanup --prune=all

# see a packages dependencies
$ brew deps <package-name>

# see all dependencies
$ brew deps --installed

# see what depends on a package
$ brew uses <package-name> --installed

# remove unused dependencies
$ brew autoremove
```

## Useful Packages Installed During Course

- [httpie](https://httpie.io/docs/cli): Command-line HTTP and API testing client
- [bat](https://github.com/sharkdp/bat#how-to-use): `cat` clone with syntax
  highlighting
