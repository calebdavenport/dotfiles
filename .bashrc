export PATH=~/bin:/bin:/sbin:/usr/sbin:/usr/bin:/usr/local/bin

    P_RED="\[\033[38;5;196m\]"
    P_ORANGE="\[\033[38;5;208m\]"
    P_YELLOW="\[\033[1;33m\]"
    P_GREEN="\[\033[1;32m\]"
    P_BLUE="\[\033[38;5;27m\]"
    P_PURPLE="\[\033[38;5;104m\]"
    P_BOLD="\[\033[1m\]"
    P_RESET="\[\033[m\]"
    HN=`echo $HOSTNAME | cut -c 1-2`
    echo -ne "\033]0;$USER@$HOSTNAME\007"

export PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]O\"; else echo \"\[\033[01;31m\]\$?\"; fi)${P_RESET} [\t] ${P_BLUE}\h${P_RESET}:${P_BLUE}\w${P_RESET} >> "

alias ls="ls --color"
alias ssh="ssh -X"
alias ..='cd ..'
alias ~='cd ~'
alias e="exit"
alias ll="ls -al"
