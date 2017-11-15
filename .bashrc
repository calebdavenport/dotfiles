#!/usr/bin/bash
export PATH=~/bin:/bin:/sbin:/usr/sbin:/usr/bin:/usr/local/bin

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
# Show color coded error code of previous command
prompt="\$(if [[ \$? == 0 ]];"
prompt+="then echo \${C_BOLD}\${C_GREEN}O;"
prompt+="else echo \${C_BOLD}\${C_LIGHTRED}\$?;"
prompt+="fi)${C_RESET} "

# Show the current git branch, bold if there are files not committed
gitbranch() {
    response=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) 2>/dev/null
    if [[ -z $response ]]; then return; fi
    git diff-index --quiet HEAD -- 2>/dev/null || response=${C_BOLD}$response${C_RESET}
    printf $response
}
prompt+="\$(if [[ \$(gitbranch) ]];"
prompt+="then printf \$(gitbranch); printf ' ';"
prompt+="fi)"

# Show the current time
prompt+="[\t] "
# Show the first section of the hostname
prompt+="${C_BLUE}\h${C_RESET}:"
# Show the current working directory
prompt+="${C_BLUE}\w${C_RESET}$ "
export PS1=$prompt

###########
# Aliases #
###########
alias ssh="ssh -X"
alias ..='cd ..'
alias ~='cd ~'
alias e="exit"
alias ll="ls -alh"
