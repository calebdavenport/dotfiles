#!/usr/bin/bash
export PATH=~/bin:/bin:/sbin:/usr/sbin:/usr/bin:/usr/local/bin:/opt/bin

    C_RED=$(tput setaf 196)
    C_LIGHTRED=$(tput setaf 1)
    C_ORANGE=$(tput setaf 208)
    C_YELLOW=$(tput setaf 11)
    C_GREEN=$(tput setaf 2)
    C_BLUE=$(tput setaf 27)
    C_MAGENTA=$(tput setaf 13)
    C_PURPLE=$(tput setaf 5)
    C_BOLD=$(tput bold)
    C_RESET=$(tput sgr0)
    HN=`echo $HOSTNAME | cut -c 1-2`
    echo -ne "\033]0;$USER@$HOSTNAME\007"

#################
# Custom Prompt #
#################
# Run commands before showing the prompt
gitbranch() {
    response=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) 2>/dev/null
    if [[ -z $response ]]; then return; fi
    response="$response "
}
diff_head() {
    diff_head_nochange=1
    git diff-index --quiet HEAD -- 2>/dev/null || diff_head_nochange=0
}
PROMPT_COMMAND='gitbranch; diff_head'

# Note that ${C_COLOR} must be surrounded by \[ and \].
# This ensures that bash can accurately count the number of visible characters.

# Color coded error code of previous command
prompt='$(if [[ $? == 0 ]];'
prompt+='then echo "\[$C_BOLD$C_GREEN\]O"; '
prompt+='else echo \[$C_BOLD$C_LIGHTRED\]$?; '
prompt+='fi)\[$C_RESET\]'

# Current git branch, bold if there are files not committed
prompt+='$(if [[ $diff_head_nochange == 0 ]];'
prompt+='then echo "\[$C_BOLD\]";'
prompt+='fi) '
prompt+='$response\[$C_RESET\]'

# Current time [HH:MM:SS]
prompt+='[\t] '
# First section of the hostname
prompt+='\[$C_BLUE\]\h\[$C_RESET\]:'
# Current working directory
prompt+='\[$C_BLUE\]\w\[$C_RESET\]'

# Use $ or # depending on root status
prompt+='$(if [[ $EUID == 0 ]];'
prompt+='then echo "#";'
prompt+='else echo "$";'
prompt+='fi) '
export PS1=$prompt

###########
# Aliases #
###########
alias ssh="ssh -X"
alias ..='cd ..'
alias ~='cd ~'
alias e="exit"
alias ll="ls -alh"

alias :q="echo You are not in Vim"
alias :x="echo You are not in Vim"
