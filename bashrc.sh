#!/bin/bash

### GIT
# Preto        30
# Vermelho     31
# Verde        32
# Marrom       33
# Azul         34

#if [ -f /etc/bash_completion.d/git ]; then
#  . /etc/bash_completion.d/git
#fi
GIT_PS1_SHOWDIRTYSTATE=true

color_prompt=yes
if [ "$color_prompt" = yes ]; then
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\h\[\033[00m\]@\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;36m\]\w\n\[\033[31m\]$(__git_ps1 "(%s) ")\[\033[00m\]\[\033[07;37m\]->\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\h@\u: \w\n$(__git_ps1 "(%s) ")-> '
fi
unset color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h@\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# my include bashrc.sh if it exists
if [ -f ~/bin/bash_aliases.sh ]; then
    . ~/bin/bash_aliases.sh
fi