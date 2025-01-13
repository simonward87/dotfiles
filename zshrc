# .zshrc is for 'interactive shells'
# It is sourced each time a new terminal session is started

ZSH_CONFIGS="$HOME/.config/zsh"

# Variables are sourced first as other configs may depend on them
source "$ZSH_CONFIGS/vars.zsh"

for FILE in $ZSH_CONFIGS/*.zsh; do
    if [[ "$FILE" == "$ZSH_CONFIGS/vars.zsh" ]]; then continue; fi

    if [[ $FILE =~ '^.*(cmp|zplug)\.zsh$' ]]; then
        # Scheduled as blocking and slow to initialise
        sched +1 "source $FILE" &>/dev/null || source $FILE
    else
        source $FILE
    fi
done
