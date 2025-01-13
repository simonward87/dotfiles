setopt APPEND_HISTORY # sessions append to history file, rather than replace it
setopt AUTO_CD # auto cd when a command is a directory name
setopt CD_SILENT # never print directory when cd -
setopt CORRECT # command spelling correction
setopt EXTENDED_HISTORY # save command timestamps
setopt HIST_EXPIRE_DUPS_FIRST # remove oldest duplicates first when trimming
setopt HIST_IGNORE_DUPS # don't add duplicate commands to history
setopt HIST_NO_STORE # remove history command from list when invoked
setopt NO_CASE_GLOB # case-insensitive glob

unsetopt BEEP # beep on error
unsetopt CORRECT_ALL # argument spelling correction

# Custom shell prompt
PROMPT="%(?.%F{$CLR_COMMENT}%m%f.%F{$CLR_ERROR}[%?]%f %F{$CLR_COMMENT}%m%f) %2~ %# "

# Prepend prompt new-line
precmd() $funcstack[1]() echo

# Remove any duplicate $PATH entries
typeset -U path
